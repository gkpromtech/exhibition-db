ALTER TABLE visitors ADD email_code VARCHAR(16) DEFAULT NULL;
ALTER TABLE visitors ADD email_confirmed INT(1) DEFAULT 0;
ALTER TABLE visitors ADD created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
-- максимальная длина для UNIQUE = varchar(255)
ALTER TABLE visitors CHANGE email email VARCHAR(255) NOT NULL;
ALTER TABLE visitors ADD CONSTRAINT visitors_email_uni UNIQUE (email);
