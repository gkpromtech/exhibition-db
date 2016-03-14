DROP TABLE IF EXISTS maps_points;
DROP TABLE IF EXISTS maps_tr;
DROP TABLE IF EXISTS maps;

CREATE TABLE maps (
  id int NOT NULL AUTO_INCREMENT,
  parentid int DEFAULT NULL,
  groupname varchar(255) DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (parentid) REFERENCES maps(id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE maps_tr (
  id int NOT NULL AUTO_INCREMENT,
  mapid INT NOT NULL,
  languageid INT NOT NULL,
  title varchar(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (mapid) REFERENCES maps(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE maps_points (
  id int NOT NULL AUTO_INCREMENT,
  mapid int NOT NULL,
  placename varchar(255) DEFAULT NULL,
  coords varchar(1024) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY mapid (mapid),
  CONSTRAINT maps_points_fk FOREIGN KEY (mapid) REFERENCES maps(id) ON DELETE CASCADE ON UPDATE CASCADE
);


ALTER TABLE places CHANGE COLUMN mapPointId mappointid INT DEFAULT NULL,
ADD INDEX places_map_fk_idx (mappointid ASC);

UPDATE places SET mappointid = NULL;

ALTER TABLE places ADD CONSTRAINT places_map_fk
  FOREIGN KEY (mappointid)
  REFERENCES maps_points(id)
  ON DELETE SET NULL
  ON UPDATE CASCADE;



-- changes tracking triggers

-- maps

DROP TRIGGER IF EXISTS maps_insert;
DROP TRIGGER IF EXISTS maps_update;
DROP TRIGGER IF EXISTS maps_delete;

CREATE TRIGGER maps_insert AFTER INSERT ON maps
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('maps', 0, NEW.id);

CREATE TRIGGER maps_update AFTER UPDATE ON maps
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('maps', 1, NEW.id);

CREATE TRIGGER maps_delete AFTER DELETE ON maps
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('maps', 2, OLD.id);


-- maps_tr

DROP TRIGGER IF EXISTS maps_tr_insert;
DROP TRIGGER IF EXISTS maps_tr_update;
DROP TRIGGER IF EXISTS maps_tr_delete;

CREATE TRIGGER maps_tr_insert AFTER INSERT ON maps_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('maps_tr', 0, NEW.id);

CREATE TRIGGER maps_tr_update AFTER UPDATE ON maps_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('maps_tr', 1, NEW.id);

CREATE TRIGGER maps_tr_delete AFTER DELETE ON maps_tr
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('maps_tr', 2, OLD.id);


-- maps_points

DROP TRIGGER IF EXISTS maps_points_insert;
DROP TRIGGER IF EXISTS maps_points_update;
DROP TRIGGER IF EXISTS maps_points_delete;

CREATE TRIGGER maps_points_insert AFTER INSERT ON maps_points
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('maps_points', 0, NEW.id);

CREATE TRIGGER maps_points_update AFTER UPDATE ON maps_points
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('maps_points', 1, NEW.id);

CREATE TRIGGER maps_points_delete AFTER DELETE ON maps_points
FOR EACH ROW INSERT INTO changes(entity, changetype, rowid) VALUES('maps_points', 2, OLD.id);


-- =============== data ===========================

INSERT INTO maps(parentId, groupName) VALUES(NULL, 'overview');
SET @maps_overview := last_insert_id();

INSERT INTO maps(parentId, groupName) VALUES(@maps_overview, 'kvc');
SET @maps_kvc := last_insert_id();

INSERT INTO maps(parentId, groupName) VALUES (@maps_overview, 'alabino');
SET @maps_alabino := last_insert_id();

INSERT INTO maps(parentId, groupName) VALUES (@maps_overview, 'kubinka');
SET @maps_kubinka := last_insert_id();

INSERT INTO maps(parentId, groupName) VALUES (@maps_overview, 'komsomolskoe');
SET @maps_komsomolskoe := last_insert_id();

INSERT INTO maps(parentId, groupName) VALUES (@maps_kvc, 'p_1_5');
SET @maps_p_1_5 := last_insert_id();

INSERT INTO maps(parentId, groupName) VALUES (@maps_kvc, 'p_6_10');
SET @maps_p_6_10 := last_insert_id();

INSERT INTO maps(parentId, groupName) VALUES (@maps_kvc, 'p_11_15');
SET @maps_p_11_15 := last_insert_id();

INSERT INTO maps(parentId, groupName) VALUES (@maps_kvc, 'p_16_20');
SET @maps_p_16_20 := last_insert_id();

INSERT INTO maps(parentId, groupName) VALUES (@maps_kvc, 'kz1');
SET @maps_kz1 := last_insert_id();

INSERT INTO maps(parentId, groupName) VALUES (@maps_kvc, 'kz2');
SET @maps_kz2 := last_insert_id();


-- maps tr

INSERT INTO maps_tr(mapid, languageid, title) VALUES
(@maps_overview, 0, 'Общая карта'),
(@maps_kvc, 0, 'Конгрессно-выставочный центр'),
(@maps_alabino, 0, 'Полигон Алабино'),
(@maps_kubinka, 0, 'Аэродром Кубинка'),
(@maps_komsomolskoe, 0, 'оз. Комсомольское'),
(@maps_p_1_5, 0, 'Залы 1-5'),
(@maps_p_6_10, 0, 'Залы 6-10'),
(@maps_p_11_15, 0, 'Павильоны 11-15'),
(@maps_p_16_20, 0, 'Павильоны 16-20'),
(@maps_kz1, 0, 'Конференц залы 1'),
(@maps_kz2, 0, 'Конференц залы 2');

INSERT INTO maps_tr(mapid, languageid, title) VALUES
(@maps_overview, 1, 'Overview'),
(@maps_kvc, 1, 'Exhibition and Convention Centre'),
(@maps_alabino, 1, 'Alabino'),
(@maps_kubinka, 1, 'Aerodrome Kubinka'),
(@maps_komsomolskoe, 1, 'Komsomolskoe lake'),
(@maps_p_1_5, 1, 'Halls 1-5'),
(@maps_p_6_10, 1, 'Halls 6-10'),
(@maps_p_11_15, 1, 'Pavilions 11-15'),
(@maps_p_16_20, 1, 'Pavilions 16-20'),
(@maps_kz1, 1, 'Conference halls 1'),
(@maps_kz2, 1, 'Conference halls 2');


-- regions



 -- alabino

SET @mapId = (SELECT id FROM maps WHERE groupName = 'alabino');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_p_alabino', '1085,342,1119,343,1119,377,1085,377');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_tankovaya_direktrisa', '555,404,660,552,725,539,611,384');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ognevoj_rubezh_i_trassa_tankovogo_biatlona', '1058,175,1262,110,1408,334,1402,345,1311,381,1288,384,1200,272,1169,227,1059,183');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_napravlenie_1_avtomat_vojskovoe_strelbitse_1', '876,335,954,302,1000,360,919,396');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_napravlenie_2_avtomat_vojskovoe_strelbitse_1', '619,380,741,334,799,423,873,392,910,444,721,523');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_napravlenie_3_snajperskoe_vojskovoe_strelbitse_1', '977,518,1025,498,1070,558,1020,578');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_napravlenie_4_snajperskoe_vojskovoe_strelbitse_1', '1044,492,1091,472,1136,531,1086,552');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_napravlenie_5_granatomet_pistolet_vojskovoe_strelbitse_1', '410,460,510,420,551,483,447,530');

 -- komsomolskoe

SET @mapId = (SELECT id FROM maps WHERE groupName = 'komsomolskoe');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_vododrom', '805,516,847,479,882,440,895,442,944,381,911,345,826,437,777,467');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_o_komsomolskoe', '641,480,689,480,689,440,638,440');

 -- kubinka

