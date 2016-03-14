-- -------------------------------------------------------------------------------------
-- merge 58 <= 138

-- organizations
--      id status logo phone email site business_sectionid
-- src: '138','7','','','','','NULL'
-- dst: '58','3','img/iifrf_logo.png','8 (4967) 35-31-93 ','info@iifrf.ru','http://www.iifrf.ru/','NULL'

UPDATE organizations SET 
  status = '3',
  logo = 'img/iifrf_logo.png',
  phone = '8 (4967) 35-31-93',
  email = 'info@iifrf.ru',
  site = 'http://www.iifrf.ru/',
  business_sectionid = NULL
  WHERE id = 58;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '173','138','0','Институт инженерной физики','Институт инженерной физики','NULL',''
-- dst: '7','58','0','Институт инженерной физик','Институт инженерной физики','NULL','Московская обл., г.Серпухов, Б. Ударный пер., д. 1а'

UPDATE organizations_tr SET 
  shortname = 'Институт инженерной физики',
  fullname = 'Институт инженерной физики',
  description = NULL,
  address = 'Московская обл., г.Серпухов, Б. Ударный пер., д. 1а'
  WHERE languageid = 0 AND organizationid = 58;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '174','138','1','Institut inzhenernoj fiziki','Institut inzhenernoj fiziki','NULL',''
-- dst: '15','58','1','Institute of Engineering Physics','Institute of Engineering Physics','NULL','Moskovskaya oblast, Serpukhov, Bolshoy Udarny pereulok, 1a'

UPDATE organizations_tr SET 
  shortname = 'Institute of Engineering Physics',
  fullname = 'Institute of Engineering Physics',
  description = NULL,
  address = 'Moskovskaya oblast, Serpukhov, Bolshoy Udarny pereulok, 1a'
  WHERE languageid = 1 AND organizationid = 58;


UPDATE IGNORE exhibitions SET organizationid = 58 WHERE organizationid = 138;
UPDATE IGNORE persons SET organizationid = 58 WHERE organizationid = 138;
UPDATE IGNORE media SET organizationid = 58 WHERE organizationid = 138;
UPDATE IGNORE news SET organizationid = 58 WHERE organizationid = 138;
UPDATE IGNORE places_organizations SET organizationid = 58 WHERE organizationid = 138;
UPDATE IGNORE events_organizations SET organizationid = 58 WHERE organizationid = 138;
UPDATE IGNORE organizations_sections SET organizationid = 58 WHERE organizationid = 138;
DELETE FROM organizations WHERE id = 138;



-- -------------------------------------------------------------------------------------
-- merge 58 <= 265

-- organizations
--      id status logo phone email site business_sectionid
-- src: '265','7','','','','','NULL'
-- dst: '58','3','img/iifrf_logo.png','8 (4967) 35-31-93 ','info@iifrf.ru','http://www.iifrf.ru/','NULL'

UPDATE organizations SET 
  status = '3',
  logo = 'img/iifrf_logo.png',
  phone = '8 (4967) 35-31-93',
  email = 'info@iifrf.ru',
  site = 'http://www.iifrf.ru/',
  business_sectionid = NULL
  WHERE id = 58;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '427','265','0','Институт инженерной физики','Институт инженерной физики','NULL',''
-- dst: '7','58','0','Институт инженерной физик','Институт инженерной физики','NULL','Московская обл., г.Серпухов, Б. Ударный пер., д. 1а'

UPDATE organizations_tr SET 
  shortname = 'Институт инженерной физики',
  fullname = 'Институт инженерной физики',
  description = NULL,
  address = 'Московская обл., г.Серпухов, Б. Ударный пер., д. 1а'
  WHERE languageid = 0 AND organizationid = 58;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '428','265','1','Institut inzhenernoj fiziki','Institut inzhenernoj fiziki','NULL',''
-- dst: '15','58','1','Institute of Engineering Physics','Institute of Engineering Physics','NULL','Moskovskaya oblast, Serpukhov, Bolshoy Udarny pereulok, 1a'

UPDATE organizations_tr SET 
  shortname = 'Institute of Engineering Physics',
  fullname = 'Institute of Engineering Physics',
  description = NULL,
  address = 'Moskovskaya oblast, Serpukhov, Bolshoy Udarny pereulok, 1a'
  WHERE languageid = 1 AND organizationid = 58;


UPDATE IGNORE exhibitions SET organizationid = 58 WHERE organizationid = 265;
UPDATE IGNORE persons SET organizationid = 58 WHERE organizationid = 265;
UPDATE IGNORE media SET organizationid = 58 WHERE organizationid = 265;
UPDATE IGNORE news SET organizationid = 58 WHERE organizationid = 265;
UPDATE IGNORE places_organizations SET organizationid = 58 WHERE organizationid = 265;
UPDATE IGNORE events_organizations SET organizationid = 58 WHERE organizationid = 265;
UPDATE IGNORE organizations_sections SET organizationid = 58 WHERE organizationid = 265;
DELETE FROM organizations WHERE id = 265;



-- -------------------------------------------------------------------------------------
-- merge 90 <= 284

-- organizations
--      id status logo phone email site business_sectionid
-- src: '284','7','','','','','NULL'
-- dst: '90','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '',
  phone = '',
  email = '',
  site = '',
  business_sectionid = NULL
  WHERE id = 90;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '465','284','0','Алмаз-Антей','Алмаз-Антей','NULL',''
-- dst: '77','90','0','Алмаз-Антей','Алмаз-Антей','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Алмаз-Антей',
  fullname = 'Алмаз-Антей',
  description = NULL,
  address = ''
  WHERE languageid = 0 AND organizationid = 90;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '466','284','1','Almaz-Antej','Almaz-Antej','NULL',''
-- dst: '78','90','1','Almaz-Antej','Almaz-Antej','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Almaz-Antej',
  fullname = 'Almaz-Antej',
  description = NULL,
  address = ''
  WHERE languageid = 1 AND organizationid = 90;


UPDATE IGNORE exhibitions SET organizationid = 90 WHERE organizationid = 284;
UPDATE IGNORE persons SET organizationid = 90 WHERE organizationid = 284;
UPDATE IGNORE media SET organizationid = 90 WHERE organizationid = 284;
UPDATE IGNORE news SET organizationid = 90 WHERE organizationid = 284;
UPDATE IGNORE places_organizations SET organizationid = 90 WHERE organizationid = 284;
UPDATE IGNORE events_organizations SET organizationid = 90 WHERE organizationid = 284;
UPDATE IGNORE organizations_sections SET organizationid = 90 WHERE organizationid = 284;
DELETE FROM organizations WHERE id = 284;



-- -------------------------------------------------------------------------------------
-- merge 233 <= 234

-- organizations
--      id status logo phone email site business_sectionid
-- src: '234','7','','','','','NULL'
-- dst: '233','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '',
  phone = '',
  email = '',
  site = '',
  business_sectionid = NULL
  WHERE id = 233;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '365','234','0','Архив','Архив','NULL',''
-- dst: '363','233','0','Архив','Архив','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Архив',
  fullname = 'Архив',
  description = NULL,
  address = ''
  WHERE languageid = 0 AND organizationid = 233;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '366','234','1','Arhiw','Arhiw','NULL',''
-- dst: '364','233','1','Arhiw','Arhiw','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Arhiw',
  fullname = 'Arhiw',
  description = NULL,
  address = ''
  WHERE languageid = 1 AND organizationid = 233;


UPDATE IGNORE exhibitions SET organizationid = 233 WHERE organizationid = 234;
UPDATE IGNORE persons SET organizationid = 233 WHERE organizationid = 234;
UPDATE IGNORE media SET organizationid = 233 WHERE organizationid = 234;
UPDATE IGNORE news SET organizationid = 233 WHERE organizationid = 234;
UPDATE IGNORE places_organizations SET organizationid = 233 WHERE organizationid = 234;
UPDATE IGNORE events_organizations SET organizationid = 233 WHERE organizationid = 234;
UPDATE IGNORE organizations_sections SET organizationid = 233 WHERE organizationid = 234;
DELETE FROM organizations WHERE id = 234;



