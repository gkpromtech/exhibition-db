
SET @eid = @events_firstid - 1;
SET @pid = @places_firstid - 1;

INSERT INTO events_places (eventid, placeid) VALUES
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1),
(@eid := @eid + 1, @pid := @pid + 1);