SET @mapId = (SELECT id FROM maps WHERE groupName = 'kubinka');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ae_kubinka', '397,531,482,459,479,451,765,210,817,270,461,565,452,563,420,585,409,586,399,562');

 -- kvc

SET @mapId = (SELECT id FROM maps WHERE groupName = 'kvc');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'p_6_10', '992,129,1019,119,1040,129,1061,119,1083,129,1105,119,1127,129,1148,119,1170,129,1191,119,1216,135,1212,260,980,260');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'p_11_15', '1321,133,1345,119,1369,129,1390,119,1413,129,1432,119,1456,129,1476,119,1501,129,1520,119,1544,135,1558,261,1325,262');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'p_16_20', '1598,134,1626,119,1648,129,1668,119,1691,129,1712,119,1734,129,1755,118,1777,129,1797,118,1822,134,1865,278,1623,278');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'p_1_5', '714,135,738,120,762,129,784,119,806,129,826,120,848,129,871,119,891,129,916,119,940,132,916,273,678,273');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_kvc', '1222,346,1323,346,1323,428,1221,428');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'parking_visitors', '0,208,148,183,133,397,0,419');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'parking_pass', '202,178,548,129,565,241,200,299');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'military_technics_sports', '1837,603,1912,100,2014,120,2229,163,2455,217,2600,258,2454,659,2085,659,1969,631');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'railway_patriot', '2383,134,2560,182,2560,245,2382,197');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'kz1', '962,285,1130,285,1127,360,953,360');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'kz2', '1416,285,1581,285,1588,360,1421,360');

 -- kz1