-- -------------------------------------------------------------------------------------
-- merge 116 <= 295

-- organizations
--      id status logo phone email site business_sectionid
-- src: '295','7','','','','','NULL'
-- dst: '116','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '',
  phone = '',
  email = '',
  site = '',
  business_sectionid = NULL
  WHERE id = 116;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '487','295','0','АсТейс','АсТейс','NULL',''
-- dst: '129','116','0','АсТейс','АсТейс','NULL',''

UPDATE organizations_tr SET 
  shortname = 'АсТейс',
  fullname = 'АсТейс',
  description = NULL,
  address = ''
  WHERE languageid = 0 AND organizationid = 116;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '488','295','1','AsTejs','AsTejs','NULL',''
-- dst: '130','116','1','AsTejs','AsTejs','NULL',''

UPDATE organizations_tr SET 
  shortname = 'AsTejs',
  fullname = 'AsTejs',
  description = NULL,
  address = ''
  WHERE languageid = 1 AND organizationid = 116;


UPDATE IGNORE exhibitions SET organizationid = 116 WHERE organizationid = 295;
UPDATE IGNORE persons SET organizationid = 116 WHERE organizationid = 295;
UPDATE IGNORE media SET organizationid = 116 WHERE organizationid = 295;
UPDATE IGNORE news SET organizationid = 116 WHERE organizationid = 295;
UPDATE IGNORE places_organizations SET organizationid = 116 WHERE organizationid = 295;
UPDATE IGNORE events_organizations SET organizationid = 116 WHERE organizationid = 295;
UPDATE IGNORE organizations_sections SET organizationid = 116 WHERE organizationid = 295;
DELETE FROM organizations WHERE id = 295;



-- -------------------------------------------------------------------------------------
-- merge 56 <= 92

-- organizations
--      id status logo phone email site business_sectionid
-- src: '92','7','','','','','NULL'
-- dst: '56','5','img/russianhelicopters_logo.png','+7 (495) 627-5545','info@russianhelicopters.aero','http://www.russianhelicopters.aero/','NULL'

UPDATE organizations SET 
  status = '5',
  logo = 'img/russianhelicopters_logo.png',
  phone = '+7 (495) 627-5545',
  email = 'info@russianhelicopters.aero',
  site = 'http://www.russianhelicopters.aero/',
  business_sectionid = NULL
  WHERE id = 56;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '81','92','0','Вертолеты России','Вертолеты России','NULL',''
-- dst: '5','56','0','Вертолеты России','Вертолеты России','NULL','г. Москва, Краснопресненская наб. 12, подъезд №9, этаж 21'

UPDATE organizations_tr SET 
  shortname = 'Вертолеты России',
  fullname = 'Вертолеты России',
  description = NULL,
  address = 'г. Москва, Краснопресненская наб. 12, подъезд №9, этаж 21'
  WHERE languageid = 0 AND organizationid = 56;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '82','92','1','Wertolety Rossii','Wertolety Rossii','NULL',''
-- dst: '13','56','1','Russian Helicopters','Russian Helicopters','NULL','Moscow, Krasnopresnenskaya naberezhnaya 12, porch 9, floor 21'

UPDATE organizations_tr SET 
  shortname = 'Russian Helicopters',
  fullname = 'Russian Helicopters',
  description = NULL,
  address = 'Moscow, Krasnopresnenskaya naberezhnaya 12, porch 9, floor 21'
  WHERE languageid = 1 AND organizationid = 56;


UPDATE IGNORE exhibitions SET organizationid = 56 WHERE organizationid = 92;
UPDATE IGNORE persons SET organizationid = 56 WHERE organizationid = 92;
UPDATE IGNORE media SET organizationid = 56 WHERE organizationid = 92;
UPDATE IGNORE news SET organizationid = 56 WHERE organizationid = 92;
UPDATE IGNORE places_organizations SET organizationid = 56 WHERE organizationid = 92;
UPDATE IGNORE events_organizations SET organizationid = 56 WHERE organizationid = 92;
UPDATE IGNORE organizations_sections SET organizationid = 56 WHERE organizationid = 92;
DELETE FROM organizations WHERE id = 92;



-- -------------------------------------------------------------------------------------
-- merge 145 <= 294

-- organizations
--      id status logo phone email site business_sectionid
-- src: '294','7','','','','','NULL'
-- dst: '145','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '',
  phone = '',
  email = '',
  site = '',
  business_sectionid = NULL
  WHERE id = 145;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '485','294','0','Интралл Рус','Интралл Рус','NULL',''
-- dst: '187','145','0','Интралл Рус','Интралл Рус','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Интралл Рус',
  fullname = 'Интралл Рус',
  description = NULL,
  address = ''
  WHERE languageid = 0 AND organizationid = 145;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '486','294','1','Intrall Rus','Intrall Rus','NULL',''
-- dst: '188','145','1','Intrall Rus','Intrall Rus','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Intrall Rus',
  fullname = 'Intrall Rus',
  description = NULL,
  address = ''
  WHERE languageid = 1 AND organizationid = 145;


UPDATE IGNORE exhibitions SET organizationid = 145 WHERE organizationid = 294;
UPDATE IGNORE persons SET organizationid = 145 WHERE organizationid = 294;
UPDATE IGNORE media SET organizationid = 145 WHERE organizationid = 294;
UPDATE IGNORE news SET organizationid = 145 WHERE organizationid = 294;
UPDATE IGNORE places_organizations SET organizationid = 145 WHERE organizationid = 294;
UPDATE IGNORE events_organizations SET organizationid = 145 WHERE organizationid = 294;
UPDATE IGNORE organizations_sections SET organizationid = 145 WHERE organizationid = 294;
DELETE FROM organizations WHERE id = 294;



-- -------------------------------------------------------------------------------------
-- merge 85 <= 285

-- organizations
--      id status logo phone email site business_sectionid
-- src: '285','7','','','','','NULL'
-- dst: '85','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '',
  phone = '',
  email = '',
  site = '',
  business_sectionid = NULL
  WHERE id = 85;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '467','285','0','Концерн ВЕГА','Концерн ВЕГА','NULL',''
-- dst: '67','85','0','Концерн ВЕГА','Концерн ВЕГА','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Концерн ВЕГА',
  fullname = 'Концерн ВЕГА',
  description = NULL,
  address = ''
  WHERE languageid = 0 AND organizationid = 85;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '468','285','1','Koncern WEGA','Koncern WEGA','NULL',''
-- dst: '68','85','1','Koncern WEGA','Koncern WEGA','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Koncern WEGA',
  fullname = 'Koncern WEGA',
  description = NULL,
  address = ''
  WHERE languageid = 1 AND organizationid = 85;


UPDATE IGNORE exhibitions SET organizationid = 85 WHERE organizationid = 285;
UPDATE IGNORE persons SET organizationid = 85 WHERE organizationid = 285;
UPDATE IGNORE media SET organizationid = 85 WHERE organizationid = 285;
UPDATE IGNORE news SET organizationid = 85 WHERE organizationid = 285;
UPDATE IGNORE places_organizations SET organizationid = 85 WHERE organizationid = 285;
UPDATE IGNORE events_organizations SET organizationid = 85 WHERE organizationid = 285;
UPDATE IGNORE organizations_sections SET organizationid = 85 WHERE organizationid = 285;
DELETE FROM organizations WHERE id = 285;



-- -------------------------------------------------------------------------------------
-- merge 94 <= 286

-- organizations
--      id status logo phone email site business_sectionid
-- src: '286','7','','','','','NULL'
-- dst: '94','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '',
  phone = '',
  email = '',
  site = '',
  business_sectionid = NULL
  WHERE id = 94;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '469','286','0','КРЭТ','КРЭТ','NULL',''
-- dst: '85','94','0','КРЭТ','КРЭТ','NULL',''

