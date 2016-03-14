ALTER TABLE business_sections ADD organizationid int DEFAULT NULL AFTER num;

INSERT INTO organizations(status, logo, phone, email, site) VALUES
(7, "", "", "", "");
SET @org_firstid := @last_inserted_id;
INSERT INTO organizations(status,logo,phone,email,site) VALUES
(7, "", "", "", ""),
(7, "", "", "", ""),
(7, "", "", "", ""),
(7, "", "", "", ""),
(7, "", "", "", ""),
(7, "", "", "", ""),
(7, "", "", "", ""),
(7, "", "", "", ""),
(7, "", "", "", ""),
(7, "", "", "", ""),
(7, "", "", "", ""),
(7, "", "", "", ""),
(7, "", "", "", ""),
(7, "", "", "", ""),
(7, "", "", "", ""),
(7, "", "", "", ""),
(7, "", "", "", ""),
(7, "", "", "", ""),
(7, "", "", "", "");

SET @id = @org_firstid - 1;
INSERT INTO organizations_tr(organizationid, languageid, shortname, fullname, address) VALUES
(@id := @id + 1, 0, "Военная академия ГШ ВС РФ", "Военная академия Генерального штаба Вооруженных Сил Российской Федерации",""),
(@id := @id + 1, 0, "Главное оперативное управление ГШ ВС РФ", "Главное оперативное управление Генерального штаба Вооруженных Сил Российской Федерации",""),
(@id := @id + 1, 0, "ГК СВ", "Главное командование Сухопутных Войск",""),
(@id := @id + 1, 0, "ГК ВМФ", "Главное командование Военно-Морского Флота",""),
(@id := @id + 1, 0, "ГК ВВС", "Главное командование Военно-воздушных сил",""),
(@id := @id + 1, 0, "Командование ВВКО", "Командование Войск Воздушно-космической обороны",""),
(@id := @id + 1, 0, "Командование РВСН", "Командование Ракетных войск стратегического назначения",""),
(@id := @id + 1, 0, "Командование ВДВ", "Командование Воздушно-десантных войск",""),
(@id := @id + 1, 0, "ГУ Связи ВС РФ", "Главное управление Связи Вооруженных Сил Российской Федерации",""),
(@id := @id + 1, 0, "Управление службы войск и безопасности военной службы МО РФ", "Управление службы войск и безопасности военной службы Министерства обороны Российской Федерации",""),
(@id := @id + 1, 0, "Военно-топографическое управление ГШ ВС РФ", "Военно-топографическое управление Генерального штаба Вооруженных Сил Российской Федерации",""),
(@id := @id + 1, 0, "ГУ развития информационных и телекоммуникационных технологий МО РФ", "Главное управление развития информационных и телекоммуникационных технологий Министерства обороны Российской Федерации",""),
(@id := @id + 1, 0, "Управление начальника инженерных войск ВС РФ", "Управление начальника инженерных войск Вооруженных Сил Российской Федерации",""),
(@id := @id + 1, 0, "Управление интеллектуальной собственности, военно-технического сотрудничества и экспертизы поставок ВВТ МО РФ", "Управление интеллектуальной собственности, военно-технического сотрудничества и экспертизы поставок ВВТ Министерства обороны Российской Федерации",""),
(@id := @id + 1, 0, "Штаб МТО ВС РФ", "Штаб материально-технического обеспечения Вооруженных Сил Российской Федерации",""),
(@id := @id + 1, 0, "ГУ научно-исследовательской деятельности и технологического сопровождения передовых технологий (инновационных исследований) МО РФ", "Главное управление научно-исследовательской деятельности и технологического сопровождения передовых технологий (инновационных исследований) Министерства обороны Российской Федерации",""),
(@id := @id + 1, 0, "Департамент эксплуатационного содержания и обеспечения коммунальными услугами воинских частей и организаций МО РФ", "Департамент эксплуатационного содержания и обеспечения коммунальными услугами воинских частей и организаций МО РФ",""),
(@id := @id + 1, 0, "Главное военно-медицинское управление МО РФ", "Главное военно-медицинское управление Министерства обороны Российской Федерации",""),
(@id := @id + 1, 0, "ГУ кадров МО РФ", "Главное управление кадров Министерства обороны Российской Федерации","");