SET @mapId = (SELECT id FROM maps WHERE groupName = 'kz1');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'kz2', '820,0,1060,0,1060,479');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ch1', '184,207,275,208,258,271,160,271');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ch2', '326,156,435,157,429,211,314,212');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ch3', '301,266,424,266,416,341,283,341');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ch4', '473,208,566,208,570,271,469,271');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ch5', '603,156,711,157,724,211,608,212');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ch6', '614,266,737,266,754,340,621,341');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ch7', '766,208,858,208,882,271,785,271');

 -- kz2

SET @mapId = (SELECT id FROM maps WHERE groupName = 'kz2');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'kz1', '240,0,0,0,0,479');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ch8', '184,208,275,208,258,271,160,271');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ch9', '326,157,435,157,429,212,313,212');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ch10', '301,266,423,267,416,341,283,341');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ch11', '472,208,566,209,569,271,469,271');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ch12', '603,157,711,157,723,212,608,212');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ch13', '614,266,737,267,754,341,621,341');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ch14', '766,208,857,208,881,271,785,272');

 -- overview

SET @mapId = (SELECT id FROM maps WHERE groupName = 'overview');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'kvc', '988,229,1003,216,1005,197,997,184,990,175,983,168,970,157,952,148,952,139,971,137,1000,131,1036,129,1036,192,1058,204,1055,225,1050,241,1037,261,1021,276,1003,288,994,292,994,308,992,311,985,311,985,323,976,345,948,369,923,380,899,378,885,366,866,356,835,346,812,316,797,304,795,293,782,280,783,276,843,281,852,262,860,262,896,263,913,259,935,251,963,242');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'kubinka', '0,48,91,50,155,59,152,193,150,196,0,210');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'alabino', '1500,530,1591,493,1637,465,1659,460,1681,449,1696,447,1840,597,1714,661,1678,659,1665,667,1644,654,1616,639,1594,609,1496,640,1473,642,1416,580');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'komsomolskoe', '1501,472,1499,474,1504,482,1540,483,1546,477,1556,476,1561,470,1576,463,1585,463,1594,468,1598,466,1596,462,1604,460,1606,457,1611,457,1637,461,1659,461,1661,456,1669,448,1672,448,1673,446,1674,442,1678,442,1681,436,1690,432,1673,420,1641,447,1638,447,1617,440,1607,439,1592,435,1584,435,1578,431,1560,422,1557,416,1545,409,1542,413,1533,413,1528,408,1525,406,1521,407,1522,411,1519,413,1512,408,1507,409,1506,411,1513,419,1535,427,1551,427,1567,435,1565,444,1562,450,1555,458,1550,462,1546,463,1542,465,1536,466,1526,472');

 -- p_11_15

