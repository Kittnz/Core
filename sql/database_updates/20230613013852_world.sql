
-- Changes by SHANG
REPLACE INTO `creature` VALUES (2577474,61556,0,0,0,1,-3667.39,-4412.68,10.7948,4.43763,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2577474;
DELETE FROM creature_addon WHERE guid=2577474;
DELETE FROM creature_movement WHERE id=2577474;
DELETE FROM game_event_creature WHERE guid=2577474;
DELETE FROM game_event_creature_data WHERE guid=2577474;
DELETE FROM creature_battleground WHERE guid=2577474;
REPLACE INTO `creature` VALUES (2577475,61557,0,0,0,1,-3817.8,-4561.31,9.12589,2.38301,120,120,0,100,100,0,0,0);
UPDATE `creature` SET `position_x` = -3819.262451, `position_y` = -4562.958984, `position_z` = 9.006362, `orientation` = 2.398850 WHERE `guid` = 2577475;
REPLACE INTO `creature` VALUES (2574701,61279,0,0,0,0,-2173.26,1160.76,26.7683,1.51749,300,300,5,100,100,1,0,0);
UPDATE `creature` SET `position_x` = -2174.518311, `position_y` = 1161.486328, `position_z` = 26.880362, `orientation` = 2.586490 WHERE `guid` = 2574701;
REPLACE INTO `creature` VALUES (2574701,61279,0,0,0,0,-2174.52,1161.49,26.8804,2.58649,300,300,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574701,61279,0,0,0,0,-2174.52,1161.49,26.8804,2.58649,300,300,3,100,100,1,0,0);
REPLACE INTO `gameobject` VALUES ( 5015523, 22834, 0, -2175.06, 1168.22, 26.8529, 5.38735, 0, 0, 0.433089, -0.901351, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015523, 22834, 0, -2175.06, 1168.42, 26.8529, 5.38735, 0, 0, 0.433089, -0.901351, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015524, 2003528, 815, -969.369, 2954.07, 166.314, 5.60712, 0, 0, 0.331631, -0.943409, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015524, 2003528, 815, -969.369, 2954.27, 166.314, 5.60712, 0, 0, 0.331631, -0.943409, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015524, 2003528, 815, -969.369, 2954.47, 166.314, 5.60712, 0, 0, 0.331631, -0.943409, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015524, 2003528, 815, -969.369, 2954.67, 166.314, 5.60712, 0, 0, 0.331631, -0.943409, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015524, 2003528, 815, -969.369, 2954.87, 166.314, 5.60712, 0, 0, 0.331631, -0.943409, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015524, 2003528, 815, -969.369, 2955.07, 166.314, 5.60712, 0, 0, 0.331631, -0.943409, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015524, 2003528, 815, -969.369, 2955.27, 166.314, 5.60712, 0, 0, 0.331631, -0.943409, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015524, 2003528, 815, -969.369, 2955.47, 166.314, 5.60712, 0, 0, 0.331631, -0.943409, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015524, 2003528, 815, -969.369, 2955.67, 166.314, 5.60712, 0, 0, 0.331631, -0.943409, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015524, 2003528, 815, -969.369, 2955.87, 166.314, 5.60712, 0, 0, 0.331631, -0.943409, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015524, 2003528, 815, -969.369, 2956.07, 166.314, 5.60712, 0, 0, 0.331631, -0.943409, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015524, 2003528, 815, -969.369, 2956.27, 166.314, 5.60712, 0, 0, 0.331631, -0.943409, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015524, 2003528, 815, -969.369, 2956.47, 166.314, 5.60712, 0, 0, 0.331631, -0.943409, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015524, 2003528, 815, -969.369, 2956.67, 166.314, 5.60712, 0, 0, 0.331631, -0.943409, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015525, 177514, 815, -970.722, 2954.52, 166.314, 0.398607, 0, 0, 0.197987, 0.980205, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5015525';
DELETE FROM game_event_gameobject WHERE guid = '5015525';
DELETE FROM gameobject_battleground WHERE guid = '5015525';
REPLACE INTO `gameobject` VALUES ( 5015526, 177513, 815, -969.971, 2955.14, 166.314, 0.0891571, 0, 0, 0.0445638, 0.999007, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015527, 177512, 815, -968.723, 2958.27, 166.314, 4.06327, 0, 0, 0.895679, -0.444701, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5015527';
DELETE FROM game_event_gameobject WHERE guid = '5015527';
DELETE FROM gameobject_battleground WHERE guid = '5015527';
REPLACE INTO `gameobject` VALUES ( 5015528, 2020033, 815, -969.41, 2957.07, 167.442, 4.61619, 0, 0, 0.740287, -0.672291, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015529, 2020034, 0, -13306, -452.182, 18.3923, 5.12116, 0, 0, 0.548871, -0.835907, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015530, 2020034, 0, -13261.2, -478.404, 19.1519, 2.34321, 0, 0, 0.921375, 0.388675, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015531, 2020034, 0, -13249.8, -553.549, 16.0805, 0.501439, 0, 0, 0.248101, 0.968734, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015531, 2020034, 0, -13249.8, -553.549, 15.8805, 0.501439, 0, 0, 0.248101, 0.968734, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015531, 2020034, 0, -13249.8, -553.549, 15.6805, 0.501439, 0, 0, 0.248101, 0.968734, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015532, 2020034, 0, -13229.2, -613.12, 5.68349, 5.33635, 0, 0, 0.455929, -0.890016, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015533, 2020034, 0, -13120, -531.795, 12.7168, 1.62299, 0, 0, 0.725316, 0.688416, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015534, 2020034, 0, -13177, -468.811, 5.27792, 4.75358, 0, 0, 0.692393, -0.72152, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015535, 2020034, 0, -13204.2, -486.848, 4.63551, 1.14922, 0, 0, 0.543509, 0.839404, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015536, 2020034, 0, -13230.4, -480.769, 5.57799, 0.579809, 0, 0, 0.285861, 0.958271, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015537, 2020034, 0, -13187.4, -574.796, 12.3895, 4.15023, 0, 0, 0.875504, -0.483212, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015538, 2020034, 0, -13272.1, -576.738, 15.7677, 3.9421, 0, 0, 0.920962, -0.389653, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015539, 2020034, 0, -13233.7, -508.341, 12.7197, 5.3676, 0, 0, 0.441968, -0.897031, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015539, 2020034, 0, -13233.7, -508.341, 12.5197, 5.3676, 0, 0, 0.441968, -0.897031, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015540, 2020034, 0, -13273.9, -520.091, 20.0049, 4.68823, 0, 0, 0.715596, -0.698514, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015541, 2020034, 0, -13291.3, -437.663, 16.9224, 5.60007, 0, 0, 0.334953, -0.942235, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015542, 2020034, 0, -13323, -440.008, 22.3666, 5.87104, 0, 0, 0.204617, -0.978842, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015542, 2020034, 0, -13323, -440.008, 22.1666, 5.87104, 0, 0, 0.204617, -0.978842, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015543, 2020034, 0, -13184.8, -533.644, 4.64338, 0.90105, 0, 0, 0.435438, 0.900219, 300, 300, 100, 1, 0, 0);

-- Changes by JOE
DELETE FROM gameobject WHERE guid = '4012590';
DELETE FROM game_event_gameobject WHERE guid = '4012590';
DELETE FROM gameobject_battleground WHERE guid = '4012590';
