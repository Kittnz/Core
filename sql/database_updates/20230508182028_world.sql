
-- Changes by SHANG
REPLACE INTO `creature` VALUES (2576466,61483,0,0,0,0,-4810.14,639.711,378.472,3.28001,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2576466;
DELETE FROM creature_addon WHERE guid=2576466;
DELETE FROM creature_movement WHERE id=2576466;
DELETE FROM game_event_creature WHERE guid=2576466;
DELETE FROM game_event_creature_data WHERE guid=2576466;
DELETE FROM creature_battleground WHERE guid=2576466;
REPLACE INTO `gameobject` VALUES ( 5015108, 2020020, 90, -620.978, 78.1894, -198.434, 2.63085, 0, 0, 0.96757, 0.252603, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370417653084882500, 0.800000);
REPLACE INTO `gameobject` VALUES ( 5015108, 2020020, 90, -620.978, 78.1894, -198.434, 2.63085, 0, 0, 0.96757, 0.252603, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015108, 2020020, 90, -620.978, 78.1894, -198.234, 2.63085, 0, 0, 0.96757, 0.252603, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370417653084882500, 0.600000);
REPLACE INTO `gameobject` VALUES ( 5015108, 2020020, 90, -620.978, 78.1894, -198.234, 2.63085, 0, 0, 0.96757, 0.252603, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015109, 2020022, 0, -5878.32, -2018.51, 401.182, 2.17328, 0, 0, 0.885068, 0.465462, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015110, 2020022, 0, -5912.93, -2007.83, 405.254, 6.08814, 0, 0, 0.0973681, -0.995248, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015110, 2020022, 0, -5912.93, -2007.83, 405.054, 6.08814, 0, 0, 0.0973681, -0.995248, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015111, 2020022, 0, -5905.67, -2036.21, 405.674, 5.49359, 0, 0, 0.384621, -0.923075, 300, 300, 100, 1, 0, 0);
REPLACE INTO `creature` VALUES (2576467,1211,0,0,0,0,-5257.58,449.543,386.334,0.993049,120,120,5,100,100,1,0,0);