UPDATE organizations_tr SET 
  shortname = 'КРЭТ',
  fullname = 'КРЭТ',
  description = NULL,
  address = ''
  WHERE languageid = 0 AND organizationid = 94;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '470','286','1','KRET','KRET','NULL',''
-- dst: '86','94','1','KRET','KRET','NULL',''

UPDATE organizations_tr SET 
  shortname = 'KRET',
  fullname = 'KRET',
  description = NULL,
  address = ''
  WHERE languageid = 1 AND organizationid = 94;


UPDATE IGNORE exhibitions SET organizationid = 94 WHERE organizationid = 286;
UPDATE IGNORE persons SET organizationid = 94 WHERE organizationid = 286;
UPDATE IGNORE media SET organizationid = 94 WHERE organizationid = 286;
UPDATE IGNORE news SET organizationid = 94 WHERE organizationid = 286;
UPDATE IGNORE places_organizations SET organizationid = 94 WHERE organizationid = 286;
UPDATE IGNORE events_organizations SET organizationid = 94 WHERE organizationid = 286;
UPDATE IGNORE organizations_sections SET organizationid = 94 WHERE organizationid = 286;
DELETE FROM organizations WHERE id = 286;



-- -------------------------------------------------------------------------------------
-- merge 158 <= 304

-- organizations
--      id status logo phone email site business_sectionid
-- src: '304','7','','','','','NULL'
-- dst: '158','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '',
  phone = '',
  email = '',
  site = '',
  business_sectionid = NULL
  WHERE id = 158;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '505','304','0','МГТУ им. Баумана','МГТУ им. Баумана','NULL',''
-- dst: '213','158','0','МГТУ им.Баумана','МГТУ им.Баумана','NULL',''

UPDATE organizations_tr SET 
  shortname = 'МГТУ им.Баумана',
  fullname = 'МГТУ им.Баумана',
  description = NULL,
  address = ''
  WHERE languageid = 0 AND organizationid = 158;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '506','304','1','MGTU im. Baumana','MGTU im. Baumana','NULL',''
-- dst: '214','158','1','MGTU im.Baumana','MGTU im.Baumana','NULL',''

UPDATE organizations_tr SET 
  shortname = 'MGTU im.Baumana',
  fullname = 'MGTU im.Baumana',
  description = NULL,
  address = ''
  WHERE languageid = 1 AND organizationid = 158;


UPDATE IGNORE exhibitions SET organizationid = 158 WHERE organizationid = 304;
UPDATE IGNORE persons SET organizationid = 158 WHERE organizationid = 304;
UPDATE IGNORE media SET organizationid = 158 WHERE organizationid = 304;
UPDATE IGNORE news SET organizationid = 158 WHERE organizationid = 304;
UPDATE IGNORE places_organizations SET organizationid = 158 WHERE organizationid = 304;
UPDATE IGNORE events_organizations SET organizationid = 158 WHERE organizationid = 304;
UPDATE IGNORE organizations_sections SET organizationid = 158 WHERE organizationid = 304;
DELETE FROM organizations WHERE id = 304;



-- -------------------------------------------------------------------------------------
-- merge 158 <= 843

-- organizations
--      id status logo phone email site business_sectionid
-- src: '843','7','/images/logos/843.png','+7 499-263-63-91','bauman@bmstu.ru','www.bmstu.ru','NULL'
-- dst: '158','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '/images/logos/843.png',
  phone = '+7 499-263-63-91',
  email = 'bauman@bmstu.ru',
  site = 'www.bmstu.ru',
  business_sectionid = NULL
  WHERE id = 158;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '575','843','0','МГТУ им.Н.Э. Баумана','федеральное государственное бюджетное образовательное учреждение высшего профессионального образования "Московский государственный технический университет МГТУ им.Н.Э. Баумана"','Московский государственный технический университет имени Н.Э. Баумана, основанный в 1830 году, является ведущим инженерным вузом России и хорошо известен за рубежом.r     Наш университет осуществляет подготовку бакалавров, магистров, дипломированных специалистов, кандидатов и докторов наук по широкому спектру инженерных специальностей.r     МГТУ им. Н.Э. Баумана является также ведущим научно-исследовательским центром. Университет располагает уникальной базой для научных исследований и проводит  научно-иссле','105005, Россия, г. Москва, 2-я Бауманская, д. 5 стр. 1.'
-- dst: '213','158','0','МГТУ им.Баумана','МГТУ им.Баумана','NULL',''

UPDATE organizations_tr SET 
  shortname = 'МГТУ им.Н.Э. Баумана',
  fullname = 'федеральное государственное бюджетное образовательное учреждение высшего профессионального образования "Московский государственный технический университет МГТУ им.Н.Э. Баумана"',
  description = 'Московский государственный технический университет имени Н.Э. Баумана, основанный в 1830 году, является ведущим инженерным вузом России и хорошо известен за рубежом.r     Наш университет осуществляет подготовку бакалавров, магистров, дипломированных специалистов, кандидатов и докторов наук по широкому спектру инженерных специальностей.r     МГТУ им. Н.Э. Баумана является также ведущим научно-исследовательским центром. Университет располагает уникальной базой для научных исследований и проводит  научно-иссле',
  address = '105005, Россия, г. Москва, 2-я Бауманская, д. 5 стр. 1.'
  WHERE languageid = 0 AND organizationid = 158;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '576','843','1','BMSTU','Bauman Moscow State Technical University','Bauman Moscow State Technical  University (BMSTU) founded in 1830 is a leading engineering university of Russia.r    Our University offers study programmes leading to Bachelors and Masters degrees, Diploma of Engineer, PhD and Doctor of Science across a wide portfolio of subjects. BMSTU is leading center of higher education and research engineering. It has a unique research  and   development  base that helps conduct research  and   development  in diverse emerging science and technology areas','Russia, 105005, Moscow, 5  bldg. 1, 2-nd  Baumanskaya str.,'
-- dst: '214','158','1','MGTU im.Baumana','MGTU im.Baumana','NULL',''

UPDATE organizations_tr SET 
  shortname = 'BMSTU',
  fullname = 'Bauman Moscow State Technical University',
  description = 'Bauman Moscow State Technical  University (BMSTU) founded in 1830 is a leading engineering university of Russia.r    Our University offers study programmes leading to Bachelors and Masters degrees, Diploma of Engineer, PhD and Doctor of Science across a wide portfolio of subjects. BMSTU is leading center of higher education and research engineering. It has a unique research  and   development  base that helps conduct research  and   development  in diverse emerging science and technology areas',
  address = 'Russia, 105005, Moscow, 5  bldg. 1, 2-nd  Baumanskaya str.,'
  WHERE languageid = 1 AND organizationid = 158;


UPDATE IGNORE exhibitions SET organizationid = 158 WHERE organizationid = 843;
UPDATE IGNORE persons SET organizationid = 158 WHERE organizationid = 843;
UPDATE IGNORE media SET organizationid = 158 WHERE organizationid = 843;
UPDATE IGNORE news SET organizationid = 158 WHERE organizationid = 843;
UPDATE IGNORE places_organizations SET organizationid = 158 WHERE organizationid = 843;
UPDATE IGNORE events_organizations SET organizationid = 158 WHERE organizationid = 843;
UPDATE IGNORE organizations_sections SET organizationid = 158 WHERE organizationid = 843;
DELETE FROM organizations WHERE id = 843;



-- -------------------------------------------------------------------------------------
-- merge 69 <= 844

-- organizations
--      id status logo phone email site business_sectionid
-- src: '844','7','/images/logos/844.png','8 3513 298-100','info@mmz.ru','www.mmz.ru','NULL'
-- dst: '69','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '/images/logos/844.png',
  phone = '8 3513 298-100',
  email = 'info@mmz.ru',
  site = 'www.mmz.ru',
  business_sectionid = NULL
  WHERE id = 69;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '577','844','0','Миасский машиностроительный завод, ОАО','Открытое акционерное общество "Миасский машиностроительный завод"','ОАО «Миасский машиностроительный завод» является успешно развивающимся предприятием, входящим в структуру Объединенной Ракетно-Космической корпорации. Предприятие располагает необходимым оборудованием для выполнения сложных технологических операций в области машино- и приборостроения, обладает мощным потенциалом, основанным на новейших научно-технических достижениях, внедряет и продвигает собственные разработки.rnrnНаправления производства:rnrn- компоненты ракетных комплексов для ВМФ РФ;rn- кабели и разъемы','456320, Россия, Челябинская область, город Миасс, Тургоякское шоссе, 1'