SET @id = @org_firstid - 1;
INSERT INTO organizations_tr(organizationid, languageid, shortname, fullname, address) VALUES
(@id := @id + 1, 1, "Военная академия ГШ ВС РФ", "Военная академия Генерального штаба Вооруженных Сил Российской Федерации",""),
(@id := @id + 1, 1, "Главное оперативное управление ГШ ВС РФ", "Главное оперативное управление Генерального штаба Вооруженных Сил Российской Федерации",""),
(@id := @id + 1, 1, "ГК СВ", "Главное командование Сухопутных Войск",""),
(@id := @id + 1, 1, "ГК ВМФ", "Главное командование Военно-Морского Флота",""),
(@id := @id + 1, 1, "ГК ВВС", "Главное командование Военно-воздушных сил",""),
(@id := @id + 1, 1, "Командование ВВКО", "Командование Войск Воздушно-космической обороны",""),
(@id := @id + 1, 1, "Командование РВСН", "Командование Ракетных войск стратегического назначения",""),
(@id := @id + 1, 1, "Командование ВДВ", "Командование Воздушно-десантных войск",""),
(@id := @id + 1, 1, "ГУ Связи ВС РФ", "Главное управление Связи Вооруженных Сил Российской Федерации",""),
(@id := @id + 1, 1, "Управление службы войск и безопасности военной службы МО РФ", "Управление службы войск и безопасности военной службы Министерства обороны Российской Федерации",""),
(@id := @id + 1, 1, "Военно-топографическое управление ГШ ВС РФ", "Военно-топографическое управление Генерального штаба Вооруженных Сил Российской Федерации",""),
(@id := @id + 1, 1, "ГУ развития информационных и телекоммуникационных технологий МО РФ", "Главное управление развития информационных и телекоммуникационных технологий Министерства обороны Российской Федерации",""),
(@id := @id + 1, 1, "Управление начальника инженерных войск ВС РФ", "Управление начальника инженерных войск Вооруженных Сил Российской Федерации",""),
(@id := @id + 1, 1, "Управление интеллектуальной собственности, военно-технического сотрудничества и экспертизы поставок ВВТ МО РФ", "Управление интеллектуальной собственности, военно-технического сотрудничества и экспертизы поставок ВВТ Министерства обороны Российской Федерации",""),
(@id := @id + 1, 1, "Штаб МТО ВС РФ", "Штаб материально-технического обеспечения Вооруженных Сил Российской Федерации",""),
(@id := @id + 1, 1, "ГУ научно-исследовательской деятельности и технологического сопровождения передовых технологий (инновационных исследований) МО РФ", "Главное управление научно-исследовательской деятельности и технологического сопровождения передовых технологий (инновационных исследований) Министерства обороны Российской Федерации",""),
(@id := @id + 1, 1, "Департамент эксплуатационного содержания и обеспечения коммунальными услугами воинских частей и организаций МО РФ", "Департамент эксплуатационного содержания и обеспечения коммунальными услугами воинских частей и организаций МО РФ",""),
(@id := @id + 1, 1, "Главное военно-медицинское управление МО РФ", "Главное военно-медицинское управление Министерства обороны Российской Федерации",""),
(@id := @id + 1, 1, "ГУ кадров МО РФ", "Главное управление кадров Министерства обороны Российской Федерации","");


