CREATE TABLE IF NOT EXISTS online (
  id int NOT NULL AUTO_INCREMENT,
  url1 varchar(256) NOT NULL,
  url2 varchar(256),
  PRIMARY KEY (id)
);

CREATE TABLE online_tr (
  id int NOT NULL AUTO_INCREMENT,
  onlineid INT NOT NULL,
  languageid INT NOT NULL,              -- 0 - RU, 1 - EN
  name varchar(256) NOT NULL,
  description varchar(512),

  PRIMARY KEY (id),
  FOREIGN KEY (onlineid) REFERENCES online(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- online

CREATE TRIGGER online_insert AFTER INSERT ON online
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('online', 0, NEW.id);

CREATE TRIGGER online_update AFTER UPDATE ON online
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('online', 1, NEW.id);

CREATE TRIGGER online_delete AFTER DELETE ON online
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('online', 2, OLD.id);


DELIMITER //
CREATE TRIGGER online_object_insert BEFORE INSERT ON online
FOR EACH ROW
BEGIN
    INSERT INTO objects(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END; //

DELIMITER ;

-- online_tr

CREATE TRIGGER online_tr_insert AFTER INSERT ON online_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('online_tr', 0, NEW.id);

CREATE TRIGGER online_tr_update AFTER UPDATE ON online_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('online_tr', 1, NEW.id);

CREATE TRIGGER online_tr_delete AFTER DELETE ON online_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('online_tr', 2, OLD.id);


-- ins

INSERT INTO online(url1, url2) VALUES('rtmp://portal.rusarmyexpo.ru:1935/channel1/stream', 'http://portal.rusarmyexpo.ru:81/hls/stream1.m3u8');
SET @online_firstid := @last_inserted_id;
INSERT INTO online(url1, url2) VALUES('rtmp://portal.rusarmyexpo.ru:1935/channel2/stream', 'http://portal.rusarmyexpo.ru:81/hls/stream1.m3u8');

INSERT INTO online_tr (onlineid, languageid, name, description) VALUES
(@online_firstid + 0, 0, 'АРМИЯ-2015', 'Международный военно-технический форум АРМИЯ-2015. Видео 1.'),
(@online_firstid + 1, 0, 'АРМИЯ-2015', 'Международный военно-технический форум АРМИЯ-2015. Видео 2.'),
(@online_firstid + 0, 1, 'Army-2015', 'International military forum. Video 1.'),
(@online_firstid + 1, 1, 'Army-2015', 'International military forum. Video 2.');