-- dst: '35','69','0','Миасский машиностроительный завод','Миасский машиностроительный завод','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Миасский машиностроительный завод, ОАО',
  fullname = 'Открытое акционерное общество "Миасский машиностроительный завод"',
  description = 'ОАО «Миасский машиностроительный завод» является успешно развивающимся предприятием, входящим в структуру Объединенной Ракетно-Космической корпорации. Предприятие располагает необходимым оборудованием для выполнения сложных технологических операций в области машино- и приборостроения, обладает мощным потенциалом, основанным на новейших научно-технических достижениях, внедряет и продвигает собственные разработки.rnrnНаправления производства:rnrn- компоненты ракетных комплексов для ВМФ РФ;rn- кабели и разъемы',
  address = '456320, Россия, Челябинская область, город Миасс, Тургоякское шоссе, 1'
  WHERE languageid = 0 AND organizationid = 69;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '578','844','1','ZAVOD MIASS','Open Joint Stock Company','Zavod "Miass" is one of the promising and successfully evolutive enterprise of Russia included in the structure of the United Rocket and Space Corporation. The enterprise has the required hardware for complicated technological operations in machinery and tool engineering, production capabilities based on the latest scientific and technical advancements in defense branch, it is also implementing and promoting the in-house developments.rnrnProduction areas:rnrn- parts of missile complexes for the Russian Navy','1, Tyrgoyak road, Miass, Chelyabinsk region, Russia'
-- dst: '36','69','1','Miasskij mashinostroitelnyj zawod','Miasskij mashinostroitelnyj zawod','NULL',''

UPDATE organizations_tr SET 
  shortname = 'ZAVOD MIASS',
  fullname = 'Open Joint Stock Company',
  description = 'Zavod "Miass" is one of the promising and successfully evolutive enterprise of Russia included in the structure of the United Rocket and Space Corporation. The enterprise has the required hardware for complicated technological operations in machinery and tool engineering, production capabilities based on the latest scientific and technical advancements in defense branch, it is also implementing and promoting the in-house developments.rnrnProduction areas:rnrn- parts of missile complexes for the Russian Navy',
  address = '1, Tyrgoyak road, Miass, Chelyabinsk region, Russia'
  WHERE languageid = 1 AND organizationid = 69;


UPDATE IGNORE exhibitions SET organizationid = 69 WHERE organizationid = 844;
UPDATE IGNORE persons SET organizationid = 69 WHERE organizationid = 844;
UPDATE IGNORE media SET organizationid = 69 WHERE organizationid = 844;
UPDATE IGNORE news SET organizationid = 69 WHERE organizationid = 844;
UPDATE IGNORE places_organizations SET organizationid = 69 WHERE organizationid = 844;
UPDATE IGNORE events_organizations SET organizationid = 69 WHERE organizationid = 844;
UPDATE IGNORE organizations_sections SET organizationid = 69 WHERE organizationid = 844;
DELETE FROM organizations WHERE id = 844;



-- -------------------------------------------------------------------------------------
-- merge 99 <= 288

-- organizations
--      id status logo phone email site business_sectionid
-- src: '288','7','','','','','NULL'
-- dst: '99','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '',
  phone = '',
  email = '',
  site = '',
  business_sectionid = NULL
  WHERE id = 99;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '473','288','0','Минотор-Сервис','Минотор-Сервис','NULL',''
-- dst: '95','99','0','Минотор-Сервис','Минотор-Сервис','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Минотор-Сервис',
  fullname = 'Минотор-Сервис',
  description = NULL,
  address = ''
  WHERE languageid = 0 AND organizationid = 99;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '474','288','1','Minotor-Serwis','Minotor-Serwis','NULL',''
-- dst: '96','99','1','Minotor-Serwis','Minotor-Serwis','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Minotor-Serwis',
  fullname = 'Minotor-Serwis',
  description = NULL,
  address = ''
  WHERE languageid = 1 AND organizationid = 99;


UPDATE IGNORE exhibitions SET organizationid = 99 WHERE organizationid = 288;
UPDATE IGNORE persons SET organizationid = 99 WHERE organizationid = 288;
UPDATE IGNORE media SET organizationid = 99 WHERE organizationid = 288;
UPDATE IGNORE news SET organizationid = 99 WHERE organizationid = 288;
UPDATE IGNORE places_organizations SET organizationid = 99 WHERE organizationid = 288;
UPDATE IGNORE events_organizations SET organizationid = 99 WHERE organizationid = 288;
UPDATE IGNORE organizations_sections SET organizationid = 99 WHERE organizationid = 288;
DELETE FROM organizations WHERE id = 288;



-- -------------------------------------------------------------------------------------
-- merge 142 <= 292

-- organizations
--      id status logo phone email site business_sectionid
-- src: '292','7','','','','','NULL'
-- dst: '142','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '',
  phone = '',
  email = '',
  site = '',
  business_sectionid = NULL
  WHERE id = 142;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '481','292','0','Минский завод колесных тягачей','Минский завод колесных тягачей','NULL',''
-- dst: '181','142','0','Минский завод колесных тягачей','Минский завод колесных тягачей','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Минский завод колесных тягачей',
  fullname = 'Минский завод колесных тягачей',
  description = NULL,
  address = ''
  WHERE languageid = 0 AND organizationid = 142;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '482','292','1','Minskij zawod kolesnyh tyagachej','Minskij zawod kolesnyh tyagachej','NULL',''
-- dst: '182','142','1','Minskij zawod kolesnyh tyagachej','Minskij zawod kolesnyh tyagachej','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Minskij zawod kolesnyh tyagachej',
  fullname = 'Minskij zawod kolesnyh tyagachej',
  description = NULL,
  address = ''
  WHERE languageid = 1 AND organizationid = 142;


UPDATE IGNORE exhibitions SET organizationid = 142 WHERE organizationid = 292;
UPDATE IGNORE persons SET organizationid = 142 WHERE organizationid = 292;
UPDATE IGNORE media SET organizationid = 142 WHERE organizationid = 292;
UPDATE IGNORE news SET organizationid = 142 WHERE organizationid = 292;
UPDATE IGNORE places_organizations SET organizationid = 142 WHERE organizationid = 292;
UPDATE IGNORE events_organizations SET organizationid = 142 WHERE organizationid = 292;
UPDATE IGNORE organizations_sections SET organizationid = 142 WHERE organizationid = 292;
DELETE FROM organizations WHERE id = 292;



-- -------------------------------------------------------------------------------------
-- merge 179 <= 308

-- organizations
--      id status logo phone email site business_sectionid
-- src: '308','7','','','','','NULL'
-- dst: '179','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '',
  phone = '',
  email = '',
  site = '',
  business_sectionid = NULL
  WHERE id = 179;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '513','308','0','НТЦ РЭБ','НТЦ РЭБ','NULL',''
-- dst: '255','179','0','НТЦ РЭБ','НТЦ РЭБ','NULL',''

UPDATE organizations_tr SET 
  shortname = 'НТЦ РЭБ',
  fullname = 'НТЦ РЭБ',
  description = NULL,
  address = ''
  WHERE languageid = 0 AND organizationid = 179;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '514','308','1','NTC REB','NTC REB','NULL',''
-- dst: '256','179','1','NTC REB','NTC REB','NULL',''

UPDATE organizations_tr SET 
  shortname = 'NTC REB',
  fullname = 'NTC REB',
  description = NULL,
  address = ''
  WHERE languageid = 1 AND organizationid = 179;


