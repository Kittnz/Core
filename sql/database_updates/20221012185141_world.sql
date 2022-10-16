
-- Changes by SHANG
REPLACE INTO `creature` VALUES (2572848,61040,0,0,0,1,-1768.02,914.729,92.4927,0.624425,3600,3600,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2572849,61041,0,0,0,1,-1764.95,911.72,92.4927,0.90233,3600,3600,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2572850,61042,0,0,0,1,-1761.33,915.897,92.4919,4.0786,3600,3600,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2572850;
DELETE FROM creature_addon WHERE guid=2572850;
DELETE FROM creature_movement WHERE id=2572850;
DELETE FROM game_event_creature WHERE guid=2572850;
DELETE FROM game_event_creature_data WHERE guid=2572850;
DELETE FROM creature_battleground WHERE guid=2572850;
REPLACE INTO `creature` VALUES (2572851,61042,0,0,0,1,209.728,2004.88,162.53,5.09014,3600,3600,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2572851,61042,0,0,0,1,209.728,2004.88,162.53,5.09014,300,300,15,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2572852,61043,0,0,0,1,-2096.36,1813.76,57.129,3.32154,3600,3600,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2572852,61043,0,0,0,1,-2096.36,1813.76,57.129,3.32154,300,300,5,100,100,1,0,0);
DELETE FROM creature WHERE guid=2571848;
DELETE FROM creature_addon WHERE guid=2571848;
DELETE FROM creature_movement WHERE id=2571848;
DELETE FROM game_event_creature WHERE guid=2571848;
DELETE FROM game_event_creature_data WHERE guid=2571848;
DELETE FROM creature_battleground WHERE guid=2571848;
DELETE FROM creature WHERE guid=2568472;
DELETE FROM creature_addon WHERE guid=2568472;
DELETE FROM creature_movement WHERE id=2568472;
DELETE FROM game_event_creature WHERE guid=2568472;
DELETE FROM game_event_creature_data WHERE guid=2568472;
DELETE FROM creature_battleground WHERE guid=2568472;

-- Changes by WILL
REPLACE INTO `creature` VALUES (2572853,4221,0,0,0,1,9838.55,2436.83,1315.72,3.73654,3600,3600,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2572853;
DELETE FROM creature_addon WHERE guid=2572853;
DELETE FROM creature_movement WHERE id=2572853;
DELETE FROM game_event_creature WHERE guid=2572853;
DELETE FROM game_event_creature_data WHERE guid=2572853;
DELETE FROM creature_battleground WHERE guid=2572853;
REPLACE INTO `creature` VALUES (2572854,4221,0,0,0,0,-8365.93,1275.64,5.94216,0.036502,3600,3600,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2572855,60929,0,0,0,0,-8365.62,1270.51,6.02976,5.92503,3600,3600,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2572855;
DELETE FROM creature_addon WHERE guid=2572855;
DELETE FROM creature_movement WHERE id=2572855;
DELETE FROM game_event_creature WHERE guid=2572855;
DELETE FROM game_event_creature_data WHERE guid=2572855;
DELETE FROM creature_battleground WHERE guid=2572855;
REPLACE INTO `creature` VALUES (2572856,60929,0,0,0,0,-8365.27,1270.55,5.43015,0.128391,3600,3600,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2572857,51561,0,0,0,0,-8370.41,1269.61,5.23089,5.20598,3600,3600,0,100,100,0,0,0);
UPDATE creature SET position_x = '-8369.135742', position_y = '1269.950806', position_z = '5.230281', orientation = '4.131953' WHERE guid = '2572856';
DELETE FROM creature WHERE guid=2572854;
DELETE FROM creature_addon WHERE guid=2572854;
DELETE FROM creature_movement WHERE id=2572854;
DELETE FROM game_event_creature WHERE guid=2572854;
DELETE FROM game_event_creature_data WHERE guid=2572854;
DELETE FROM creature_battleground WHERE guid=2572854;
DELETE FROM creature WHERE guid=2572856;
DELETE FROM creature_addon WHERE guid=2572856;
DELETE FROM creature_movement WHERE id=2572856;
DELETE FROM game_event_creature WHERE guid=2572856;
DELETE FROM game_event_creature_data WHERE guid=2572856;
DELETE FROM creature_battleground WHERE guid=2572856;
DELETE FROM creature WHERE guid=2572857;
DELETE FROM creature_addon WHERE guid=2572857;
DELETE FROM creature_movement WHERE id=2572857;
DELETE FROM game_event_creature WHERE guid=2572857;
DELETE FROM game_event_creature_data WHERE guid=2572857;
DELETE FROM creature_battleground WHERE guid=2572857;

-- Changes by SHANG
REPLACE INTO `creature` VALUES (2572858,61019,0,0,0,1,-4345.26,-4381.64,1.98717,0.0496055,3600,3600,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2572859,61019,0,0,0,1,-4345.88,-4381.49,1.98717,5.82621,3600,3600,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2572858;
DELETE FROM creature_addon WHERE guid=2572858;
DELETE FROM creature_movement WHERE id=2572858;
DELETE FROM game_event_creature WHERE guid=2572858;
DELETE FROM game_event_creature_data WHERE guid=2572858;
DELETE FROM creature_battleground WHERE guid=2572858;

-- Changes by COUN
REPLACE INTO `gameobject` VALUES ( 5010674, 1000011, 0, -10347.8, -3296.09, 23.4386, 4.96175, 0, 0, 0.613684, -0.789551, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5010674';
DELETE FROM game_event_gameobject WHERE guid = '5010674';
DELETE FROM gameobject_battleground WHERE guid = '5010674';
REPLACE INTO `gameobject` VALUES ( 5010675, 2000188, 0, -10354.4, -3296.63, 23.4653, 5.26263, 0, 0, 0.48842, -0.872609, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5010675';
DELETE FROM game_event_gameobject WHERE guid = '5010675';
DELETE FROM gameobject_battleground WHERE guid = '5010675';
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3301.43, 22.7191, 0.636333, 0, 0, 0.312826, 0.949811, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3301.43, 22.7191, 3.82583, 0, 0, 0.942045, -0.335486, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3301.43, 22.7191, 4.82643, 0, 0, 0.665661, -0.746254, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3301.43, 22.7191, 0.776131, 0, 0, 0.378398, 0.925643, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3302.43, 22.7191, 0.776131, 0, 0, 0.378398, 0.925643, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3303.43, 22.7191, 0.776131, 0, 0, 0.378398, 0.925643, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3304.43, 22.7191, 0.776131, 0, 0, 0.378398, 0.925643, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3305.43, 22.7191, 0.776131, 0, 0, 0.378398, 0.925643, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3306.43, 22.7191, 0.776131, 0, 0, 0.378398, 0.925643, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3307.43, 22.7191, 0.776131, 0, 0, 0.378398, 0.925643, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3308.43, 22.7191, 0.776131, 0, 0, 0.378398, 0.925643, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3309.43, 22.7191, 0.776131, 0, 0, 0.378398, 0.925643, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3310.43, 22.7191, 0.776131, 0, 0, 0.378398, 0.925643, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3311.43, 22.7191, 0.776131, 0, 0, 0.378398, 0.925643, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3312.43, 22.7191, 0.776131, 0, 0, 0.378398, 0.925643, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3313.43, 22.7191, 0.776131, 0, 0, 0.378398, 0.925643, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3313.43, 23.7191, 0.776131, 0, 0, 0.378398, 0.925643, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3313.43, 24.7191, 0.776131, 0, 0, 0.378398, 0.925643, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010676, 2007952, 0, -10358.7, -3313.43, 25.7191, 0.776131, 0, 0, 0.378398, 0.925643, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5010676';
DELETE FROM game_event_gameobject WHERE guid = '5010676';
DELETE FROM gameobject_battleground WHERE guid = '5010676';
REPLACE INTO `gameobject` VALUES ( 5010677, 2007441, 0, -10351.6, -3300.21, 23.6799, 0.421133, 0, 0, 0.209014, 0.977913, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010677, 2007441, 0, -10351.6, -3300.21, 24.6799, 0.421133, 0, 0, 0.209014, 0.977913, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010677, 2007441, 0, -10351.6, -3300.21, 25.6799, 0.421133, 0, 0, 0.209014, 0.977913, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010677, 2007441, 0, -10351.6, -3300.21, 26.6799, 0.421133, 0, 0, 0.209014, 0.977913, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010677, 2007441, 0, -10351.6, -3300.21, 27.6799, 0.421133, 0, 0, 0.209014, 0.977913, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010677, 2007441, 0, -10351.6, -3300.21, 26.6799, 0.421133, 0, 0, 0.209014, 0.977913, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010677, 2007441, 0, -10351.6, -3300.21, 25.6799, 0.421133, 0, 0, 0.209014, 0.977913, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010677, 2007441, 0, -10351.6, -3300.21, 24.6799, 0.421133, 0, 0, 0.209014, 0.977913, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010677, 2007441, 0, -10351.6, -3301.21, 24.6799, 0.421133, 0, 0, 0.209014, 0.977913, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5010677';
DELETE FROM game_event_gameobject WHERE guid = '5010677';
DELETE FROM gameobject_battleground WHERE guid = '5010677';

-- Changes by BOYO
REPLACE INTO `gameobject` VALUES ( 5010678, 2001792, 451, 16878.2, 15660.7, 70.4345, 6.09611, 0, 0, 0.0934007, -0.995629, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010678, 2001792, 451, 16878.2, 15660.7, 70.4345, 3.02129, 0, 0, 0.998191, 0.0601175, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010678, 2001792, 451, 16879.2, 15660.7, 70.4345, 3.02129, 0, 0, 0.998191, 0.0601175, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010678, 2001792, 451, 16880.2, 15660.7, 70.4345, 3.02129, 0, 0, 0.998191, 0.0601175, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010678, 2001792, 451, 16880.2, 15661.7, 70.4345, 3.02129, 0, 0, 0.998191, 0.0601175, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010678, 2001792, 451, 16880.2, 15662.7, 70.4345, 3.02129, 0, 0, 0.998191, 0.0601175, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010678, 2001792, 451, 16880.2, 15663.7, 70.4345, 3.02129, 0, 0, 0.998191, 0.0601175, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010678, 2001792, 451, 16880.2, 15664.7, 70.4345, 3.02129, 0, 0, 0.998191, 0.0601175, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010678, 2001792, 451, 16880.2, 15665.7, 70.4345, 3.02129, 0, 0, 0.998191, 0.0601175, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010678, 2001792, 451, 16881.2, 15665.7, 70.4345, 3.02129, 0, 0, 0.998191, 0.0601175, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010678, 2001792, 451, 16882.2, 15665.7, 70.4345, 3.02129, 0, 0, 0.998191, 0.0601175, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010678, 2001792, 451, 16883.2, 15665.7, 70.4345, 3.02129, 0, 0, 0.998191, 0.0601175, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010678, 2001792, 451, 16884.2, 15665.7, 70.4345, 3.02129, 0, 0, 0.998191, 0.0601175, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010678, 2001792, 451, 16885.2, 15665.7, 70.4345, 3.02129, 0, 0, 0.998191, 0.0601175, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010678, 2001792, 451, 16885.2, 15665.7, 72.2345, 3.02129, 0, 0, 0.998191, 0.0601175, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010678, 2001792, 451, 16885.2, 15665.7, 70.4345, 3.02129, 0, 0, 0.998191, 0.0601175, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010678, 2001792, 451, 16885.2, 15665.7, 68.6345, 3.02129, 0, 0, 0.998191, 0.0601175, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010678, 2001792, 451, 16885.4, 15665.7, 68.6345, 3.02129, 0, 0, 0.998191, 0.0601175, 300, 300, 100, 1, 0, 0);

-- Changes by COUN
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 72.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 72.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 73.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 74.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 75.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 74.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 73.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 72.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 70.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 72.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 73.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 74.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 75.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 76.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 75.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 74.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 73.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 72.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15697.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15698.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15697.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15696.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15695.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16913.4, 15695.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16914.4, 15695.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16913.4, 15695.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16912.4, 15695.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16911.4, 15695.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16910.4, 15695.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16909.4, 15695.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16908.4, 15695.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16907.4, 15695.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16906.4, 15695.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16905.4, 15695.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16904.4, 15695.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16903.4, 15695.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16902.4, 15695.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16901.4, 15695.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010679, 2007558, 451, 16900.4, 15695.8, 71.2448, 5.44894, 0, 0, 0.405131, -0.914259, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010680, 2003361, 451, 16905.6, 15696.4, 71.718, 1.6217, 0, 0, 0.724872, 0.688883, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010680, 2003361, 451, 16905.6, 15696.4, 71.518, 1.6217, 0, 0, 0.724872, 0.688883, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010680, 2003361, 451, 16905.6, 15696.4, 71.318, 1.6217, 0, 0, 0.724872, 0.688883, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010681, 2000162, 451, 16909, 15689.6, 70.9367, 5.5212, 0, 0, 0.371841, -0.928296, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5010681';
DELETE FROM game_event_gameobject WHERE guid = '5010681';
DELETE FROM gameobject_battleground WHERE guid = '5010681';
REPLACE INTO `gameobject` VALUES ( 5010682, 2003848, 451, 16912.3, 15689.5, 71.0979, 0.743621, 0, 0, 0.363303, 0.931671, 300, 300, 100, 1, 0, 0);

-- Changes by BOYO
REPLACE INTO `gameobject` VALUES ( 5010682, 2003848, 451, 16912.3, 15689.5, 71.0979, 0.743621, 0, 0, 0.363303, 0.931671, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010682, 2003848, 451, 16912.3, 15689.5, 71.0979, 0.743621, 0, 0, 0.363303, 0.931671, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010682, 2003848, 451, 16912.3, 15689.5, 71.0979, 0.743621, 0, 0, 0.363303, 0.931671, 300, 300, 100, 1, 0, 0);

-- Changes by COUN
REPLACE INTO `gameobject` VALUES ( 5010683, 149038, 451, 16912.3, 15672.3, 69.1421, 2.35624, 0, 0, 0.923889, 0.38266, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010683, 149038, 451, 16912.3, 15672.5, 69.1421, 2.35624, 0, 0, 0.923889, 0.38266, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010683, 149038, 451, 16912.3, 15672.3, 69.1421, 2.35624, 0, 0, 0.923889, 0.38266, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5010683, 149038, 451, 16912.3, 15672.3, 68.9421, 2.35624, 0, 0, 0.923889, 0.38266, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5010683';
DELETE FROM game_event_gameobject WHERE guid = '5010683';
DELETE FROM gameobject_battleground WHERE guid = '5010683';

-- Changes by BOYO
REPLACE INTO `gameobject` VALUES ( 5010684, 176749, 451, 16916.5, 15671.5, 69.1814, 2.37648, 0, 0, 0.927714, 0.373293, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5010684';
DELETE FROM game_event_gameobject WHERE guid = '5010684';
DELETE FROM gameobject_battleground WHERE guid = '5010684';

-- Changes by COUN
DELETE FROM gameobject WHERE guid = '5010682';
DELETE FROM game_event_gameobject WHERE guid = '5010682';
DELETE FROM gameobject_battleground WHERE guid = '5010682';
DELETE FROM gameobject WHERE guid = '5010680';
DELETE FROM game_event_gameobject WHERE guid = '5010680';
DELETE FROM gameobject_battleground WHERE guid = '5010680';
DELETE FROM gameobject WHERE guid = '5010679';
DELETE FROM game_event_gameobject WHERE guid = '5010679';
DELETE FROM gameobject_battleground WHERE guid = '5010679';

-- Changes by BOYO
DELETE FROM gameobject WHERE guid = '5010678';
DELETE FROM game_event_gameobject WHERE guid = '5010678';
DELETE FROM gameobject_battleground WHERE guid = '5010678';
