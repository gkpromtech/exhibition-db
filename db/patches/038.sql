
SET @mapId = (SELECT id FROM maps WHERE groupName = 'kvc');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'pressroom', '1336,425,1394,425,1396,506,1338,506');

UPDATE places p
JOIN places_tr pt ON pt.placeid = p.id
SET p.schemaid = concat('kz_ch', substring(pt.name, 17))
WHERE pt.name LIKE 'Conference Hall %';

UPDATE places p
JOIN places_tr pt ON pt.placeid = p.id
SET p.schemaid = 'pressroom'
WHERE pt.name = 'Pressroom';

UPDATE places p
LEFT JOIN maps_points mp ON mp.placename = replace(p.schemaid, substring(p.schemaid, instr(p.schemaid, '-')), '')
SET p.mappointid = mp.id;

