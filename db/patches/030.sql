SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE business_sections ADD personid INT AFTER organizationid;
ALTER TABLE business_sections ADD FOREIGN KEY (personid) REFERENCES persons(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE business_events ADD personid INT AFTER organizationid;
ALTER TABLE business_events ADD FOREIGN KEY (personid) REFERENCES persons(id) ON DELETE CASCADE ON UPDATE CASCADE;

SET FOREIGN_KEY_CHECKS=1;
