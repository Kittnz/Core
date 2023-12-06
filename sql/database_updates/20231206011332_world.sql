
-- Changes by WOJI
REPLACE INTO `gameobject` VALUES ( 5017460, 2003278, 0, 4313.51, -3040.56, 22.4574, 2.2156, 0, 0, 0.894718, 0.446632, 300, 300, 100, 1, 0, 0);
UPDATE `creature` SET `position_x` = 4311.998535, `position_y` = -3040.729492, `position_z` = 22.923153, `orientation` = 3.953319 WHERE `guid` = 2581910;
REPLACE INTO `gameobject` VALUES ( 5017460, 2003278, 0, 4314.51, -3040.56, 22.4574, 2.2156, 0, 0, 0.894718, 0.446632, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017460, 2003278, 0, 4313.51, -3040.56, 22.4574, 2.2156, 0, 0, 0.894718, 0.446632, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017460, 2003278, 0, 4312.51, -3040.56, 22.4574, 2.2156, 0, 0, 0.894718, 0.446632, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017460, 2003278, 0, 4312.71, -3040.56, 22.4574, 2.2156, 0, 0, 0.894718, 0.446632, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017460, 2003278, 0, 4312.51, -3040.56, 22.4574, 2.2156, 0, 0, 0.894718, 0.446632, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017460, 2003278, 0, 4312.31, -3040.56, 22.4574, 2.2156, 0, 0, 0.894718, 0.446632, 300, 300, 100, 1, 0, 0);
UPDATE `creature` SET `position_x` = 4312.302734, `position_y` = -3040.532227, `position_z` = 23.589949, `orientation` = 3.474220 WHERE `guid` = 2581910;
DELETE FROM gameobject WHERE guid = '5017460';
DELETE FROM game_event_gameobject WHERE guid = '5017460';
DELETE FROM gameobject_battleground WHERE guid = '5017460';
UPDATE `creature` SET `position_x` = 3309.260986, `position_y` = -2508.207275, `position_z` = 103.189705, `orientation` = 3.319462 WHERE `guid` = 2581878;
UPDATE `creature_addon` SET `emote_state`=0 WHERE `guid`=2581878;
UPDATE `creature` SET `position_x` = 3311.405518, `position_y` = -2507.876465, `position_z` = 103.456474, `orientation` = 3.048499 WHERE `guid` = 2581878;
REPLACE INTO `creature` VALUES (2581923,61770,0,0,0,0,3409.69,-2816.47,100.611,3.44117,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2581924,61770,0,0,0,0,3409.72,-2810.19,101.226,3.68857,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2581925,61770,0,0,0,0,3407.41,-2806.4,101.226,3.68857,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2581926,61770,0,0,0,0,3403.02,-2803.03,101.848,4.56036,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2581926, 43);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2581926, 27);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2581926, 45);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2581925, 45);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2581924, 45);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2581923, 45);
REPLACE INTO `creature` VALUES (2581927,80506,0,0,0,0,4393.1,-3099.46,11.9973,0.813991,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2581928,80506,0,0,0,0,4470.12,-3024.63,8.7039,3.3037,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES (2581928,1, 4452.146484,-3028.635254,8.858979, 100);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES (2581928,2, 4432.157227,-3026.664795,9.681352, 100);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES (2581928,3, 4423.458984,-3019.854248,10.871468, 100);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES (2581928,4, 4415.693848,-3012.276123,11.272605, 100);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES (2581928,5, 4421.756836,-3018.403809,11.154697, 100);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES (2581928,6, 4434.137207,-3028.363281,9.505410, 100);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES (2581928,7, 4447.130371,-3028.928223,9.112897, 100);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES (2581928,8, 4460.054199,-3027.521973,8.532183, 100);
REPLACE INTO `creature` VALUES (2581928,80506,0,0,0,0,4470.12,-3024.63,8.7039,3.3037,300,300,0,100,100,2,0,0);
REPLACE INTO `creature` VALUES (2581929,80236,0,0,0,0,4315.87,-2878.92,7.54021,5.13367,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2581929,80236,0,0,0,0,4315.87,-2878.92,7.54021,5.13367,300,300,8,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2581930,80236,0,0,0,0,4352.75,-2896.64,7.40731,4.73311,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2581931,80236,0,0,0,0,4372.1,-2920.62,7.55287,5.87585,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2581931,80236,0,0,0,0,4372.1,-2920.62,7.55287,5.87585,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2581932,80236,0,0,0,0,4405.08,-2967.49,7.05798,5.34178,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2581932,80236,0,0,0,0,4405.08,-2967.49,7.05798,5.34178,300,300,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2581933,80236,0,0,0,0,4439.9,-3090.64,13.0613,1.35196,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2581934,80236,0,0,0,0,4499.45,-2857.96,9.90821,0.25318,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2581935,80236,0,0,0,0,4573.14,-2776.84,15.5076,0.822595,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2581935,80236,0,0,0,0,4573.14,-2776.84,15.5076,0.822595,300,300,3,100,100,1,0,0);
UPDATE `creature` SET `position_x` = 4238.204590, `position_y` = -2766.965332, `position_z` = 6.629169, `orientation` = 4.911366 WHERE `guid` = 2558648;
REPLACE INTO `creature` VALUES (2581936,80236,0,0,0,0,4431.35,-2939.29,7.452,4.49508,120,120,0,100,100,0,0,0);
UPDATE `creature` SET `position_x` = 4364.188477, `position_y` = -3107.452148, `position_z` = 15.822783, `orientation` = 0.332478 WHERE `guid` = 2581853;

-- Changes by REN
UPDATE `creature` SET `position_x` = 4311.842285, `position_y` = -3040.930664, `position_z` = 22.923079, `orientation` = 3.502104 WHERE `guid` = 2581910;