UPDATE IGNORE exhibitions SET organizationid = 179 WHERE organizationid = 308;
UPDATE IGNORE persons SET organizationid = 179 WHERE organizationid = 308;
UPDATE IGNORE media SET organizationid = 179 WHERE organizationid = 308;
UPDATE IGNORE news SET organizationid = 179 WHERE organizationid = 308;
UPDATE IGNORE places_organizations SET organizationid = 179 WHERE organizationid = 308;
UPDATE IGNORE events_organizations SET organizationid = 179 WHERE organizationid = 308;
UPDATE IGNORE organizations_sections SET organizationid = 179 WHERE organizationid = 308;
DELETE FROM organizations WHERE id = 308;



-- -------------------------------------------------------------------------------------
-- merge 96 <= 287

-- organizations
--      id status logo phone email site business_sectionid
-- src: '287','7','','','','','NULL'
-- dst: '96','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '',
  phone = '',
  email = '',
  site = '',
  business_sectionid = NULL
  WHERE id = 96;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '471','287','0','РУССКИЕ МАШИНЫ','РУССКИЕ МАШИНЫ','NULL',''
-- dst: '89','96','0','Русские машины','Русские машины','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Русские машины',
  fullname = 'Русские машины',
  description = NULL,
  address = ''
  WHERE languageid = 0 AND organizationid = 96;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '472','287','1','RUSSKIE MASchINY','RUSSKIE MASchINY','NULL',''
-- dst: '90','96','1','Russkie mashiny','Russkie mashiny','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Russkie mashiny',
  fullname = 'Russkie mashiny',
  description = NULL,
  address = ''
  WHERE languageid = 1 AND organizationid = 96;


UPDATE IGNORE exhibitions SET organizationid = 96 WHERE organizationid = 287;
UPDATE IGNORE persons SET organizationid = 96 WHERE organizationid = 287;
UPDATE IGNORE media SET organizationid = 96 WHERE organizationid = 287;
UPDATE IGNORE news SET organizationid = 96 WHERE organizationid = 287;
UPDATE IGNORE places_organizations SET organizationid = 96 WHERE organizationid = 287;
UPDATE IGNORE events_organizations SET organizationid = 96 WHERE organizationid = 287;
UPDATE IGNORE organizations_sections SET organizationid = 96 WHERE organizationid = 287;
DELETE FROM organizations WHERE id = 287;



-- -------------------------------------------------------------------------------------
-- merge 172 <= 307

-- organizations
--      id status logo phone email site business_sectionid
-- src: '307','7','','','','','NULL'
-- dst: '172','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '',
  phone = '',
  email = '',
  site = '',
  business_sectionid = NULL
  WHERE id = 172;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '511','307','0','РЭЛЕРО','РЭЛЕРО','NULL',''
-- dst: '241','172','0','РЭЛЕРО','РЭЛЕРО','NULL',''

UPDATE organizations_tr SET 
  shortname = 'РЭЛЕРО',
  fullname = 'РЭЛЕРО',
  description = NULL,
  address = ''
  WHERE languageid = 0 AND organizationid = 172;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '512','307','1','RELERO','RELERO','NULL',''
-- dst: '242','172','1','RELERO','RELERO','NULL',''

UPDATE organizations_tr SET 
  shortname = 'RELERO',
  fullname = 'RELERO',
  description = NULL,
  address = ''
  WHERE languageid = 1 AND organizationid = 172;


UPDATE IGNORE exhibitions SET organizationid = 172 WHERE organizationid = 307;
UPDATE IGNORE persons SET organizationid = 172 WHERE organizationid = 307;
UPDATE IGNORE media SET organizationid = 172 WHERE organizationid = 307;
UPDATE IGNORE news SET organizationid = 172 WHERE organizationid = 307;
UPDATE IGNORE places_organizations SET organizationid = 172 WHERE organizationid = 307;
UPDATE IGNORE events_organizations SET organizationid = 172 WHERE organizationid = 307;
UPDATE IGNORE organizations_sections SET organizationid = 172 WHERE organizationid = 307;
DELETE FROM organizations WHERE id = 307;



-- -------------------------------------------------------------------------------------
-- merge 255 <= 836

-- organizations
--      id status logo phone email site business_sectionid
-- src: '836','7','/images/logos/836.png','8 (8342) 22-30-29','optic@sarko.ru','www.sarko.ru','NULL'
-- dst: '255','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '/images/logos/836.png',
  phone = '8 (8342) 22-30-29',
  email = 'optic@sarko.ru',
  site = 'www.sarko.ru',
  business_sectionid = NULL
  WHERE id = 255;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '561','836','0','Сарансккабель-Оптика, ООО','Общество с ограниченной ответственностью "Сарансккабель-Оптика"','ООО«Сарансккабель-Оптика» - одно из ведущих предприятий России по производству волоконно-оптического кабеля. rПроизводство волоконно-оптического кабеля:r-для различных условий прокладки и эксплуатации (в грунтах, канализации, для подвеса на опорах линий электропередач, внутри помещений и т.д.); r-в т.ч. для сетей кабельного телевидения с применением волокна Corning® SMF-28e+™;r-встроенного в грозозащитный трос марки ОКГТ (OPGW);r-для построения сетей по технологии GPON.','РФ, Республика Мордовия, 430001, г.Саранск, ул. Строительная, 3'
-- dst: '407','255','0','Сарансккабель-Оптика','Сарансккабель-Оптика','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Сарансккабель-Оптика, ООО',
  fullname = 'Общество с ограниченной ответственностью "Сарансккабель-Оптика"',
  description = 'ООО«Сарансккабель-Оптика» - одно из ведущих предприятий России по производству волоконно-оптического кабеля. rПроизводство волоконно-оптического кабеля:r-для различных условий прокладки и эксплуатации (в грунтах, канализации, для подвеса на опорах линий электропередач, внутри помещений и т.д.); r-в т.ч. для сетей кабельного телевидения с применением волокна Corning® SMF-28e+™;r-встроенного в грозозащитный трос марки ОКГТ (OPGW);r-для построения сетей по технологии GPON.',
  address = 'РФ, Республика Мордовия, 430001, г.Саранск, ул. Строительная, 3'
  WHERE languageid = 0 AND organizationid = 255;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '562','836','1','Saranskkabel-Optika,Ltd.','Saranskkabel-Optika,Ltd.','Saranskkabel-Optika,Ltd – one of the leading Russian companies producing fiber-optic cables. rProduction of fiber-optic cables:r- for different conditions of installation and exploitation (into grounds, in cable ducts, for suspension on overhead power lines, indoors etc);r- including cable television networks using fiber Corning® SMF-28e+™;r- incorporated in ground wire (OPGW);r- for networks based on GPON technology.','3, Stroitelnaya St., Saransk, Republic of Mordovia, 430001, Russian Federation'
-- dst: '408','255','1','Saranskkabel-Optika','Saranskkabel-Optika','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Saranskkabel-Optika,Ltd.',
  fullname = 'Saranskkabel-Optika,Ltd.',
  description = 'Saranskkabel-Optika,Ltd – one of the leading Russian companies producing fiber-optic cables. rProduction of fiber-optic cables:r- for different conditions of installation and exploitation (into grounds, in cable ducts, for suspension on overhead power lines, indoors etc);r- including cable television networks using fiber Corning® SMF-28e+™;r- incorporated in ground wire (OPGW);r- for networks based on GPON technology.',
  address = '3, Stroitelnaya St., Saransk, Republic of Mordovia, 430001, Russian Federation'
  WHERE languageid = 1 AND organizationid = 255;


UPDATE IGNORE exhibitions SET organizationid = 255 WHERE organizationid = 836;
UPDATE IGNORE persons SET organizationid = 255 WHERE organizationid = 836;
UPDATE IGNORE media SET organizationid = 255 WHERE organizationid = 836;
UPDATE IGNORE news SET organizationid = 255 WHERE organizationid = 836;
UPDATE IGNORE places_organizations SET organizationid = 255 WHERE organizationid = 836;
UPDATE IGNORE events_organizations SET organizationid = 255 WHERE organizationid = 836;
UPDATE IGNORE organizations_sections SET organizationid = 255 WHERE organizationid = 836;
DELETE FROM organizations WHERE id = 836;



