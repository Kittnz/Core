
-- Changes by SHANG
REPLACE INTO `creature` VALUES (2572860,61046,0,0,0,1,-63.9279,2212.74,88.0546,0.0369127,3600,3600,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2572860,61046,0,0,0,1,-63.9279,2212.74,88.0546,0.0369127,300,300,20,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2572861,61050,0,0,0,0,1813.12,-5998.99,117.659,1.05884,3600,3600,0,100,100,0,0,0);
REPLACE INTO `gameobject` VALUES ( 5010732, 211016, 0, 1813.76, -5995.72, 117.659, 2.31155, 0, 0, 0.915109, 0.403208, 300, 300, 100, 1, 1, 533.333);
DELETE FROM gameobject WHERE guid = '5010732';
DELETE FROM game_event_gameobject WHERE guid = '5010732';
DELETE FROM gameobject_battleground WHERE guid = '5010732';
REPLACE INTO `gameobject` VALUES ( 5010733, 179864, 0, 1813.76, -5995.72, 117.659, 2.31155, 0, 0, 0.915109, 0.403208, 300, 300, 100, 1, 0, 0);
REPLACE INTO `creature` VALUES (2572862,61050,0,0,0,0,1815.7,-5997.13,117.659,3.83443,3600,3600,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2572861;
DELETE FROM creature_addon WHERE guid=2572861;
DELETE FROM creature_movement WHERE id=2572861;
DELETE FROM game_event_creature WHERE guid=2572861;
DELETE FROM game_event_creature_data WHERE guid=2572861;
DELETE FROM creature_battleground WHERE guid=2572861;
REPLACE INTO `creature` VALUES (2572863,61043,0,0,0,0,1749.38,-5915.11,116.12,2.62334,3600,3600,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2572863;
DELETE FROM creature_addon WHERE guid=2572863;
DELETE FROM creature_movement WHERE id=2572863;
DELETE FROM game_event_creature WHERE guid=2572863;
DELETE FROM game_event_creature_data WHERE guid=2572863;
DELETE FROM creature_battleground WHERE guid=2572863;
REPLACE INTO `creature` VALUES (2572864,61024,0,0,0,0,2278.66,-5855.06,100.977,2.99154,3600,3600,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2572864;
DELETE FROM creature_addon WHERE guid=2572864;
DELETE FROM creature_movement WHERE id=2572864;
DELETE FROM game_event_creature WHERE guid=2572864;
DELETE FROM game_event_creature_data WHERE guid=2572864;
DELETE FROM creature_battleground WHERE guid=2572864;
REPLACE INTO `creature` VALUES (2572865,61024,0,0,0,1,1377.24,1766.13,143.976,4.06737,3600,3600,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2572866,61025,0,0,0,1,1373.03,1767.17,143.976,5.06404,3600,3600,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2572867,61038,0,0,0,1,1426.69,2047.28,132.311,5.51926,3600,3600,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2572867,61038,0,0,0,1,1426.69,2047.28,132.311,5.51926,300,300,5,100,100,1,0,0);
REPLACE INTO `gameobject` VALUES ( 5010734, 2010932, 1, 1821.3, 2050.87, 69.8304, 1.82396, 0, 0, 0.790718, 0.61218, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010735, 2010932, 1, 1945.44, 2165.72, 63.6699, 5.41638, 0, 0, 0.419962, -0.907542, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010736, 2010932, 1, 2033.31, 2122.57, 60.086, 0.491928, 0, 0, 0.243492, 0.969903, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010737, 2010932, 1, 2108.7, 2249.27, 54.0884, 5.66299, 0, 0, 0.30515, -0.952304, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010738, 2010932, 1, 2140.9, 2280.36, 54.0884, 0.550481, 0, 0, 0.271778, 0.96236, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010739, 2010932, 1, 2188.21, 2282.67, 53.6821, 4.95028, 0, 0, 0.6182, -0.786021, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010740, 2010932, 1, 2204.58, 2284.14, 53.682, 3.05825, 0, 0, 0.999132, 0.0416598, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010741, 2010932, 1, 2190.39, 2308.7, 53.6827, 2.82263, 0, 0, 0.98731, 0.158806, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010742, 2010932, 1, 2193.83, 2316.99, 53.6819, 1.7592, 0, 0, 0.770484, 0.637459, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010743, 2010932, 1, 2284.1, 2244.14, 53.6804, 5.16756, 0, 0, 0.529332, -0.848415, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010744, 2010932, 1, 2209.48, 2191.03, 51.2103, 3.06269, 0, 0, 0.999222, 0.0394387, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010745, 2010932, 1, 2325.02, 2337.97, 42.2893, 6.08726, 0, 0, 0.0978043, -0.995206, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010746, 2010932, 1, 2371.24, 2348.18, 42.3016, 2.0566, 0, 0, 0.856423, 0.516275, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010747, 2010932, 1, 2387.3, 2409.62, 37.427, 1.3898, 0, 0, 0.640308, 0.768119, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010748, 2010932, 1, 2340.6, 2434.79, 37.4535, 2.43752, 0, 0, 0.938672, 0.344811, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010749, 2010932, 1, 2454.24, 2437.29, 50.3343, 4.74345, 0, 0, 0.696041, -0.718002, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010750, 2010932, 1, 2448.63, 2432.72, 50.3342, 0.525857, 0, 0, 0.259909, 0.965633, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010751, 2010932, 1, 2435.09, 2421.03, 50.334, 5.16913, 0, 0, 0.528664, -0.848831, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010752, 2010932, 1, 2419.57, 2485.98, 48.1597, 1.3843, 0, 0, 0.638193, 0.769877, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010753, 2010932, 1, 2403.05, 2479.41, 61.5507, 1.76836, 0, 0, 0.773396, 0.633923, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010754, 2010932, 1, 2418.76, 2436.85, 61.5498, 3.54494, 0, 0, 0.979733, -0.200308, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010755, 2010932, 1, 2401.46, 2473.8, 61.5515, 2.93547, 0, 0, 0.994694, 0.102879, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010756, 2010932, 1, 2302.64, 2375.74, 42.2892, 3.25669, 0, 0, 0.998345, -0.0575168, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010757, 2010932, 1, 2221.32, 2267.45, 53.6479, 3.71379, 0, 0, 0.959352, -0.282213, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010758, 2010932, 1, 2162.2, 2233.43, 50.1288, 3.33366, 0, 0, 0.995392, -0.0958866, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010759, 2010932, 1, 2139.68, 2167.83, 51.9297, 1.28296, 0, 0, 0.598383, 0.80121, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010760, 2010932, 1, 2002.25, 2208.25, 63.5623, 4.10176, 0, 0, 0.886957, -0.461852, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010761, 2010932, 1, 1976.08, 2122.68, 65.1891, 3.49179, 0, 0, 0.98471, -0.174204, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010762, 2010932, 1, 1965.03, 2080.96, 67.202, 5.76629, 0, 0, 0.255578, -0.966788, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010763, 2010931, 1, 1961.65, 2083.79, 67.2392, 1.15836, 0, 0, 0.54734, 0.836911, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5010763';
DELETE FROM game_event_gameobject WHERE guid = '5010763';
DELETE FROM gameobject_battleground WHERE guid = '5010763';
REPLACE INTO `creature` VALUES (2572868,4009,0,0,0,1,1229.93,1781.76,129.101,2.31122,3600,3600,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2572868,4009,0,0,0,1,1229.93,1781.76,129.101,2.31122,300,300,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2572869,4009,0,0,0,1,1232.06,1812.26,128.554,0.783621,3600,3600,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2572869,4009,0,0,0,1,1232.06,1812.26,128.554,0.783621,300,300,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2572870,4009,0,0,0,1,1362.77,1909.14,139.826,5.61858,3600,3600,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2572870,4009,0,0,0,1,1362.77,1909.14,139.826,5.61858,300,300,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2572871,61038,0,0,0,1,1330.99,1838.45,164.215,2.06544,3600,3600,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2572871,61038,0,0,0,1,1330.99,1838.45,164.215,2.06544,300,300,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2572872,4009,0,0,0,1,1218.33,1850.99,131.156,3.99124,3600,3600,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2572873,4009,0,0,0,1,1190.16,1792.19,127.089,5.31505,3600,3600,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2572874,4044,0,0,0,1,1251.2,1885.26,131.407,0.706202,3600,3600,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2572874,4044,0,0,0,1,1251.2,1885.26,131.407,0.706202,300,300,8,100,100,1,0,0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8117.19, 1221.01, 9.36358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8117.19, 1221.01, 9.36358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8117.19, 1221.01, 9.36358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.99, 1221.01, 9.36358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.01, 9.36358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.01, 9.56358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.01, 9.76358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.01, 9.96358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.01, 10.1636, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.01, 10.3636, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1220.81, 10.3636, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.01, 10.3636, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.21, 10.3636, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.41, 10.3636, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.61, 10.3636, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.61, 10.1636, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.61, 9.96358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.61, 9.76358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.61, 9.56358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.61, 9.36358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.61, 9.16358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.81, 9.16358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.61, 9.16358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.99, 1221.61, 9.16358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.79, 1221.61, 9.16358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.59, 1221.61, 9.16358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.39, 1221.61, 9.16358, 1.2528, 0, 0, 0.58623, 0.810145, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.39, 1221.61, 9.16358, 4.4101, 0, 0, 0.805513, -0.592578, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.39, 1221.61, 9.16358, 1.32034, 0, 0, 0.613253, 0.789887, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010764, 2008294, 0, -8116.39, 1221.61, 9.16358, 1.26537, 0, 0, 0.591311, 0.806444, 300, 300, 100, 1, 0, 0);
REPLACE INTO `creature` VALUES (2572875,61017,0,0,0,0,-8540.38,386.135,108.386,4.84757,3600,3600,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2572399;
DELETE FROM creature_addon WHERE guid=2572399;
DELETE FROM creature_movement WHERE id=2572399;
DELETE FROM game_event_creature WHERE guid=2572399;
DELETE FROM game_event_creature_data WHERE guid=2572399;
DELETE FROM creature_battleground WHERE guid=2572399;
DELETE FROM creature WHERE guid=2572875;
DELETE FROM creature_addon WHERE guid=2572875;
DELETE FROM creature_movement WHERE id=2572875;
DELETE FROM game_event_creature WHERE guid=2572875;
DELETE FROM game_event_creature_data WHERE guid=2572875;
DELETE FROM creature_battleground WHERE guid=2572875;
REPLACE INTO `creature` VALUES (2572876,61017,0,0,0,0,-8540.28,386.166,108.386,4.67871,3600,3600,0,100,100,0,0,0);
