
-- Changes by TINYFIN
REPLACE INTO `creature` VALUES (2574579,50514,0,0,0,0,-10617.7,290.595,32.8007,6.1999,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2574579;
DELETE FROM creature_addon WHERE guid=2574579;
DELETE FROM creature_movement WHERE id=2574579;
DELETE FROM game_event_creature WHERE guid=2574579;
DELETE FROM game_event_creature_data WHERE guid=2574579;
DELETE FROM creature_battleground WHERE guid=2574579;

-- Changes by JOE
REPLACE INTO `gameobject` VALUES ( 5013378, 2010866, 47, 2165.45, 1871.18, 59.8287, 1.70109, 0, 0, 0.751642, 0.659572, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5013378';
DELETE FROM game_event_gameobject WHERE guid = '5013378';
DELETE FROM gameobject_battleground WHERE guid = '5013378';
REPLACE INTO `gameobject` VALUES ( 5013379, 180322, 47, 2165.46, 1871.39, 60.086, 1.8928, 0, 0, 0.811315, 0.584609, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013379, 180322, 47, 2165.46, 1871.39, 58, 1.8928, 0, 0, 0.811315, 0.584609, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013379, 180322, 47, 2165.46, 1871.39, 30, 1.8928, 0, 0, 0.811315, 0.584609, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013379, 180322, 47, 2165.46, 1871.39, 40, 1.8928, 0, 0, 0.811315, 0.584609, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013379, 180322, 47, 2165.46, 1871.39, 50, 1.8928, 0, 0, 0.811315, 0.584609, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013379, 180322, 47, 2165.46, 1871.39, 45, 1.8928, 0, 0, 0.811315, 0.584609, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013379, 180322, 47, 2165.46, 1871.39, 50, 1.8928, 0, 0, 0.811315, 0.584609, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013379, 180322, 47, 2154.51, 1868.52, 50, 1.8928, 0, 0, 0.811315, 0.584609, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5013379';
DELETE FROM game_event_gameobject WHERE guid = '5013379';
DELETE FROM gameobject_battleground WHERE guid = '5013379';
REPLACE INTO `gameobject` VALUES ( 5013380, 180322, 47, 2165.41, 1869.68, 57.7413, 0.659666, 0, 0, 0.323885, 0.946096, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013380, 180322, 47, 2180, 1880, 50, 0.659666, 0, 0, 0.323885, 0.946096, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013380, 180322, 47, 2178, 1878, 50, 0.659666, 0, 0, 0.323885, 0.946096, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013380, 180322, 47, 2176, 1876, 50, 0.659666, 0, 0, 0.323885, 0.946096, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013380, 180322, 47, 2170, 1870, 50, 0.659666, 0, 0, 0.323885, 0.946096, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013380, 180322, 47, 2168, 1868, 50, 0.659666, 0, 0, 0.323885, 0.946096, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013380, 180322, 47, 2168, 1868, 55, 0.659666, 0, 0, 0.323885, 0.946096, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5013380';
DELETE FROM game_event_gameobject WHERE guid = '5013380';
DELETE FROM gameobject_battleground WHERE guid = '5013380';
REPLACE INTO `gameobject` VALUES ( 5013381, 180322, 47, 2165.73, 1877.14, 67.1697, 1.65319, 0, 0, 0.73563, 0.677384, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013381, 180322, 47, 2148.7, 1875.85, 60, 1.65319, 0, 0, 0.73563, 0.677384, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013381, 180322, 47, 2148.7, 1875.85, 65, 1.65319, 0, 0, 0.73563, 0.677384, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013381, 180322, 47, 2148.7, 1877, 60, 1.65319, 0, 0, 0.73563, 0.677384, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013381, 180322, 47, 2148.7, 1877, 68, 1.65319, 0, 0, 0.73563, 0.677384, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013381, 180322, 47, 2165.73, 1877.14, 67, 1.65319, 0, 0, 0.73563, 0.677384, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013381, 180322, 47, 2165.73, 1877.14, 65, 1.65319, 0, 0, 0.73563, 0.677384, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013381, 180322, 47, 2150.73, 1877.14, 67, 1.65319, 0, 0, 0.73563, 0.677384, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013381, 180322, 47, 2150.73, 1877.14, 67, 1.65319, 0, 0, 0.73563, 0.677384, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013381, 180322, 47, 2160.73, 1877.14, 67, 1.65319, 0, 0, 0.73563, 0.677384, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013381, 180322, 47, 2158.73, 1877.14, 67, 1.65319, 0, 0, 0.73563, 0.677384, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013381, 180322, 47, 2156.73, 1877.14, 67, 1.65319, 0, 0, 0.73563, 0.677384, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013381, 180322, 47, 2155.73, 1877.14, 67, 1.65319, 0, 0, 0.73563, 0.677384, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013381, 180322, 47, 2155.73, 1877.14, 60, 1.65319, 0, 0, 0.73563, 0.677384, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5013381';
DELETE FROM game_event_gameobject WHERE guid = '5013381';
DELETE FROM gameobject_battleground WHERE guid = '5013381';
UPDATE `creature` SET `position_x` = 2189.113037, `position_y` = 1860.551514, `position_z` = 79.056000, `orientation` = 1.232212 WHERE `guid` = 87487;
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.79, 1878.19, 68.4695, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165, 1878.19, 68, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2166, 1878.19, 68, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2166, 1878.19, 65, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2166, 1878.19, 62, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2166, 1878.19, 60, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1878.19, 60, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1879, 60, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1881, 60, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1882, 60, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1882, 59, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1882, 58, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1882, 57, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1882, 56, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1882, 50, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1882, 48, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1882, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1882, 42, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1882, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1882, 45, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1882, 44, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1882, 45, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1882, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1881, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1884, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1883, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1883.5, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1883.6, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1883.7, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1883.8, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1883.5, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1883, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370386788074160006, 0.900000);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1883, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370386788074160006, 0.950000);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1883, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370386788074160006, 1.000000);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1883, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1883, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370386788074160006, 2.000000);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1883, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370386788074160006, 1.700000);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1883, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370386788074160006, 1.800000);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1883, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370386788074160006, 2.000000);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1883, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370386788074160006, 1.900000);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1883, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370386788074160006, 2.000000);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1883, 46, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013382, 180322, 47, 2165.5, 1883, 46.5, 6.28237, 0, 0, 0.000405701, -1, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2168.65, 1881.73, 74.0996, 3.24735, 0, 0, 0.998602, -0.0528535, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370386788074160007, 1.000000);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2168.65, 1881.73, 74.0996, 3.24735, 0, 0, 0.998602, -0.0528535, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370386788074160007, 0.500000);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2168.65, 1881.73, 74.0996, 3.24735, 0, 0, 0.998602, -0.0528535, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5013382';
DELETE FROM game_event_gameobject WHERE guid = '5013382';
DELETE FROM gameobject_battleground WHERE guid = '5013382';
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.65, 1874.96, 64.5027, 3.24735, 0, 0, 0.998602, -0.0528535, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.65, 1874.96, 64.5027, 3, 0, 0, 0.997495, 0.0707372, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.65, 1874.96, 64.5027, 2.9, 0, 0, 0.992713, 0.120503, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.65, 1874.96, 64.5027, 2.5, 0, 0, 0.948985, 0.315322, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.65, 1874.96, 64.5027, 2, 0, 0, 0.841471, 0.540302, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.45, 1871.18, 59.8287, 2, 0, 0, 0.841471, 0.540302, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.45, 1871.18, 50, 2, 0, 0, 0.841471, 0.540302, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.45, 1871.18, 55, 2, 0, 0, 0.841471, 0.540302, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.45, 1871.18, 58, 2, 0, 0, 0.841471, 0.540302, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.7, 1876.02, 65.8106, 2, 0, 0, 0.841471, 0.540302, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.7, 1876.02, 65.8106, 3, 0, 0, 0.997495, 0.0707372, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.7, 1876.02, 65.8106, 2.5, 0, 0, 0.948985, 0.315322, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.45, 1871.18, 50, 2.5, 0, 0, 0.948985, 0.315322, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.38, 1870.7, 60.3343, 2.5, 0, 0, 0.948985, 0.315322, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.87, 1879.75, 70.4055, 2.5, 0, 0, 0.948985, 0.315322, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.56, 1873.34, 62.4954, 2.5, 0, 0, 0.948985, 0.315322, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.41, 1869.55, 57.6865, 2.5, 0, 0, 0.948985, 0.315322, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.41, 1869.55, 57.6865, 3, 0, 0, 0.997495, 0.0707372, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.41, 1869.55, 57.6865, 2, 0, 0, 0.841471, 0.540302, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.41, 1869.55, 57.6865, 1.9, 0, 0, 0.813416, 0.581683, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.41, 1869.55, 57, 1.9, 0, 0, 0.813416, 0.581683, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.41, 1869.55, 56.5, 1.9, 0, 0, 0.813416, 0.581683, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.41, 1869.55, 56, 1.9, 0, 0, 0.813416, 0.581683, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.74, 1877.32, 67.3915, 1.9, 0, 0, 0.813416, 0.581683, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.74, 1877.32, 67.3915, 3, 0, 0, 0.997495, 0.0707372, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2169.68, 1882.07, 74.0686, 3, 0, 0, 0.997495, 0.0707372, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.65, 1875.02, 64.5741, 3, 0, 0, 0.997495, 0.0707372, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2164.01, 1868.34, 57.5295, 3, 0, 0, 0.997495, 0.0707372, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2164.01, 1868.34, 57.5295, 3, 0, 0, 0.997495, 0.0707372, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2164.01, 1868.34, 57.5295, 2, 0, 0, 0.841471, 0.540302, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2164.57, 1867.97, 57.4614, 2, 0, 0, 0.841471, 0.540302, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2164.57, 1867.97, 57.4614, 2, 0, 0, 0.841471, 0.540302, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.18, 1869.16, 57.6322, 2, 0, 0, 0.841471, 0.540302, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.46, 1869.88, 58.1154, 2, 0, 0, 0.841471, 0.540302, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.46, 1869.88, 58, 2, 0, 0, 0.841471, 0.540302, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.46, 1869.88, 57.9, 2, 0, 0, 0.841471, 0.540302, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.46, 1869.88, 57.8, 2, 0, 0, 0.841471, 0.540302, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.46, 1869.88, 57.7, 2, 0, 0, 0.841471, 0.540302, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.46, 1869.88, 57.5, 2, 0, 0, 0.841471, 0.540302, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.46, 1869.88, 57.4, 2, 0, 0, 0.841471, 0.540302, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.46, 1869.88, 57.4, 2.1, 0, 0, 0.867423, 0.497571, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.46, 1869.88, 57.3, 2.1, 0, 0, 0.867423, 0.497571, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.46, 1869.88, 57.2, 2.1, 0, 0, 0.867423, 0.497571, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.46, 1869.88, 57, 2.1, 0, 0, 0.867423, 0.497571, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5013383, 180322, 47, 2165.46, 1869.88, 56, 2.1, 0, 0, 0.867423, 0.497571, 300, 300, 100, 1, 0, 0);

-- Changes by SHANG
REPLACE INTO `creature` VALUES (2574580,61225,0,0,0,532,-11091.2,-1988.72,49.7796,0.658258,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2574229,61211,0,0,0,532,-11103,-1933.81,74.4232,0.146177,120,120,5,100,100,1,0,0);