INSERT INTO business_sections(num, organizationid) VALUES(1, @org_firstid);
SET @sections_firstid := @last_inserted_id;
INSERT INTO business_sections(num, organizationid) VALUES(2, @org_firstid + 1);
INSERT INTO business_sections(num, organizationid) VALUES(3, @org_firstid + 2);
INSERT INTO business_sections(num, organizationid) VALUES(4, @org_firstid + 3);
INSERT INTO business_sections(num, organizationid) VALUES(5, @org_firstid + 4);
INSERT INTO business_sections(num, organizationid) VALUES(6, @org_firstid + 5);
INSERT INTO business_sections(num, organizationid) VALUES(7, @org_firstid + 6);
INSERT INTO business_sections(num, organizationid) VALUES(8, @org_firstid + 7);
INSERT INTO business_sections(num, organizationid) VALUES(9, @org_firstid + 8);
INSERT INTO business_sections(num, organizationid) VALUES(10, @org_firstid + 9);
INSERT INTO business_sections(num, organizationid) VALUES(11, @org_firstid + 10);
INSERT INTO business_sections(num, organizationid) VALUES(12, @org_firstid + 11);
INSERT INTO business_sections(num, organizationid) VALUES(13, @org_firstid + 12);
INSERT INTO business_sections(num, organizationid) VALUES(14, @org_firstid + 13);
INSERT INTO business_sections(num, organizationid) VALUES(15, @org_firstid + 14);
INSERT INTO business_sections(num, organizationid) VALUES(16, @org_firstid + 15);
INSERT INTO business_sections(num, organizationid) VALUES(17, @org_firstid + 16);
INSERT INTO business_sections(num, organizationid) VALUES(18, @org_firstid + 17);
INSERT INTO business_sections(num, organizationid) VALUES(19, @org_firstid + 18);
INSERT INTO business_sections(num, organizationid) VALUES(20, @org_firstid + 19);

INSERT INTO business_sections_tr(business_sectionid, languageid, name) VALUES
(@sections_firstid, 0, "Россия в современном мире. Вызовы и угрозы"),
(@sections_firstid + 1, 0, "Управление войсками (силами) и оружием. Моделирование военных (боевых) действий"),
(@sections_firstid + 2, 0, "Обеспечение национальной безопасности в Арктике"),
(@sections_firstid + 3, 0, "Актуальные проблемы развития Сухопутных войск"),
(@sections_firstid + 4, 0, "Актуальные проблемы развития Военно-Морского Флота"),
(@sections_firstid + 5, 0, "Актуальные проблемы развития Военно-воздушных сил"),
(@sections_firstid + 6, 0, "Актуальные проблемы развития космических сил и средств"),
(@sections_firstid + 7, 0, "Актуальные проблемы развития наземного стратегического вооружения"),
(@sections_firstid + 8, 0, "Актуальные проблемы развития Воздушно-десантных войск"),
(@sections_firstid + 9, 0, "Актуальные проблемы развития системы связи ВС РФ"),
(@sections_firstid + 10, 0, "Актуальные проблемы обеспечения безопасности военных объектов"),
(@sections_firstid + 11, 0, "Гидрометеорологическое, топогеодезическое и навигационное обеспечение войск (сил)"),
(@sections_firstid + 12, 0, "Средства и технологии связи и обработки информации"),
(@sections_firstid + 13, 0, "Инженерное обеспечение действий войск (сил)"),
(@sections_firstid + 14, 0, "Военно-техническое обеспечение войск (сил)"),
(@sections_firstid + 15, 0, "Актуальные вопросы материально-технического обеспечения войск (сил)"),
(@sections_firstid + 16, 0, "Робототехнические комплексы военного назначения"),
(@sections_firstid + 17, 0, "Актуальные проблемы обеспечения жизнедеятельности ВС РФ"),
(@sections_firstid + 18, 0, "Всестороннее обеспечение Вооруженных Сил"),
(@sections_firstid + 19, 0, "Воинское обучение и воспитание");

