
-- objects

DROP TRIGGER IF EXISTS objects_insert;
DROP TRIGGER IF EXISTS objects_update;
DROP TRIGGER IF EXISTS objects_delete;

CREATE TRIGGER objects_insert AFTER INSERT ON objects
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('objects', 0, NEW.id);

CREATE TRIGGER objects_update AFTER UPDATE ON objects
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('objects', 1, NEW.id);

CREATE TRIGGER objects_delete AFTER DELETE ON objects
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('objects', 2, OLD.id);


-- organizations

DROP TRIGGER IF EXISTS organizations_insert;
DROP TRIGGER IF EXISTS organizations_update;
DROP TRIGGER IF EXISTS organizations_delete;

CREATE TRIGGER organizations_insert AFTER INSERT ON organizations
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('organizations', 0, NEW.id);

CREATE TRIGGER organizations_update AFTER UPDATE ON organizations
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('organizations', 1, NEW.id);

CREATE TRIGGER organizations_delete AFTER DELETE ON organizations
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('organizations', 2, OLD.id);


DROP TRIGGER IF EXISTS organizations_object_insert;

DELIMITER //
CREATE TRIGGER organizations_object_insert BEFORE INSERT ON organizations
FOR EACH ROW
BEGIN
    INSERT INTO objects(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END //

DELIMITER ;

-- organizations_tr

DROP TRIGGER IF EXISTS organizations_tr_insert;
DROP TRIGGER IF EXISTS organizations_tr_update;
DROP TRIGGER IF EXISTS organizations_tr_delete;

CREATE TRIGGER organizations_tr_insert AFTER INSERT ON organizations_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('organizations_tr', 0, NEW.id);

CREATE TRIGGER organizations_tr_update AFTER UPDATE ON organizations_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('organizations_tr', 1, NEW.id);

CREATE TRIGGER organizations_tr_delete AFTER DELETE ON organizations_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('organizations_tr', 2, OLD.id);


-- events

DROP TRIGGER IF EXISTS events_insert;
DROP TRIGGER IF EXISTS events_update;
DROP TRIGGER IF EXISTS events_delete;

CREATE TRIGGER events_insert AFTER INSERT ON events
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('events', 0, NEW.id);

CREATE TRIGGER events_update AFTER UPDATE ON events
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('events', 1, NEW.id);

CREATE TRIGGER events_delete AFTER DELETE ON events
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('events', 2, OLD.id);


DROP TRIGGER IF EXISTS events_object_insert;

DELIMITER //
CREATE TRIGGER events_object_insert BEFORE INSERT ON events
FOR EACH ROW
BEGIN
    INSERT INTO objects(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END //

DELIMITER ;

-- events_tr

DROP TRIGGER IF EXISTS events_tr_insert;
DROP TRIGGER IF EXISTS events_tr_update;
DROP TRIGGER IF EXISTS events_tr_delete;

CREATE TRIGGER events_tr_insert AFTER INSERT ON events_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('events_tr', 0, NEW.id);

CREATE TRIGGER events_tr_update AFTER UPDATE ON events_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('events_tr', 1, NEW.id);

CREATE TRIGGER events_tr_delete AFTER DELETE ON events_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('events_tr', 2, OLD.id);


-- groups

DROP TRIGGER IF EXISTS groups_insert;
DROP TRIGGER IF EXISTS groups_update;
DROP TRIGGER IF EXISTS groups_delete;

CREATE TRIGGER groups_insert AFTER INSERT ON groups
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('groups', 0, NEW.id);

CREATE TRIGGER groups_update AFTER UPDATE ON groups
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('groups', 1, NEW.id);

CREATE TRIGGER groups_delete AFTER DELETE ON groups
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('groups', 2, OLD.id);


DROP TRIGGER IF EXISTS groups_object_insert;

DELIMITER //
CREATE TRIGGER groups_object_insert BEFORE INSERT ON groups
FOR EACH ROW
BEGIN
    INSERT INTO objects(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END //

DELIMITER ;

-- groups_tr

DROP TRIGGER IF EXISTS groups_tr_insert;
DROP TRIGGER IF EXISTS groups_tr_update;
DROP TRIGGER IF EXISTS groups_tr_delete;

CREATE TRIGGER groups_tr_insert AFTER INSERT ON groups_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('groups_tr', 0, NEW.id);

CREATE TRIGGER groups_tr_update AFTER UPDATE ON groups_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('groups_tr', 1, NEW.id);

CREATE TRIGGER groups_tr_delete AFTER DELETE ON groups_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('groups_tr', 2, OLD.id);


-- places

DROP TRIGGER IF EXISTS places_insert;
DROP TRIGGER IF EXISTS places_update;
DROP TRIGGER IF EXISTS places_delete;

CREATE TRIGGER places_insert AFTER INSERT ON places
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('places', 0, NEW.id);

CREATE TRIGGER places_update AFTER UPDATE ON places
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('places', 1, NEW.id);

CREATE TRIGGER places_delete AFTER DELETE ON places
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('places', 2, OLD.id);


DROP TRIGGER IF EXISTS places_object_insert;

DELIMITER //
CREATE TRIGGER places_object_insert BEFORE INSERT ON places
FOR EACH ROW
BEGIN
    INSERT INTO objects(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END //

DELIMITER ;

-- places_tr

DROP TRIGGER IF EXISTS places_tr_insert;
DROP TRIGGER IF EXISTS places_tr_update;
DROP TRIGGER IF EXISTS places_tr_delete;

CREATE TRIGGER places_tr_insert AFTER INSERT ON places_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('places_tr', 0, NEW.id);

CREATE TRIGGER places_tr_update AFTER UPDATE ON places_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('places_tr', 1, NEW.id);

CREATE TRIGGER places_tr_delete AFTER DELETE ON places_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('places_tr', 2, OLD.id);


-- exhibitions

DROP TRIGGER IF EXISTS exhibitions_insert;
DROP TRIGGER IF EXISTS exhibitions_update;
DROP TRIGGER IF EXISTS exhibitions_delete;

CREATE TRIGGER exhibitions_insert AFTER INSERT ON exhibitions
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('exhibitions', 0, NEW.id);

CREATE TRIGGER exhibitions_update AFTER UPDATE ON exhibitions
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('exhibitions', 1, NEW.id);

CREATE TRIGGER exhibitions_delete AFTER DELETE ON exhibitions
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('exhibitions', 2, OLD.id);


DROP TRIGGER IF EXISTS exhibitions_object_insert;

DELIMITER //
CREATE TRIGGER exhibitions_object_insert BEFORE INSERT ON exhibitions
FOR EACH ROW
BEGIN
    INSERT INTO objects(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END //

DELIMITER ;

-- exhibitions_tr

DROP TRIGGER IF EXISTS exhibitions_tr_insert;
DROP TRIGGER IF EXISTS exhibitions_tr_update;
DROP TRIGGER IF EXISTS exhibitions_tr_delete;

CREATE TRIGGER exhibitions_tr_insert AFTER INSERT ON exhibitions_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('exhibitions_tr', 0, NEW.id);

CREATE TRIGGER exhibitions_tr_update AFTER UPDATE ON exhibitions_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('exhibitions_tr', 1, NEW.id);

CREATE TRIGGER exhibitions_tr_delete AFTER DELETE ON exhibitions_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('exhibitions_tr', 2, OLD.id);


-- sections

DROP TRIGGER IF EXISTS sections_insert;
DROP TRIGGER IF EXISTS sections_update;
DROP TRIGGER IF EXISTS sections_delete;

CREATE TRIGGER sections_insert AFTER INSERT ON sections
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('sections', 0, NEW.id);

CREATE TRIGGER sections_update AFTER UPDATE ON sections
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('sections', 1, NEW.id);

CREATE TRIGGER sections_delete AFTER DELETE ON sections
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('sections', 2, OLD.id);


DROP TRIGGER IF EXISTS sections_object_insert;

DELIMITER //
CREATE TRIGGER sections_object_insert BEFORE INSERT ON sections
FOR EACH ROW
BEGIN
    INSERT INTO objects(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END //

DELIMITER ;

-- sections_tr

DROP TRIGGER IF EXISTS sections_tr_insert;
DROP TRIGGER IF EXISTS sections_tr_update;
DROP TRIGGER IF EXISTS sections_tr_delete;

CREATE TRIGGER sections_tr_insert AFTER INSERT ON sections_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('sections_tr', 0, NEW.id);

CREATE TRIGGER sections_tr_update AFTER UPDATE ON sections_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('sections_tr', 1, NEW.id);

CREATE TRIGGER sections_tr_delete AFTER DELETE ON sections_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('sections_tr', 2, OLD.id);


-- business_sections

DROP TRIGGER IF EXISTS business_sections_insert;
DROP TRIGGER IF EXISTS business_sections_update;
DROP TRIGGER IF EXISTS business_sections_delete;

CREATE TRIGGER business_sections_insert AFTER INSERT ON business_sections
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('business_sections', 0, NEW.id);

CREATE TRIGGER business_sections_update AFTER UPDATE ON business_sections
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('business_sections', 1, NEW.id);

CREATE TRIGGER business_sections_delete AFTER DELETE ON business_sections
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('business_sections', 2, OLD.id);


DROP TRIGGER IF EXISTS business_sections_object_insert;

DELIMITER //
CREATE TRIGGER business_sections_object_insert BEFORE INSERT ON business_sections
FOR EACH ROW
BEGIN
    INSERT INTO objects(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END //

DELIMITER ;

-- business_sections_tr

DROP TRIGGER IF EXISTS business_sections_tr_insert;
DROP TRIGGER IF EXISTS business_sections_tr_update;
DROP TRIGGER IF EXISTS business_sections_tr_delete;

CREATE TRIGGER business_sections_tr_insert AFTER INSERT ON business_sections_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('business_sections_tr', 0, NEW.id);

CREATE TRIGGER business_sections_tr_update AFTER UPDATE ON business_sections_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('business_sections_tr', 1, NEW.id);

CREATE TRIGGER business_sections_tr_delete AFTER DELETE ON business_sections_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('business_sections_tr', 2, OLD.id);


-- persons

DROP TRIGGER IF EXISTS persons_insert;
DROP TRIGGER IF EXISTS persons_update;
DROP TRIGGER IF EXISTS persons_delete;

DELIMITER //
CREATE TRIGGER persons_insert AFTER INSERT ON persons
FOR EACH ROW
BEGIN
  INSERT INTO changes(entity, changetype, rowid) VALUES('persons', 0, NEW.id);
  INSERT INTO persons_auth(personId, pin) VALUES(NEW.id, LPAD(FLOOR(RAND() * 10000), 4, '0'));
END //
DELIMITER ;

CREATE TRIGGER persons_update AFTER UPDATE ON persons
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('persons', 1, NEW.id);

CREATE TRIGGER persons_delete AFTER DELETE ON persons
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('persons', 2, OLD.id);


DROP TRIGGER IF EXISTS persons_object_insert;

DELIMITER //
CREATE TRIGGER persons_object_insert BEFORE INSERT ON persons
FOR EACH ROW
BEGIN
    INSERT INTO objects(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END //

DELIMITER ;

-- persons_tr

DROP TRIGGER IF EXISTS persons_tr_insert;
DROP TRIGGER IF EXISTS persons_tr_update;
DROP TRIGGER IF EXISTS persons_tr_delete;

CREATE TRIGGER persons_tr_insert AFTER INSERT ON persons_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('persons_tr', 0, NEW.id);

CREATE TRIGGER persons_tr_update AFTER UPDATE ON persons_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('persons_tr', 1, NEW.id);

CREATE TRIGGER persons_tr_delete AFTER DELETE ON persons_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('persons_tr', 2, OLD.id);


-- meetings

DROP TRIGGER IF EXISTS meetings_insert;
DROP TRIGGER IF EXISTS meetings_update;
DROP TRIGGER IF EXISTS meetings_delete;

CREATE TRIGGER meetings_insert AFTER INSERT ON meetings
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('meetings', 0, NEW.id);

CREATE TRIGGER meetings_update AFTER UPDATE ON meetings
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('meetings', 1, NEW.id);

CREATE TRIGGER meetings_delete AFTER DELETE ON meetings
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('meetings', 2, OLD.id);


DROP TRIGGER IF EXISTS meetings_object_insert;

DELIMITER //
CREATE TRIGGER meetings_object_insert BEFORE INSERT ON meetings
FOR EACH ROW
BEGIN
    INSERT INTO objects(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END //

DELIMITER ;

-- media

DROP TRIGGER IF EXISTS media_insert;
DROP TRIGGER IF EXISTS media_update;
DROP TRIGGER IF EXISTS media_delete;

CREATE TRIGGER media_insert AFTER INSERT ON media
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('media', 0, NEW.id);

CREATE TRIGGER media_update AFTER UPDATE ON media
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('media', 1, NEW.id);

CREATE TRIGGER media_delete AFTER DELETE ON media
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('media', 2, OLD.id);


DROP TRIGGER IF EXISTS media_object_insert;

DELIMITER //
CREATE TRIGGER media_object_insert BEFORE INSERT ON media
FOR EACH ROW
BEGIN
    INSERT INTO objects(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END //

DELIMITER ;

-- media_tr

DROP TRIGGER IF EXISTS media_tr_insert;
DROP TRIGGER IF EXISTS media_tr_update;
DROP TRIGGER IF EXISTS media_tr_delete;

CREATE TRIGGER media_tr_insert AFTER INSERT ON media_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('media_tr', 0, NEW.id);

CREATE TRIGGER media_tr_update AFTER UPDATE ON media_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('media_tr', 1, NEW.id);

CREATE TRIGGER media_tr_delete AFTER DELETE ON media_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('media_tr', 2, OLD.id);


DROP TRIGGER IF EXISTS news_object_insert;

DELIMITER //
CREATE TRIGGER news_object_insert BEFORE INSERT ON news
FOR EACH ROW
BEGIN
    INSERT INTO objects(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END //

DELIMITER ;

-- groups_places

DROP TRIGGER IF EXISTS groups_places_insert;
DROP TRIGGER IF EXISTS groups_places_update;
DROP TRIGGER IF EXISTS groups_places_delete;

CREATE TRIGGER groups_places_insert AFTER INSERT ON groups_places
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('groups_places', 0, NEW.id);

CREATE TRIGGER groups_places_update AFTER UPDATE ON groups_places
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('groups_places', 1, NEW.id);

CREATE TRIGGER groups_places_delete AFTER DELETE ON groups_places
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('groups_places', 2, OLD.id);


DROP TRIGGER IF EXISTS groups_places_object_insert;

DELIMITER //
CREATE TRIGGER groups_places_object_insert BEFORE INSERT ON groups_places
FOR EACH ROW
BEGIN
    INSERT INTO objects(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END //

DELIMITER ;

-- events_places

DROP TRIGGER IF EXISTS events_places_insert;
DROP TRIGGER IF EXISTS events_places_update;
DROP TRIGGER IF EXISTS events_places_delete;

CREATE TRIGGER events_places_insert AFTER INSERT ON events_places
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('events_places', 0, NEW.id);

CREATE TRIGGER events_places_update AFTER UPDATE ON events_places
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('events_places', 1, NEW.id);

CREATE TRIGGER events_places_delete AFTER DELETE ON events_places
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('events_places', 2, OLD.id);


-- events_persons

DROP TRIGGER IF EXISTS events_persons_insert;
DROP TRIGGER IF EXISTS events_persons_update;
DROP TRIGGER IF EXISTS events_persons_delete;

CREATE TRIGGER events_persons_insert AFTER INSERT ON events_persons
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('events_persons', 0, NEW.id);

CREATE TRIGGER events_persons_update AFTER UPDATE ON events_persons
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('events_persons', 1, NEW.id);

CREATE TRIGGER events_persons_delete AFTER DELETE ON events_persons
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('events_persons', 2, OLD.id);


-- places_organizations

DROP TRIGGER IF EXISTS places_organizations_insert;
DROP TRIGGER IF EXISTS places_organizations_update;
DROP TRIGGER IF EXISTS places_organizations_delete;

CREATE TRIGGER places_organizations_insert AFTER INSERT ON places_organizations
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('places_organizations', 0, NEW.id);

CREATE TRIGGER places_organizations_update AFTER UPDATE ON places_organizations
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('places_organizations', 1, NEW.id);

CREATE TRIGGER places_organizations_delete AFTER DELETE ON places_organizations
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('places_organizations', 2, OLD.id);


-- events_organizations

DROP TRIGGER IF EXISTS events_organizations_insert;
DROP TRIGGER IF EXISTS events_organizations_update;
DROP TRIGGER IF EXISTS events_organizations_delete;

CREATE TRIGGER events_organizations_insert AFTER INSERT ON events_organizations
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('events_organizations', 0, NEW.id);

CREATE TRIGGER events_organizations_update AFTER UPDATE ON events_organizations
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('events_organizations', 1, NEW.id);

CREATE TRIGGER events_organizations_delete AFTER DELETE ON events_organizations
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('events_organizations', 2, OLD.id);


-- events_businesssections

DROP TRIGGER IF EXISTS events_businesssections_insert;
DROP TRIGGER IF EXISTS events_businesssections_update;
DROP TRIGGER IF EXISTS events_businesssections_delete;

CREATE TRIGGER events_businesssections_insert AFTER INSERT ON events_businesssections
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('events_businesssections', 0, NEW.id);

CREATE TRIGGER events_businesssections_update AFTER UPDATE ON events_businesssections
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('events_businesssections', 1, NEW.id);

CREATE TRIGGER events_businesssections_delete AFTER DELETE ON events_businesssections
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('events_businesssections', 2, OLD.id);


-- sections_places

DROP TRIGGER IF EXISTS sections_places_insert;
DROP TRIGGER IF EXISTS sections_places_update;
DROP TRIGGER IF EXISTS sections_places_delete;

CREATE TRIGGER sections_places_insert AFTER INSERT ON sections_places
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('sections_places', 0, NEW.id);

CREATE TRIGGER sections_places_update AFTER UPDATE ON sections_places
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('sections_places', 1, NEW.id);

CREATE TRIGGER sections_places_delete AFTER DELETE ON sections_places
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('sections_places', 2, OLD.id);


-- tags

DROP TRIGGER IF EXISTS tags_insert;
DROP TRIGGER IF EXISTS tags_update;
DROP TRIGGER IF EXISTS tags_delete;

CREATE TRIGGER tags_insert AFTER INSERT ON tags
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('tags', 0, NEW.id);

CREATE TRIGGER tags_update AFTER UPDATE ON tags
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('tags', 1, NEW.id);

CREATE TRIGGER tags_delete AFTER DELETE ON tags
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('tags', 2, OLD.id);


DROP TRIGGER IF EXISTS tags_object_insert;

DELIMITER //
CREATE TRIGGER tags_object_insert BEFORE INSERT ON tags
FOR EACH ROW
BEGIN
    INSERT INTO objects(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END //

DELIMITER ;

-- tags_objects

DROP TRIGGER IF EXISTS tags_objects_insert;
DROP TRIGGER IF EXISTS tags_objects_update;
DROP TRIGGER IF EXISTS tags_objects_delete;

CREATE TRIGGER tags_objects_insert AFTER INSERT ON tags_objects
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('tags_objects', 0, NEW.id);

CREATE TRIGGER tags_objects_update AFTER UPDATE ON tags_objects
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('tags_objects', 1, NEW.id);

CREATE TRIGGER tags_objects_delete AFTER DELETE ON tags_objects
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('tags_objects', 2, OLD.id);


DROP TRIGGER IF EXISTS tags_objects_object_insert;

DELIMITER //
CREATE TRIGGER tags_objects_object_insert BEFORE INSERT ON tags_objects
FOR EACH ROW
BEGIN
    INSERT INTO objects(createtime) VALUES(CURRENT_TIMESTAMP);
    SET NEW.id = LAST_INSERT_ID();
    SET @last_inserted_id = NEW.id;
END //

DELIMITER ;

-- objects_media

DROP TRIGGER IF EXISTS objects_media_insert;
DROP TRIGGER IF EXISTS objects_media_update;
DROP TRIGGER IF EXISTS objects_media_delete;

DELIMITER //
CREATE TRIGGER objects_media_insert AFTER INSERT ON objects_media
FOR EACH ROW
BEGIN
    IF (SELECT count(id) FROM news WHERE id=NEW.objectid LIMIT 1) = 0 THEN
        INSERT INTO changes(entity, changetype, rowid) VALUES('objects_media', 0, NEW.id);
    END IF;
END //

CREATE TRIGGER objects_media_update AFTER UPDATE ON objects_media
FOR EACH ROW
BEGIN
    IF (SELECT count(id) FROM news WHERE id=NEW.objectid LIMIT 1) = 0 THEN
        INSERT INTO changes(entity, changetype, rowid) VALUES('objects_media', 1, NEW.id);
    END IF;
END //

CREATE TRIGGER objects_media_delete BEFORE DELETE ON objects_media
FOR EACH ROW
BEGIN
    IF (SELECT count(id) FROM news WHERE id=OLD.id LIMIT 1) = 0 THEN
        INSERT INTO changes(entity, changetype, rowid) VALUES('objects_media', 2, OLD.id);
    END IF;
END //

DELIMITER ;

