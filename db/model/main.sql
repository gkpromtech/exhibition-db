SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS changes;
CREATE TABLE changes (
  id INT NOT NULL AUTO_INCREMENT,
  entity VARCHAR(32) NOT NULL,
  changetype INT NOT NULL, -- ADDED=0, UPDATED=1, DELETED=2
  rowid INT NOT NULL,
  PRIMARY KEY (id)
);

-- базовый объект для всех информационных объектов
DROP TABLE IF EXISTS objects;
CREATE TABLE objects (
  id int NOT NULL AUTO_INCREMENT,
  createtime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modifytime TIMESTAMP NULL,
  PRIMARY KEY (id)
);


-- организации
DROP TABLE IF EXISTS organizations;
CREATE TABLE organizations (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  status int NOT NULL,
  logo varchar(128) NOT NULL,
  phone varchar(64) NOT NULL,
  email varchar(128) NOT NULL,
  site varchar(128) NOT NULL,
  business_sectionid int NULL,
FOREIGN KEY (id) REFERENCES objects(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (business_sectionid) REFERENCES business_sections(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- транляции для текстовых полей организаций
DROP TABLE IF EXISTS organizations_tr;
CREATE TABLE organizations_tr (
  id int NOT NULL AUTO_INCREMENT,
  organizationid INT NOT NULL,
  languageid INT NOT NULL,              -- 0 - RU, 1 - EN
  shortname varchar(256) NOT NULL,
  fullname varchar(256) NOT NULL,
  description varchar(256) ,
  address varchar(128) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (organizationid) REFERENCES organizations(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- представление для получения организаций по-русски
DROP VIEW IF EXISTS organizations_ru;
CREATE VIEW organizations_ru AS
    SELECT o.*, o_t.description, o_t.address FROM organizations AS o
        JOIN organizations_tr AS o_t on o_t.organizationid = o.id
        AND languageid=0;

-- представление для получения организаций по-английски
DROP VIEW IF EXISTS organizations_en;
CREATE VIEW organizations_en AS
    SELECT o.*, o_t.description, o_t.address FROM organizations AS o
        JOIN organizations_tr AS o_t on o_t.organizationid = o.id
        AND languageid=1;



-- мероприятия
DROP TABLE IF EXISTS events;
CREATE TABLE events (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  date TIMESTAMP NOT NULL,
  type int NOT NULL default 0,
FOREIGN KEY (id) REFERENCES objects(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- транляции для текстовых полей мероприятий
DROP TABLE IF EXISTS events_tr;
CREATE TABLE events_tr (
  id int NOT NULL AUTO_INCREMENT,
  eventid INT NOT NULL,
  languageid INT NOT NULL,              -- 0 - RU, 1 - EN
  header varchar(256) NOT NULL,
  details text,
PRIMARY KEY (id),
FOREIGN KEY (eventid) REFERENCES events(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- представление для получения мероприятий по-русски
DROP VIEW IF EXISTS events_ru;
CREATE VIEW events_ru AS
    SELECT e.*, e_t.header, e_t.details FROM events AS e
        JOIN events_tr AS e_t on e_t.eventid = e.id
        AND languageid=0;

-- представление для получения мероприятий по-английски
DROP VIEW IF EXISTS events_en;
CREATE VIEW events_en AS
    SELECT e.*, e_t.header, e_t.details FROM events AS e
        JOIN events_tr AS e_t on e_t.eventid = e.id
        AND languageid=1;

-- группы
DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  sortorder int NOT NULL UNIQUE, -- порядок в списке для сортировки
  position varchar(16) NOT NULL, -- идентификатор для привязки к схеме
FOREIGN KEY (id) REFERENCES objects(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- трансляции для текстовых полей групп
DROP TABLE IF EXISTS groups_tr;
CREATE TABLE groups_tr (
  id int NOT NULL AUTO_INCREMENT,
  groupid INT NOT NULL,
  languageid INT NOT NULL,              -- 0 - RU, 1 - EN
  name varchar(256) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (groupid) REFERENCES groups(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- представление для получения групп по-русски
DROP VIEW IF EXISTS groups_ru;
CREATE VIEW groups_ru AS
    SELECT p.*, p_t.name FROM groups AS p
        JOIN groups_tr AS p_t on p_t.groupid = p.id
        AND languageid=0;

-- представление для получения групп по-английски
DROP VIEW IF EXISTS groups_en;
CREATE VIEW groups_en AS
    SELECT p.*, p_t.name FROM groups AS p
        JOIN groups_tr AS p_t on p_t.groupid = p.id
        AND languageid=1;




-- места
DROP TABLE IF EXISTS places;
CREATE TABLE places (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  groupid int NOT NULL,
  mapPointId int,
FOREIGN KEY (id) REFERENCES objects(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (groupid) REFERENCES groups(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- транляции для текстовых полей Мест
DROP TABLE IF EXISTS places_tr;
CREATE TABLE places_tr (
  id int NOT NULL AUTO_INCREMENT,
  placeid INT NOT NULL,
  languageid INT NOT NULL,              -- 0 - RU, 1 - EN
  name varchar(256) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (placeid) REFERENCES places(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- представление для получения Мест по-русски
DROP VIEW IF EXISTS places_ru;
CREATE VIEW places_ru AS
    SELECT p.*, p_t.name FROM places AS p
        JOIN places_tr AS p_t on p_t.placeid = p.id
        AND languageid=0;

-- представление для получения Мест по-английски
DROP VIEW IF EXISTS places_en;
CREATE VIEW places_en AS
    SELECT p.*, p_t.name FROM places AS p
        JOIN places_tr AS p_t on p_t.placeid = p.id
        AND languageid=1;



-- выставочные образцы
DROP TABLE IF EXISTS exhibitions;
CREATE TABLE exhibitions (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  organizationid int NOT NULL,
  placeid int,
  sectionid int,
FOREIGN KEY (id) REFERENCES objects(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (organizationid) REFERENCES organizations(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (placeid) REFERENCES places(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (sectionid) REFERENCES sections(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- транляции для текстовых полей Образцов
DROP TABLE IF EXISTS exhibitions_tr;
CREATE TABLE exhibitions_tr (
  id int NOT NULL AUTO_INCREMENT,
  exhibitionid INT NOT NULL,
  languageid INT NOT NULL,              -- 0 - RU, 1 - EN
  name varchar(256) NOT NULL,
  text TEXT,
PRIMARY KEY (id),
FOREIGN KEY (exhibitionid) REFERENCES exhibitions(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- представление для получения Образцов по-русски
DROP VIEW IF EXISTS exhibitions_ru;
CREATE VIEW exhibitions_ru AS
    SELECT t.*, tr.name FROM exhibitions AS t
        JOIN exhibitions_tr AS tr on tr.exhibitionid = t.id
        AND languageid=0;

-- представление для получения Образцов по-английски
DROP VIEW IF EXISTS exhibitions_en;
CREATE VIEW exhibitions_en AS
    SELECT t.*, tr.name FROM exhibitions AS t
        JOIN exhibitions_tr AS tr on tr.exhibitionid = t.id
        AND languageid=1;




-- тематические разделы
DROP TABLE IF EXISTS sections;
CREATE TABLE sections (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  num int NOT NULL UNIQUE,
FOREIGN KEY (id) REFERENCES objects(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- транляции для текстовых полей Тем.разделов
DROP TABLE IF EXISTS sections_tr;
CREATE TABLE sections_tr (
  id int NOT NULL AUTO_INCREMENT,
  sectionid INT NOT NULL,
  languageid INT NOT NULL,              -- 0 - RU, 1 - EN
  name varchar(256) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (sectionid) REFERENCES sections(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- представление для получения Тем.разделов по-русски
DROP VIEW IF EXISTS sections_ru;
CREATE VIEW sections_ru AS
    SELECT t.*, tr.name FROM sections AS t
        JOIN sections_tr AS tr on tr.sectionid = t.id
        AND languageid=0;

-- представление для получения Тем.разделов по-английски
DROP VIEW IF EXISTS sections_en;
CREATE VIEW sections_en AS
    SELECT t.*, tr.name FROM sections AS t
        JOIN sections_tr AS tr on tr.sectionid = t.id
        AND languageid=1;



-- разделы деловой программы
DROP TABLE IF EXISTS business_sections;
CREATE TABLE business_sections (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  num int NOT NULL UNIQUE,
FOREIGN KEY (id) REFERENCES objects(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- транляции для текстовых полей Разделов деловой программы
DROP TABLE IF EXISTS business_sections_tr;
CREATE TABLE business_sections_tr (
  id int NOT NULL AUTO_INCREMENT,
  business_sectionid INT NOT NULL,
  languageid INT NOT NULL,              -- 0 - RU, 1 - EN
  name varchar(256) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (business_sectionid) REFERENCES business_sections(id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- персоны
DROP TABLE IF EXISTS persons;
CREATE TABLE persons (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  organizationid int NOT NULL,
  photo varchar(128) NOT NULL,
  phone varchar(64) NOT NULL,
  email varchar(128) NOT NULL,
  site varchar(128),
  FOREIGN KEY (id) REFERENCES objects(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (organizationid) REFERENCES organizations(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- транляции для текстовых полей Персоны
DROP TABLE IF EXISTS persons_tr;
CREATE TABLE persons_tr (
  id int NOT NULL AUTO_INCREMENT,
  personid INT NOT NULL,
  languageid INT NOT NULL,              -- 0 - RU, 1 - EN
  position varchar(256) NOT NULL,
  name varchar(256),
PRIMARY KEY (id),
FOREIGN KEY (personid) REFERENCES persons(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- представление для получения Персоны по-русски
DROP VIEW IF EXISTS persons_ru;
CREATE VIEW persons_ru AS
    SELECT t.*, tr.position, tr.name FROM persons AS t
        JOIN persons_tr AS tr on tr.personid = t.id
        AND languageid=0;

-- представление для получения Персоны по-английски
DROP VIEW IF EXISTS persons_en;
CREATE VIEW persons_en AS
    SELECT t.*, tr.position, tr.name FROM persons AS t
        JOIN persons_tr AS tr on tr.personid = t.id
        AND languageid=1;


-- pin персон
DROP TABLE IF EXISTS persons_auth;
CREATE TABLE persons_auth (
  personid int NOT NULL UNIQUE AUTO_INCREMENT,
  pin char(4) NOT NULL,
  token varchar(64) DEFAULT NULL,
  FOREIGN KEY (personid) REFERENCES persons(id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- встречи
DROP TABLE IF EXISTS meetings;
CREATE TABLE meetings (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  personid int NOT NULL,
  text TEXT,
  placeid int,
  status int DEFAULT 0, -- 0 - ACCEPTED, 1 - REJECTED, 2 - POSTPONED
FOREIGN KEY (id) REFERENCES objects(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (personid) REFERENCES persons(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (placeid) REFERENCES places(id) ON DELETE CASCADE ON UPDATE CASCADE
);



-- медиа
DROP TABLE IF EXISTS media;
CREATE TABLE media (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  type int NOT NULL DEFAULT 0, -- 0 - IMAGE, 1 - VIDEO, 2 - FILE
  organizationid int NOT NULL,
  FOREIGN KEY (id) REFERENCES objects(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (organizationid) REFERENCES organizations(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- транляции для текстовых полей Медиа
DROP TABLE IF EXISTS media_tr;
CREATE TABLE media_tr (
  id int NOT NULL AUTO_INCREMENT,
  mediaid INT NOT NULL,
  languageid INT NOT NULL,              -- 0 - RU, 1 - EN
  url varchar(256) NOT NULL,
  preview varchar(256),
  name varchar(256),
PRIMARY KEY (id),
FOREIGN KEY (mediaid) REFERENCES media(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- представление для получения Медиа по-русски
DROP VIEW IF EXISTS media_ru;
CREATE VIEW media_ru AS
    SELECT m.*, tr.name FROM media AS m
        JOIN media_tr AS tr on tr.mediaid = m.id AND tr.languageid = 0;

-- представление для получения Медиа по-английски
DROP VIEW IF EXISTS media_en;
CREATE VIEW media_en AS
    SELECT m.*, tr.name FROM media AS m
        JOIN media_tr AS tr on tr.mediaid = m.id AND tr.languageid = 1;




-- таблица новостей
DROP TABLE IF EXISTS news;
CREATE TABLE news (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  pubDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- из базового объекта
  organizationid int NOT NULL,
  status INT DEFAULT 0, -- 0 - DRAFT, 1 - READY, 2 - PUBLISHED
FOREIGN KEY (id) REFERENCES objects(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (organizationid) REFERENCES organizations(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- транляции для текстовых полей Медиа
DROP TABLE IF EXISTS news_tr;
CREATE TABLE news_tr (
  id int NOT NULL AUTO_INCREMENT,
  newsid INT NOT NULL,
  languageid INT NOT NULL,              -- 0 - RU, 1 - EN
  title varchar(256) NOT NULL,
  description text,
  link varchar(512) NOT NULL,
  enclosureUrl varchar(512) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (newsid) REFERENCES news(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- представление для получения Медиа по-русски
DROP VIEW IF EXISTS news_ru;
CREATE VIEW news_ru AS
    SELECT t.*, tr.title, tr.description FROM news AS t
        JOIN news_tr AS tr on tr.newsid = t.id
        AND languageid=0;

-- представление для получения Медиа по-английски
DROP VIEW IF EXISTS news_en;
CREATE VIEW news_en AS
    SELECT t.*, tr.title, tr.description FROM news AS t
        JOIN news_tr AS tr on tr.newsid = t.id
        AND languageid=1;




-- таблица связки групп и мест
DROP TABLE IF EXISTS groups_places;
CREATE TABLE groups_places (
  id int NOT NULL AUTO_INCREMENT,
  groupid int NOT NULL,
  placeid int NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (groupid) REFERENCES groups(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (placeid) REFERENCES places(id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- таблица связки событий и мест
DROP TABLE IF EXISTS events_places;
CREATE TABLE events_places (
  id int NOT NULL AUTO_INCREMENT,
  eventid int NOT NULL,
  placeid int NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (eventid) REFERENCES events(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (placeid) REFERENCES places(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- таблица связки событий и персон
DROP TABLE IF EXISTS events_persons;
CREATE TABLE events_persons (
  id int NOT NULL AUTO_INCREMENT,
  eventid int NOT NULL,
  personid int NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (eventid) REFERENCES events(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (personid) REFERENCES persons(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- таблица связки мест и организаций
DROP TABLE IF EXISTS places_organizations;
CREATE TABLE places_organizations (
  id int NOT NULL AUTO_INCREMENT,
  placeid int NOT NULL,
  organizationid int NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (placeid) REFERENCES places(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (organizationid) REFERENCES organizations(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- таблица связки событий и организаций
DROP TABLE IF EXISTS events_organizations;
CREATE TABLE events_organizations (
  id int NOT NULL AUTO_INCREMENT,
  eventid int NOT NULL,
  organizationid int NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (eventid) REFERENCES events(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (organizationid) REFERENCES organizations(id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- таблица связки событий и разделов секций программы
DROP TABLE IF EXISTS events_businesssections;
CREATE TABLE events_businesssections (
  id int NOT NULL AUTO_INCREMENT,
  eventid int NOT NULL,
  businesssectionid int NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (eventid) REFERENCES events(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (businesssectionid) REFERENCES business_sections(id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- таблица связки тематических разделов и мест
DROP TABLE IF EXISTS sections_places;
CREATE TABLE sections_places (
  id int NOT NULL AUTO_INCREMENT,
  placeid int NOT NULL,
  sectionid int NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (placeid) REFERENCES places (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (sectionid) REFERENCES sections (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- таблица тегов
DROP TABLE IF EXISTS tags;
CREATE TABLE tags (
  id int NOT NULL AUTO_INCREMENT,
  tag varchar(256) NOT NULL,
  PRIMARY KEY (id)
);

-- таблица связки тегоы и объектов
DROP TABLE IF EXISTS tags_objects;
CREATE TABLE tags_objects (
  id int NOT NULL AUTO_INCREMENT,
  tagid int NOT NULL,
  objectid int NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (tagid) REFERENCES tags(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (objectid) REFERENCES objects(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- таблица связки объектов и медиа-файлов
DROP TABLE IF EXISTS objects_media;
CREATE TABLE objects_media (
  id int NOT NULL AUTO_INCREMENT,
  objectid int NOT NULL,
  mediaid int NOT NULL,
  ordernum int DEFAULT 0,
  PRIMARY KEY (id),
  FOREIGN KEY (objectid) REFERENCES objects (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (mediaid) REFERENCES media (id) ON DELETE CASCADE ON UPDATE CASCADE
);

SET FOREIGN_KEY_CHECKS=1;

