ALTER TABLE visitors ADD organization VARCHAR(255) DEFAULT NULL AFTER name;
ALTER TABLE visitors ADD position VARCHAR(255) DEFAULT NULL AFTER organization;
ALTER TABLE visitors ADD phone VARCHAR(64) DEFAULT NULL AFTER position;
