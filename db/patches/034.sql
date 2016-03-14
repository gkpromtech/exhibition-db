SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE business_sections_persons DROP FOREIGN KEY business_sections_persons_ibfk_1;
ALTER TABLE business_sections_persons CHANGE COLUMN `business_sectioid` `business_sectionid` INT(11) NOT NULL ;
ALTER TABLE business_sections_persons ADD CONSTRAINT `business_sections_persons_ibfk_1` FOREIGN KEY (`business_sectionid`)
  REFERENCES business_sections (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

SET FOREIGN_KEY_CHECKS=1;
