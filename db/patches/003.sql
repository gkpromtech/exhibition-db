
delimiter //

CREATE FUNCTION upsert_org(
  shortNameRu varchar(256),
  shortNameEn varchar(256),
  fullNameRu varchar(256),
  fullNameEn varchar(256),
  phone_ varchar(64),
  email_ varchar(128),
  descriptionRu varchar(512),
  descriptionEn varchar(512),
  addressRu varchar(128),
  addressEn varchar(128),
  site_ varchar(128)
) RETURNS INT
BEGIN

  DECLARE oid INT;
  SET oid := (SELECT organizationid FROM organizations_tr
              WHERE shortname = shortNameRu
                  OR shortname = fullNameRu
                  OR fullname = shortNameRu
                  OR fullname = fullNameRu
                  AND languageid = 0 LIMIT 1);

  IF oid IS NULL THEN
    INSERT INTO organizations (status, logo, phone, email, site) VALUES (7, '', phone_, email_, site_);
    SET oid := (SELECT MAX(id) FROM organizations);
    UPDATE organizations SET logo = CONCAT('/images/logos/', oid, '.png') WHERE id = oid;

    INSERT INTO organizations_tr (organizationid, languageid, shortname, fullname, address, description) VALUES
    (oid, 0, shortNameRu, fullNameRu, addressRu, descriptionRu),
    (oid, 1, shortNameEn, fullNameEn, addressEn, descriptionEn);
  ELSE

    UPDATE organizations SET
      logo = CONCAT('/images/logos/', @oid, '.png'),
      phone = phone_,
      email = email_,
      site = site_
    WHERE id = oid;

    UPDATE organizations_tr SET
      shortname = shortNameRu,
      fullname = fullNameRu,
      address = addressRu,
      description = descriptionRu
    WHERE organizationid = oid AND languageid = 0;

    UPDATE organizations_tr SET
      shortname = shortNameEn,
      fullname = fullNameEn,
      address = addressEn,
      description = descriptionEn
    WHERE organizationid = oid AND languageid = 1;

  END IF;

  RETURN oid;
END //

delimiter ;


 -- "ТЕТИС КС" ОАО 

