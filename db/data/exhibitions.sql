INSERT INTO exhibitions(organizationid, placeid, sectionid) VALUES
(@org1_firstid + 3, @places_firstid + 9, 8); -- АК Туламашзавод
SET @ex_firstid := @last_inserted_id;
INSERT INTO exhibitions(organizationid, placeid, sectionid) VALUES
(@org1_firstid + 3, @places_firstid + 9, 8), -- АК Туламашзавод
(@org1_firstid + 3, @places_firstid + 9, 6), -- АК Туламашзавод
(@org1_firstid + 6, @places_firstid + 23, 6), -- Зеленодольский завод
(@org1_firstid + 6, @places_firstid + 23, 6); -- Зеленодольский завод

INSERT INTO exhibitions_tr(exhibitionid, languageid, name, text) VALUES
(@ex_firstid, 0, 'Каштан', 'Зенитный ракетно-артиллерийский комплекс КАШТАН предназначен для обороны кораблей и важных стационарных объектов от высокоточного оружия (противокорабельных ракет и авиабомб), самолетов и вертолетов в зоне сверхмалой дальности и на предельно малых высотах, а также для поражения малоразмерных морских целей.\n\nВ боевом модуле комплексов впервые совмещено ракетное и артиллерийское вооружение:\n\n• зенитные управляемые двухступенчатые твердотопливные ракеты с осколочно-стержневой боевой частью и неконтактным датчиком цели;\n\n• два 30-мм шестиствольных автомата.'),
(@ex_firstid, 1, 'Kashtan', 'Anti-aircraft missile and artillery system CHESTNUT for defense ships and important stationary objects from high-precision weapons (anti-ship missiles and bombs), planes and helicopters in the area of ​​very short ranges and at extremely low altitudes, as well as to hit small targets at sea. \n\nThe battle module systems for the first time combined missile and artillery armament: \n\n• antiaircraft guided two-stage solid rocket with high-rod warhead and a non-contact sensor goals; \n\n• Two 30-mm six-barrel gun.'),
(@ex_firstid + 1, 0, 'Пальма', 'Комплекс предназначен для поиска цели по данным целеуказания, захвата и сопровождения цели оптико-электронной системой, выработки данных для наведения артиллерийской установки и поражения цели зенитными автоматами.\nКомплекс предназначен для поиска цели по данным целеуказания, захвата и сопровождения цели оптико-электронной системой, выработки данных для наведения артиллерийской установки и поражения цели зенитными автоматами.\nЗенитный артиллерийский комплекс ПАЛЬМА может оснащаться зенитными управляемыми ракетами СОСНА-Р с лазерным наведением и аппаратурой управления. Ракета предназначена для поражения самолетов, вертолетов, крылатых ракет, малотоннажных надводных и малоразмерных береговых целей.'),
(@ex_firstid + 1, 1, 'Palma', 'The system is designed to search for the goal of targeting data, capture and tracking of optical-electronic system for generating data pointing guns and anti-aircraft machine guns hitting the target. \nKompleks designed to search for the purpose according to targeting, capturing and tracking optoelectronic system, development data for guidance guns and anti-aircraft machine guns hitting the target. \nZenitny artillery system can be equipped with PALMA Surface-to-air missile PINE-P laser-guided and control equipment. The missile is designed to destroy aircraft, helicopters, cruise missiles, small-size light-duty surface and coastal targets.'),
(@ex_firstid + 2, 0, 'АК-630М', '30-мм автоматическая артиллерийская установка АК-630М, дистанционно управляемая от различных радиолокационных, оптико-электронных систем управления и визирной колонки (резервный пост управления).\n\nАртиллерийская установка АК-630М предназначена для вооружения кораблей с основной задачей:\n\n• уничтожение противокорабельных ракет, самолетов, вертолетов и других средств воздушного нападения противника;\n\n• поражения малоразмерных морских надводных целей и расстрел плавающих мин;\n\n• поражение видимой открытой живой силы и огневых точек противника на берегу.'),
(@ex_firstid + 2, 1, 'AK-630M', '30-mm automatic gun mount AK-630M, remotely controlled from a variety of radar, optical-electronic control systems and target column (backup control station).\n\nGun mount AK-630M is designed to arm ships with the main objective:\n\n• destruction of anti-ship missiles, aircraft, helicopters and other means of air attack;\n\n• hit small sea surface targets and execution of floating mines;\n\n• the apparent defeat of open manpower and enemy firing points on the shore.'),
(@ex_firstid + 3, 0, 'Противодиверсионный катер проекта 21980', 'Предназначен для охраны водных районов, портов, военно-морских баз, а также для противодействия подводным диверсионным силам и средствам. Современное оборудование и высокие мореходные характеристики позволяют ему решать широкий спектр задач, свойственный кораблям более высокого ранга.\n \nВооружение:\n — ПЗРК «Игла»\n — 14,5 мм пулемёт\n — 55-мм противодиверсионные гранатомёты ДП-65А и ДП-64\n — имеется водолазное снаряжение.\nПротиводиверсионный катер «Грачонок» оснащен современным радиоэлектронным вооружением, которое позволяет обнаруживать и обследовать подводные объекты.'),
(@ex_firstid + 3, 1, 'Countersabotage boat project 21980', 'Designed for protection of water areas, ports, naval bases, as well as to counter the underwater sabotage forces and means. Modern equipment and high seaworthy characteristics enable it to solve a wide range of problems inherent in the ships of higher rank.\n \nArmament:\n - MANPADS Igla\n - 14.5 mm machine gun\n - 55-mm anti-sabotage grenade-65A DP and DP-64\n - There is a diving equipment.\nCountersabotage boat Rook is equipped with modern electronic equipment that can detect and inspect underwater objects.'),
(@ex_firstid + 4, 0, 'Сторожевой корабль проекта 11661', 'Корабль предназначен для выполнения целого ряда задач, это: поиск и борьба с подводными, надводными и воздушными целями, несение дозорной службы, проведение конвойных операций, а также охрана морской экономической зоны. Проект 11661 разработан ОАО  «Зеленодольское проектно-конструкторское бюро».\nПервый корабль проекта 11661 «Татарстан» вступил в строй 31 августа 2003 года, став флагманом Каспийской флотилии. Второй сторожевой корабль — „Дагестан“— достраивался по вновь откорректированному проекту 11661К. Торжественная передача его Каспийской флотилии состоялась 28 ноября 2012 года в Махачкалинском морском торговом порту.\nКорабли проекта 11661 имеют мощное ракетное, зенитно-ракетное и артиллерийское вооружение. Основное оружие корабля «Татарстан» — ударный комплекс „Уран“ с противокорабельными крылатыми ракетами Х-35, имеющий дальность стрельбы до 130 км. Второй корабль этого проекта „Дагестан“ является первым кораблём ВМФ России вооружённым универсальным ракетным комплексом „Калибр-НК“, в составе которого может применяться несколько типов высокоточных крылатых ракет как по надводным, так и по береговым целям на удалении до 300 км.\nАртиллерийское вооружение включает 76,2-мм артиллерийский комплекс АК-176М и 30-мм автоматизированную спаренную артиллерийскую установку АК-630М, которое обеспечивает борьбу с морскими, наземными и низколетящими воздушными целями.'),
(@ex_firstid + 4, 1, 'Patrol boat project 11661', 'The ship is designed to perform a number of tasks are: search and anti-submarine, surface and air targets, a patrol, conducting convoy operations, as well as protection of the marine economic zone. Project 11661 is designed JSC Zelenodolsk Design Bureau.\nThe first ship of the project 11661 Tatarstan was put into operation August 31, 2003, becoming the flagship of the Caspian Flotilla. The second patrol ship - Dagestan - the newly rebuilt the adjusted project 11661K. The solemn transfer of its Caspian Flotilla on 28 November 2012 in Makhachkala sea trading port.\nShips of the project 11661 have a powerful missile, anti-aircraft missile and artillery weapons. The main weapon of the ship Tatarstan - strike complex Uranus with antiship cruise missiles X-35, having a range of up to 130 km. The second ship of this project Dagestan is the first ship of the Russian Navy armed versatile missile system Caliber-NK, as part of which may be used several types of high-precision cruise missiles at surface as well as on shore targets at a distance of 300 km.\nArtillery armament includes a 76.2-mm artillery complex AK-176M and 30-mm automatic paired artillery installation AK-630M, which provides a combat marine, terrestrial, and low-flying air targets.');


