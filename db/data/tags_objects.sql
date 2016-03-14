SET @tid = @tags_firstid - 1;
SET @nid = @news_firstid - 1;
SET @eid = @events_firstid - 1;

INSERT INTO tags_objects (tagid, objectid) VALUES
(@tid := @tid + 1, @nid := @nid + 1),
(@tid := @tid + 0, @nid := @nid + 1),
(@tid := @tid + 0, @nid := @nid + 1),
(@tid := @tid + 0, @nid := @nid + 1),
(@tid := @tid + 0, @nid := @nid + 1),
(@tid := @tid + 0, @nid := @nid + 1),

(@tid := @tid + 1, @eid := @eid + 1),
(@tid := @tid + 0, @eid := @eid + 1),
(@tid := @tid + 0, @eid := @eid + 1),
(@tid := @tid + 0, @eid := @eid + 1);