INSERT INTO business_sections_tr(business_sectionid, languageid, name) VALUES
(@sections_firstid, 0, "Россия в современном мире. Вызовы и угрозы"),
(@sections_firstid + 1, 1, "Управление войсками (силами) и оружием. Моделирование военных (боевых) действий"),
(@sections_firstid + 2, 1, "Обеспечение национальной безопасности в Арктике"),
(@sections_firstid + 3, 1, "Актуальные проблемы развития Сухопутных войск"),
(@sections_firstid + 4, 1, "Актуальные проблемы развития Военно-Морского Флота"),
(@sections_firstid + 5, 1, "Актуальные проблемы развития Военно-воздушных сил"),
(@sections_firstid + 6, 1, "Актуальные проблемы развития космических сил и средств"),
(@sections_firstid + 7, 1, "Актуальные проблемы развития наземного стратегического вооружения"),
(@sections_firstid + 8, 1, "Актуальные проблемы развития Воздушно-десантных войск"),
(@sections_firstid + 9, 1, "Актуальные проблемы развития системы связи ВС РФ"),
(@sections_firstid + 10, 1, "Актуальные проблемы обеспечения безопасности военных объектов"),
(@sections_firstid + 11, 1, "Гидрометеорологическое, топогеодезическое и навигационное обеспечение войск (сил)"),
(@sections_firstid + 12, 1, "Средства и технологии связи и обработки информации"),
(@sections_firstid + 13, 1, "Инженерное обеспечение действий войск (сил)"),
(@sections_firstid + 14, 1, "Военно-техническое обеспечение войск (сил)"),
(@sections_firstid + 15, 1, "Актуальные вопросы материально-технического обеспечения войск (сил)"),
(@sections_firstid + 16, 1, "Робототехнические комплексы военного назначения"),
(@sections_firstid + 17, 1, "Актуальные проблемы обеспечения жизнедеятельности ВС РФ"),
(@sections_firstid + 18, 1, "Всестороннее обеспечение Вооруженных Сил"),
(@sections_firstid + 19, 1, "Воинское обучение и воспитание");

