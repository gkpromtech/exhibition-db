SET @mkv_orgid = @org_firstid + 1;

INSERT INTO media (type, organizationid) VALUES
('1', @mkv_orgid);
SET @media_firstid := @last_inserted_id;
INSERT INTO media (type, organizationid) VALUES
('0', @mkv_orgid),
('0', @mkv_orgid),
('1', @mkv_orgid),
('0', @mkv_orgid),
('0', @mkv_orgid),
('0', @mkv_orgid),
('0', @mkv_orgid),
('0', @mkv_orgid),
('0', @mkv_orgid);


SET @id = @media_firstid - 1;
INSERT INTO media_tr (mediaid, languageid, name, url, preview) VALUES
(@id := @id + 1, 0, 'Церемония заложения первого камня', 'http://player.rutv.ru/iframe/video/id/807973/acc_video_id/603618/isPlay/false/time_play/1/', 'http://park-patriot.ru/wp-content/uploads/2014/06/min3.jpg'),
(@id := @id + 1, 0, 'Церемония заложения первого камня', 'http://park-patriot.ru/wp-content/uploads/2014/06/%D1%84%D0%BE%D1%82%D0%BE-2.jpg', 'http://park-patriot.ru/wp-content/uploads/2014/06/%D1%84%D0%BE%D1%82%D0%BE-2-300x224.jpg'),
(@id := @id + 1, 0, 'Церемония заложения первого камня', 'http://cp616650.cpanel.tech-logol.ru/wp-content/uploads/2014/06/kamen.jpg', 'http://cp616650.cpanel.tech-logol.ru/wp-content/uploads/2014/06/kamen-300x224.jpg'),
(@id := @id + 1, 0, 'Церемония заложения первого камня', 'http://www.youtube.com/watch?v=zZcIIgrsE2Q', 'http://park-patriot.ru/wp-content/uploads/2014/06/min2.jpg'),
(@id := @id + 1, 0, 'Первая информация по планированию Парка Патриот', 'http://park-patriot.ru/wp-content/uploads/2014/07/4261685181d660564b3ad1abe459a07a.jpg', 'http://park-patriot.ru/wp-content/uploads/2014/07/4261685181d660564b3ad1abe459a07a.jpg'),
(@id := @id + 1, 0, 'Первая информация по планированию Парка Патриот', 'http://park-patriot.ru/wp-content/uploads/2014/07/dd1f720a06a8fefc478594f2a824fff2.jpg', 'http://park-patriot.ru/wp-content/uploads/2014/07/dd1f720a06a8fefc478594f2a824fff2.jpg'),
(@id := @id + 1, 0, 'Первая информация по планированию Парка Патриот', 'http://park-patriot.ru/wp-content/uploads/2014/07/038a5c2d5af74daa2fc391e9465c1c07.jpg', 'http://park-patriot.ru/wp-content/uploads/2014/07/038a5c2d5af74daa2fc391e9465c1c07.jpg'),
(@id := @id + 1, 0, 'Первая информация по планированию Парка Патриот', 'http://park-patriot.ru/wp-content/uploads/2014/07/32a670b2cc22ffdc2774d0a472be567f.jpg', 'http://park-patriot.ru/wp-content/uploads/2014/07/32a670b2cc22ffdc2774d0a472be567f.jpg'),
(@id := @id + 1, 0, '«Армия-2015» пройдет в парке «Патриот» (Кубинка)', 'http://park-patriot.ru/wp-content/uploads/2014/11/armi2015.jpg', 'http://park-patriot.ru/wp-content/uploads/2014/11/ar.jpg'),
(@id := @id + 1, 0, 'На форуме «Армия-2015» состоится масштабное авиашоу', 'http://park-patriot.ru/wp-content/uploads/2015/02/3954930-1.jpg', 'http://park-patriot.ru/wp-content/uploads/2015/02/mini.jpg');

SET @id = @media_firstid - 1;
INSERT INTO media_tr (mediaid, languageid, name, url, preview) VALUES
(@id := @id + 1, 1, 'The ceremony of laying the first stone', 'http://player.rutv.ru/iframe/video/id/807973/acc_video_id/603618/isPlay/false/time_play/1/', 'http://park-patriot.ru/wp-content/uploads/2014/06/min3.jpg'),
(@id := @id + 1, 1, 'The ceremony of laying the first stone', 'http://park-patriot.ru/wp-content/uploads/2014/06/%D1%84%D0%BE%D1%82%D0%BE-2.jpg', 'http://park-patriot.ru/wp-content/uploads/2014/06/%D1%84%D0%BE%D1%82%D0%BE-2-300x224.jpg'),
(@id := @id + 1, 1, 'The ceremony of laying the first stone', 'http://cp616650.cpanel.tech-logol.ru/wp-content/uploads/2014/06/kamen.jpg', 'http://cp616650.cpanel.tech-logol.ru/wp-content/uploads/2014/06/kamen-300x224.jpg'),
(@id := @id + 1, 1, 'The ceremony of laying the first stone', 'http://www.youtube.com/watch?v=zZcIIgrsE2Q', 'http://park-patriot.ru/wp-content/uploads/2014/06/min2.jpg'),
(@id := @id + 1, 1, 'The first information on planning Patriot Park', 'http://park-patriot.ru/wp-content/uploads/2014/07/4261685181d660564b3ad1abe459a07a.jpg', 'http://park-patriot.ru/wp-content/uploads/2014/07/4261685181d660564b3ad1abe459a07a.jpg'),
(@id := @id + 1, 1, 'The first information on planning Patriot Park', 'http://park-patriot.ru/wp-content/uploads/2014/07/dd1f720a06a8fefc478594f2a824fff2.jpg', 'http://park-patriot.ru/wp-content/uploads/2014/07/dd1f720a06a8fefc478594f2a824fff2.jpg'),
(@id := @id + 1, 1, 'The first information on planning Patriot Park', 'http://park-patriot.ru/wp-content/uploads/2014/07/038a5c2d5af74daa2fc391e9465c1c07.jpg', 'http://park-patriot.ru/wp-content/uploads/2014/07/038a5c2d5af74daa2fc391e9465c1c07.jpg'),
(@id := @id + 1, 1, 'The first information on planning Patriot Park', 'http://park-patriot.ru/wp-content/uploads/2014/07/32a670b2cc22ffdc2774d0a472be567f.jpg', 'http://park-patriot.ru/wp-content/uploads/2014/07/32a670b2cc22ffdc2774d0a472be567f.jpg'),
(@id := @id + 1, 1, '"Army-2015" will be held in the park "Patriot" (Kubinka)', 'http://park-patriot.ru/wp-content/uploads/2014/11/armi2015.jpg', 'http://park-patriot.ru/wp-content/uploads/2014/11/ar.jpg'),
(@id := @id + 1, 1, 'The forum "Army-2015" held a large-scale air show', 'http://park-patriot.ru/wp-content/uploads/2015/02/3954930-1.jpg', 'http://park-patriot.ru/wp-content/uploads/2015/02/mini.jpg');
