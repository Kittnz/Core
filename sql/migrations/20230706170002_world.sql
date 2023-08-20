DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230706170002');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230706170002');
-- Add your query below.

SET @OGUID = 39820;
SET @PTEMPLATE = 2082;

-- 40 Westfall / 3662 / 3705 / Food Crate / Barrel of Milk
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (42679, 42682, 42683, 42686, 42687, 42713, 42714, 42715, 42716, 42717, 42733, 42735, 42737, 42750));
DELETE FROM `gameobject` WHERE `guid` IN (42679, 42682, 42683, 42686, 42687, 42713, 42714, 42715, 42716, 42717, 42733, 42735, 42737, 42750);
DELETE FROM `pool_gameobject` WHERE `guid` IN (42679, 42682, 42683, 42686, 42687, 42713, 42714, 42715, 42716, 42717, 42733, 42735, 42737, 42750);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3662, 0, -11457, 1521.76, 50.9323, 1.46608, 0, 0, 0.669131, 0.743145, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3662, 0, -11309.9, 1714.72, 37.5294, -2.6529, 0, 0, 0.970296, -0.241922, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3662, 0, -11115.7, 564.248, 32.7555, 1.58825, 0, 0, 0.71325, 0.700909, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3662, 0, -11006.8, 2041.88, 10.6006, -2.86234, 0, 0, 0.990268, -0.139173, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3662, 0, -10994.1, 2096.65, 0.014037, -1.6057, 0, 0, 0.71934, -0.694658, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3662, 0, -10990.8, 1473.42, 43.2017, -0.785398, 0, 0, 0.382683, -0.92388, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3662, 0, -10883.2, 1981.65, 38.6544, -1.15192, 0, 0, 0.544639, -0.838671, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3662, 0, -10815.4, 1327.02, 34.0955, 1.25664, 0, 0, 0.587785, 0.809017, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 3662, 0, -10658.4, 993.572, 32.8741, 1.0472, 0, 0, 0.5, 0.866025, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 3662, 0, -10558.6, 1964.51, 35.0131, -2.42601, 0, 0, 0.936672, -0.350207, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 3662, 0, -10178.1, 2022.71, 5.62225, -2.96706, 0, 0, 0.996195, -0.087156, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 3662, 0, -10062.7, 1689.69, 34.9306, -2.23402, 0, 0, 0.898794, -0.438371, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 3662, 0, -9741.55, 1185.91, 41.191, 0.226893, 0, 0, 0.113203, 0.993572, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 3662, 0, -9633.56, 1594.26, 0.009919, -0.122173, 0, 0, 0.061049, -0.998135, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 3662, 0, -11507.4, 1750.15, 2.05305, 4.18879, 0, 0, -0.866025, 0.500001, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 3662, 0, -11422, 1812.74, -0.088864, 4.7822, 0, 0, -0.681998, 0.731354, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 3662, 0, -11389.2, 1981.19, 1.27075, 1.62316, 0, 0, 0.725374, 0.688355, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 3662, 0, -11234.2, 2013.1, 0.033822, 6.03884, 0, 0, -0.121869, 0.992546, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 3662, 0, -11197.9, 841.782, 40.794, 0.523598, 0, 0, 0.258819, 0.965926, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 3662, 0, -11154.6, 1721.86, 41.2989, 4.99164, 0, 0, -0.601814, 0.798636, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 3662, 0, -11144.1, 565.335, 70.4333, 4.62512, 0, 0, -0.737277, 0.675591, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 3662, 0, -11089.9, 1908.65, 33.5946, 0.0698117, 0, 0, 0.0348988, 0.999391, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 3662, 0, -11063.5, 1499.29, 43.4303, 2.58308, 0, 0, 0.961261, 0.27564, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 3662, 0, -11019.1, 1546.45, 44.2436, 3.47321, 0, 0, -0.986285, 0.16505, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 3662, 0, -10933.4, 1986.15, 33.5183, 5.84685, 0, 0, -0.216439, 0.976296, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 3662, 0, -10864.4, 1171.04, 37.1872, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 3662, 0, -10803.7, 2041.63, 11.9502, 5.11382, 0, 0, -0.551936, 0.833886, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 3662, 0, -10739.3, 1860.52, 32.6953, 3.4034, 0, 0, -0.991445, 0.130528, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 3662, 0, -10660.1, 2034.55, 9.13552, 3.85718, 0, 0, -0.936671, 0.35021, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 3662, 0, -10628.6, 1186.59, 34.6776, 3.57793, 0, 0, -0.976295, 0.216442, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 3662, 0, -10612.6, 1956.29, 37.6884, 6.10865, 0, 0, -0.0871553, 0.996195, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 3662, 0, -10491.1, 1030.94, 60.5239, 3.56047, 0, 0, -0.978148, 0.207912, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 3662, 0, -10483.3, 1337.91, 42.5685, 1.85005, 0, 0, 0.798635, 0.601815, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 3662, 0, -10187.8, 1925.64, 37.4336, 2.72271, 0, 0, 0.978148, 0.207912, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 3662, 0, -10130.9, 1737.09, 32.3876, 1.37881, 0, 0, 0.636078, 0.771625, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 3662, 0, -10032.3, 1883.86, 13.4883, 3.35105, 0, 0, -0.994521, 0.104536, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 3662, 0, -9904.01, 1759.95, 10.1947, 1.67551, 0, 0, 0.743144, 0.669131, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 3662, 0, -9849.99, 1296.9, 41.302, 0.0349062, 0, 0, 0.0174522, 0.999848, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 3662, 0, -9748.92, 1811.8, -0.004704, 4.88692, 0, 0, -0.642787, 0.766045, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 3662, 0, -9724.01, 1677.6, 0.010549, 2.93214, 0, 0, 0.994521, 0.104536, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 3662, 0, -9718.28, 1036.46, 36.4421, 5.00909, 0, 0, -0.594823, 0.803857, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 3662, 0, -11300.2, 1599.91, 35.8807, 1.71042, 0, 0, 0.754709, 0.656059, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 3662, 0, -11262.1, 1553.41, 35.072, 5.86431, 0, 0, -0.207911, 0.978148, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 3662, 0, -11235.1, 1668.54, 34.1432, 1.32645, 0, 0, 0.615661, 0.788011, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 3662, 0, -11194.7, 1489.61, 15.387, 0.104719, 0, 0, 0.0523357, 0.99863, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 3662, 0, -10136.3, 1655.46, 38.5074, 0.366518, 0, 0, 0.182235, 0.983255, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 3705, 0, -11457, 1521.76, 50.9323, 1.46608, 0, 0, 0.669131, 0.743145, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 3705, 0, -11309.9, 1714.72, 37.5294, -2.6529, 0, 0, 0.970296, -0.241922, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 3705, 0, -11115.7, 564.248, 32.7555, 1.58825, 0, 0, 0.71325, 0.700909, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 3705, 0, -11006.8, 2041.88, 10.6006, -2.86234, 0, 0, 0.990268, -0.139173, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 3705, 0, -10994.1, 2096.65, 0.014037, -1.6057, 0, 0, 0.71934, -0.694658, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+52, 3705, 0, -10990.8, 1473.42, 43.2017, -0.785398, 0, 0, 0.382683, -0.92388, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 3705, 0, -10883.2, 1981.65, 38.6544, -1.15192, 0, 0, 0.544639, -0.838671, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+54, 3705, 0, -10815.4, 1327.02, 34.0955, 1.25664, 0, 0, 0.587785, 0.809017, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+55, 3705, 0, -10658.4, 993.572, 32.8741, 1.0472, 0, 0, 0.5, 0.866025, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+56, 3705, 0, -10558.6, 1964.51, 35.0131, -2.42601, 0, 0, 0.936672, -0.350207, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+57, 3705, 0, -10178.1, 2022.71, 5.62225, -2.96706, 0, 0, 0.996195, -0.087156, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+58, 3705, 0, -10062.7, 1689.69, 34.9306, -2.23402, 0, 0, 0.898794, -0.438371, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+59, 3705, 0, -9741.55, 1185.91, 41.191, 0.226893, 0, 0, 0.113203, 0.993572, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+60, 3705, 0, -9633.56, 1594.26, 0.009919, -0.122173, 0, 0, 0.061049, -0.998135, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+61, 3705, 0, -11507.4, 1750.15, 2.05305, 4.18879, 0, 0, -0.866025, 0.500001, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+62, 3705, 0, -11422, 1812.74, -0.088864, 4.7822, 0, 0, -0.681998, 0.731354, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+63, 3705, 0, -11389.2, 1981.19, 1.27075, 1.62316, 0, 0, 0.725374, 0.688355, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+64, 3705, 0, -11234.2, 2013.1, 0.033822, 6.03884, 0, 0, -0.121869, 0.992546, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+65, 3705, 0, -11197.9, 841.782, 40.794, 0.523598, 0, 0, 0.258819, 0.965926, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+66, 3705, 0, -11154.6, 1721.86, 41.2989, 4.99164, 0, 0, -0.601814, 0.798636, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+67, 3705, 0, -11144.1, 565.335, 70.4333, 4.62512, 0, 0, -0.737277, 0.675591, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+68, 3705, 0, -11089.9, 1908.65, 33.5946, 0.0698117, 0, 0, 0.0348988, 0.999391, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+69, 3705, 0, -11063.5, 1499.29, 43.4303, 2.58308, 0, 0, 0.961261, 0.27564, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+70, 3705, 0, -11019.1, 1546.45, 44.2436, 3.47321, 0, 0, -0.986285, 0.16505, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+71, 3705, 0, -10933.4, 1986.15, 33.5183, 5.84685, 0, 0, -0.216439, 0.976296, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+72, 3705, 0, -10864.4, 1171.04, 37.1872, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+73, 3705, 0, -10803.7, 2041.63, 11.9502, 5.11382, 0, 0, -0.551936, 0.833886, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+74, 3705, 0, -10739.3, 1860.52, 32.6953, 3.4034, 0, 0, -0.991445, 0.130528, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+75, 3705, 0, -10660.1, 2034.55, 9.13552, 3.85718, 0, 0, -0.936671, 0.35021, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+76, 3705, 0, -10628.6, 1186.59, 34.6776, 3.57793, 0, 0, -0.976295, 0.216442, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+77, 3705, 0, -10612.6, 1956.29, 37.6884, 6.10865, 0, 0, -0.0871553, 0.996195, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+78, 3705, 0, -10491.1, 1030.94, 60.5239, 3.56047, 0, 0, -0.978148, 0.207912, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+79, 3705, 0, -10483.3, 1337.91, 42.5685, 1.85005, 0, 0, 0.798635, 0.601815, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+80, 3705, 0, -10187.8, 1925.64, 37.4336, 2.72271, 0, 0, 0.978148, 0.207912, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+81, 3705, 0, -10130.9, 1737.09, 32.3876, 1.37881, 0, 0, 0.636078, 0.771625, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+82, 3705, 0, -10032.3, 1883.86, 13.4883, 3.35105, 0, 0, -0.994521, 0.104536, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+83, 3705, 0, -9904.01, 1759.95, 10.1947, 1.67551, 0, 0, 0.743144, 0.669131, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+84, 3705, 0, -9849.99, 1296.9, 41.302, 0.0349062, 0, 0, 0.0174522, 0.999848, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+85, 3705, 0, -9748.92, 1811.8, -0.004704, 4.88692, 0, 0, -0.642787, 0.766045, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+86, 3705, 0, -9724.01, 1677.6, 0.010549, 2.93214, 0, 0, 0.994521, 0.104536, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+87, 3705, 0, -9718.28, 1036.46, 36.4421, 5.00909, 0, 0, -0.594823, 0.803857, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+88, 3705, 0, -11300.2, 1599.91, 35.8807, 1.71042, 0, 0, 0.754709, 0.656059, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+89, 3705, 0, -11262.1, 1553.41, 35.072, 5.86431, 0, 0, -0.207911, 0.978148, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+90, 3705, 0, -11235.1, 1668.54, 34.1432, 1.32645, 0, 0, 0.615661, 0.788011, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+91, 3705, 0, -11194.7, 1489.61, 15.387, 0.104719, 0, 0, 0.0523357, 0.99863, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+92, 3705, 0, -10136.3, 1655.46, 38.5074, 0.366518, 0, 0, 0.182235, 0.983255, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+2, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+3, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+4, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+5, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+6, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+7, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+8, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+9, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+10, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+11, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+12, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+13, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+14, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+15, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+16, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+17, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+18, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+19, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+20, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+21, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+22, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+23, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+24, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+25, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+26, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+27, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+28, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+29, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+30, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+31, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+32, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+33, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+34, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+35, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+36, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+37, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+38, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+39, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+40, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+41, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+42, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+43, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+44, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+45, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+46, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+15, @PTEMPLATE+15, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+16, @PTEMPLATE+16, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+17, @PTEMPLATE+17, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+18, @PTEMPLATE+18, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+19, @PTEMPLATE+19, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+20, @PTEMPLATE+20, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+21, @PTEMPLATE+21, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+22, @PTEMPLATE+22, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+23, @PTEMPLATE+23, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+24, @PTEMPLATE+24, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+25, @PTEMPLATE+25, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+26, @PTEMPLATE+26, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+27, @PTEMPLATE+27, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+28, @PTEMPLATE+28, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+29, @PTEMPLATE+29, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+30, @PTEMPLATE+30, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+31, @PTEMPLATE+31, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+32, @PTEMPLATE+32, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+33, @PTEMPLATE+33, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+34, @PTEMPLATE+34, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+35, @PTEMPLATE+35, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+36, @PTEMPLATE+36, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+37, @PTEMPLATE+37, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+38, @PTEMPLATE+38, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+39, @PTEMPLATE+39, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+40, @PTEMPLATE+40, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+41, @PTEMPLATE+41, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+42, @PTEMPLATE+42, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+43, @PTEMPLATE+43, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+44, @PTEMPLATE+44, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+45, @PTEMPLATE+45, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+46, @PTEMPLATE+46, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+47, @PTEMPLATE+1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+48, @PTEMPLATE+2, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+49, @PTEMPLATE+3, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+50, @PTEMPLATE+4, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+51, @PTEMPLATE+5, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+52, @PTEMPLATE+6, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+53, @PTEMPLATE+7, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+54, @PTEMPLATE+8, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+55, @PTEMPLATE+9, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+56, @PTEMPLATE+10, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+57, @PTEMPLATE+11, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+58, @PTEMPLATE+12, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+59, @PTEMPLATE+13, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+60, @PTEMPLATE+14, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+61, @PTEMPLATE+15, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+62, @PTEMPLATE+16, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+63, @PTEMPLATE+17, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+64, @PTEMPLATE+18, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+65, @PTEMPLATE+19, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+66, @PTEMPLATE+20, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+67, @PTEMPLATE+21, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+68, @PTEMPLATE+22, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+69, @PTEMPLATE+23, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+70, @PTEMPLATE+24, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+71, @PTEMPLATE+25, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+72, @PTEMPLATE+26, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+73, @PTEMPLATE+27, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+74, @PTEMPLATE+28, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+75, @PTEMPLATE+29, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+76, @PTEMPLATE+30, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+77, @PTEMPLATE+31, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+78, @PTEMPLATE+32, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+79, @PTEMPLATE+33, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+80, @PTEMPLATE+34, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+81, @PTEMPLATE+35, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+82, @PTEMPLATE+36, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+83, @PTEMPLATE+37, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+84, @PTEMPLATE+38, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+85, @PTEMPLATE+39, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+86, @PTEMPLATE+40, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+87, @PTEMPLATE+41, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+88, @PTEMPLATE+42, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+89, @PTEMPLATE+43, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+90, @PTEMPLATE+44, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+91, @PTEMPLATE+45, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+92, @PTEMPLATE+46, 'Food Crate / Barrel of Milk - Westfall', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+47, 22, 'Westfall - Food Crate / Barrel of Milk (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+2, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+3, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+4, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+5, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+6, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+7, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+8, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+9, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+10, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+11, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+12, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+13, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+14, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+15, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+16, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+17, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+18, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+19, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+20, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+21, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+22, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+23, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+24, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+25, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+26, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+27, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+28, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+29, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+30, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+31, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+32, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+33, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+34, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+35, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+36, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+37, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+38, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+39, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+40, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+41, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+42, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+43, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+44, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+45, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+46, @PTEMPLATE+47, 0, 'Food Crate / Barrel of Milk - Westfall', 0);

UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` IN (3662, 3705);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