-- медиа

INSERT INTO media (type, organizationid) VALUES
(0, @org1_firstid + 3);
SET @media_ex_firstid := @last_inserted_id;
INSERT INTO media (type, organizationid) VALUES
(0, @org1_firstid + 3),
(0, @org1_firstid + 3),
(0, @org1_firstid + 6),
(0, @org1_firstid + 6),
(0, @org1_firstid + 6);


SET @id = @media_ex_firstid - 1;
INSERT INTO media_tr (mediaid, languageid, name, url, preview) VALUES
(@id := @id + 1, 0, 'КАШТАН Зенитный ракетно-артиллерийский комплекс', 'http://www.tulamash.ru/media/catalog/001_kashtan.jpg', 'http://www.tulamash.ru/media/catalog/001_kashtan_pic.jpg'),
(@id := @id + 1, 0, 'ПАЛЬМА Зенитный артиллерийский комплекс', 'http://www.tulamash.ru/media/catalog/003_ags_palma.jpg', 'http://www.tulamash.ru/media/catalog/003_ags_palma_pic.jpg'),
(@id := @id + 1, 0, 'АК-630М 30-мм автоматическая артиллерийская установка', 'http://www.tulamash.ru/media/catalog/004_ak-630m.jpg', 'http://www.tulamash.ru/media/catalog/004_ak-630m_pic.jpg'),
(@id := @id + 1, 0, 'Противодиверсионный катер проекта 21980', 'http://www.zdship.ru/upload/information_system_27/4/4/2/item_442/information_items_442.jpg', 'http://www.zdship.ru/upload/information_system_27/4/4/2/item_442/small_information_items_442.jpg'),
(@id := @id + 1, 0, 'Сторожевой корабль проекта 11661', 'http://www.zdship.ru/upload/information_system_27/3/2/3/item_323/information_items_323.jpg', 'http://www.zdship.ru/upload/information_system_27/3/2/3/item_323/small_information_items_323.jpg'),
(@id := @id + 1, 0, 'Сторожевой корабль проекта 11661', 'http://www.zdship.ru/images/production/tatarstan.jpg', 'http://www.zdship.ru/images/production/tatarstan.jpg');