-- -------------------------------------------------------------------------------------
-- merge 110 <= 302

-- organizations
--      id status logo phone email site business_sectionid
-- src: '302','7','','','','','NULL'
-- dst: '110','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '',
  phone = '',
  email = '',
  site = '',
  business_sectionid = NULL
  WHERE id = 110;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '501','302','0','Синара','Синара','NULL',''
-- dst: '117','110','0','Синара','Синара','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Синара',
  fullname = 'Синара',
  description = NULL,
  address = ''
  WHERE languageid = 0 AND organizationid = 110;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '502','302','1','Sinara','Sinara','NULL',''
-- dst: '118','110','1','Sinara','Sinara','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Sinara',
  fullname = 'Sinara',
  description = NULL,
  address = ''
  WHERE languageid = 1 AND organizationid = 110;


UPDATE IGNORE exhibitions SET organizationid = 110 WHERE organizationid = 302;
UPDATE IGNORE persons SET organizationid = 110 WHERE organizationid = 302;
UPDATE IGNORE media SET organizationid = 110 WHERE organizationid = 302;
UPDATE IGNORE news SET organizationid = 110 WHERE organizationid = 302;
UPDATE IGNORE places_organizations SET organizationid = 110 WHERE organizationid = 302;
UPDATE IGNORE events_organizations SET organizationid = 110 WHERE organizationid = 302;
UPDATE IGNORE organizations_sections SET organizationid = 110 WHERE organizationid = 302;
DELETE FROM organizations WHERE id = 302;



-- -------------------------------------------------------------------------------------
-- merge 190 <= 309

-- organizations
--      id status logo phone email site business_sectionid
-- src: '309','7','','','','','NULL'
-- dst: '190','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '',
  phone = '',
  email = '',
  site = '',
  business_sectionid = NULL
  WHERE id = 190;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '515','309','0','Специальный технологический центр','Специальный технологический центр','NULL',''
-- dst: '277','190','0','Специальный технологический центр','Специальный технологический центр','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Специальный технологический центр',
  fullname = 'Специальный технологический центр',
  description = NULL,
  address = ''
  WHERE languageid = 0 AND organizationid = 190;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '516','309','1','Specialnyj tehnologicheskij centr','Specialnyj tehnologicheskij centr','NULL',''
-- dst: '278','190','1','Specialnyj tehnologicheskij centr','Specialnyj tehnologicheskij centr','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Specialnyj tehnologicheskij centr',
  fullname = 'Specialnyj tehnologicheskij centr',
  description = NULL,
  address = ''
  WHERE languageid = 1 AND organizationid = 190;


UPDATE IGNORE exhibitions SET organizationid = 190 WHERE organizationid = 309;
UPDATE IGNORE persons SET organizationid = 190 WHERE organizationid = 309;
UPDATE IGNORE media SET organizationid = 190 WHERE organizationid = 309;
UPDATE IGNORE news SET organizationid = 190 WHERE organizationid = 309;
UPDATE IGNORE places_organizations SET organizationid = 190 WHERE organizationid = 309;
UPDATE IGNORE events_organizations SET organizationid = 190 WHERE organizationid = 309;
UPDATE IGNORE organizations_sections SET organizationid = 190 WHERE organizationid = 309;
DELETE FROM organizations WHERE id = 309;



-- -------------------------------------------------------------------------------------
-- merge 65 <= 280

-- organizations
--      id status logo phone email site business_sectionid
-- src: '280','7','','','','','NULL'
-- dst: '65','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '',
  phone = '',
  email = '',
  site = '',
  business_sectionid = NULL
  WHERE id = 65;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '457','280','0','Тракторные заводы','Тракторные заводы','NULL',''
-- dst: '27','65','0','Тракторные заводы','Тракторные заводы','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Тракторные заводы',
  fullname = 'Тракторные заводы',
  description = NULL,
  address = ''
  WHERE languageid = 0 AND organizationid = 65;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '458','280','1','Traktornye zawody','Traktornye zawody','NULL',''
-- dst: '28','65','1','Traktornye zawody','Traktornye zawody','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Traktornye zawody',
  fullname = 'Traktornye zawody',
  description = NULL,
  address = ''
  WHERE languageid = 1 AND organizationid = 65;


UPDATE IGNORE exhibitions SET organizationid = 65 WHERE organizationid = 280;
UPDATE IGNORE persons SET organizationid = 65 WHERE organizationid = 280;
UPDATE IGNORE media SET organizationid = 65 WHERE organizationid = 280;
UPDATE IGNORE news SET organizationid = 65 WHERE organizationid = 280;
UPDATE IGNORE places_organizations SET organizationid = 65 WHERE organizationid = 280;
UPDATE IGNORE events_organizations SET organizationid = 65 WHERE organizationid = 280;
UPDATE IGNORE organizations_sections SET organizationid = 65 WHERE organizationid = 280;
DELETE FROM organizations WHERE id = 280;



-- -------------------------------------------------------------------------------------
-- merge 128 <= 845

-- organizations
--      id status logo phone email site business_sectionid
-- src: '845','7','/images/logos/845.png','+7 495 745-09-15','info@textile.ru','www.textile.ru','NULL'
-- dst: '128','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '/images/logos/845.png',
  phone = '+7 495 745-09-15',
  email = 'info@textile.ru',
  site = 'www.textile.ru',
  business_sectionid = NULL
  WHERE id = 128;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '579','845','0','Чайковский текстиль, группа компаний','Чайковский текстиль, группа компаний','Ведущий российский разработчик и производитель тканей для униформы военнослужащих. Более 50 лет опыта производства тканей, опыт разработки тканей для силовых структур - более 40 лет. Производство сертифицировано по ISO 9001, ISO 14001 и OHSAS 18001. Компания производит ткани для форменных рубашек, инновационные ткани для зимней, летней и повседневной  униформы, ткани специального назначения. Разработки и производство ведутся в плотном контакте со специалистами силовых структур РФ в четком соответствии с тре','Россия, 109052, Москва, ул. Нижегородская, д. 29'
-- dst: '153','128','0','Чайковский текстиль','Чайковский текстиль','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Чайковский текстиль, группа компаний',
  fullname = 'Чайковский текстиль, группа компаний',
  description = 'Ведущий российский разработчик и производитель тканей для униформы военнослужащих. Более 50 лет опыта производства тканей, опыт разработки тканей для силовых структур - более 40 лет. Производство сертифицировано по ISO 9001, ISO 14001 и OHSAS 18001. Компания производит ткани для форменных рубашек, инновационные ткани для зимней, летней и повседневной  униформы, ткани специального назначения. Разработки и производство ведутся в плотном контакте со специалистами силовых структур РФ в четком соответствии с тре',
  address = 'Россия, 109052, Москва, ул. Нижегородская, д. 29'
  WHERE languageid = 0 AND organizationid = 128;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '580','845','1','Tchaikovsky Textile, the Group of Companies','Tchaikovsky Textile, the Group of Companies','A leading developer and manufacturer of fabrics for military uniform. More than 50 years of experience producing fabrics, more than 40 years' experience of fabrics development for military structures. The production is certified according to ISO 9001, ISO 14001 and OHSAS 18001. The company manufactures fabrics for uniform shirts, innovative fabrics for winter, summer and conventional uniforms, fabrics for special assignments.','H. 29, Nizhegorodskaya St., Moscow, 109052, Russia'
-- dst: '154','128','1','Chajkowskij tekstil','Chajkowskij tekstil','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Tchaikovsky Textile, the Group of Companies',
  fullname = 'Tchaikovsky Textile, the Group of Companies',
  description = 'A leading developer and manufacturer of fabrics for military uniform. More than 50 years of experience producing fabrics, more than 40 years\' experience of fabrics development for military structures. The production is certified according to ISO 9001, ISO 14001 and OHSAS 18001. The company manufactures fabrics for uniform shirts, innovative fabrics for winter, summer and conventional uniforms, fabrics for special assignments.',
  address = 'H. 29, Nizhegorodskaya St., Moscow, 109052, Russia'
  WHERE languageid = 1 AND organizationid = 128;