SET @oid = upsert_org(
    '"ТЕТИС КС" ОАО',
    'TETIS KS',
    'ТЕТИС  КОМПЛЕКСНЫЕ СИСТЕМЫ',
    'TETIS Integrated Systems',
    '+7 (495) 786-98-58',
    'sec@tetis-ks.ru',
    'Основными направлениями деятельности компании  Тетис КС  являются: проектирование стационарных  и мобильных ИТСО объектов, поставка технических средств и выполнение полного цикла СМР и ПНР на объекте. rОсновные компоненты создаваемых нами комплексов ИТСО – это зональные и рубежные гидроакустические станции для обнаружения подводных нарушителей, радиолокационные станции обнаружения, оптико – электронные системы обнаружения и распознавания целей, рубежные магнитометрические и сейсмические системы обнаружения нарушителей, средства нелетального воздействия на нарушителей в водной среде.',
    'Founded in 2007 TETIS Integrated Systems LTD. is specialized in turnkey solutions for protection of high value assets from water side threats. Protected assets include naval bases, offshore oil and drilling rigs, sea and river ports and harbors, nuclear and hydro power plants, major state and private industrial facilities.rrOur product range includes intruder detections sonars, high frequency radars for small target detection, infrared and day time video systems, magnetic detection systems, ground seismic detection systems to provide reliable all weather day/night security coverage over and under water areas.',
    '117042, г. Москва район Южное Бутово, rул. Поляны, д.54, 2 этаж',
    '54 Polyani st., Moscow, Russia, 117042',
    'www.tetis-ks.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (38, @oid);
INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (21, @oid);
INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (23, @oid);


 -- СЕТ-1 

SET @oid = upsert_org(
    'СЕТ-1',
    'SET-1',
    'АО "СЕТ-1"',
    'SET-1',
    '+7 (495) 223 22 05',
    'set@set-1.ru',
    'Компания СЕТ-1 известна на рынке безопасности с 1992 года как разработчик специальной радиоэлектронной аппаратуры для силовых структур.rОсновное направление деятельности – производство микро аудио-, видеопередатчиков, систем контроля информации с передачей по радиоканалу. Собственные инженерно-конструкторская и производственная базы позволяют реализовывать индивидуальные проекты заказчиков по техническим заданиям любой сложности.rВ настоящее время компания активно развивает направление антитеррористической робототехники – дистанционно-управляемых комплексов со встроенными системами видеонаблюдения.',
    'The SET-1 Company is the well-known in the security market since 1992 as a developer of surveillance equipment for law enforcement agencies.rOne of the main fields of activities is production of miniature audio and video transmitters, surveillance wireless systems and miniature video cameras. In-house engineering and manufacturing departments allow to accomplish any sophisticated projects according to customers\' specifications.rToday the SET-1 Company actively develops the new sector – remote-controlled robot systems with integrated video surveillance systems for counterterrorism applications.',
    '127083, г. Москва, ул. Мишина, дом 14, стр. 1',
    '14, Mishina Str., building 1, Moscow, 127083, RUSSIA',
    'www.set-1.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (1, @oid);


 -- Закрытое акционерное общество "МНИТИ" 

SET @oid = upsert_org(
    'Закрытое акционерное общество "МНИТИ"',
    'JSC MNITI',
    'Закрытое акционерное общество "Московский научно-исследовательский телевизионный институт"',
    'JSC MNITI',
    '8 (499) 763-45-42',
    'mniti@mniti.ru',
    'Московский научно-исследовательский телевизионный институт (ЗАО "МНИТИ") имеет богатую историю. В этом году предприятию исполняется 65 лет и все это время институт является головной научно-исследовательской организацией страны в области телевидения. rВ настоящее время, институт работает над решением научно-технических задач по ряду важнейших направлений, в области телевизионных и телекоммуникационных технологий: r* Системы прикладного телевидения;r* Мобильные теле- и радиовещательные комплексы;r* Системы и средства отображения информации коллективного пользования;r* Приемная аппаратура цифрового телевидения.',
    'JSC MNITI has a rich history. This year the company celebrates 65 years and all this time the Institute is a leading research organization in the country in the field of television. rCurrently, the Institute is working to solve scientific and engineering problems on a number of important directions in the field of telecommunication technologies: r* System applied television;r* Mobile TV and radio broadcasting systems;r* System and information display means for collective use;r* Reception apparatus of digital television.',
    '105094, Россия, Москва, ул. Гольяновская, 7а, стр. 1',
    '7a, Golyanovskaya St., Building 1, Moscow, 105094, Russia',
    'www.mniti.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (5, @oid);


 -- ОАО "Электроагрегат" 

SET @oid = upsert_org(
    'ОАО "Электроагрегат"',
    'JSC “Electroagregat”',
    'Открытое акционерное общество "Электроагрегат"',
    'Joint-stock company “Electroagregat”',
    '(4712) 36-92-04, 36-93-52,36-93-50',
    'agregat@kursknet.ru',
    'ОАО «Электроагрегат» - крупнейший в России производитель автономных источников электропитания, используемых Министерством обороны, а так же другими силовыми ведомствами. r- Стационарные и передвижные электростанции мощностью от 0,5 до 2 500 кВт, различной степени автоматизации;r- Одно и двух агрегатные изделия повышенной мобильности, на базе шасси «Урал», «КамАЗ»;r- генераторы синхронные серии ГС, мощностью от 0,5 до 1000 кВт; частотой 50 и 400 Гцr- передвижные электростанции  в кузовах (контейнерах) в том числе и на прицепах собственного производства;r- преобразователи частоты мощностью 20, 30, 60 и 100 кВт, так же ВПЛ-30.r',
    'JSC “Electroagregat” is Russia’s largest manufacturer of self-contained power supply units used by the Ministry of Defense as well as other military and law enforcement organizations. r- Stationary and mobile generating sets with a power range of 0.5 kW to 2,500 kW with various automation degreesr- Single and double-unit generating sets of improved mobility, mounted on the Ural, KamAZ chassisr- 50 and 400 Hz synchronous generating sets series ГС with a power range of 0.5 kW to 1,000 kW r- Mobile generating sets in car bodies (containers), including mounted on trailers manufactured by JSC “Electroagregat”r- 20, 30, 60 and 100 kW frequency conv',
    'Российская Федерация,305022, г. Курск, ул. 2-я Агрегатная, 5а.',
    'Russian Federation,305022, Kursk, street 2nd Aggregate, 5A.',
    'www.electroagregat.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (50, @oid);


 -- ООО "Челэнергоприбор" 

SET @oid = upsert_org(
    'ООО "Челэнергоприбор"',
    'LLC "Chelenergopribor"',
    'ООО "Челэнергоприбор"',
    'LLC "Chelenergopribor"',
    '+7(351)211-54-01',
    'info@limi.ru',
    'ООО «Челэнергоприбор» предлагает измерительные приборы для электроизмерений в энергетике и на предприятиях ВПК.rМикроомметр ИКС-5 - на сегодня более 3000 приборов используются для контроля переходного сопротивления.rТрехфазный вольтамперфазометр ВФМ-3 – самый компактный в своем классе, с цветным  графическим TFT–экраном.rВольтамперфазометр ВФМ-2 - малогабаритный полностью автоматизированный универсальный прибор.rАнализатор частотных характеристик АЧХИ-102 - не имеет отечественных аналогов.',
    'LLC "Chelenergopribor" offers measuring instruments for electrical measurements in the energy sector and in the defense industry.rMicroohmmeter IKS-5 - more than 3,000 devices are used to measure the contact resistance at now.rThree-phase VAF meter VFM-3 - the most compact in its class, with color graphic TFT-screen.rVAF meter VFM-2 - compact fully automated multi-purpose device.rFrequency response analyzer ACHHI-102 - has no domestic counterparts.',
    '454902, Россия, г. Челябинск, ул. Северная (Шершни), д. 52, оф. 32',
    '454902, Russia, Chelyabinsk, ul. Severnaya (Shershni), 52-32',
    'www.limi.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (50, @oid);


 -- ПОЛИМЕДИА 

SET @oid = upsert_org(
    'ПОЛИМЕДИА',
    'POLYMEDIA',
    'Закрытое акционерное общество "Полимедиа"',
    'Polymedia JSC',
    '+7 495 956 85 81',
    'info@polymedia.ru',
    'Polymedia – лидер российского рынка систем отображения информации. Компания основана в 1998 году и объединяет 14 компаний в крупнейших городах России и СНГ.rНаправления деятельности компании : системная интеграция, поставка и продажа аудиовизуального оборудования, создание комплексных проектных решений – от разработки до полного воплощения «под ключ», а также разработка собственных программно-аппаратных продуктов. Специалисты компании создают проекты для ситуационных центров, диспетчерских залов, центров мониторинга и управления, конференц-залов,  стадионов и многофункциональных спортивных комплексов, переговорных комнат, и учебных аудиторий.',
    'Polymedia is a leader at Russian market for AV solutions. The company was founded in 1998; it unites 14 companies, which are located in the biggest cities of Russia and CIS. The Company main businesses are as follows: system integration, delivery and sale of projection and AV-equipment, rental and staging solutions – from concept to turn-key implementation. The Company professionals create authorial solutions for operation control rooms, monitoring and control centers, stadia and multifunctional sport complexes, meeting rooms, conference halls and lecture hallsrr',
    '117218, Москва, ул. Кржижановского, д.29, кор.1',
    '',
    'www.polymedia.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (36, @oid);


 -- ООО "ЭМ-КАБЕЛЬ" 

SET @oid = upsert_org(
    'ООО "ЭМ-КАБЕЛЬ"',
    '"EM-CABEL", Ltd.',
    'Общество с ограниченной ответственностью "ЭМ-КАБЕЛЬ"',
    '"EM-CABEL", Ltd.',
    '8 (8342) 38-02-09',
    'sp@emcable.ru',
    'ООО «ЭМ-КАБЕЛЬ» новый завод, входящий в ГК «Оптикэнерго». Производит и реализует кабельно-проводниковую продукцию: высокотемпературный провод, неизолированный провод, самонесущий провод, грозозащитный трос, силовой кабель и проволоку. На предприятии введено в эксплуатацию самое современное оборудование ведущих мировых производителей. Качество изделий подтверждено различными сертификатами качества. Благодаря удобному географическому расположению предприятия, продукция в самые кратчайшие сроки может быть доставлена в любую точку России и стран СНГ автомобильным или железнодорожным транспортом.',
    '"EM-CABEL" Ltd. – new plant included in Group of Companies "Optikenergo." Makes and realizes cable products: high-temperature wire, bare wire, self supporting wire, ground wire, power cable and wire. The enterprise has the most modern equipment from leading manufacturers. The quality of products is confirmed by various quality certificates. Thanks to the convenient geographical location of the enterprise, the products can be delivered in the shortest possible time anywhere in Russia and CIS countries by road or rail.',
    'РФ, Республика Мордовия, 430006, г.Саранск, ул. 2-я Промышленная, 10А',
    '10А, 2-ya Promyshlennaya St., Saransk, Republic of Mordovia, 430006, Russian Federation',
    'http://www.emcable.ru/');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (50, @oid);


 -- НПО "Изолятор" 

SET @oid = upsert_org(
    'НПО "Изолятор"',
    'NPO “IZOLYATOR”',
    'Закрытое акционерное общество «НПО «Изолятор»',
    'Joint-Stock Company “NPO “IZOLYATOR”',
    'Тел./факс: +7(812) 334 35 74, +7(812) 334 35 75.',
    'info@izolyator.ru',
    'Производство высоковольтных полимерных изоляторов последнего поколения с цельнолитой силиконовой защитной оболочкой.r- Линейные подвесные изоляторы от 10 до 500 кВr- Штыревые изоляторы от 10 до 35 кВr- Опорные изоляторы от 3 до 220 кВr- Шинные опоры  от 6 до 750 кВr- Проходные изоляторыr- Антенные изоляторыr- Изоляторы для контактных сетей железных дорог, трамвая и троллейбуса.rИзоляторы обладают высокой надежностью, стойкостью к актам вандализма, ударопрочностью, сейсмостойкостью, грязестойкостью,  не требуют обслуживания.rr',
    'Production of high-voltage polymer insulators of last generation with silicone unit-cast housing.r- Line insulators from 10 to 500 kV;r- Pin insulators from 10 to 35 kV;r- Post stations insulators from 3 to 220 kV;r- Polymeric bushings;r-Antenna insulators;r- Insulators for railway,tram and trolleybus contact systems.rInsulators has high reliability, high resistance to acts of vandalism, impact resistance, seismic resistance, pollution resistance, do not require of service.r',
    'Россия,195009, Санкт-Петербург, ул. Михайлова, д. 11',
    '195009, St. Petersburg, 11 Mikhaylova St., Russia',
    'www.izolyator.ru,  www.нпоизолятор.рф');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (50, @oid);


 -- ЗАО "ЦНИИ СМ" 

SET @oid = upsert_org(
    'ЗАО "ЦНИИ СМ"',
    'Company JSC CRI of ME',
    'Центральный научно-исследовательский институт судового машиностроения, ЗАО',
    'Joint-Stock Company Central Research Institute rof Marine Engineering',
    '+7 (812) 640-10-51',
    'sudmash@sudmash.ru',
    'ЗАО «Центральный научно-исследовательский институт судового машиностроения» (ЗАО «ЦНИИ СМ») проектирует и поставляет современное судовое оборудование для судов, кораблей и нефтедобывающих платформ: устройства передачи грузов между судами в море на ходу; подводные манипуляторные устройства с дистанционным управлением; комплексы транспортировки корабельных вертолетов; судовое грузоподъемное оборудование; рулевые машины; успокоители качки; изделия систем гидравлики; палубные механизмы; оборудование водоподготовки.',
    'Joint-Stock Company Central Research Institute of Marine Engineering (Company JSC CRI of ME) designs and supplies modern marine equipment for ships and oil platforms: cargoes transfer-at-sea gears; remote-controlled manipulating devices for underwater operations; devices for transportation of shipborne helicopters; marine hoisting equipment; steering gears; stabilizers; hydraulic systems articles; deck machinery; water treatment equipment.',
    '192029, Санкт-Петербург, ул. Дудко, д.3',
    '192171, Russia, Saint-Petersburg, ul. Dudko, 3.',
    'www.sudmash.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (17, @oid);


 -- ЮВС-ЮРИОН 

SET @oid = upsert_org(
    'ЮВС-ЮРИОН',
    'UVS-YURION',
    'Общество с ограниченной ответственностью "ЮВС-ЮРИОН"',
    'Limited Liability Company "UVS-URION"',
    '8(495) 645-68-50',
    'info@uvs.yurion.ru',
    'Компания "ЮВС-ЮРИОН" была основана для реализации проекта инновационного центра Сколково по созданию современных цифровых телекоммуникационных систем для беспилотных и робототехнических комплексов.',
    'UVS-YURION Company was established for the project of  rInnovation Center "Skolkovo" to create the digital telecommunications systemsrfor unmanned and robotic systems.r',
    '107564, г.Москва, r107564, г.Москва, ул. 3-я Гражданская, д.2А.',
    '107564, Moscow, 3rd Grazdanskaya st, 2A',
    'www.uvs.yurion.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (36, @oid);


 -- "Ярославский судостроительный завод", ОАО 

SET @oid = upsert_org(
    '"Ярославский судостроительный завод", ОАО',
    '"Yaroslavsky shipbuilding plant", OJSC',
    'Открытое акционерное общество "Ярославский судостроительный завод"',
    'Open joint-stock company "Yaroslavsky shipbuilding plant"',
    '+7(4852) 671555',
    'info@yarshipyard.com',
    'ОАО «Ярославский судостроительный завод» (управляющая компания ЗАО «ВП ФИНСУДПРОМ») предлагает суда водоизмещением до 2400 т, длиной до 72 м, шириной до15 м:r- скоростные десантные, патрульные, служебно-разъездные катера с различными принципами поддержания движения в корпусах из АМГ;r- пограничные сторожевые корабли;r- морские буксиры-спасатели и суда обеспечения;r- рыбопромысловые и рыбоохранные суда;r- водолазные суда;r- суда обслуживающего флота;r- насосные плавучие станции;r- суда для отдыха и туризма;r- услуги по проектированию и разработке РКД на строительство судов.',
    'OJSC “Yaroslavsky shipbuilding plant” (managing company JSC “Foreign Trade Company FINSUDPROM”) can offer to its customers vessels of displacement up to 2400 t, length up to 72 meters and breadth up to 15 meters:r- high speed landing, patrol, general service boats in aluminium-magnesium hulls with various movement maintenance concepts;r- border guard ships;r- sea-going rescue tugs and supply vessels;r- fishing and fishery protection vessels;r- diving vessels;r- service fleet vessels;r- floating pumping plants;r- boats for recreation and tourism;r- services for design and development of WCD for shipbuilding.r',
    'Россия, 150006, Ярославская область, г. Ярославль, ул. Корабельная, 1',
    '1, Korabelnaya str., Yaroslavl, Yaroslavl region, 15006, Russia',
    'yarshipyard.com');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (6, @oid);


 -- ЮМИРС, ЗАО 

SET @oid = upsert_org(
    'ЮМИРС, ЗАО',
    'UMIRS, JSC',
    'Закрытое акционерное общество "Фирма "ЮМИРС"',
    'Joint stock company UMIRS',
    '(8412) 69-84-01, (8412) 69-82-72',
    'market@umirs.ru',
    'ЗАО "ЮМИРС" специализируется на разработке, производстве и инсталляции комплексов технических средств охраны периметра.rnВ настоящее время в производственной программе находится более пятидесяти выпускаемых изделий, среди которых: rn радиолокационные, комбинированные, мобильные, обрывные комплексы охраны объектов; радиоволновые, инфракрасные, вибрационные, проводноволновые средства охраны.',
    'UMIRS specializes in the design, manufacture and installation the complexes of technical security devices of perimeter.rnAt present there are more than fifty items in the production program, among which: radiolocation, combined, mobile, broken wire protection complexes; microwave sensors, infrared sensors, triboelectric and wire-wave protecting devices.rn',
    'Российская Федерация, 440600, Пенза, ул. Антонова, д.3',
    '3, Antonova St., Penza, 440600, Russian Federation',
    'www.umirs.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (29, @oid);


 -- Центр речевых технологий 

SET @oid = upsert_org(
    'Центр речевых технологий',
    'Speech Technology Center',
    'Общество с ограниченной ответственностьюr«Центр речевых технологий»r',
    'Speech Technology Center',
    '(495) 669-74-40',
    'stc-msk@speechpro.com',
    'Центр речевых технологий (ЦРТ) — российская компания с 25-летней историей. За это время компания накопила богатейший научный потенциал и стала абсолютным лидером российского и значимым игроком международного рынка речевых технологий и мультимодальной биометрии.rСегодня ЦРТ является ведущим мировым разработчиком инновационных систем в сфере высококачественной записи, обработки и анализа аудио-видео информации, синтеза и распознавания речи. Создаваемые в ЦРТ биометрические решения обеспечивают высокую точность распознавания личности по голосу и изображению лица в реальном времени.',
    'Speech Technology Center (STC) is an international leader in speech technology and multimodal biometrics. It has over 20 years of research, development and implementation experience in Russia and internationally.rSTC is leading global provider of innovative systems in high-quality recording, audio and video processing and analysis, speech synthesis and recognition, and real-time, high-accuracy voice and facial biometrics solutions. STC innovations are used in both public and commercial sectors, from small expert laboratories to nation-wide security systems.',
    'Бизнес-центр «Таганский»rМарксистская ул., д. 3, стр. 2, офис 2.3.7, 2.3.8rМосква, 109147r',
    'Speech Technology Center Ltd. 4 Krasutskogo St.,rSt. Petersburg, Russiar',
    'http//www.speechpro.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (13, @oid);


 -- БАНС, ОАО 

SET @oid = upsert_org(
    'БАНС, ОАО',
    'BANS, JSC',
    'Бортовые аэронавигационные системы, ОАО',
    'Board Aero Navigation Systems, JSC',
    '+7 (495) 980-65-16',
    'info@ians.aero',
    'ОАО «Бортовые аэронавигационные системы» было основано для реализации инновационных проектов, связанных с разработкой аппаратно-программных комплексов в интересах повышения безопасности полетов, руководства полетами, организации воздушного движения (ОрВД), технологий связи, навигации, наблюдения и управления воздушным движением (CNS/ATM) и метеорологического обеспечения полетов, а также для повышения эффективности аэронавигационного обеспечения государственной и гражданской авиации России.',
    'JSC “Board Aero Navigation Systems” was established to implement innovative projects in the sphere of software and hardware development in order to improve safety, operational control, air traffic management (ATM), communication technologies, navigation, surveillance and air traffic management (CNS/ATM ) and MET services, as well as to increase the efficiency of Russian state and civil air navigation.',
    'Россия, 127015, г. Москва, ул. Большая Новодмитровская, rд. 12, стр. 15',
    '12/15, Bolshaya Novodmitrovskaya st., Moscow, 127015, Russia',
    'www.ians.aero');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (15, @oid);


 -- ОАО "БЭМЗ" 

SET @oid = upsert_org(
    'ОАО "БЭМЗ"',
    'JSC “Bryansk Electromechanical Plant”',
    'Открытое акционерное общество "Брянский электромеханический завод"',
    'Joint stock company “Bryansk Electromechanical Plant”',
    '8 (4832) 53-11-11',
    'mail@oaobemz.ru',
    'ОАО «БЭМЗ» - ведущий производитель продукции В и ВТ для ВС РФ и поставки на экспорт по направлениям:r- наземные комплексы радиоэлектронной борьбы и радиоэлектронной разведки;r- аппаратура самолетных радиолокационных станций.r',
    'Joint stock company “Bryansk Electromechanical Plant” is the leading armament and warfare equipment manufacturer for Armed Forces of the Russian Federation and for export supplies in the following areas:r- ground radioelectronic warfare and intelligence systems;r- aircraft radar equipment.r.',
    '241017 Россия г. Брянск ул. Вокзальная 136',
    '241017 Russia, Bryansk, Vokzalnaya st, 136',
    'www.oaobemz.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (42, @oid);


 -- ЗАО "ЦПФ МГТУ" 

SET @oid = upsert_org(
    'ЗАО "ЦПФ МГТУ"',
    'CAP BMSTU',
    'Закрытое акционерное общество "Центр прикладной физики МГТУ им. Н.Э. Баумана"',
    '"Center of Appied Physics Moscow State Technical University n. a. Bauman"',
    '+7 499 263 6735',
    'cpf.mstu@yandex.ru',
    'ЗАО "ЗАО «ЦПФ МГТУ» ведет собственные исследования и разработки в области пассивной оптической локации химических соединений в открытой атмосфере.rРазработаны и приняты к серийному производству, приборы химической разведки дистанционного действия ПХРДД-2 и ПХРДД-3 предназначенные для обнаружения паров токсичных химикатов, в том числе их смесей, в приземном слое воздуха в полевых условиях. Изделия осуществляют индикацию информации о концентрации веществ и их компонентов, а также координаты, направление и времени обнаружения. Информация о результатах обнаружения выдается на аппаратуру передачи данных.r',
    'JSC «CAP BMSTU» performs its own investigations and developments in the field of passive remote sensing of chemical compounds in the open atmosphere.rRemote sensing FTIR spectrometers PHRDD-2 and PHRDD-3 for detecting vapors of toxic chemicals, including mixtures, in the surface air in field conditions are developed and adopted for mass production. Devices display information about substances concentration and its components as well as the coordinates, direction, and detection time. Information on the detection results is send to data transmission equipment.rr',
    'РФ, 105005, г. Москва, ул. 2-я Бауманская, д. 5, стр. 1',
    'ul. Baumanskaya 2-ya, 5, MoscowrPostcode: 105005',
    'http://www.cpf-bmstu.ru/');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (4, @oid);


 -- ЗАО "ЭЗОИС" 

SET @oid = upsert_org(
    'ЗАО "ЭЗОИС"',
    'LLC  "EZOIS"',
    'Экспериментальный завод объемных инженерных сооружений',
    'An Experimental factory of volumetric engineering structures',
    '(495) 789-37-77',
    'commerce@ezois.ru',
    'Компания «ЭЗОИС» предлагает малогабаритные комплектные трансформаторные подстанции (КТП, БКТП) мощностью силовых трансформаторов до 1250кВА а также блочные распределительные пункты (РП, БРТП) нового поколения в железобетонной оболочке полной заводской готовности. Габариты БКТП (2460х4640х2698), вес с оборудованием 12,5т. Широкий выбор электротехнического оборудования среднего и низкого напряжения. Все изделия сертифицированы НТЦ «Стандартэлектро-С» Госстандарта России, ГОСТ Р. Разработка и сдача под ключ проектов и сетей.',
    'EZOIS offers small size packaged transformer sub-stations having transformer capacity up to 1250 KVA as well as prefabricated, new generation modular distribution stations in reinforced concrete shells. Wide range of medium and low voltage electrical equipment manufactured at Company owned facilities. All products are certified by Standartelektro-C, Gosstandart of Russia, GOST P.  Basic design and turn key projects for power grids and power grid structures as well as for incorporated substations. Guarantee maintenance and free training of the Client operators to implement installation, maintenance, commissioning and start-up works.',
    'Россия, 107143, г. Москва, 2-ой Иртышский пр-д, д. 6',
    '107143 Moscow, 2-nd Irtishski proezd,  6',
    'ezois.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (50, @oid);


 -- Ризо Евразия 

SET @oid = upsert_org(
    'Ризо Евразия',
    'RISO Eurasia',
    'ООО "Ризо Евразия"',
    'LLC RISO Eurasia',
    '8-499-463-51-61, 8-499-463-93-72',
    'moscow@riso.ru',
    'РИЗО ЕВРАЗИЯ – дочерняя компания японской корпорации RISO Kagaku Corp., основоположника «Ризографии», известнейшего производителя ризографов и струйных принтеров ComColor.  rВ продуктовую линейку RISO входят аппараты, не имеющие аналогов в мире: ризограф SE9380, со скоростью печати 185 стр/мин, двухцветный ризограф ME9350, уникальный ризограф формата А2, широко используемый для печати газет, и самые высокоскоростные полноцветные принтеры ComColor. rОборудование RISO – это высокая производительность, низкая себестоимость печати, высокая надежность и экологическая чистота.',
    'RISO EURASIA is a subsidiary of Japanese Corporation RISO Kagaku Corp., the founder of "Risography", the famous manufacturer of risograph and ComColor inkjet printers. rThe RISO product line includes devices that have no analogues in the world: risograph SE 9380, with speed 185 ppm, two-color risograph ME9350, unique A2-format risograph, widely used for newspaper printing, and the high-speed full-color ComColor printers. rRISO is: high performance, low cost printing, high reliability and environmental friendliness.r',
    '105203, Россия, г.Москва, ул. 12-я Парковая, д.5, оф.206',
    '206, bld. 5, 12 Parkovaya st., Moscow, 105203, Russian Federation',
    'www.riso.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (13, @oid);


 -- ЗАО НТЦ "Модуль" 

SET @oid = upsert_org(
    'ЗАО НТЦ "Модуль"',
    'Research Centre "Module"',
    'Закрытое акционерное общество Научно-технический центр "Модуль"',
    'Joint Stock Company Research Centre "Module"',
    '+7 (495) 531 3080',
    'rusales@module.ru',
    '25 лет ЗАО НТЦ «Модуль» успешно работает на российском рынке наукоемких технологий. Компания занимается практическими разработками и производством в области цифровой обработки сигналов и изображений,  построением функционально законченных вычислительных комплексов для ответственного применения (бортовая аппаратура и авионика); проектированием полузаказных цифровых и аналого-цифровых интегральных схем.',
    '25 years JSC Research Centre "Module" has been one of the few Russian firms that are leaders in the area of high technology embedded systems both in Russia and in the world. RC Module designs high-end RISC/DSP processors, mixed-signal ASICs and real-time video-image processing systems and provides embedded system design services to a variety of avionics and space equipment manufacturers.',
    '125167, г. Москва, 4-я улица 8-го Марта, д. 3',
    '3, Eight March 4th st., Moscow, 125167, Russia',
    'www.module.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (49, @oid);


 -- Сарансккабель-Оптика, ООО 

SET @oid = upsert_org(
    'Сарансккабель-Оптика, ООО',
    'Saranskkabel-Optika,Ltd.',
    'Общество с ограниченной ответственностью "Сарансккабель-Оптика"',
    'Saranskkabel-Optika,Ltd.',
    '8 (8342) 22-30-29',
    'optic@sarko.ru',
    'ООО«Сарансккабель-Оптика» - одно из ведущих предприятий России по производству волоконно-оптического кабеля. rПроизводство волоконно-оптического кабеля:r-для различных условий прокладки и эксплуатации (в грунтах, канализации, для подвеса на опорах линий электропередач, внутри помещений и т.д.); r-в т.ч. для сетей кабельного телевидения с применением волокна Corning® SMF-28e+™;r-встроенного в грозозащитный трос марки ОКГТ (OPGW);r-для построения сетей по технологии GPON.',
    'Saranskkabel-Optika,Ltd – one of the leading Russian companies producing fiber-optic cables. rProduction of fiber-optic cables:r- for different conditions of installation and exploitation (into grounds, in cable ducts, for suspension on overhead power lines, indoors etc);r- including cable television networks using fiber Corning® SMF-28e+™;r- incorporated in ground wire (OPGW);r- for networks based on GPON technology.',
    'РФ, Республика Мордовия, 430001, г.Саранск, ул. Строительная, 3',
    '3, Stroitelnaya St., Saransk, Republic of Mordovia, 430001, Russian Federation',
    'www.sarko.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (50, @oid);


 -- РФЯЦ-ВНИИЭФ 

SET @oid = upsert_org(
    'РФЯЦ-ВНИИЭФ',
    'RFNC-VNIIEF',
    'Российский федеральный ядерный центр – Всероссийский научно-исследовательский институт экспериментальной физики (ФГУП «РФЯЦ-ВНИИЭФ»)',
    'Russian Federal Nuclear Center – All-Russian Research Institute of Experimental Physicsr(FSUE “RFNC-VNIIEF”)r',
    '+7(83130)2-60-00',
    'staff@vniief.ru',
    'ФГУП Российский Федеральный Ядерный Центр – ВНИИЭФ – крупнейший научно-исследовательский центр России мирового значения, который может решать сложнейшие научные, оборонные и народнохозяйственные задачи. В институте ведутся работы по целому ряду наукоемких направлений от численного моделирования сложных физических процессов и разработки компактных супер-ЭВМ до производства датчиков, приборов и систем автоматизированного управления для предприятий ТЭК. r',
    'FGUP Russia Federal Nuclear Center – VNIIEF is one of the largest scientific and research centers throughout Russia capable of solving diverse problems in science, defense and national economy. The activities involving  the number of science-effective technologies, randing from numerical simulation of complicated phisical processes and development of small-size super-computers to production of sensors, devices and systems for automated control at fuel-energy complex are underway at the Institute.r',
    'Россия, 607188,Саров, пр.Мира, 37rrrr',
    'Russia, Sarov, Mira Ave, 37rrr',
    'www.vniief.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (13, @oid);


 -- Тетис Про, ОАО 

SET @oid = upsert_org(
    'Тетис Про, ОАО',
    'Tetis Pro, JSC',
    'ОАО "Тетис Про"',
    'Tetis Pro JSC',
    '+7 (495) 786-98-55',
    'tetis@tetis.ru',
    'Основные направления деятельности ОАО «Тетис Про» - разработка и производство подводной техники, поставка полного спектра водолазного снаряжения и современного высокотехнологичного оборудования для выполнения подводных работ в широком диапазоне глубин. Наша компания является основным поставщиком специального водолазного снаряжения и оборудования для МЧС РФ, МВД РФ, ФСБ, ФПС и Минобороны России, в т.ч. ВМФ, Инженерные войска и другие структуры. Среди клиентов -  крупнейшие промышленные предприятия России, а также судостроительные предприятия и организации, выполняющие разнообразные виды подводных работ.',
    'JSC “Tetis Pro” specializes in design, manufacture and supply of a full range of up-to-date domestic and imported underwater equipment, ROVs, diving and life support systems. Our key clients are the Emergency Ministry, the Ministry of Internal Affairs, the Federal Security Service, the Federal Border Service and the Ministry of Defence of the Russian Federation, including the Navy, Engineering Corps and other governmental institutions. Among our clients there are the largest  Russian industrial enterprises, shipbuilders and the organizations which carry out various types of underwater works.',
    'Россия, 117042, г. Москва, ул. Поляны, 54, а/я 73',
    '117042, Box 73, 54 Polyani st., Moscow, Russia',
    'www.tetis-pro.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (33, @oid);
INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (10, @oid);
INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (6, @oid);


 -- ОАО "Завод Электросигнал" 

SET @oid = upsert_org(
    'ОАО "Завод Электросигнал"',
    'Plant Electrosignal',
    'Открытое акционерное общество "Корпорация - Новосибирский завод Электросигнал"',
    'ELECTROSIGNAL Corporation',
    '(383) 266-06-42, 266-28-01, 269-29-71',
    'elest@electrosignal.ru',
    'Завод Электросигнал - известное в России и за ее пределами предприятие по выпуску профессиональных средств радиосвязи. Завод разрабатывает и изготавливает:r-авиационные бортовые радиостанции МВ и ДМВ диапазона, в том числе с режимом КРПД;r- авиационные наземные радиостанции серии "Юрок", имеющие сертификаты МАК; r- радиостанции низовой и космической связи для ВМФ;r- комплекс средств цифро-аналоговой радиосвязи с криптографической защитой информации серии "Альфа";r- радиостанции для железнодорожного транспорта.rКачество радиостанций соответствует международному стандарту ГОСТ ISO 9001-2011.',
    'ELECTROSIGNAL Corporation has been working in the field of development and production of radio electronics for 70 years. rMain production lines of the enterprise are aviation airborne and ground-based VHF radio stations corresponding to the requirements of ICAO, RTCA, ARING; radio stations for railway transport; analog radio stations of 146-174 MHz range of the «SIGNAL» family; digital-analog «Alpha» radio stations of 146 to 174 MHz range with cryptographic data protection for power structures. The output quality meets the requirements of the international standard ISO 9001.',
    'Россия, 630009, Новосибирск, ул. Добролюбова, д.31',
    'Dobrolyubov str., 31, Novosibirsk, 630009, Russia',
    'www.electrosignal.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (36, @oid);


 -- ООО "Проектэлектротехника" 

SET @oid = upsert_org(
    'ООО "Проектэлектротехника"',
    'LLC Proektelektrotechnika',
    'ООО "Проектэлектротехника"',
    'LLC Proektelektrotechnika',
    '8(8352)58-08-93, 58-08-94, 58-08-95',
    'petinfo@pr-t.ru, trans-pet@pr-t.ru',
    'Проектирование и производство силовых трансформаторов различного назначения. rnНаименование продукции: трансформаторы силовые сухие с литой изоляцией серии ТЛС номинальной мощностью от 25 до 12500 кВА классов напряжения до 35 кВ, реакторное оборудование, комплектные трансформаторные подстанции.rnПродукция соответствует требованиям ГОСТ 11677-85, ГОСТ Р 52719-2007 и ГОСТ 54827-2011, ГОСТ 16772-77 сертифицирована и испытана на сейсмическое воздействие интенсивностью 9 баллов по шкале MSK-64 и ударное воздействие до 10 g. Получена Лицензия Ростехнадзора. Имеется Свидетельство РМРС.',
    'Engineering and fabrication of power transformers used for various purposes. rnProducts designation: dry power transformers with casted insulation of the TLS series with the nominal capacity from 25 to 12500 kVA, voltage classes up to 35 kV, equipment for reactors, complete transformer substations. rnThe products correspond to the requirements of GOST 11677-85, GOST Р 52719-2007 and GOST 54827-2011, GOST 16772-77, the products are certified and tested for seismic impact equal to 9 points according to the MSK-64 scale and shock action up to 10 g. We were awarded with a license of the Federal Service for Ecological, Technological and Atomic Super',
    '429122, Россия, Республика Чувашия, г. Шумерля, Щербакова ул., 60',
    '60, Shcherbakov str., Shumerlya, Chuvash Republic, 429122, Russia',
    'www.trans-pet.ru, www.pr-t.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (50, @oid);


 -- СЗАО Завод САНТЭКС 

SET @oid = upsert_org(
    'СЗАО Завод САНТЭКС',
    'CJSC Plant Santex',
    'Совместное закрытое акционерное общество Завод САНТЭКС',
    'Closed joint stock company Plant SANTEKS',
    '+375-232-410055',
    'santex_by@mail.ru',
    'Производственное предприятие, специализирующееся на металообработке и производстве изделий из металла любой сложности.',
    'Production company specializing in metalwork and manufacture of metal products of any complexity.',
    '246043, Республика Беларусь, г. Гомель, ул. Барыкина 132.',
    'code 246043, 132 Barykina street, Gomel, Belarus.',
    'www.santex.by');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (47, @oid);


 -- Научно-производственное объединение завод «Волна», ПАО 

SET @oid = upsert_org(
    'Научно-производственное объединение завод «Волна», ПАО',
    '“Scientific and Production Association “Volna”, PSC',
    'ПАО "НПО Завод "Волна"',
    '“Scientific and Production Association “Volna”, PSC',
    '+7 (812) 252-09-14',
    'info@volnaspb.ru',
    '- Производит радиопередающие устройства комплексных аппаратных КВ-радиосвязиr- Выполняет модернизацию автоматизированных радиостанций КВ-диапазона, а также приемных и передающих центров радиосвязиr- Производит и поставляет мобильные и стационарные антенно-аппаратурные приемные и передающие комплексы на базе фазированных антенных решеток, в том числе в контейнерном исполнении.r- Проводит весь комплекс работ по ремонту оборудования радиосвязи, электропитающих установок, транспортной базы.r- Обеспечивает техническое сопровождение объектов по гарантийным обязательствам и после гарантийное обслуживание.r',
    '- Produces complex hardware radio transmitters HF radior- Performs automated upgrade radio HF band, as well as receiving and transmitting radio centersr- Produces and delivers mobile and fixed antenna receiving and transmitting instrumental systems based on phased arrays, including in container.r- Repairs radio equipment, power systems, transport base.r- Provides technical support facilities for warranty and after sales service.r',
    '198095, Россия, г. Санкт-Петербург,r ул. Маршала Говорова, д. 29',
    'Marchala Govorova St, 29, Saint-Petersburg, 198095, Russia',
    'www.volnaspb.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (36, @oid);


 -- Тетис МС, ОАО 

SET @oid = upsert_org(
    'Тетис МС, ОАО',
    'Tetis Medical Systems, JSC',
    'ОАО "Тетис Медицинские системы"',
    'Tetis Medical Systems JSC',
    '+7 (495) 786-98-51',
    'tem@tetis-med.ru',
    'Основным направлением ОАО «Тетис Медицинские Системы» - разработка комплексных решений, продажа и производство медицинского оборудования для лечебно-профилактических учреждений, служб экстренной медицинской помощи, различных ведомств и министерств России. Основными разработками компании являются медицинские комплексы, в состав которых входит современное высокотехнологичное медицинское оборудование для оказания медицинской помощи в экстренных условиях, при чрезвычайных ситуациях и в районах стихийных бедствий. Большая часть изделий, входящих в состав комплексов, изготавливается на собственной конструкторской и производственной площадке.',
    'The main business area of JSC “Tetis Medical Systems” is development of integrated solutions, design, manufacture and supply of medical equipment for health care centres, emergency services, various  ministries and governmental institutions of the Russian Federation.rCompany specializes in design of turnkey integrated systems. These systems includes modern hi-tech medical equipment for emergency health care in extreme conditions and in natural disaster areas. rThe major part of medical devices which makes up the integrated systems, is produced  on our own design and manufacturing area.r',
    'Россия, 117042, г. Москва, ул. Поляны, 54, а/я 73',
    '117042, Box 73, 54 Polyani st., Moscow, Russia',
    'www.tetis-med.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (38, @oid);
INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (33, @oid);
INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (18, @oid);


 -- ЭЛВИС-НеоТек 

SET @oid = upsert_org(
    'ЭЛВИС-НеоТек',
    'ELVEES NeoTek',
    'Закрытое акционерное общество «ЭЛВИС-НеоТек»',
    'Closed Joint Stock Company "ELVEES NeoTek"',
    '+7(495)648-78-23',
    'main@elvees.com',
    '«ЭЛВИС-НеоТек» – отечественный разработчик и производитель высокотехнологичных систем безопасности и бизнес-мониторинга с применением технологий распознавания образов, компьютерного зрения, радиолокационного, видео, тепловизионного наблюдения, биометрической идентификации и т.д.r«ЭЛВИС-НеоТек» является проектной компанией ОАО «РОСНАНО».',
    'ELVEES NeoTek — a Russian developer and manufacturer of high-tech security and business monitoring systems using technologies of image recognition, computer vision, radar, video and thermal imaging surveillance and biometric identification, etc.rThe company has been of the market for more than a decade.rELVEES company group employs more than 450 specialists, 5 Doctors of Engineering and 25 Candidates of Science.rELVEES-NeoTek was established with the support of ROSNANO, JSC.r',
    'Российская Федерация, 124498, г. Москва, Зеленоград, проезд № 4922, дом 4, стр.2',
    'Proezd 4922, dom 4, stroenie 2, Zelenograd, Moscow, Russia, 124498',
    'www.elvees.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (23, @oid);


 -- МГТУ им.Н.Э. Баумана 

SET @oid = upsert_org(
    'МГТУ им.Н.Э. Баумана',
    'BMSTU',
    'федеральное государственное бюджетное образовательное учреждение высшего профессионального образования "Московский государственный технический университет МГТУ им.Н.Э. Баумана"',
    'Bauman Moscow State Technical University',
    '+7 499-263-63-91',
    'bauman@bmstu.ru',
    'Московский государственный технический университет имени Н.Э. Баумана, основанный в 1830 году, является ведущим инженерным вузом России и хорошо известен за рубежом.r     Наш университет осуществляет подготовку бакалавров, магистров, дипломированных специалистов, кандидатов и докторов наук по широкому спектру инженерных специальностей.r     МГТУ им. Н.Э. Баумана является также ведущим научно-исследовательским центром. Университет располагает уникальной базой для научных исследований и проводит  научно-исследовательские и  опытно-конструкторские работы по новейшим направления науки и техники.',
    'Bauman Moscow State Technical  University (BMSTU) founded in 1830 is a leading engineering university of Russia.r    Our University offers study programmes leading to Bachelors and Masters degrees, Diploma of Engineer, PhD and Doctor of Science across a wide portfolio of subjects. BMSTU is leading center of higher education and research engineering. It has a unique research  and   development  base that helps conduct research  and   development  in diverse emerging science and technology areas',
    '105005, Россия, г. Москва, 2-я Бауманская, д. 5 стр. 1.',
    'Russia, 105005, Moscow, 5  bldg. 1, 2-nd  Baumanskaya str.,',
    'www.bmstu.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (27, @oid);


 -- Миасский машиностроительный завод, ОАО 

SET @oid = upsert_org(
    'Миасский машиностроительный завод, ОАО',
    'ZAVOD MIASS',
    'Открытое акционерное общество "Миасский машиностроительный завод"',
    'Open Joint Stock Company',
    '8 3513 298-100',
    'info@mmz.ru',
    'ОАО «Миасский машиностроительный завод» является успешно развивающимся предприятием, входящим в структуру Объединенной Ракетно-Космической корпорации. Предприятие располагает необходимым оборудованием для выполнения сложных технологических операций в области машино- и приборостроения, обладает мощным потенциалом, основанным на новейших научно-технических достижениях, внедряет и продвигает собственные разработки.rnrnНаправления производства:rnrn- компоненты ракетных комплексов для ВМФ РФ;rn- кабели и разъемы для ВМФ РФ;rn- снегоходы;rn- светодиодные светильники;rn- оборудование для нефтехимической отрасли.rn',
    'Zavod "Miass" is one of the promising and successfully evolutive enterprise of Russia included in the structure of the United Rocket and Space Corporation. The enterprise has the required hardware for complicated technological operations in machinery and tool engineering, production capabilities based on the latest scientific and technical advancements in defense branch, it is also implementing and promoting the in-house developments.rnrnProduction areas:rnrn- parts of missile complexes for the Russian Navy;rn- cables and connectors for the Russian Navy;rn- snowmobiles;rn- LED lighting devices:rn- products for petrochemical industry.rn',
    '456320, Россия, Челябинская область, город Миасс, Тургоякское шоссе, 1',
    '1, Tyrgoyak road, Miass, Chelyabinsk region, Russia',
    'www.mmz.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (6, @oid);


 -- Чайковский текстиль, группа компаний 

SET @oid = upsert_org(
    'Чайковский текстиль, группа компаний',
    'Tchaikovsky Textile, the Group of Companies',
    'Чайковский текстиль, группа компаний',
    'Tchaikovsky Textile, the Group of Companies',
    '+7 495 745-09-15',
    'info@textile.ru',
    'Ведущий российский разработчик и производитель тканей для униформы военнослужащих. Более 50 лет опыта производства тканей, опыт разработки тканей для силовых структур - более 40 лет. Производство сертифицировано по ISO 9001, ISO 14001 и OHSAS 18001. Компания производит ткани для форменных рубашек, инновационные ткани для зимней, летней и повседневной  униформы, ткани специального назначения. Разработки и производство ведутся в плотном контакте со специалистами силовых структур РФ в четком соответствии с требованиями и с применением новейших достижений легкой промышленности.',
    'A leading developer and manufacturer of fabrics for military uniform. More than 50 years of experience producing fabrics, more than 40 years\' experience of fabrics development for military structures. The production is certified according to ISO 9001, ISO 14001 and OHSAS 18001. The company manufactures fabrics for uniform shirts, innovative fabrics for winter, summer and conventional uniforms, fabrics for special assignments.',
    'Россия, 109052, Москва, ул. Нижегородская, д. 29',
    'H. 29, Nizhegorodskaya St., Moscow, 109052, Russia',
    'www.textile.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (48, @oid);


 -- НИИ "Солитон" ОАО 

SET @oid = upsert_org(
    'НИИ "Солитон" ОАО',
    '«NII «Soliton» ОАО',
    'Открытое акционерное общество « Научно-исследовательский институт «Солитон»',
    'Research institute «Soliton» Joint stock company',
    '(347)228-85-90',
    'soliton9@online.ru',
    'Разработка, изготовление контрольно-измерительной аппаратуры и телекоммуникационного оборудования повышенной живучести для интегральных цифровых сетей связи, аппаратно-программных комплексов.',
    'Development and production of control-measuring equipment and higt survivable telecommunication equipment for integrated digital communication networks and operating-programmed complexes',
    'Россия, РБ, г. Уфа, 450000, ул. Айская 46',
    '46, Aiskaya str., 450000, Ufa, Russia',
    '');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (13, @oid);


 -- ЗВЕЗДА-ЭНЕРГЕТИКА 

SET @oid = upsert_org(
    'ЗВЕЗДА-ЭНЕРГЕТИКА',
    'ZVEZDA-ENERGETIKA',
    'ОАО "ЗВЕЗДА-ЭНЕРГЕТИКА"',
    'JSC "ZVEZDA-ENERGETIKA"',
    '+7 812 777 9000',
    'office@energostar.com',
    'ЗВЕЗДА-ЭНЕРГЕТИКА – Санкт-Петербургское энергомашиностроительное предприятие, основанное в 2001 году. Компания оказывает полный спектр услуг по строительству энергоустановок на базе дизельных и газопоршневых двигателей, а также газовых турбин, предлагает решения по энергообеспечению для различных отраслей промышленности и инфраструктуры. Производственная площадь предприятия составляет 18 000 м², также в ее состав входят уникальные испытательные стенды. Компания постоянно разрабатывает новую высокотехнологичную продукцию, ведет активную научную деятельность.',
    'ZVEZDA-ENERGETIKA - Saint-Petersburg  power machine building enterprise, founded in 2001. The company provides a full range of services for the construction of power plants based on diesel and gas engines and gas turbines, offers solutions for energy supply for various industries and infrastructure. The production area of the plant is 18 000 m2, including a unique test stands. The company is constantly developing new high-tech products, conducts scientific activity.',
    '198097, Санкт-Петербург, проспект Стачек, дом 47, почтовое отделение №97',
    '47, Stachek av., St. Petersburg, 198097, Russia; p/o 97',
    'www.energostar.com');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (50, @oid);


 -- ООО «СпецЭнерго» 

SET @oid = upsert_org(
    'ООО «СпецЭнерго»',
    'СпецЭнерго',
    'ООО «СпецЭнерго»',
    'LLC «Spetсenergo»r',
    '(812) 245-07-60',
    'info@specenergo.com',
    'ООО «СпецЭнерго» специализируется на проектировании, изготовлении и поставке электротехнического оборудования 0,4-110 кВ, для обеспечения надежного электроснабжения потребителей.В линейку производимого и поставляемого компанией оборудования входит:r мобильное КРУ 6 – 10 кВ;r мобильные модульные подстанции (ММПС) 20/10/0,4 кВ;r мобильные и модульные подстанции (ММПС) 35 кВ –110 кВ.rr',
    'We specializing in the design, manufacture and supply of electrical equipment of 0.4-110 kV to ensure a reliable power supply to our consumers.rThe range manufactured and supplied by the equipment includes: r Mobile Indoor switchgear assembly 6 - 10 kV; r Mobile modular substation 20/10 / 0.4 kV; r Mobile and modular substation  35 kV 110 kV. r',
    '195220, г. Санкт-Петербург, пр. Непокоренных, д.49 лит А.r',
    'Russia, 195220, Sankt Petersburg, pr. Nepokorennich, d.49, lit.А.r',
    'specenergo.com');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (50, @oid);


 -- ЗАО "АЭРОКОН" 

SET @oid = upsert_org(
    'ЗАО "АЭРОКОН"',
    '"AEROCON", JSC',
    'Закрытое акционерное общество "АЭРОКОН"',
    '"AEROCON", Joint-stock company',
    '+7 (495) 777-63-25',
    'office@aerocon.ru',
    'ЗАО "АЭРОКОН" - инновационная компания на базе ЦАГИ им. проф. Н.Е.Жуковского, работающая в авиационной отрасли с 1991г.rnПредметы деятельности:rn- Беспилотные авиационные комплексы "INSPECTOR";rn- Автоматизированная система управления полетом БЛА (автопилот) с единым высокоскоростным цифровым каналом связи и широким набором интерфейсов;rn- Амфибийное транспортное средство (прототип аэросаней) - аэроджип "FORTIS", предназначенный для транспортирования 5 человек или 500 кг груза по мелководью, льду, снегу, глубокой воде.',
    '"AEROCON" JSC is an Innovation Company that is established based on TsAGI n.a. prof. N.E.Zhukovsky. The enterprise is engaged in aeronautical industry since 1991.rnScope:rn- "INSPECTOR" Unmanned Aircraft Vehicle complexes;rn- Automated UAV flight control system (autopilot) with integrated high speed digital communication bus and multiple interface set;rn- "FORTIS" aerojeep that constitutes an amphibian transport vehicle (snowplane prototype), and is intended for patrolling, transportation of 5 persons or of a pay-load of 500kg when driving on shallow water, ice, snow and deep water.',
    '140180, Московская область, г. Жуковский, ул. Жуковского, д.1',
    'Zhukovskogo str. 1, Zhukovsky city, Moscow region, Russia, 140180',
    'www.aerocon.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (33, @oid);


 -- ОСТЕОМЕД 

SET @oid = upsert_org(
    'ОСТЕОМЕД',
    'OSTEOMED',
    'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ОСТЕОМЕД"',
    'OSTEOMED',
    '(495) 602-86-13; 602-87-59',
    'info@osteomed.ru',
    'Занимаясь разработкой и производством систем для травматологии, ортопедии и эндопротезирования с 1989г., фирма ООО "ОСТЕОМЕД" обеспечивает традиционно высокое качество, функциональность и надежность изделий.r"Остеомед" предлагает имплантаты и инструменты  для интрамедуллярного остеосинтеза, накостного остеосинтеза пластинами и винтами, остеосинтеза канюлированными винтами, остеосинтеза костей таза, наружной фиксации (АНФ), эндопротезирования, хирургии позвоночника.',
    'rOsteomed trademark has been known since 1989. Constant drive for improvement and focus on meeting the needs of practicing surgeons and their patients allowed the company to take the leading positions among producers of implants and instruments for traumatology and orthopedics. Today Osteomed products are much in demand and widely recognized by clinicians. At present the company specializes on developing and manufacturing of implants and equipment for traumatology, endoprosthesis replacement and spine surgery. Since 2005 Osteomed-M manufacturing company has been located at #8 ulitsa Tankistov, Rybinsk, Yaroslavskaya oblast (region) Russia',
    '129301 МОСКВА ул. Касаткина, д.3а, стр. 11',
    '129301 Moscow street Kasatkina 3а building 11',
    'www.osteomed.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (18, @oid);


 -- ЗВЕЗДА, ОАО 

SET @oid = upsert_org(
    'ЗВЕЗДА, ОАО',
    'ZVEZDA, JSC',
    'ОАО "ЗВЕЗДА"',
    'JSC "ZVEZDA"',
    '+7 812 362 07 47, 703 00 70',
    'office@zvezda.spb.ru',
    'ОАО «ЗВЕЗДА» - ведущий российский производитель высокооборотных судовых дизельных двигателей (500-7400 кВт), судовых реверс-редукторных передач (до 40000 кВт); судовых дизель-генераторов (300-800 кВт) и автоматизированных стационарных и контейнерных электростанций аварийно-резервного и основного энергоснабжения (315-1500 кВт).r Сервис: гарантийное обслуживание, запчасти, ремонт, обучение, консультацииr Услуги: алюминиевое литье и механообработка, включая особо точную на станках с ЧПУrПредприятие основано в 1932 году.r',
    'JSC “ZVEZDA” is the leading Russian manufacturer of high-speed marine diesel engines (500-7400 kW); marine reverse-reduction gearboxes (up to 40000 kW); marine diesel-generators (300-800 kW); automated stationary and containerized generating sets for stand-by, emergency and main power supply (315-1500 kW).r- Product-related services: warranty maintenance, spare parts, repairs, training, consultationsr- Other services: aluminum casting, machining (including high-precision machining), tool production, etc.',
    'Россия, 192012 Санкт-Петербург, ул. Бабушкина 123',
    '123 Babushkina St., St.-Petersburg, 192012 Russia',
    'www.zvezda.spb.ru');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (11, @oid);


 -- «Горьковский завод аппаратуры связи им. А.С.Попова» 

SET @oid = upsert_org(
    '«Горьковский завод аппаратуры связи им. А.С.Попова»',
    'Joint Stock Company "GZAS named after A.S. Popov"',
    'ОАО "Горьковский завод аппаратуры связи им. А.С. Попова"',
    'Joint Stock Company "GZAS named after A.S. Popov»',
    '(831) 260-01-01; факс (831) 260-02-61',
    'info@gzas.ru',
    'ОАО «ГЗАС им. А.С. Попова» основан в 1916 году. Предприятие осуществляет производство, техническое обслуживание, ремонт и модернизацию авиационных и наземных радиостанций СВ и ДКМВ диапазонов мощностью от 50 до 400 Вт, авиационных модулей комплексов радиосвязи, самолетных переговорных устройств, аппаратуры речевого оповещения. Здесь ведутся работы по модернизации аппаратуры связи для авиационной техники (самолетов, вертолетов), Министерства обороны РФ, ФСБ, МЧС, МВД, а также для Пограничных войск и Таможенной службы страны. rТакже завод выпускает физиотерапевтические приборы для домашнего применения – аппарат магнитотерапии «АМнп-01» и кварце',
    'JSC «GZAS named after A.S. Popov» was founded in 1916. The Plant is engaged in the production, maintenance, repair and modernization of aircraft and ground stations ST and HF ranges, air and ground modules of radiocommunication equipment complexes for internal communication. Each also produces switch board for objects of armore and aircraft, as well as equipment of voice announcement.rJSC «GZAS named after A.S. Popov» produces physiotherapeutic devices for hospitals and home use - the unit of magnetic therapy and quartz ultraviolet irradiatorsr',
    '603951, г. Нижний Новгород, ул. Интернациональная, д.100',
    '603951 Nizhniy Novgorod International str.100',
    'http://www.gzas.ru/');

INSERT IGNORE INTO organizations_sections(sectionid, organizationid) VALUES (10, @oid);
DROP FUNCTION upsert_org;