-- мероприятия деловой программы
CREATE TABLE IF NOT EXISTS business_events (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  date DATETIME,
  organizationid int NOT NULL,
  members_limit int,
  placeid int,
  business_sectionid int,

FOREIGN KEY (id) REFERENCES objects(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (organizationid) REFERENCES organizations(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (placeid) REFERENCES places(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (business_sectionid) REFERENCES business_sections(id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TRIGGER IF EXISTS business_events_object_insert;

DELIMITER //
CREATE TRIGGER business_events_object_insert BEFORE INSERT ON business_events
FOR EACH ROW
BEGIN
    INSERT INTO objects(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END //

DELIMITER ;



-- транcляции для текстовых полей
CREATE TABLE IF NOT EXISTS business_events_tr (
  id int NOT NULL AUTO_INCREMENT,
  business_eventid INT NOT NULL,
  languageid INT NOT NULL,              -- 0 - RU, 1 - EN
  header varchar(256) NOT NULL,
  details text,

PRIMARY KEY (id),
FOREIGN KEY (business_eventid) REFERENCES business_events(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- связка представителя с мероприятием деловой программы
CREATE TABLE IF NOT EXISTS person_business_events (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  personid int NOT NULL,
  business_eventid int NOT NULL,

FOREIGN KEY (personid) REFERENCES persons(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (business_eventid) REFERENCES business_events(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- business_events

CREATE TRIGGER business_events_insert AFTER INSERT ON business_events
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('business_events', 0, NEW.id);

CREATE TRIGGER business_events_update AFTER UPDATE ON business_events
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('business_events', 1, NEW.id);

CREATE TRIGGER business_events_delete AFTER DELETE ON business_events
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('business_events', 2, OLD.id);

-- business_events_tr

CREATE TRIGGER business_events_tr_insert AFTER INSERT ON business_events_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('business_events_tr', 0, NEW.id);

CREATE TRIGGER business_events_tr_update AFTER UPDATE ON business_events_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('business_events_tr', 1, NEW.id);

CREATE TRIGGER business_events_tr_delete AFTER DELETE ON business_events_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('business_events_tr', 2, OLD.id);

-- person_business_events

CREATE TRIGGER person_business_events_insert AFTER INSERT ON person_business_events
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('person_business_events', 0, NEW.id);

CREATE TRIGGER person_business_events_update AFTER UPDATE ON person_business_events
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('person_business_events', 1, NEW.id);

CREATE TRIGGER person_business_events_delete AFTER DELETE ON person_business_events
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('person_business_events', 2, OLD.id);


-- business_events data
INSERT INTO business_events(date, organizationid, members_limit, placeid, business_sectionid)
VALUES('2015-06-16 10:00:00', @org_firstid, 100, 337, @sections_firstid);
SET @events_firstid := @last_inserted_id;
INSERT INTO business_events(date, organizationid, members_limit, placeid, business_sectionid)
VALUES('2015-06-16 11:00:00', @org_firstid, 100, 337, @sections_firstid);
INSERT INTO business_events(date, organizationid, members_limit, placeid, business_sectionid)
VALUES('2015-06-17 10:00:00', @org_firstid + 1, 100, 338, @sections_firstid + 1);
INSERT INTO business_events(date, organizationid, members_limit, placeid, business_sectionid)
VALUES('2015-06-18 10:00:00', 191, 100, 337, @sections_firstid + 2);
INSERT INTO business_events(date, organizationid, members_limit, placeid, business_sectionid)
VALUES('2015-06-19 10:00:00', 81, 100, 339, @sections_firstid + 6);

INSERT INTO business_events_tr(business_eventid, languageid, header, details)
VALUES(@events_firstid + 0, 0, "Круглый стол Вызовы и угрозы безопасности России. Военная доктрина","Круглый стол Вызовы и угрозы безопасности России. Военная доктрина");
INSERT INTO business_events_tr(business_eventid, languageid, header, details)
VALUES(@events_firstid + 1, 0, "Круглый стол «Дестабилизирующая роль глобальной ПРО и ЕвроПРО»","Круглый стол «Дестабилизирующая роль глобальной ПРО и ЕвроПРО»");
INSERT INTO business_events_tr(business_eventid, languageid, header, details)
VALUES(@events_firstid + 2, 0, "Круглый стол «Современные технологии мониторинга, анализа и прогнозирования кризисных ситуаций для обеспечения информационной поддержки принятия решений в реальном масштабе времени»","Круглый стол «Современные технологии мониторинга, анализа и прогнозирования кризисных ситуаций для обеспечения информационной поддержки принятия решений в реальном масштабе времени»");
INSERT INTO business_events_tr(business_eventid, languageid, header, details)
VALUES(@events_firstid + 3, 0, "Круглый стол «Арктика. Человек и стихия. Гидрометеорологические аспекты деятельности в Арктическом регионе»","Круглый стол «Арктика. Человек и стихия. Гидрометеорологические аспекты деятельности в Арктическом регионе»");
INSERT INTO business_events_tr(business_eventid, languageid, header, details)
VALUES(@events_firstid + 4, 0, "Брифинг «Пути оптимизации целевой аппаратуры космических аппаратов (полезная нагрузка)»","Брифинг «Пути оптимизации целевой аппаратуры космических аппаратов (полезная нагрузка)»");

INSERT INTO business_events_tr(business_eventid, languageid, header, details)
VALUES(@events_firstid + 0, 1, "Круглый стол Вызовы и угрозы безопасности России. Военная доктрина","Круглый стол Вызовы и угрозы безопасности России. Военная доктрина");
INSERT INTO business_events_tr(business_eventid, languageid, header, details)
VALUES(@events_firstid + 1, 1, "Круглый стол «Дестабилизирующая роль глобальной ПРО и ЕвроПРО»","Круглый стол «Дестабилизирующая роль глобальной ПРО и ЕвроПРО»");
INSERT INTO business_events_tr(business_eventid, languageid, header, details)
VALUES(@events_firstid + 2, 1, "Круглый стол «Современные технологии мониторинга, анализа и прогнозирования кризисных ситуаций для обеспечения информационной поддержки принятия решений в реальном масштабе времени»","Круглый стол «Современные технологии мониторинга, анализа и прогнозирования кризисных ситуаций для обеспечения информационной поддержки принятия решений в реальном масштабе времени»");
INSERT INTO business_events_tr(business_eventid, languageid, header, details)
VALUES(@events_firstid + 3, 1, "Круглый стол «Арктика. Человек и стихия. Гидрометеорологические аспекты деятельности в Арктическом регионе»","Круглый стол «Арктика. Человек и стихия. Гидрометеорологические аспекты деятельности в Арктическом регионе»");
INSERT INTO business_events_tr(business_eventid, languageid, header, details)
VALUES(@events_firstid + 4, 1, "Брифинг «Пути оптимизации целевой аппаратуры космических аппаратов (полезная нагрузка)»","Брифинг «Пути оптимизации целевой аппаратуры космических аппаратов (полезная нагрузка)»");


-- person_business_events data
INSERT INTO person_business_events(personid, business_eventid)
VALUES(797, @events_firstid);
INSERT INTO person_business_events(personid, business_eventid)
VALUES(798, @events_firstid);






