DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190329022347');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190329022347');
-- Add your query below.

delete from npc_vendor where entry = 50041;
insert into npc_vendor (entry, item) values
(50041, 5565),
(50041, 16583),
(50041, 17019),
(50041, 17020),
(50041, 17021),
(50041, 17026),
(50041, 17028),
(50041, 17029),
(50041, 17030),
(50041, 17031),
(50041, 17032),
(50041, 17033),
(50041, 17034),
(50041, 17035),
(50041, 17036),
(50041, 17037),
(50041, 17038),
(50041, 21177);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
