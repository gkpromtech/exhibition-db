SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE organizations DROP FOREIGN KEY organizations_ibfk_2;

ALTER TABLE organizations DROP COLUMN business_sectionid, DROP INDEX business_sectionid;

ALTER TABLE business_sections ADD FOREIGN KEY (organizationid) REFERENCES organizations(id) ON DELETE CASCADE ON UPDATE CASCADE;

SET FOREIGN_KEY_CHECKS=1;
