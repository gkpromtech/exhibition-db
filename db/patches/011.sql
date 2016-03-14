SET FOREIGN_KEY_CHECKS=0;

-- базовый объект для всех информационных объектов
DROP TABLE IF EXISTS objects_site;
CREATE TABLE objects_site (
  id int NOT NULL AUTO_INCREMENT,
  createtime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modifytime TIMESTAMP NULL,
  PRIMARY KEY (id)
);

-- таблица статей
DROP TABLE IF EXISTS articles;
CREATE TABLE articles (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  pubDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- из базового объекта
  status INT DEFAULT 0, -- 0 - DRAFT, 1 - READY, 2 - PUBLISHED
  pub int NOT NULL,
FOREIGN KEY (id) REFERENCES objects_site(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- транляции для текстовых полей Медиа
DROP TABLE IF EXISTS articles_tr;
CREATE TABLE articles_tr (
  id int NOT NULL AUTO_INCREMENT,
  articlesid INT NOT NULL,
  languageid INT NOT NULL,              -- 0 - RU, 1 - EN
  title varchar(256) NOT NULL,
  description text,
  link varchar(512) NOT NULL,
  enclosureUrl varchar(512) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (articlesid) REFERENCES articles(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- контент
DROP TABLE IF EXISTS content;
CREATE TABLE content (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  status int DEFAULT 0, -- 0 - DRAFT, 1 - READY, 2 - PUBLISHED
  template int DEFAULT 0,
FOREIGN KEY (id) REFERENCES objects_site(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- транляции для текстовых полей Контент
DROP TABLE IF EXISTS content_tr;
CREATE TABLE content_tr (
  id int NOT NULL AUTO_INCREMENT,
  contentid int NOT NULL,
  languageid int NOT NULL,              -- 0 - RU, 1 - EN
  title varchar(256) NOT NULL,
  description text,
  PRIMARY KEY (id),
  FOREIGN KEY (contentid) REFERENCES content(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- таблица связки объектов и медиа-файлов
DROP TABLE IF EXISTS objects_media_site;
CREATE TABLE objects_media_site (
  id int NOT NULL AUTO_INCREMENT,
  objectid int NOT NULL,
  mediaid int NOT NULL,
  ordernum int DEFAULT 0,
  PRIMARY KEY (id),
  FOREIGN KEY (objectid) REFERENCES objects_site (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (mediaid) REFERENCES media (id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TRIGGER IF EXISTS articles_object_insert;

DELIMITER //
CREATE TRIGGER articles_object_insert BEFORE INSERT ON articles
FOR EACH ROW
BEGIN
    INSERT INTO objects_site(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END; //

DELIMITER ;


DROP TRIGGER IF EXISTS content_object_insert;

DELIMITER //
CREATE TRIGGER content_object_insert BEFORE INSERT ON content
FOR EACH ROW
BEGIN
    INSERT INTO objects_site(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END; //

DELIMITER ;

SET FOREIGN_KEY_CHECKS=0;

