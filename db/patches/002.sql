-- таблица связки организаций и разделов

CREATE TABLE organizations_sections (
  id int NOT NULL AUTO_INCREMENT,
  sectionid int NOT NULL,
  organizationid int NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (sectionid) REFERENCES sections (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (organizationid) REFERENCES organizations (id) ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE organizations_tr MODIFY COLUMN description varchar(512);