SET @mapId = (SELECT id FROM maps WHERE groupName = 'p_11_15');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_15c1', '969,195,984,195,1005,249,989,249');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_15b1', '918,306,1011,306,1025,347,928,347');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_15b4', '887,193,952,193,962,219,893,219');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_15b2', '950,262,994,262,1007,296,961,296');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_13b7', '617,140,684,140,686,157,616,157');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_15a1', '884,262,900,262,909,296,891,296');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_12a2', '436,283,454,283,450,305,432,305');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_11a3', '349,117,363,117,355,139,340,139');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_11b5', '350,190,402,190,398,207,344,207');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_12b4', '482,218,535,218,532,244,478,244');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_12b7', '500,124,548,124,545,146,496,146');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_14b7', '755,121,801,121,804,142,757,142');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_13b8', '627,121,675,121,675,134,627,134');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_13b1', '622,309,681,309,682,347,620,347');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_15b3', '897,227,965,227,974,253,903,253');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_15b5', '882,161,942,161,950,185,888,185');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_13b4', '625,221,678,221,678,240,624,240');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_14b4', '764,198,816,198,819,219,766,219');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_14b3', '768,227,821,227,827,259,772,259');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_14b2', '787,285,821,285,823,302,789,302');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_14b5', '760,171,810,171,814,190,763,190');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_11b2', '306,282,374,282,368,303,299,303');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_12b5', '488,190,539,190,537,211,484,211');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_12b3', '457,251,550,251,549,264,454,264');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_12b2', '469,283,526,283,524,304,465,304');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_11b8', '375,121,422,121,417,138,369,138');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_11b7', '363,143,421,143,416,159,356,159');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_11c3', '436,117,450,117,446,138,431,138');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_13c2', '691,184,706,184,710,240,693,240');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_14c2', '830,190,845,190,858,250,841,250');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_14c3', '814,117,828,117,833,141,819,141');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_14a2', '732,190,748,190,754,250,737,250');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_14a3', '725,117,739,117,742,141,727,141');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_12c3', '554,190,570,190,566,244,549,244');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_12c2', '543,283,561,283,558,306,540,306');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_12c4', '562,118,576,118,574,146,559,146');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_12a4', '474,118,488,118,482,146,468,146');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_11b6', '354,166,414,166,408,183,347,183');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_13b3', '624,248,689,248,690,265,623,265');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_13a3', '595,185,611,185,608,246,591,246');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_13a4', '599,118,613,118,613,136,598,136');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_13b6', '627,163,676,163,677,188,626,188');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_12b6', '490,152,549,152,546,183,485,183');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_14b6', '752,148,811,148,814,164,754,164');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_13b2', '651,285,707,285,708,300,650,300');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_15c2', '957,162,972,162,981,188,965,188');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_12b1', '464,313,523,313,519,348,458,348');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_12c1', '540,313,558,313,555,351,536,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_12a1', '429,313,447,313,439,351,420,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_11c1', '388,313,400,313,391,351,378,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_11b1', '301,314,370,314,362,343,291,343');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_11a1', '272,313,284,313,269,351,256,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_11b3', '313,249,390,249,383,272,305,272');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_11a2', '319,191,335,191,317,240,301,240');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_12a3', '457,190,472,190,462,244,445,244');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_11c2', '417,190,432,190,420,240,403,240');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_14b1', '763,318,856,318,861,343,765,343');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_14c1', '849,286,867,286,870,306,852,306');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_14a1', '742,286,759,286,761,306,744,306');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_santex', '1039,483,1093,483,1101,499,1045,499');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_afmservice', '408,484,463,484,460,505,403,505');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_niissu', '600,484,669,484,669,515,599,515');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_settech', '498,485,533,485,527,537,491,537');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_preccomplex', '201,484,332,484,318,536,182,536');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_mgtub', '239,392,302,392,287,436,222,436');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_13c3', '687,117,701,117,703,135,689,135');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_15b6', '851,117,954,117,962,139,938,138,944,153,885,153,881,139,857,139');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_11b4', '341,216,393,216,388,240,334,240');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_13b5', '626,196,677,196,677,213,625,213');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_13a2', '601,279,634,279,634,299,600,299');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_13a1', '587,313,605,313,603,351,585,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_13c1', '698,313,716,313,717,351,699,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_centrprog', '314,392,339,392,334,414,307,414');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_spectech', '352,392,377,392,369,427,343,427');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_kolchuga', '390,392,415,392,405,436,379,436');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_relero1', '428,392,554,392,551,436,418,436');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_reb', '567,392,605,392,603,445,563,445');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_velmashc', '617,392,655,392,655,436,615,436');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_mniti', '668,392,687,392,687,414,668,414');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_leron', '699,392,730,392,733,427,701,427');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_skizel', '743,392,807,392,814,436,747,436');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ronix', '820,392,865,392,878,460,831,460');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_umris', '877,392,920,392,929,423,883,423');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_eleron', '932,392,1058,392,1085,460,950,460');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_burevestnik', '336,520,477,520,471,564,324,564');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_kompas', '363,450,382,450,381,460,360,460');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_soran', '308,450,348,450,347,460,306,460');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_kostr', '218,445,298,445,293,460,213,460');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'p_16_20', '1083,105,1300,105,1300,538');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'p_6_10', '1,538,1,105,217,104');

 -- p_16_20

