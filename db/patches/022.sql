DROP TABLE IF EXISTS `home_videos`;
CREATE TABLE IF NOT EXISTS `home_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TRIGGER IF EXISTS home_videos_object_insert;


DELIMITER //

CREATE TRIGGER home_videos_object_insert BEFORE INSERT ON home_videos
FOR EACH ROW
BEGIN
    INSERT INTO objects_site(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END //


DELIMITER ;

INSERT INTO home_videos (count) VALUES (0);