SET @id = @media_ex_firstid - 1;
INSERT INTO media_tr (mediaid, languageid, name, url, preview) VALUES
(@id := @id + 1, 1, 'KASHTAN Anti-aircraft missile and artillery system', 'http://www.tulamash.ru/media/catalog/001_kashtan.jpg', 'http://www.tulamash.ru/media/catalog/001_kashtan_pic.jpg'),
(@id := @id + 1, 1, 'PALMA Anti-aircraft artillery system', 'http://www.tulamash.ru/media/catalog/003_ags_palma.jpg', 'http://www.tulamash.ru/media/catalog/003_ags_palma_pic.jpg'),
(@id := @id + 1, 1, 'AK-630M 30-mm automatic gun mount', 'http://www.tulamash.ru/media/catalog/004_ak-630m.jpg', 'http://www.tulamash.ru/media/catalog/004_ak-630m_pic.jpg'),
(@id := @id + 1, 1, 'Countersabotage boat project 21980', 'http://www.zdship.ru/upload/information_system_27/4/4/2/item_442/information_items_442.jpg', 'http://www.zdship.ru/upload/information_system_27/4/4/2/item_442/small_information_items_442.jpg'),
(@id := @id + 1, 1, 'Patrol boat project 11661', 'http://www.zdship.ru/upload/information_system_27/3/2/3/item_323/information_items_323.jpg', 'http://www.zdship.ru/upload/information_system_27/3/2/3/item_323/small_information_items_323.jpg'),
(@id := @id + 1, 1, 'Patrol boat project 11661', 'http://www.zdship.ru/images/production/tatarstan.jpg', 'http://www.zdship.ru/images/production/tatarstan.jpg');


-- медиа к объектам

SET @eid = @ex_firstid - 1;
SET @mid = @media_ex_firstid - 1;
INSERT INTO objects_media (objectid, mediaid) VALUES
(@eid := @eid + 1, @mid := @mid + 1),
(@eid := @eid + 1, @mid := @mid + 1),
(@eid := @eid + 1, @mid := @mid + 1),
(@eid := @eid + 1, @mid := @mid + 1),
(@eid := @eid + 1, @mid := @mid + 1),
(@eid, @mid := @mid + 1);
