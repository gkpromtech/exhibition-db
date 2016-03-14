-- новости

SET @mid = @media_firstid - 1;
SET @nid = @news_firstid - 1;
INSERT INTO objects_media (objectid, mediaid) VALUES
(@nid := @nid + 1, @mid := @mid + 1),
(@nid := @nid + 1, @mid := @mid + 1),
(@nid := @nid + 0, @mid := @mid + 1), -- 3 картинки на одну новость
(@nid := @nid + 0, @mid := @mid + 1), -- 2 новости на одну картинку
(@nid := @nid + 1, @mid := @mid + 0),
(@nid := @nid + 1, @mid := @mid + 1),
(@nid := @nid + 0, @mid := @mid + 1), -- 4 картинки на одну новость
(@nid := @nid + 0, @mid := @mid + 1),
(@nid := @nid + 0, @mid := @mid + 1),
(@nid := @nid + 1, @mid := @mid + 1),
(@nid := @nid + 1, @mid := @mid + 1);


-- события

SET @eid = @events_firstid - 1;
SET @mid = @media_firstid - 1;
INSERT INTO objects_media (objectid, mediaid) VALUES
(@eid + 1, 	@mid + 1),
(@eid + 1, 	@mid + 2),
(@eid + 1, 	@mid + 3),
(@eid + 1, 	@mid + 4),
(@eid + 2, 	@mid + 5),
(@eid + 2, 	@mid + 6),
(@eid + 2, 	@mid + 7),
(@eid + 2, 	@mid + 8),
(@eid + 3,  @mid + 9),
(@eid + 4,  @mid + 10),
(@eid + 5, 	@mid + 1),
(@eid + 5, 	@mid + 3),
(@eid + 5, 	@mid + 5),
(@eid + 5, 	@mid + 7),
(@eid + 6, 	@mid + 2),
(@eid + 6, 	@mid + 4),
(@eid + 6, 	@mid + 6),
(@eid + 6, 	@mid + 8),
(@eid + 7, 	@mid + 8),
(@eid + 7, 	@mid + 9),
(@eid + 8, 	@mid + 7),
(@eid + 8, 	@mid + 10),
(@eid + 9, 	@mid + 1),
(@eid + 10, @mid + 1),
(@eid + 12, @mid + 1),
(@eid + 13, @mid + 1),
(@eid + 14, @mid + 1),
(@eid + 15, @mid + 1),
(@eid + 16, @mid + 1),
(@eid + 17, @mid + 1),
(@eid + 18, @mid + 1),
(@eid + 19, @mid + 1),
(@eid + 20, @mid + 1),
(@eid + 21, @mid + 1),
(@eid + 22, @mid + 1),
(@eid + 23, @mid + 1);

