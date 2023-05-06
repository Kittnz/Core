
-- Changes by SHANG
REPLACE INTO `creature` VALUES (2576428,61482,0,0,0,0,-5265.85,523.769,386.573,3.22004,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2576429,61482,0,0,0,0,-5263.4,523.961,386.623,3.22004,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2576429;
DELETE FROM creature_addon WHERE guid=2576429;
DELETE FROM creature_movement WHERE id=2576429;
DELETE FROM game_event_creature WHERE guid=2576429;
DELETE FROM game_event_creature_data WHERE guid=2576429;
DELETE FROM creature_battleground WHERE guid=2576429;
REPLACE INTO `gameobject` VALUES ( 5015098, 2020019, 0, -5309.76, 602.808, 390.544, 4.48698, 0, 0, 0.782145, -0.623097, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5015098';
DELETE FROM game_event_gameobject WHERE guid = '5015098';
DELETE FROM gameobject_battleground WHERE guid = '5015098';
REPLACE INTO `gameobject` VALUES ( 5015099, 2020019, 0, -5277.03, 531.209, 387.531, 5.8731, 0, 0, 0.203607, -0.979053, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5015099';
DELETE FROM game_event_gameobject WHERE guid = '5015099';
DELETE FROM gameobject_battleground WHERE guid = '5015099';
REPLACE INTO `gameobject` VALUES ( 5015100, 2020019, 0, -5311.2, 596.074, 390.543, 1.13637, 0, 0, 0.538102, 0.84288, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5015100';
DELETE FROM game_event_gameobject WHERE guid = '5015100';
DELETE FROM gameobject_battleground WHERE guid = '5015100';
REPLACE INTO `gameobject` VALUES ( 5015101, 2020019, 0, -5313.88, 602.931, 390.545, 5.45998, 0, 0, 0.400079, -0.916481, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015102, 2020017, 90, -820.56, 365.587, -316.873, 0.661019, 0, 0, 0.324525, 0.945877, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370417653034550846, 2.000000);
REPLACE INTO `gameobject` VALUES ( 5015102, 2020017, 90, -820.56, 365.587, -316.873, 0.661019, 0, 0, 0.324525, 0.945877, 0, 0, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015102, 2020017, 90, -820.56, 365.587, -315.873, 0.661019, 0, 0, 0.324525, 0.945877, 0, 0, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015102, 2020017, 90, -820.56, 365.587, -314.873, 0.661019, 0, 0, 0.324525, 0.945877, 0, 0, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015102, 2020017, 90, -820.56, 365.587, -313.873, 0.661019, 0, 0, 0.324525, 0.945877, 0, 0, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015102, 2020017, 90, -820.56, 365.587, -314.873, 0.661019, 0, 0, 0.324525, 0.945877, 0, 0, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015102, 2020017, 90, -820.56, 365.587, -315.873, 0.661019, 0, 0, 0.324525, 0.945877, 0, 0, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015102, 2020017, 90, -820.56, 365.987, -315.873, 0.661019, 0, 0, 0.324525, 0.945877, 0, 0, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015102, 2020017, 90, -820.56, 365.587, -315.873, 0.661019, 0, 0, 0.324525, 0.945877, 0, 0, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015102, 2020017, 90, -820.56, 365.187, -315.873, 0.661019, 0, 0, 0.324525, 0.945877, 0, 0, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015102, 2020017, 90, -820.56, 364.787, -315.873, 0.661019, 0, 0, 0.324525, 0.945877, 0, 0, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015102, 2020017, 90, -820.16, 364.787, -315.873, 0.661019, 0, 0, 0.324525, 0.945877, 0, 0, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015102, 2020017, 90, -820.56, 364.787, -315.873, 0.661019, 0, 0, 0.324525, 0.945877, 0, 0, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015102, 2020017, 90, -820.96, 364.787, -315.873, 0.661019, 0, 0, 0.324525, 0.945877, 0, 0, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015102, 2020017, 90, -820.96, 365.187, -315.873, 0.661019, 0, 0, 0.324525, 0.945877, 0, 0, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015103, 2020017, 90, -814.972, 366.03, -316.873, 3.40722, 0, 0, 0.991193, -0.132424, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5015103';
DELETE FROM game_event_gameobject WHERE guid = '5015103';
DELETE FROM gameobject_battleground WHERE guid = '5015103';
REPLACE INTO `gameobject` VALUES ( 5015104, 2020018, 90, -688.455, 393.583, -273.064, 5.36366, 0, 0, 0.443734, -0.896158, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370417653051328064, 2.000000);
REPLACE INTO `gameobject` VALUES ( 5015104, 2020018, 90, -688.455, 393.583, -273.064, 5.36366, 0, 0, 0.443734, -0.896158, 0, 0, 100, 1, 0, 0);
