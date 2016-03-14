INSERT INTO organizations(status,logo,phone,email,site) VALUES
(0,"img/minobr_logo.png","8 (495) 333-45-72","gunid@mil.ru","http://www.mil.ru/");
SET @org_firstid := @last_inserted_id;
INSERT INTO organizations(status,logo,phone,email,site) VALUES
(1,"img/mkv_logo.png","+7-495-607-88-05","glebov@icecompany.org","http://www.icecompany.org/"),
(1,"img/roscosmos_logo.png","8 (499) 975-44-58","press@roscosmos.ru","http://www.federalspace.ru/"),
(1,"img/rostec_logo.png","+7 (495) 287-25-25","info@rostec.ru","http://rostec.ru/"),
(5,"img/russianhelicopters_logo.png","+7 (495) 627-5545","info@russianhelicopters.aero","http://www.russianhelicopters.aero/"),
(2,"img/streletz_logo.png","(+7-812) 7037500","mail@argus-spectr.ru","http://www.streletz.ru/"),
(3,"img/iifrf_logo.png","8 (4967) 35-31-93 ","info@iifrf.ru","http://www.iifrf.ru/"),
(4,"img/egotranslating_logo.png","+7 (495) 287-80-01","office-moscow@egotranslating.ru","http://egotranslating.com/");


SET @id = @org_firstid - 1;
INSERT INTO organizations_tr(organizationid, languageid, shortname, fullname, address) VALUES
(@id := @id + 1, 0, "МО РФ", "Министерство обороны Российской Федерации","г. Москва, Колымажный переулок, дом 14"),
(@id := @id + 1, 0, "ООО МВК", "ООО Международные конгрессы и выставки","г. Москва, Фурманный пер., д. 8 стр. 2"),
(@id := @id + 1, 0, "Роскосмос", "Федеральное космическое агентство","г. Москва, ул. Щепкина, д. 42."),
(@id := @id + 1, 0, "ГК “Ростехнологии”", "Государственная компания “Ростехнологии”","г. Москва, Усачева, 24"),
(@id := @id + 1, 0, "Вертолеты России", "Вертолеты России","г. Москва, Краснопресненская наб. 12, подъезд №9, этаж 21"),
(@id := @id + 1, 0, "Стрелец", "Стрелец","г. С-Петербург, Сердобольская, 65"),
(@id := @id + 1, 0, "Институт инженерной физик", "Институт инженерной физики","Московская обл., г.Серпухов, Б. Ударный пер., д. 1а"),
(@id := @id + 1, 0, "ЭГО Транслейтинг", "Компания ЭГО Транслейтинг","г. Санкт-Петербург, Мучной переулок, дом 2");

SET @id = @org_firstid - 1;
INSERT INTO organizations_tr(organizationid, languageid, shortname, fullname, address) VALUES
(@id := @id + 1, 1, "The Ministry of Defence", "The Ministry of Defence of the Russian Federation","Moscow, Kolymazhny Pereulok, 14"),
(@id := @id + 1, 1, "International Congresses and Exhibitions", "International Congresses and Exhibitions","Moscow, Furmanny pereulok 8, building 2"),
(@id := @id + 1, 1, "Federal Space Agency", "Federal Space Agency","Moscow, Shchepkina, 42"),
(@id := @id + 1, 1, "Rostekhnologii", "GK “Rostekhnologii”","Moscow, Usacheva, 24"),
(@id := @id + 1, 1, "Russian Helicopters", "Russian Helicopters","Moscow, Krasnopresnenskaya naberezhnaya 12, porch 9, floor 21"),
(@id := @id + 1, 1, "Strelets", "Strelets","Saint Petersburg, Serdobolskaya, 65"),
(@id := @id + 1, 1, "Institute of Engineering Physics", "Institute of Engineering Physics","Moskovskaya oblast, Serpukhov, Bolshoy Udarny pereulok, 1a"),
(@id := @id + 1, 1, "Translating company", "EGO Translating company","Saint Petersburg, Muchnoy pereulok, 2");