UPDATE IGNORE exhibitions SET organizationid = 128 WHERE organizationid = 845;
UPDATE IGNORE persons SET organizationid = 128 WHERE organizationid = 845;
UPDATE IGNORE media SET organizationid = 128 WHERE organizationid = 845;
UPDATE IGNORE news SET organizationid = 128 WHERE organizationid = 845;
UPDATE IGNORE places_organizations SET organizationid = 128 WHERE organizationid = 845;
UPDATE IGNORE events_organizations SET organizationid = 128 WHERE organizationid = 845;
UPDATE IGNORE organizations_sections SET organizationid = 128 WHERE organizationid = 845;
DELETE FROM organizations WHERE id = 845;



-- -------------------------------------------------------------------------------------
-- merge 209 <= 311

-- organizations
--      id status logo phone email site business_sectionid
-- src: '311','7','','','','','NULL'
-- dst: '209','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '',
  phone = '',
  email = '',
  site = '',
  business_sectionid = NULL
  WHERE id = 209;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '519','311','0','ЭЛЕРОН','ЭЛЕРОН','NULL',''
-- dst: '315','209','0','ЭЛЕРОН','ЭЛЕРОН','NULL',''

UPDATE organizations_tr SET 
  shortname = 'ЭЛЕРОН',
  fullname = 'ЭЛЕРОН',
  description = NULL,
  address = ''
  WHERE languageid = 0 AND organizationid = 209;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '520','311','1','ELERON','ELERON','NULL',''
-- dst: '316','209','1','ELERON','ELERON','NULL',''

UPDATE organizations_tr SET 
  shortname = 'ELERON',
  fullname = 'ELERON',
  description = NULL,
  address = ''
  WHERE languageid = 1 AND organizationid = 209;


UPDATE IGNORE exhibitions SET organizationid = 209 WHERE organizationid = 311;
UPDATE IGNORE persons SET organizationid = 209 WHERE organizationid = 311;
UPDATE IGNORE media SET organizationid = 209 WHERE organizationid = 311;
UPDATE IGNORE news SET organizationid = 209 WHERE organizationid = 311;
UPDATE IGNORE places_organizations SET organizationid = 209 WHERE organizationid = 311;
UPDATE IGNORE events_organizations SET organizationid = 209 WHERE organizationid = 311;
UPDATE IGNORE organizations_sections SET organizationid = 209 WHERE organizationid = 311;
DELETE FROM organizations WHERE id = 311;



-- -------------------------------------------------------------------------------------
-- merge 219 <= 310

-- organizations
--      id status logo phone email site business_sectionid
-- src: '310','7','','','','','NULL'
-- dst: '219','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '',
  phone = '',
  email = '',
  site = '',
  business_sectionid = NULL
  WHERE id = 219;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '517','310','0','ЮМИРС','ЮМИРС','NULL',''
-- dst: '335','219','0','ЮМИРС','ЮМИРС','NULL',''

UPDATE organizations_tr SET 
  shortname = 'ЮМИРС',
  fullname = 'ЮМИРС',
  description = NULL,
  address = ''
  WHERE languageid = 0 AND organizationid = 219;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '518','310','1','YuMIRS','YuMIRS','NULL',''
-- dst: '336','219','1','YuMIRS','YuMIRS','NULL',''

UPDATE organizations_tr SET 
  shortname = 'YuMIRS',
  fullname = 'YuMIRS',
  description = NULL,
  address = ''
  WHERE languageid = 1 AND organizationid = 219;


UPDATE IGNORE exhibitions SET organizationid = 219 WHERE organizationid = 310;
UPDATE IGNORE persons SET organizationid = 219 WHERE organizationid = 310;
UPDATE IGNORE media SET organizationid = 219 WHERE organizationid = 310;
UPDATE IGNORE news SET organizationid = 219 WHERE organizationid = 310;
UPDATE IGNORE places_organizations SET organizationid = 219 WHERE organizationid = 310;
UPDATE IGNORE events_organizations SET organizationid = 219 WHERE organizationid = 310;
UPDATE IGNORE organizations_sections SET organizationid = 219 WHERE organizationid = 310;
DELETE FROM organizations WHERE id = 310;



-- -------------------------------------------------------------------------------------
-- merge 219 <= 828

-- organizations
--      id status logo phone email site business_sectionid
-- src: '828','7','/images/logos/828.png','(8412) 69-84-01, (8412) 69-82-72','market@umirs.ru','www.umirs.ru','NULL'
-- dst: '219','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '/images/logos/828.png',
  phone = '(8412) 69-84-01, (8412) 69-82-72',
  email = 'market@umirs.ru',
  site = 'www.umirs.ru',
  business_sectionid = NULL
  WHERE id = 219;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '545','828','0','ЮМИРС, ЗАО','Закрытое акционерное общество "Фирма "ЮМИРС"','ЗАО "ЮМИРС" специализируется на разработке, производстве и инсталляции комплексов технических средств охраны периметра.rnВ настоящее время в производственной программе находится более пятидесяти выпускаемых изделий, среди которых: rn радиолокационные, комбинированные, мобильные, обрывные комплексы охраны объектов; радиоволновые, инфракрасные, вибрационные, проводноволновые средства охраны.','Российская Федерация, 440600, Пенза, ул. Антонова, д.3'
-- dst: '335','219','0','ЮМИРС','ЮМИРС','NULL',''

UPDATE organizations_tr SET 
  shortname = 'ЮМИРС, ЗАО',
  fullname = 'Закрытое акционерное общество "Фирма "ЮМИРС"',
  description = 'ЗАО "ЮМИРС" специализируется на разработке, производстве и инсталляции комплексов технических средств охраны периметра.rnВ настоящее время в производственной программе находится более пятидесяти выпускаемых изделий, среди которых: rn радиолокационные, комбинированные, мобильные, обрывные комплексы охраны объектов; радиоволновые, инфракрасные, вибрационные, проводноволновые средства охраны.',
  address = 'Российская Федерация, 440600, Пенза, ул. Антонова, д.3'
  WHERE languageid = 0 AND organizationid = 219;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '546','828','1','UMIRS, JSC','Joint stock company UMIRS','UMIRS specializes in the design, manufacture and installation the complexes of technical security devices of perimeter.rnAt present there are more than fifty items in the production program, among which: radiolocation, combined, mobile, broken wire protection complexes; microwave sensors, infrared sensors, triboelectric and wire-wave protecting devices.rn','3, Antonova St., Penza, 440600, Russian Federation'
-- dst: '336','219','1','YuMIRS','YuMIRS','NULL',''

UPDATE organizations_tr SET 
  shortname = 'UMIRS, JSC',
  fullname = 'Joint stock company UMIRS',
  description = 'UMIRS specializes in the design, manufacture and installation the complexes of technical security devices of perimeter.rnAt present there are more than fifty items in the production program, among which: radiolocation, combined, mobile, broken wire protection complexes; microwave sensors, infrared sensors, triboelectric and wire-wave protecting devices.rn',
  address = '3, Antonova St., Penza, 440600, Russian Federation'
  WHERE languageid = 1 AND organizationid = 219;


UPDATE IGNORE exhibitions SET organizationid = 219 WHERE organizationid = 828;
UPDATE IGNORE persons SET organizationid = 219 WHERE organizationid = 828;
UPDATE IGNORE media SET organizationid = 219 WHERE organizationid = 828;
UPDATE IGNORE news SET organizationid = 219 WHERE organizationid = 828;
UPDATE IGNORE places_organizations SET organizationid = 219 WHERE organizationid = 828;
UPDATE IGNORE events_organizations SET organizationid = 219 WHERE organizationid = 828;
UPDATE IGNORE organizations_sections SET organizationid = 219 WHERE organizationid = 828;
DELETE FROM organizations WHERE id = 828;