SET @mapId = (SELECT id FROM maps WHERE groupName = 'p_16_20');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_20b1', '880,119,926,119,935,143,886,143');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_20c3', '946,216,988,216,999,246,955,246');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_20c2', '947,255,997,255,1011,295,960,295');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_20c4', '935,185,975,185,984,207,942,206');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_20c5', '924,151,962,151,972,177,932,177');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_19b6', '746,174,826,174,829,190,748,190');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_19b7', '741,146,822,146,827,167,742,167');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_17b3', '469,226,548,226,543,265,461,265');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_17b5', '489,165,547,165,545,181,485,181');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_19b2', '788,286,856,286,860,306,790,306');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_19b4', '768,221,819,221,822,231,769,231');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_20a6', '852,117,866,117,872,143,857,143');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_17b4', '474,187,555,187,551,220,467,220');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_17b6', '493,143,550,143,548,159,490,159');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_16a5', '349,117,360,117,362,112,366,109,372,109,375,111,377,115,383,114,387,117,451,117,445,146,338,146');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_16a4', '330,163,355,163,342,201,315,201');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_16b6', '372,156,431,156,427,171,368,171');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_16b3', '347,231,378,231,374,250,341,250');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_16b1', '307,299,375,299,362,343,291,343');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_16b2', '299,258,370,259,360,289,287,289');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_16a1', '270,317,282,317,269,351,257,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_16c1', '389,310,401,310,390,351,378,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_16c3', '406,190,431,190,425,222,398,222');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_18c2', '668,242,700,242,703,303,668,303');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_18c3', '692,187,707,187,710,234,694,234');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_18a3', '596,186,611,186,609,234,593,234');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_18b3', '626,207,678,207,678,238,625,237');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_18b4', '626,185,677,185,677,199,626,199');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_18b5', '623,143,680,143,681,177,622,176');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_18b1', '622,313,681,313,682,339,621,339');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_19b1', '780,317,838,317,844,347,784,347');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_19a2', '738,230,753,230,757,262,741,262');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_19c3', '831,198,847,198,852,221,835,221');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_19b3', '771,239,825,239,830,262,774,262');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_19b5', '765,198,816,198,818,213,766,213');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_19a1', '745,317,763,317,768,351,749,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_18c1', '698,313,716,313,718,351,700,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_17b7', '501,121,548,121,545,137,498,137');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_17a2', '475,117,489,117,484,136,470,136');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_17c2', '563,117,577,117,575,136,560,136');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_18b6', '628,124,675,124,675,137,627,137');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_18a4', '600,117,614,117,613,137,598,137');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_18c4', '689,117,703,117,704,137,690,137');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_19b8', '743,121,813,121,816,139,745,139');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_19c1', '856,318,874,318,883,351,865,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_17a1', '430,317,447,317,440,351,422,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_17c1', '540,316,557,316,554,351,536,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_18a1', '587,313,605,313,603,351,584,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_17b1', '464,317,521,317,518,343,459,343');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_17b2', '447,285,549,285,547,306,443,306');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_16a3', '314,206,339,206,333,224,306,224');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_16a2', '304,231,329,231,324,249,297,249');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_16b4', '356,205,386,205,383,222,350,222');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_16b5', '364,179,395,179,391,196,358,196');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_16c2', '396,230,421,231,417,249,391,249');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_18a2', '596,243,624,243,623,275,594,275');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_18b2', '595,286,651,286,651,303,594,303');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_19a3', '735,198,749,198,752,222,736,221');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_19c2', '839,231,854,231,861,262,844,262');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_20c6', '940,117,954,117,964,143,950,143');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_20a5', '871,151,909,151,918,177,877,177');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_20a4', '880,185,920,185,927,207,884,207');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_20a3', '888,215,929,215,939,246,896,246');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_20a2', '905,279,939,279,944,300,910,300');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_20c1', '970,306,1016,306,1030,343,982,344');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_20a1', '913,309,954,309,964,343,921,343');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_murom', '234,392,361,392,342,459,207,459');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_tulh', '373,392,424,392,416,432,363,431');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_garnizon', '437,392,469,392,463,428,430,427');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_europrom', '479,392,542,392,536,460,468,460');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_vector', '556,392,581,392,580,406,555,405');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ez', '594,392,619,392,618,418,593,418');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_promet', '631,392,657,392,657,410,631,409');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_elektroagregat', '669,392,733,392,734,414,669,413');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_forman', '746,392,809,392,818,460,751,459');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_kaliningrad', '671,445,738,445,739,460,671,460');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_mpkstal', '197,484,239,484,227,520,184,520');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_garnizon1', '341,484,581,484,579,516,332,516');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_zaschita', '739,484,842,484,848,525,742,525');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'p_11_15', '217,103,0,103,0,537');

 -- p_1_5

