-- groups
INSERT INTO groups (sortorder, position) VALUES
(22, 'alabino');
SET @groups_firstid := @last_inserted_id;
INSERT INTO groups (sortorder, position) VALUES
(23, 'kvc'),
(24, 'kulibinka'),
(25, 'komsomolskoe');

INSERT INTO groups_tr (groupid, languageid, name) VALUES
(@groups_firstid + 0, 0, 'п.Алабино'),
(@groups_firstid + 0, 1, 'Alabino'),
(@groups_firstid + 1, 0, 'аэ.Кулибинка'),
(@groups_firstid + 1, 1, 'Kulibinka'),
(@groups_firstid + 2, 0, 'о.Комсомольское'),
(@groups_firstid + 2, 1, 'Komsomolskoe');

-- places
INSERT INTO places (groupid) VALUES (@groups_firstid);
SET @places_firstid := @last_inserted_id;
INSERT INTO places (groupid) VALUES
(@groups_firstid + 1),
(@groups_firstid + 2);

INSERT INTO places_tr (placeid, languageid, name) VALUES
(@places_firstid + 0, 0, 'п.Алабино'),
(@places_firstid + 0, 1, 'Alabino'),
(@places_firstid + 1, 0, 'аэ.Кулибинка'),
(@places_firstid + 1, 1, 'Kulibinka'),
(@places_firstid + 2, 0, 'о.Комсомольское'),
(@places_firstid + 2, 1, 'Komsomolskoe lake');

-- events-places
UPDATE events_places SET placeid = @places_firstid + 0 WHERE eventid = 757;
UPDATE events_places SET placeid = @places_firstid + 0 WHERE eventid = 758;
UPDATE events_places SET placeid = @places_firstid + 0 WHERE eventid = 759;
UPDATE events_places SET placeid = @places_firstid + 0 WHERE eventid = 760;
UPDATE events_places SET placeid = @places_firstid + 0 WHERE eventid = 761;
UPDATE events_places SET placeid = @places_firstid + 1 WHERE eventid = 762;
UPDATE events_places SET placeid = @places_firstid + 0 WHERE eventid = 763;
UPDATE events_places SET placeid = @places_firstid + 0 WHERE eventid = 764;
UPDATE events_places SET placeid = @places_firstid + 0 WHERE eventid = 765;
UPDATE events_places SET placeid = @places_firstid + 0 WHERE eventid = 766;
UPDATE events_places SET placeid = @places_firstid + 0 WHERE eventid = 767;
UPDATE events_places SET placeid = @places_firstid + 2 WHERE eventid = 768;
UPDATE events_places SET placeid = @places_firstid + 0 WHERE eventid = 769;
UPDATE events_places SET placeid = @places_firstid + 0 WHERE eventid = 771;
UPDATE events_places SET placeid = @places_firstid + 0 WHERE eventid = 772;
UPDATE events_places SET placeid = @places_firstid + 0 WHERE eventid = 773;
UPDATE events_places SET placeid = @places_firstid + 0 WHERE eventid = 774;
UPDATE events_places SET placeid = @places_firstid + 0 WHERE eventid = 776;
UPDATE events_places SET placeid = @places_firstid + 0 WHERE eventid = 777;

