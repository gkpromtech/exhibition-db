CREATE TABLE IF NOT EXISTS `settings` (
  `name` varchar(64) NOT NULL,
  `value` varchar(64) NOT NULL,
  PRIMARY KEY (`name`)
);

INSERT IGNORE INTO settings(name, value)
VALUES("version", 1);
