INSERT INTO groups (sortorder, position) VALUES
(1, 'p_1_5');
SET @groups_firstid := @last_inserted_id;
INSERT INTO groups (sortorder, position) VALUES
(2, 'p_1_5'),
(3, 'p_1_5'),
(4, 'p_1_5'),
(5, 'p_1_5'),
(6, 'p_6_10'),
(7, 'p_6_10'),
(8, 'p_6_10'),
(9, 'p_6_10'),
(10, 'p_6_10'),
(11, 'p_11_15'),
(12, 'p_11_15'),
(13, 'p_11_15'),
(14, 'p_11_15'),
(15, 'p_11_15'),
(16, 'p_16_20'),
(17, 'p_16_20'),
(18, 'p_16_20'),
(19, 'p_16_20'),
(20, 'p_16_20'),
(21, 'air');

SET @groups_lastid := @last_inserted_id;

SET @id = @groups_firstid - 1;
INSERT INTO groups_tr (groupid, languageid, name) VALUES
(@id := @id + 1, 0, 'Павильон 1'),
(@id := @id + 1, 0, 'Павильон 2'),
(@id := @id + 1, 0, 'Павильон 3'),
(@id := @id + 1, 0, 'Павильон 4'),
(@id := @id + 1, 0, 'Павильон 5'),
(@id := @id + 1, 0, 'Павильон 6'),
(@id := @id + 1, 0, 'Павильон 7'),
(@id := @id + 1, 0, 'Павильон 8'),
(@id := @id + 1, 0, 'Павильон 9'),
(@id := @id + 1, 0, 'Павильон 10'),
(@id := @id + 1, 0, 'Павильон 11'),
(@id := @id + 1, 0, 'Павильон 12'),
(@id := @id + 1, 0, 'Павильон 13'),
(@id := @id + 1, 0, 'Павильон 14'),
(@id := @id + 1, 0, 'Павильон 15'),
(@id := @id + 1, 0, 'Павильон 16'),
(@id := @id + 1, 0, 'Павильон 17'),
(@id := @id + 1, 0, 'Павильон 18'),
(@id := @id + 1, 0, 'Павильон 19'),
(@id := @id + 1, 0, 'Павильон 20'),
(@id := @id + 1, 0, 'Открытая экспозиция');

SET @id := @groups_firstid - 1;
INSERT INTO groups_tr (groupid, languageid, name) VALUES
(@id := @id + 1, 1, 'Pavilion 1'),
(@id := @id + 1, 1, 'Pavilion 2'),
(@id := @id + 1, 1, 'Pavilion 3'),
(@id := @id + 1, 1, 'Pavilion 4'),
(@id := @id + 1, 1, 'Pavilion 5'),
(@id := @id + 1, 1, 'Pavilion 6'),
(@id := @id + 1, 1, 'Pavilion 7'),
(@id := @id + 1, 1, 'Pavilion 8'),
(@id := @id + 1, 1, 'Pavilion 9'),
(@id := @id + 1, 1, 'Pavilion 10'),
(@id := @id + 1, 1, 'Pavilion 11'),
(@id := @id + 1, 1, 'Pavilion 12'),
(@id := @id + 1, 1, 'Pavilion 13'),
(@id := @id + 1, 1, 'Pavilion 14'),
(@id := @id + 1, 1, 'Pavilion 15'),
(@id := @id + 1, 1, 'Pavilion 16'),
(@id := @id + 1, 1, 'Pavilion 17'),
(@id := @id + 1, 1, 'Pavilion 18'),
(@id := @id + 1, 1, 'Pavilion 19'),
(@id := @id + 1, 1, 'Pavilion 20'),
(@id := @id + 1, 1, 'Open air');