SET @mapId = (SELECT id FROM maps WHERE groupName = 'p_1_5');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_1a2', '348,117,390,117,379,150,335,150');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_1c2', '409,117,451,117,442,150,399,150');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_2a3', '474,117,516,117,510,150,467,150');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_2c3', '535,117,577,117,574,150,530,150');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_3a6', '599,118,641,118,640,151,597,151');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_3c7', '660,117,702,117,704,151,661,151');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_4a7', '726,118,828,118,834,151,729,151');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_5a4', '851,116,888,116,892,126,852,126');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_5c3', '915,117,954,117,964,144,924,144');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_1b5', '349,158,423,158,416,186,338,186');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_1b2', '308,258,381,258,369,296,294,297');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_1a1', '307,221,325,221,313,252,294,252');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_2b4', '479,158,557,158,551,213,467,213');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_3c6', '646,158,690,158,691,180,646,180');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_4a6', '739,158,774,158,776,171,740,171');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_4a5', '735,179,776,179,779,196,737,196');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_2b3', '465,221,550,221,545,262,457,262');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_2a2', '442,271,475,271,467,314,432,314');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_2c2', '543,283,560,283,557,317,539,317');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_2b1', '461,328,520,328,518,344,457,344');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_2c1', '538,327,557,327,555,352,535,352');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_2a1', '426,324,444,324,439,352,420,352');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_1b1', '292,306,385,306,376,344,278,344');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_3b2', '625,235,666,235,667,249,624,249');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_3b3', '625,184,666,184,667,224,625,224');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_3a4', '594,184,611,184,609,225,592,225');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_3c5', '681,184,707,184,708,199,681,199');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_3a2', '606,258,650,258,650,276,606,276');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_3b1', '626,295,666,295,667,342,625,342');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_4a4', '734,202,779,201,788,260,738,259');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_4a3', '744,268,778,268,780,283,745,283');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_4a2', '752,289,791,289,796,307,755,307');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_4b1', '779,317,838,317,842,340,782,340');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_4c1', '855,317,874,317,882,352,862,352');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_4a1', '743,317,762,317,766,351,746,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_4c2', '820,285,818,268,856,268,865,307,811,307,809,285');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_4c5', '788,158,837,158,840,174,789,174');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_5a2', '864,166,913,166,932,226,876,226');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_5c2', '922,150,962,150,990,228,948,228');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_5b2', '898,236,983,236,990,254,902,254');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_5b1', '918,306,1010,306,1025,347,928,347');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_5a3', '868,131,896,131,906,159,875,159');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_5c1', '943,263,999,263,1011,296,954,296');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_tz1', '235,392,525,392,517,460,208,460');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_tz3', '156,593,502,593,489,695,115,696');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_morinsis', '535,391,617,391,618,436,531,436');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_almaz1', '840,392,1067,392,1084,437,848,437');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_tz2', '200,484,513,484,504,564,168,564');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_kret', '515,592,606,592,603,654,509,654');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_almaz2', '677,483,1103,483,1125,543,678,543');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_kvega', '656,392,732,392,739,460,657,460');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_tetis', '764,392,827,392,834,436,768,436');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_fp', '530,444,578,444,578,460,530,460');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_kkp', '528,482,577,482,570,547,520,547');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_1c1', '407,221,425,221,418,252,399,252');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_1b3', '339,221,393,221,384,252,329,252');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_1b4', '334,193,415,193,410,213,326,213');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_2b2', '487,272,521,272,515,317,480,317');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_3a5', '631,158,631,180,605,180,606,158');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_3a3', '591,234,608,234,607,250,590,250');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_3c4', '683,207,709,207,709,225,683,225');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_3c3', '683,234,710,234,710,250,684,250');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_3c2', '683,258,711,258,712,275,684,275');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_3a1', '588,285,605,285,603,351,585,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_3c1', '713,285,718,351,687,351,685,285');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_4c4', '792,178,841,178,844,194,793,194');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_4c3', '796,201,846,201,859,260,804,259');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_u4', '596,444,643,444,643,461,595,461');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_u2', '620,594,658,594,659,625,620,625');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_u1', '675,594,772,594,775,625,674,625');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'p_6_10', '1083,105,1300,105,1300,538');

 -- p_6_10

