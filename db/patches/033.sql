SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE business_sections DROP FOREIGN KEY business_sections_ibfk_3;
ALTER TABLE business_sections DROP COLUMN personid, DROP INDEX personid ;

CREATE TABLE business_sections_persons (
    id int NOT NULL AUTO_INCREMENT,
    business_sectioid int NOT NULL,
    personid int NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (business_sectioid) REFERENCES business_sections(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (personid) REFERENCES persons(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TRIGGER business_sections_persons_insert AFTER INSERT ON business_sections_persons
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('business_sections_persons', 0, NEW.id);

CREATE TRIGGER business_sections_persons_update AFTER UPDATE ON business_sections_persons
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('business_sections_persons', 1, NEW.id);

CREATE TRIGGER business_sections_persons_delete AFTER DELETE ON business_sections_persons
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('business_sections_persons', 2, OLD.id);

SET FOREIGN_KEY_CHECKS=1;
