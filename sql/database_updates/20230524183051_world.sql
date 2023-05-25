
-- Changes by SHANG
REPLACE INTO `creature` VALUES (2577216,61249,0,0,0,0,-2013.63,1719.9,75.2633,4.12938,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577217,61250,0,0,0,0,-2026.38,1719.55,75.7074,6.02611,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577218,61248,0,0,0,0,-2007.93,1720.15,79.9966,2.751,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577219,61248,0,0,0,0,-2024.2,1720.23,80.0282,5.57451,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577220,61250,0,0,0,0,-2020.95,1717.87,80.0276,2.31196,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577221,6491,0,0,0,0,-1765.49,1607.01,58.1575,2.40259,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577222,61386,0,0,0,0,-1681.03,2019.17,54.7005,2.15155,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577223,61385,0,0,0,0,-1663.47,2035.2,54.6969,6.28274,120,120,0,100,100,0,0,0);
UPDATE `creature` SET `position_x` = -1662.813721, `position_y` = 2036.130127, `position_z` = 54.696880, `orientation` = 0.015263 WHERE `guid` = 2577223;
DELETE FROM creature WHERE guid=2574926;
DELETE FROM creature_addon WHERE guid=2574926;
DELETE FROM creature_movement WHERE id=2574926;
DELETE FROM game_event_creature WHERE guid=2574926;
DELETE FROM game_event_creature_data WHERE guid=2574926;
DELETE FROM creature_battleground WHERE guid=2574926;
DELETE FROM creature WHERE guid=2574930;
DELETE FROM creature_addon WHERE guid=2574930;
DELETE FROM creature_movement WHERE id=2574930;
DELETE FROM game_event_creature WHERE guid=2574930;
DELETE FROM game_event_creature_data WHERE guid=2574930;
DELETE FROM creature_battleground WHERE guid=2574930;
UPDATE `creature` SET `position_x` = -1670.628906, `position_y` = 2026.543823, `position_z` = 54.073593, `orientation` = 2.783012 WHERE `guid` = 2574912;
DELETE FROM creature WHERE guid=2574918;
DELETE FROM creature_addon WHERE guid=2574918;
DELETE FROM creature_movement WHERE id=2574918;
DELETE FROM game_event_creature WHERE guid=2574918;
DELETE FROM game_event_creature_data WHERE guid=2574918;
DELETE FROM creature_battleground WHERE guid=2574918;
UPDATE `creature` SET `position_x` = -1649.660034, `position_y` = 2033.697632, `position_z` = 54.683804, `orientation` = 1.641161 WHERE `guid` = 2574922;
UPDATE `creature` SET `position_x` = -1663.050903, `position_y` = 2036.115234, `position_z` = 54.696693, `orientation` = 0.063051 WHERE `guid` = 2574923;
UPDATE `creature` SET `position_x` = -1659.604004, `position_y` = 2034.012695, `position_z` = 54.696663, `orientation` = 3.196791 WHERE `guid` = 2577223;
UPDATE `creature` SET `position_x` = -1669.242554, `position_y` = 2038.262695, `position_z` = 61.554634, `orientation` = 2.471234 WHERE `guid` = 2574920;
UPDATE `creature` SET `position_x` = -1683.695068, `position_y` = 2023.573120, `position_z` = 61.554836, `orientation` = 5.631638 WHERE `guid` = 2574924;
UPDATE `creature` SET `position_x` = -1677.941528, `position_y` = 2036.336914, `position_z` = 54.073818, `orientation` = 5.299973 WHERE `guid` = 2574933;
UPDATE `creature` SET `position_x` = -1678.872070, `position_y` = 2039.496216, `position_z` = 61.554676, `orientation` = 4.719167 WHERE `guid` = 2574921;
UPDATE `creature_template` set `scale` = 1.000000 where entry = 61381;
DELETE FROM creature WHERE guid=2577213;
DELETE FROM creature_addon WHERE guid=2577213;
DELETE FROM creature_movement WHERE id=2577213;
DELETE FROM game_event_creature WHERE guid=2577213;
DELETE FROM game_event_creature_data WHERE guid=2577213;
DELETE FROM creature_battleground WHERE guid=2577213;
REPLACE INTO `creature` VALUES (2577224,61395,0,0,0,0,-1465.95,2534.74,111.918,0.960716,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577224, 233);
REPLACE INTO `creature` VALUES (2577225,61395,0,0,0,0,-1465.87,2565.18,96.6357,5.31497,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577226,61396,0,0,0,0,-1441.15,2589.44,95.1423,4.30417,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577227,61393,0,0,0,0,-1440.82,2577.27,96.0172,1.59801,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577228,61395,0,0,0,0,-1430.17,2593.85,94.282,0.98933,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577229,61393,0,0,0,0,-1454.92,2586.11,95.3494,3.82462,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577229,61393,0,0,0,0,-1454.92,2586.11,95.3494,3.82462,300,300,0,100,100,0,0,0);
DELETE FROM creature_movement WHERE id=2577229;
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577229,1, -1454.922363,2586.106201,95.349396, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577229,2, -1463.434326,2577.314697,95.500839, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577229,3, -1476.516357,2568.597656,95.243042, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577229,4, -1484.414307,2554.520996,98.701546, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577229,5, -1484.922729,2548.274170,103.226028, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577229,6, -1483.425537,2540.212158,105.794899, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577229,7, -1476.745361,2535.763916,108.613304, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577229,8, -1467.747192,2530.795654,110.871788, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577229,9, -1458.361450,2526.351807,113.791557, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577229,10, -1465.389404,2529.252197,111.508026, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577229,11, -1477.802368,2532.359863,108.917709, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577229,12, -1485.322998,2542.094971,105.445152, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577229,13, -1487.385498,2550.217285,101.651787, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577229,14, -1482.339966,2561.489258,95.395287, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577229,15, -1474.623047,2570.721680,95.157722, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577229,16, -1462.926270,2578.742432,95.403633, 100);
REPLACE INTO `creature` VALUES (2577229,61393,0,0,0,0,-1454.92,2586.11,95.3494,3.82462,300,300,0,100,100,2,0,0);
REPLACE INTO `creature` VALUES (2577230,61393,0,0,0,0,-1466.87,2581.93,94.8562,4.30686,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577225, 233);
REPLACE INTO `creature` VALUES (2577231,61395,0,0,0,0,-1487.71,2566.27,92.7387,3.24813,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2577231;
DELETE FROM creature_addon WHERE guid=2577231;
DELETE FROM creature_movement WHERE id=2577231;
DELETE FROM game_event_creature WHERE guid=2577231;
DELETE FROM game_event_creature_data WHERE guid=2577231;
DELETE FROM creature_battleground WHERE guid=2577231;
REPLACE INTO `creature` VALUES (2577232,61394,0,0,0,0,-1487.71,2566.27,92.7387,3.24813,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2577232;
DELETE FROM creature_addon WHERE guid=2577232;
DELETE FROM creature_movement WHERE id=2577232;
DELETE FROM game_event_creature WHERE guid=2577232;
DELETE FROM game_event_creature_data WHERE guid=2577232;
DELETE FROM creature_battleground WHERE guid=2577232;
REPLACE INTO `creature` VALUES (2577233,61396,0,0,0,0,-1487.71,2566.27,92.7387,3.24813,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577233,61396,0,0,0,0,-1487.71,2566.27,92.7387,3.24813,300,300,0,100,100,0,0,0);
DELETE FROM creature_movement WHERE id=2577233;
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577233,1, -1487.714233,2566.273926,92.738686, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577233,2, -1495.544678,2565.436523,89.940407, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577233,3, -1514.532349,2564.184082,81.578812, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577233,4, -1523.951660,2560.661377,76.121109, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577233,5, -1536.051147,2551.133545,70.001709, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577233,6, -1551.436401,2535.120361,66.389557, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577233,7, -1556.082031,2524.493408,68.934639, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577233,8, -1557.199097,2504.199951,75.067894, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577233,9, -1560.682373,2486.254883,77.360138, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577233,10, -1557.574219,2502.692383,75.452698, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577233,11, -1556.818848,2523.974121,69.042542, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577233,12, -1549.936157,2538.418213,65.927094, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577233,13, -1535.381836,2553.506348,70.505203, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577233,14, -1519.736572,2563.175293,78.629326, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577233,15, -1505.873779,2564.393311,85.895706, 100);
REPLACE INTO `creature` VALUES (2577233,61396,0,0,0,0,-1487.71,2566.27,92.7387,3.24813,300,300,0,100,100,2,0,0);
REPLACE INTO `creature` VALUES (2577234,61393,0,0,0,0,-1500.71,2570,87.8645,3.60785,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577235,61395,0,0,0,0,-1493.48,2541.54,106.583,3.99113,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577235, 233);
REPLACE INTO `creature` VALUES (2577236,61393,0,0,0,0,-1459.22,2516.14,115.509,1.80695,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577237,61396,0,0,0,0,-1457.42,2491.38,115.178,3.21384,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2577237;
DELETE FROM creature_addon WHERE guid=2577237;
DELETE FROM creature_movement WHERE id=2577237;
DELETE FROM game_event_creature WHERE guid=2577237;
DELETE FROM game_event_creature_data WHERE guid=2577237;
DELETE FROM creature_battleground WHERE guid=2577237;
REPLACE INTO `creature` VALUES (2577238,61395,0,0,0,0,-1456.88,2491.5,115.146,3.17457,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577238, 233);
REPLACE INTO `creature` VALUES (2577239,61395,0,0,0,0,-1441.66,2470.49,110.603,0.900047,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577239, 233);
REPLACE INTO `creature` VALUES (2577240,61395,0,0,0,0,-1441.45,2447.49,107.925,4.5113,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577240, 233);
REPLACE INTO `creature` VALUES (2577241,61395,0,0,0,0,-1400.51,2449.74,111.118,5.49541,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577241, 233);
REPLACE INTO `creature` VALUES (2577242,61395,0,0,0,0,-1385.23,2471.96,114.315,1.49302,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577242, 233);
REPLACE INTO `creature` VALUES (2577243,61395,0,0,0,0,-1382.11,2463.6,114.041,5.58024,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577243, 233);
REPLACE INTO `creature` VALUES (2577244,61396,0,0,0,0,-1427.63,2425.06,106.406,4.05213,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577245,61393,0,0,0,0,-1429.48,2420.11,105.987,1.89464,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577246,61395,0,0,0,0,-1398.85,2421.22,106.577,0.433369,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577246, 233);
REPLACE INTO `creature` VALUES (2577247,61396,0,0,0,0,-1423.66,2393.39,102.876,5.10099,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2577247;
DELETE FROM creature_addon WHERE guid=2577247;
DELETE FROM creature_movement WHERE id=2577247;
DELETE FROM game_event_creature WHERE guid=2577247;
DELETE FROM game_event_creature_data WHERE guid=2577247;
DELETE FROM creature_battleground WHERE guid=2577247;
REPLACE INTO `creature` VALUES (2577248,61395,0,0,0,0,-1423.66,2393.39,102.876,5.10099,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577248, 233);
REPLACE INTO `creature` VALUES (2577249,61395,0,0,0,0,-1423.11,2369.82,98.0883,1.03341,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577249, 233);
REPLACE INTO `creature` VALUES (2577250,61395,0,0,0,0,-1411.74,2362.24,96.3735,4.70043,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577251,61395,0,0,0,0,-1407.3,2365.58,96.7664,0.721604,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577251, 233);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577250, 233);
REPLACE INTO `creature` VALUES (2577252,61395,0,0,0,0,-1457.53,2353.66,98.8006,3.08879,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577252, 233);
REPLACE INTO `gameobject` VALUES ( 5015494, 2002626, 0, -1425.13, 2325.64, 93.7392, 2.03714, 0, 0, 0.85136, 0.524582, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015494, 2002626, 0, -1425.13, 2325.64, 93.3392, 2.03714, 0, 0, 0.85136, 0.524582, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015494, 2002626, 0, -1425.13, 2325.64, 92.9392, 2.03714, 0, 0, 0.85136, 0.524582, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015494, 2002626, 0, -1425.13, 2325.64, 92.5392, 2.03714, 0, 0, 0.85136, 0.524582, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015494, 2002626, 0, -1425.13, 2325.64, 92.1392, 2.03714, 0, 0, 0.85136, 0.524582, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015494, 2002626, 0, -1425.13, 2325.64, 91.7392, 2.03714, 0, 0, 0.85136, 0.524582, 300, 300, 100, 1, 0, 0);
REPLACE INTO `creature` VALUES (2577253,61393,0,0,0,0,-1436.96,2332.12,95.4827,1.36077,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577254,61395,0,0,0,0,-1449.81,2333.55,96.068,4.12459,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577254, 233);
REPLACE INTO `creature` VALUES (2577255,61395,0,0,0,0,-1431.77,2346.35,97.4577,6.21925,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577255, 233);
REPLACE INTO `creature` VALUES (2577256,61396,0,0,0,0,-1444.54,2352.34,97.7818,0.276926,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577257,61396,0,0,0,0,-1431.34,2389.65,101.909,1.29873,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577257,61396,0,0,0,0,-1431.34,2389.65,101.909,1.29873,300,300,0,100,100,0,0,0);
DELETE FROM creature_movement WHERE id=2577257;
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577257,1, -1431.343506,2389.651367,101.908768, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577257,2, -1429.076904,2398.758789,103.130928, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577257,3, -1423.711914,2412.956055,106.203186, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577257,4, -1419.852905,2430.537354,106.925308, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577257,5, -1411.845337,2443.254639,109.868912, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577257,6, -1403.202148,2451.610352,111.488358, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577257,7, -1389.526611,2461.989014,113.605659, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577257,8, -1403.146362,2452.688477,111.692108, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577257,9, -1411.366943,2442.517578,109.678596, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577257,10, -1416.333130,2419.467529,105.784325, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577257,11, -1425.851440,2401.127197,103.843697, 100);
REPLACE INTO `creature` VALUES (2577257,61396,0,0,0,0,-1431.34,2389.65,101.909,1.29873,300,300,0,100,100,2,0,0);
REPLACE INTO `creature` VALUES (2577258,61396,0,0,0,0,-1419.83,2448.17,110.082,2.47953,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577258,61396,0,0,0,0,-1419.83,2448.17,110.082,2.47953,300,300,0,100,100,0,0,0);
DELETE FROM creature_movement WHERE id=2577258;
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577258,1, -1419.828369,2448.172119,110.082176, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577258,2, -1424.859619,2451.490234,109.919144, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577258,3, -1435.305908,2453.539307,108.773209, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577258,4, -1445.569214,2465.485352,110.069633, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577258,5, -1449.424561,2478.511963,113.165489, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577258,6, -1454.218384,2489.770996,114.924454, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577258,7, -1453.902710,2499.235352,115.757072, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577258,8, -1456.278198,2516.899658,114.853584, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577258,9, -1455.053955,2501.317871,115.909546, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577258,10, -1454.681641,2484.921143,114.318954, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577258,11, -1449.940308,2478.546143,113.273567, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577258,12, -1444.667847,2466.318848,110.152954, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577258,13, -1434.573120,2456.705566,108.791550, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577258,14, -1426.368896,2454.055908,110.143974, 100);
REPLACE INTO `creature` VALUES (2577258,61396,0,0,0,0,-1419.83,2448.17,110.082,2.47953,300,300,0,100,100,2,0,0);
REPLACE INTO `creature` VALUES (2577259,61393,0,0,0,0,-1938.27,2480.42,40.8059,4.80133,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577260,61400,0,0,0,0,-1958.07,2514.95,35.851,2.88732,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577260, 233);
REPLACE INTO `creature` VALUES (2577261,61393,0,0,0,0,-1958.16,2493.08,39.1163,3.56747,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2577261;
DELETE FROM creature_addon WHERE guid=2577261;
DELETE FROM creature_movement WHERE id=2577261;
DELETE FROM game_event_creature WHERE guid=2577261;
DELETE FROM game_event_creature_data WHERE guid=2577261;
DELETE FROM creature_battleground WHERE guid=2577261;
REPLACE INTO `creature` VALUES (2577262,61395,0,0,0,0,-1958.16,2493.08,39.1163,3.56747,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577262, 233);
REPLACE INTO `creature` VALUES (2577263,61400,0,0,0,0,-1947.36,2553.71,29.5835,2.14354,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577263, 233);
REPLACE INTO `creature` VALUES (2577264,61400,0,0,0,0,-1915.13,2566.15,17.82,1.61183,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577264, 233);
REPLACE INTO `creature` VALUES (2577265,61395,0,0,0,0,-1935.78,2527.79,13.0095,3.5337,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577265, 233);
REPLACE INTO `creature` VALUES (2577266,61400,0,0,0,0,-1933.05,2509.81,12.6407,3.7599,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577266, 233);
REPLACE INTO `creature` VALUES (2577267,61400,0,0,0,0,-1932.22,2501.93,12.6386,3.04754,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577267, 233);
REPLACE INTO `creature` VALUES (2577268,61395,0,0,0,0,-1924.94,2482.81,12.6762,3.85022,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577268, 233);
REPLACE INTO `creature` VALUES (2577269,61393,0,0,0,0,-1899.41,2457.48,20.0241,1.67467,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577270,61396,0,0,0,0,-1887.23,2451.64,20.027,1.30505,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577271,61396,0,0,0,0,-1913.25,2478.37,13.2849,2.01505,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577271,61396,0,0,0,0,-1913.25,2478.37,13.2849,2.01505,300,300,0,100,100,0,0,0);
DELETE FROM creature_movement WHERE id=2577271;
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577271,1, -1913.253784,2478.366699,13.284903, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577271,2, -1921.241333,2495.147705,12.641374, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577271,3, -1928.691406,2514.530029,12.638283, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577271,4, -1927.009033,2531.948975,12.625582, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577271,5, -1914.808105,2544.403076,12.584963, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577271,6, -1926.102661,2532.696289,12.622726, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577271,7, -1924.226318,2509.910156,12.635429, 100);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation) VALUES (2577271,8, -1917.595703,2485.287598,12.658109, 100);
REPLACE INTO `creature` VALUES (2577271,61396,0,0,0,0,-1913.25,2478.37,13.2849,2.01505,300,300,0,100,100,2,0,0);
REPLACE INTO `creature` VALUES (2577272,61400,0,0,0,0,-1915.68,2461.83,13.634,4.23302,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577272, 233);
REPLACE INTO `creature` VALUES (2577273,61394,0,0,0,0,-1893.2,2484.01,12.9226,2.7926,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577274,61394,0,0,0,0,-1888.9,2483.48,12.7707,1.55565,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577274, 234);
DELETE FROM creature WHERE guid=2577273;
DELETE FROM creature_addon WHERE guid=2577273;
DELETE FROM creature_movement WHERE id=2577273;
DELETE FROM game_event_creature WHERE guid=2577273;
DELETE FROM game_event_creature_data WHERE guid=2577273;
DELETE FROM creature_battleground WHERE guid=2577273;
REPLACE INTO `creature` VALUES (2577275,61394,0,0,0,0,-1904.08,2487.27,12.8631,2.4243,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577276,61393,0,0,0,0,-1905.49,2510.16,14.4294,3.51365,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577277,61394,0,0,0,0,-1871.6,2499.69,13.0082,6.03477,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577277, 69);
REPLACE INTO `creature` VALUES (2577278,61394,0,0,0,0,-1873.77,2513.28,13.0082,0.986232,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577278, 234);
REPLACE INTO `creature` VALUES (2577279,61394,0,0,0,0,-1886.96,2506.58,14.4495,3.87571,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577280,61394,0,0,0,0,-1869.09,2468.37,12.2013,5.62007,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577281,61394,0,0,0,0,-1850.7,2484.64,12.1545,0.8959,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577282,61400,0,0,0,0,-1818.3,2512.55,17.8074,6.14864,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577282, 233);
REPLACE INTO `creature` VALUES (2577283,61400,0,0,0,0,-1818.66,2505.97,17.6419,5.74966,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577283, 233);
REPLACE INTO `creature` VALUES (2577284,61400,0,0,0,0,-1824.46,2486.81,21.4746,5.81807,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577284, 233);
REPLACE INTO `creature` VALUES (2577285,61393,0,0,0,0,-1830.52,2483.47,21.4414,1.54707,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577286,61400,0,0,0,0,-1841.94,2470.06,14.9384,5.7348,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577286, 233);
REPLACE INTO `creature` VALUES (2577287,61396,0,0,0,0,-1854.35,2506.68,12.1181,1.20586,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577288,61393,0,0,0,0,-1854.94,2514.91,12.0314,6.14366,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577289,61396,0,0,0,0,-1844.89,2519.51,11.989,3.7106,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577290,61394,0,0,0,0,-1832.78,2514.03,12.1072,0.859608,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577291,61395,0,0,0,0,-1828.22,2539.84,14.2412,0.544663,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577291, 233);
REPLACE INTO `creature` VALUES (2577292,61393,0,0,0,0,-1846.5,2550.62,12.1123,3.14694,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577293,61395,0,0,0,0,-1853.72,2565.1,18.0668,1.95234,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577293, 233);
REPLACE INTO `creature` VALUES (2577294,61395,0,0,0,0,-1878.56,2563.16,14.485,1.9298,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577294, 233);
REPLACE INTO `creature` VALUES (2577295,61400,0,0,0,0,-1893.56,2565.3,13.1948,2.49765,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577295, 233);
REPLACE INTO `creature` VALUES (2577296,61394,0,0,0,0,-1882.25,2539.76,12.0783,5.0816,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577296, 234);
REPLACE INTO `creature` VALUES (2577297,61394,0,0,0,0,-1869.61,2529.54,12.0082,3.79983,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577297, 69);
REPLACE INTO `creature` VALUES (2577298,61396,0,0,0,0,-1838.97,2522.6,24.7313,4.13756,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577299,61394,0,0,0,0,-1826.14,2519.17,31.1944,5.4099,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577299, 69);
REPLACE INTO `creature` VALUES (2577300,61393,0,0,0,0,-1835.91,2535.24,38.6894,5.48097,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577301,61400,0,0,0,0,-1812.01,2525.69,38.9254,6.21217,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577301, 233);
REPLACE INTO `creature` VALUES (2577302,61394,0,0,0,0,-1823.03,2523.11,38.8323,4.42461,120,120,0,100,100,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES (2577302, 69);
REPLACE INTO `creature` VALUES (2577303,61393,0,0,0,0,-1932.17,2430.1,46.2791,5.20763,120,120,0,100,100,0,0,0);
REPLACE INTO `gameobject` VALUES ( 5015495, 2003229, 0, -1243.3, 1771.34, 85.3513, 0.908073, 0, 0, 0.438597, 0.898684, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5015495';
DELETE FROM game_event_gameobject WHERE guid = '5015495';
DELETE FROM gameobject_battleground WHERE guid = '5015495';
REPLACE INTO `gameobject` VALUES ( 5015496, 2003227, 0, -1243.3, 1771.34, 85.3513, 0.908073, 0, 0, 0.438597, 0.898684, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5015496';
DELETE FROM game_event_gameobject WHERE guid = '5015496';
DELETE FROM gameobject_battleground WHERE guid = '5015496';
REPLACE INTO `creature` VALUES (2577304,61237,0,0,0,0,-795.064,1841.24,108.522,4.86728,120,120,0,100,100,0,0,0);

-- Changes by DRAGUNOVI
UPDATE `creature_template` set `scale` = 2.000000 where entry = 61533;

-- Changes by JOE
UPDATE `creature` SET `position_x` = -3644.987061, `position_y` = -994.833191, `position_z` = 153.012924, `orientation` = 1.798389 WHERE `guid` = 2573940;

-- Changes by SHANG
REPLACE INTO `gameobject` VALUES ( 5015497, 2008297, 815, -1485.31, 2317.84, 185.248, 1.84313, 0, 0, 0.796549, 0.604574, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015497, 2008297, 815, -1485.31, 2317.84, 185.248, 3.61499, 0, 0, 0.972118, -0.234494, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5015497';
DELETE FROM game_event_gameobject WHERE guid = '5015497';
DELETE FROM gameobject_battleground WHERE guid = '5015497';
REPLACE INTO `gameobject` VALUES ( 5015498, 2008294, 815, -1486.22, 2320.89, 185.499, 3.49011, 0, 0, 0.984855, -0.173379, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5015498';
DELETE FROM game_event_gameobject WHERE guid = '5015498';
DELETE FROM gameobject_battleground WHERE guid = '5015498';
REPLACE INTO `gameobject` VALUES ( 5015499, 2008297, 815, -1486.22, 2320.89, 185.499, 3.49011, 0, 0, 0.984855, -0.173379, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015499, 2008297, 815, -1485.82, 2320.89, 185.499, 3.49011, 0, 0, 0.984855, -0.173379, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015499, 2008297, 815, -1486.22, 2320.89, 185.499, 3.49011, 0, 0, 0.984855, -0.173379, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015499, 2008297, 815, -1486.62, 2320.89, 185.499, 3.49011, 0, 0, 0.984855, -0.173379, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5015499';
DELETE FROM game_event_gameobject WHERE guid = '5015499';
DELETE FROM gameobject_battleground WHERE guid = '5015499';
REPLACE INTO `gameobject` VALUES ( 5015500, 2008296, 815, -1485.19, 2318.61, 185.227, 3.29366, 0, 0, 0.997111, -0.0759584, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370417456388802508, 0.600000);
REPLACE INTO `gameobject` VALUES ( 5015500, 2008296, 815, -1485.19, 2318.61, 185.227, 3.29366, 0, 0, 0.997111, -0.0759584, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5015500';
DELETE FROM game_event_gameobject WHERE guid = '5015500';
DELETE FROM gameobject_battleground WHERE guid = '5015500';
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1485.91, 2319.84, 185.765, 3.61963, 0, 0, 0.971571, -0.236749, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370417456355248077, 0.600000);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1485.91, 2319.84, 185.765, 3.61963, 0, 0, 0.971571, -0.236749, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1485.91, 2319.84, 185.765, 3.52224, 0, 0, 0.981943, -0.189177, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1485.91, 2319.84, 185.765, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1485.51, 2319.84, 185.765, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1485.51, 2320.24, 185.765, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1485.51, 2320.64, 185.765, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1485.51, 2320.24, 185.765, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1485.51, 2319.84, 185.765, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1485.51, 2319.44, 185.765, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1485.51, 2319.04, 185.765, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1485.51, 2318.64, 185.765, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1485.51, 2318.24, 185.765, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1485.51, 2318.24, 185.365, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1485.51, 2318.24, 184.965, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1485.11, 2318.24, 184.965, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1485.51, 2318.24, 184.965, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1485.91, 2318.24, 184.965, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1486.31, 2318.24, 184.965, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1486.31, 2318.24, 184.765, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370417456355248077, 0.800000);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1486.31, 2318.24, 184.765, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1486.11, 2318.24, 184.765, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1486.31, 2318.24, 184.765, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1486.51, 2318.24, 184.765, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1486.71, 2318.24, 184.765, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015501, 2008294, 815, -1486.71, 2318.24, 184.565, 3.42673, 0, 0, 0.989855, -0.142084, 300, 300, 100, 1, 0, 0);
UPDATE `creature` SET `position_x` = -1475.254883, `position_y` = 2321.644531, `position_z` = 185.342972, `orientation` = 0.278426 WHERE `guid` = 2575854;
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370386781749149759, 0.600000);
REPLACE INTO `gameobject` VALUES ( 5013567, 179945, 0, -1201.44, 2700.28, 32.4026, 5.18521, 0, 0, 0.521824, -0.853053, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370386781749149759, 1.000000);
REPLACE INTO `gameobject` VALUES ( 5013567, 179945, 0, -1201.44, 2700.28, 32.4026, 5.18521, 0, 0, 0.521824, -0.853053, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370417503029461811, 0.600000);
REPLACE INTO `gameobject` VALUES ( 5014323, 2011076, 0, -1192.78, 2705.31, 32.4099, 3.62148, 0, 0, 0.971351, -0.237648, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5014323';
DELETE FROM game_event_gameobject WHERE guid = '5014323';
DELETE FROM gameobject_battleground WHERE guid = '5014323';
REPLACE INTO `creature` VALUES (2577305,61229,0,0,0,0,-1422.08,2712.86,67.2818,4.40288,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577306,61229,0,0,0,0,-1425.11,2682.06,64.0825,5.74198,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577307,61229,0,0,0,0,-1478.91,2748.37,48.7784,3.09598,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2577308,61270,0,0,0,0,-2132.79,1070.32,25.618,2.38555,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2577308;
DELETE FROM creature_addon WHERE guid=2577308;
DELETE FROM creature_movement WHERE id=2577308;
DELETE FROM game_event_creature WHERE guid=2577308;
DELETE FROM game_event_creature_data WHERE guid=2577308;
DELETE FROM creature_battleground WHERE guid=2577308;
REPLACE INTO `creature` VALUES (2577309,61270,0,0,0,0,-2216.75,1087.54,41.0406,1.00718,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2574686;
DELETE FROM creature_addon WHERE guid=2574686;
DELETE FROM creature_movement WHERE id=2574686;
DELETE FROM game_event_creature WHERE guid=2574686;
DELETE FROM game_event_creature_data WHERE guid=2574686;
DELETE FROM creature_battleground WHERE guid=2574686;
REPLACE INTO `gameobject` VALUES ( 5015502, 22886, 0, -2221.25, 1094.81, 45.8048, 5.63773, 0, 0, 0.317154, -0.948374, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015503, 22886, 0, -2220.89, 1094.39, 41.0068, 1.66754, 0, 0, 0.740471, 0.672089, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015503, 22886, 0, -2220.69, 1094.39, 41.0068, 1.66754, 0, 0, 0.740471, 0.672089, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015503, 22886, 0, -2220.89, 1094.39, 41.0068, 1.66754, 0, 0, 0.740471, 0.672089, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5015503, 22886, 0, -2221.09, 1094.39, 41.0068, 1.66754, 0, 0, 0.740471, 0.672089, 300, 300, 100, 1, 0, 0);
REPLACE INTO `creature` VALUES (2574701,61279,0,0,0,0,-2173.26,1160.76,26.7683,1.51749,300,300,0,100,100,0,0,0);
