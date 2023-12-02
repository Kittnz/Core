
-- Changes by DRAGU
REPLACE INTO `creature` VALUES (2581311,61794,0,0,0,1,318.677,-7628,87.1681,2.75431,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2581312,61793,0,0,0,1,-149.114,-7874.69,35.9685,5.20328,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2581313,61792,0,0,0,1,-592.492,-6869.34,-12.0088,5.71434,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2581314,60960,0,0,0,1,-472.175,-7125.86,35.4183,5.15502,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2581314;
DELETE FROM creature_addon WHERE guid=2581314;
DELETE FROM creature_movement WHERE id=2581314;
DELETE FROM game_event_creature WHERE guid=2581314;
DELETE FROM game_event_creature_data WHERE guid=2581314;
DELETE FROM creature_battleground WHERE guid=2581314;
REPLACE INTO `creature` VALUES (2581315,60960,0,0,0,1,-395.305,-7090.9,34.1732,0.811699,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2581315;
DELETE FROM creature_addon WHERE guid=2581315;
DELETE FROM creature_movement WHERE id=2581315;
DELETE FROM game_event_creature WHERE guid=2581315;
DELETE FROM game_event_creature_data WHERE guid=2581315;
DELETE FROM creature_battleground WHERE guid=2581315;
REPLACE INTO `gameobject` VALUES ( 5017347, 1000275, 1, 1383.83, 1737.64, 143.71, 1.83722, 0, 0, 0.794759, 0.606925, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5017347';
DELETE FROM game_event_gameobject WHERE guid = '5017347';
DELETE FROM gameobject_battleground WHERE guid = '5017347';
REPLACE INTO `gameobject` VALUES ( 5017348, 1000275, 1, 1334.87, 1696.93, 142.352, 2.86764, 0, 0, 0.990633, 0.136549, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017348, 1000275, 1, 1334.87, 1696.93, 142.352, 1.90072, 0, 0, 0.813625, 0.58139, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5017348';
DELETE FROM game_event_gameobject WHERE guid = '5017348';
DELETE FROM gameobject_battleground WHERE guid = '5017348';

-- Changes by WILLBERG
REPLACE INTO `creature` VALUES (2581316,7559,0,0,0,0,3303.89,-2464.1,107.271,5.91877,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2581317,7559,0,0,0,0,3305.34,-2465.72,107.262,2.40215,120,120,0,100,100,0,0,0);
