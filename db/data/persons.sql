INSERT INTO persons(organizationid, photo, phone, email, site) VALUES
(@org1_firstid + 3, 'http://www.tulamash.ru/media/uploads/boss.jpg', '+7 (4872) 55-87-13', 'sekretar@tulamash.ru', 'http://www.tulamash.ru/page/contacts');
SET @person_firstid := @last_inserted_id;
INSERT INTO persons(organizationid, photo, phone, email, site) VALUES
(@org1_firstid + 3, '', '+7 (4872) 55-87-13', 'sekretar@tulamash.ru', 'http://www.tulamash.ru/page/contacts');


INSERT INTO persons_tr(personid, languageid, position, name) VALUES
(@person_firstid, 0, 'Генеральный директор', 'Дронов Евгений Анатольевич'),
(@person_firstid, 1, 'CEO', 'Dronov Evgeny Anatolyevich'),
(@person_firstid + 1, 0, 'Заместитель ГД по инвестиционной деятельности', 'Казаков Сергей Иванович'),
(@person_firstid + 1, 1, 'Deputy CEO investing activities', 'Kazakov Sergey Ivanovitch');