SET @mapId = (SELECT id FROM maps WHERE groupName = 'p_6_10');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_7b2', '464,232,549,232,546,265,457,265');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_7b3', '478,166,557,166,556,181,515,181,515,184,475,184');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_6b2', '308,262,358,262,354,279,302,279');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_6b3', '324,221,408,221,399,253,312,253');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_6b5', '347,158,426,158,419,183,337,183');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_6a1', '348,117,390,117,378,152,334,152');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_6c1', '408,117,450,117,442,152,398,152');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_8c2', '695,290,713,290,713,311,696,311');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_7a1', '428,320,469,320,464,352,420,352,428,319');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_7c1', '516,321,557,321,555,351,510,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_8c4', '683,117,702,117,703,136,684,136');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_8b6', '636,124,665,124,666,136,636,136');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_10b4', '880,121,927,121,934,140,886,140');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_8a4', '599,117,619,117,618,136,598,136');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_10a5', '852,117,865,117,870,140,855,140');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_10c5', '940,116,954,116,961,139,947,139');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_9b5', '755,121,801,121,804,139,756,139');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_9a5', '726,117,740,117,742,139,728,139');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_8b2', '611,290,679,290,680,312,611,312');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_10b1', '919,276,999,276,1011,306,928,306');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_10c1', '979,317,1032,317,1046,352,991,352');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_10a1', '902,317,950,317,961,352,910,352');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_8a3', '606,167,645,167,645,193,605,193');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_8c3', '661,166,690,166,691,194,661,194');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_8a2', '589,256,604,256,603,282,587,282');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_8a1', '585,317,604,317,603,351,584,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_8c1', '686,320,715,320,717,351,687,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_8b1', '621,324,668,324,668,343,621,343');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_10b3', '906,207,957,207,964,225,911,225');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_9a1', '746,328,763,328,766,351,748,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_7b1', '463,288,532,288,529,310,458,310');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_7b4', '493,143,550,143,548,159,489,159');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_8b5', '627,143,679,143,680,159,626,159');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_10a3', '879,166,909,166,919,199,887,199');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_10c3', '928,166,958,166,970,199,939,199');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_9b2', '759,285,849,285,856,317,763,317');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_9b1', '787,328,834,328,837,344,789,344');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_9b3', '740,168,825,168,828,186,742,186');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_9c4', '815,117,829,117,833,139,819,139');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_9b4', '752,146,811,146,813,161,754,161');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_10b2', '908,233,983,233,995,266,917,266');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_9c3', '800,199,832,199,839,234,806,234');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_10a2', '874,207,890,207,895,225,879,225');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_10c2', '973,207,989,207,996,225,980,225');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_6b1', '299,288,389,288,374,344,278,344');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_7c3', '562,117,576,117,574,139,560,139');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_7b5', '501,121,548,121,546,139,498,139');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_7a3', '474,117,488,117,484,138,469,138');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_mzkt', '613,392,700,392,704,459,610,459');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_rm1', '234,392,423,392,409,459,206,459');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_rm2', '199,484,281,484,255,565,166,565');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_prima', '523,392,548,392,544,426,518,426');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_intrall', '858,392,985,392,996,428,865,428');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_gaz', '898,484,1001,483,1023,554,912,554');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_sopot', '419,484,597,484,596,499,415,499');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_kaz', '1014,483,1103,483,1131,553,1036,553');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_kuper', '712,392,839,392,848,445,716,445');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_prostor', '560,392,591,392,588,445,555,445');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_ms', '435,392,511,392,504,445,424,445');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_sv', '513,445,546,445,544,459,511,459');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_kamaz', '412,510,799,510,804,564,401,565');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_8b3', '651,255,705,255,706,282,651,282');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_9a4', '743,193,784,193,787,213,745,213');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_6b4', '335,190,417,190,409,217,324,217');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_7a2', '473,189,509,189,503,223,465,223');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_7c2', '523,189,554,189,550,224,518,223');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_8b4', '609,201,692,201,694,246,608,246');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_9a3', '751,220,783,220,785,231,752,231');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_9a2', '745,237,794,237,797,262,748,262');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_9c1', '859,328,877,328,879,351,861,351');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_9c2', '808,243,841,243,848,276,814,276');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_10a4', '873,146,912,146,916,158,875,158');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_10c4', '927,146,954,146,958,158,930,158');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_asteis', '867,436,998,436,1006,460,871,460');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_spectech', '998,391,1048,391,1055,409,1003,409');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_rustek', '1015,427,1080,427,1093,460,1026,460');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_okb_tech', '295,484,405,484,387,565,270,565');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_zstart', '609,484,692,484,692,499,609,499');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_aerocon', '747,484,795,484,797,499,749,499');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_modul', '809,484,851,484,857,520,815,520');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_npotransport', '814,531,894,531,900,564,818,564');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_npotransport2', '867,509,895,509,897,520,868,520');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 's_zalaaero', '158,587,345,587,337,618,146,618');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'p_11_15', '1082,104,1299,104,1299,537');
INSERT INTO maps_points(mapid, placename, coords) VALUES(@mapId, 'p_1_5', '217,104,0,104,0,537');


-- update places

UPDATE places p
LEFT JOIN maps_points mp ON mp.placename = replace(p.schemaid, substring(p.schemaid, instr(p.schemaid, '-')), '')
SET p.mappointid = mp.id;

