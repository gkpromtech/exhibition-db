ALTER TABLE meetings ADD meeting_date TIMESTAMP AFTER status;
ALTER TABLE meetings ADD private_flag int NOT NULL DEFAULT 0 AFTER meeting_date;  -- 0 - private meeting, 1 - public meeting

CREATE TABLE IF NOT EXISTS meeting_requests (
  id int NOT NULL AUTO_INCREMENT,
  creator int NOT NULL,
  target_person int NOT NULL,
  request_text TEXT,
  denial_text TEXT,
  req_status int NOT NULL DEFAULT 0,    -- 0 - WAITING FOR ACCEPTANCE, 1 - ACCEPTED, 2 - REJECTED
  meeting_id int DEFAULT NULL,
  private_flag int NOT NULL DEFAULT 0,

  PRIMARY KEY (id),
  FOREIGN KEY (creator) REFERENCES persons(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (target_person) REFERENCES persons(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (meeting_id) REFERENCES meetings(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS meetings_persons (
  id int NOT NULL AUTO_INCREMENT,
  meeting_id int NOT NULL,
  person_id int NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (meeting_id) REFERENCES meetings(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (person_id) REFERENCES persons(id) ON DELETE CASCADE ON UPDATE CASCADE 
);

-- meeting_requests

CREATE TRIGGER meeting_requests_insert AFTER INSERT ON meeting_requests
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('meeting_requests', 0, NEW.id);

CREATE TRIGGER meeting_requests_update AFTER UPDATE ON meeting_requests
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('meeting_requests', 1, NEW.id);

CREATE TRIGGER meeting_requests_delete AFTER DELETE ON meeting_requests
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('meeting_requests', 2, OLD.id);

-- meetings_persons

CREATE TRIGGER meetings_persons_insert AFTER INSERT ON meetings_persons
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('meetings_persons', 0, NEW.id);

CREATE TRIGGER meetings_persons_update AFTER UPDATE ON meetings_persons
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('meetings_persons', 1, NEW.id);

CREATE TRIGGER meetings_persons_delete AFTER DELETE ON meetings_persons
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('meetings_persons', 2, OLD.id);

-- test data insert

INSERT INTO meetings(personid, text, placeid, status, meeting_date) VALUES(797, 'Самолёты', 347, 0, '2015-06-18 12:00:00');
SET @meeting_requests_firstid := @last_inserted_id;
INSERT INTO meetings(personid, text, placeid, status, meeting_date) VALUES(798, 'Корабли', 348, 1, '2015-06-18 12:00:00');
INSERT INTO meetings(personid, text, placeid, status, meeting_date) VALUES(798, 'Танки', 347, 0, '2015-06-16 12:00:00');

INSERT INTO meeting_requests (creator, target_person, request_text, denial_text, req_status, meeting_id) VALUES
(797, 798, 'Предагаю поговорить о самолётах', 'Некомпетентен в этом вопросе, могу обсудить корабли', 2, NULL),
(797, 798, 'Предагаю поговорить о танках', '', 1, @meeting_requests_firstid + 2),
(797, 798, 'Предагаю поговорить о погоде', '', 0, NULL),
(798, 797, 'Предагаю поговорить о самолётах', '', 1, @meeting_requests_firstid),
(797, 798, 'Предагаю поговорить о кораблях', '', 1, @meeting_requests_firstid + 1);

INSERT INTO meetings_persons (meeting_id, person_id) VALUES
(@meeting_requests_firstid, 798),
(@meeting_requests_firstid + 1, 797),
(@meeting_requests_firstid + 2, 797);