-- -------------------------------------------------------------------------------------
-- merge 312 <= 822

-- organizations
--      id status logo phone email site business_sectionid
-- src: '822','7','/images/logos/822.png','(4712) 36-92-04, 36-93-52,36-93-50','agregat@kursknet.ru','www.electroagregat.ru','NULL'
-- dst: '312','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '/images/logos/822.png',
  phone = '(4712) 36-92-04, 36-93-52,36-93-50',
  email = 'agregat@kursknet.ru',
  site = 'www.electroagregat.ru',
  business_sectionid = NULL
  WHERE id = 312;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '533','822','0','ОАО "Электроагрегат"','Открытое акционерное общество "Электроагрегат"','ОАО «Электроагрегат» - крупнейший в России производитель автономных источников электропитания, используемых Министерством обороны, а так же другими силовыми ведомствами. r- Стационарные и передвижные электростанции мощностью от 0,5 до 2 500 кВт, различной степени автоматизации;r- Одно и двух агрегатные изделия повышенной мобильности, на базе шасси «Урал», «КамАЗ»;r- генераторы синхронные серии ГС, мощностью от 0,5 до 1000 кВт; частотой 50 и 400 Гцr- передвижные электростанции  в кузовах (контейнерах) в том ','Российская Федерация,305022, г. Курск, ул. 2-я Агрегатная, 5а.'
-- dst: '521','312','0','Электроагрегат','Электроагрегат','NULL',''

UPDATE organizations_tr SET 
  shortname = 'ОАО "Электроагрегат"',
  fullname = 'Открытое акционерное общество "Электроагрегат"',
  description = 'ОАО «Электроагрегат» - крупнейший в России производитель автономных источников электропитания, используемых Министерством обороны, а так же другими силовыми ведомствами. r- Стационарные и передвижные электростанции мощностью от 0,5 до 2 500 кВт, различной степени автоматизации;r- Одно и двух агрегатные изделия повышенной мобильности, на базе шасси «Урал», «КамАЗ»;r- генераторы синхронные серии ГС, мощностью от 0,5 до 1000 кВт; частотой 50 и 400 Гцr- передвижные электростанции  в кузовах (контейнерах) в том',
  address = 'Российская Федерация,305022, г. Курск, ул. 2-я Агрегатная, 5а.'
  WHERE languageid = 0 AND organizationid = 312;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '534','822','1','JSC “Electroagregat”','Joint-stock company “Electroagregat”','JSC “Electroagregat” is Russia’s largest manufacturer of self-contained power supply units used by the Ministry of Defense as well as other military and law enforcement organizations. r- Stationary and mobile generating sets with a power range of 0.5 kW to 2,500 kW with various automation degreesr- Single and double-unit generating sets of improved mobility, mounted on the Ural, KamAZ chassisr- 50 and 400 Hz synchronous generating sets series ГС with a power range of 0.5 kW to 1,000 kW r- Mobile generating ','Russian Federation,305022, Kursk, street 2nd Aggregate, 5A.'
-- dst: '522','312','1','Elektroagregat','Elektroagregat','NULL',''

UPDATE organizations_tr SET 
  shortname = 'JSC “Electroagregat”',
  fullname = 'Joint-stock company “Electroagregat”',
  description = 'JSC “Electroagregat” is Russia’s largest manufacturer of self-contained power supply units used by the Ministry of Defense as well as other military and law enforcement organizations. r- Stationary and mobile generating sets with a power range of 0.5 kW to 2,500 kW with various automation degreesr- Single and double-unit generating sets of improved mobility, mounted on the Ural, KamAZ chassisr- 50 and 400 Hz synchronous generating sets series ГС with a power range of 0.5 kW to 1,000 kW r- Mobile generating',
  address = 'Russian Federation,305022, Kursk, street 2nd Aggregate, 5A.'
  WHERE languageid = 1 AND organizationid = 312;


UPDATE IGNORE exhibitions SET organizationid = 312 WHERE organizationid = 822;
UPDATE IGNORE persons SET organizationid = 312 WHERE organizationid = 822;
UPDATE IGNORE media SET organizationid = 312 WHERE organizationid = 822;
UPDATE IGNORE news SET organizationid = 312 WHERE organizationid = 822;
UPDATE IGNORE places_organizations SET organizationid = 312 WHERE organizationid = 822;
UPDATE IGNORE events_organizations SET organizationid = 312 WHERE organizationid = 822;
UPDATE IGNORE organizations_sections SET organizationid = 312 WHERE organizationid = 822;
DELETE FROM organizations WHERE id = 822;



-- -------------------------------------------------------------------------------------
-- merge 167 <= 838

-- organizations
--      id status logo phone email site business_sectionid
-- src: '838','7','/images/logos/838.png','(383) 266-06-42, 266-28-01, 269-29-71','elest@electrosignal.ru','www.electrosignal.ru','NULL'
-- dst: '167','7','','','','','NULL'

UPDATE organizations SET 
  status = '7',
  logo = '/images/logos/838.png',
  phone = '(383) 266-06-42, 266-28-01, 269-29-71',
  email = 'elest@electrosignal.ru',
  site = 'www.electrosignal.ru',
  business_sectionid = NULL
  WHERE id = 167;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '565','838','0','ОАО "Завод Электросигнал"','Открытое акционерное общество "Корпорация - Новосибирский завод Электросигнал"','Завод Электросигнал - известное в России и за ее пределами предприятие по выпуску профессиональных средств радиосвязи. Завод разрабатывает и изготавливает:r-авиационные бортовые радиостанции МВ и ДМВ диапазона, в том числе с режимом КРПД;r- авиационные наземные радиостанции серии "Юрок", имеющие сертификаты МАК; r- радиостанции низовой и космической связи для ВМФ;r- комплекс средств цифро-аналоговой радиосвязи с криптографической защитой информации серии "Альфа";r- радиостанции для железнодорожного транспор','Россия, 630009, Новосибирск, ул. Добролюбова, д.31'
-- dst: '231','167','0','Электросигнал','Электросигнал','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Электросигнал',
  fullname = 'Электросигнал',
  description = NULL,
  address = 'Россия, 630009, Новосибирск, ул. Добролюбова, д.31'
  WHERE languageid = 0 AND organizationid = 167;


-- organizations_tr
--      id organizationid languageid shortname fullname description address
-- src: '566','838','1','Plant Electrosignal','ELECTROSIGNAL Corporation','ELECTROSIGNAL Corporation has been working in the field of development and production of radio electronics for 70 years. rMain production lines of the enterprise are aviation airborne and ground-based VHF radio stations corresponding to the requirements of ICAO, RTCA, ARING; radio stations for railway transport; analog radio stations of 146-174 MHz range of the «SIGNAL» family; digital-analog «Alpha» radio stations of 146 to 174 MHz range with cryptographic data protection for power structures. The output q','Dobrolyubov str., 31, Novosibirsk, 630009, Russia'
-- dst: '232','167','1','Elektrosignal','Elektrosignal','NULL',''

UPDATE organizations_tr SET 
  shortname = 'Elektrosignal',
  fullname = 'Elektrosignal',
  description = NULL,
  address = 'Dobrolyubov str., 31, Novosibirsk, 630009, Russia'
  WHERE languageid = 1 AND organizationid = 167;


UPDATE IGNORE exhibitions SET organizationid = 167 WHERE organizationid = 838;
UPDATE IGNORE persons SET organizationid = 167 WHERE organizationid = 838;
UPDATE IGNORE media SET organizationid = 167 WHERE organizationid = 838;
UPDATE IGNORE news SET organizationid = 167 WHERE organizationid = 838;
UPDATE IGNORE places_organizations SET organizationid = 167 WHERE organizationid = 838;
UPDATE IGNORE events_organizations SET organizationid = 167 WHERE organizationid = 838;
UPDATE IGNORE organizations_sections SET organizationid = 167 WHERE organizationid = 838;
DELETE FROM organizations WHERE id = 838;



