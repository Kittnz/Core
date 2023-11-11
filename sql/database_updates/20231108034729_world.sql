
-- Changes by WILLBERG
REPLACE INTO `creature` VALUES (2580111,7559,0,0,0,0,-5638.85,-503.024,398.273,2.05171,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2580111;
DELETE FROM creature_addon WHERE guid=2580111;
DELETE FROM creature_movement WHERE id=2580111;
DELETE FROM game_event_creature WHERE guid=2580111;
DELETE FROM game_event_creature_data WHERE guid=2580111;
DELETE FROM creature_battleground WHERE guid=2580111;
REPLACE INTO `creature` VALUES (2580112,7559,0,0,0,0,-5641.51,-501.683,396.67,1.56988,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2580112;
DELETE FROM creature_addon WHERE guid=2580112;
DELETE FROM creature_movement WHERE id=2580112;
DELETE FROM game_event_creature WHERE guid=2580112;
DELETE FROM game_event_creature_data WHERE guid=2580112;
DELETE FROM creature_battleground WHERE guid=2580112;
REPLACE INTO `creature` VALUES (2580113,7559,0,0,0,0,-5637.74,-496.774,396.669,3.84914,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2580114,7559,0,0,0,0,-5638.36,-499.532,396.669,3.30918,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2580114;
DELETE FROM creature_addon WHERE guid=2580114;
DELETE FROM creature_movement WHERE id=2580114;
DELETE FROM game_event_creature WHERE guid=2580114;
DELETE FROM game_event_creature_data WHERE guid=2580114;
DELETE FROM creature_battleground WHERE guid=2580114;

-- Changes by SHANG
UPDATE `creature` SET `position_x` = -267.908936, `position_y` = -7755.450195, `position_z` = 40.996395, `orientation` = 1.106992 WHERE `guid` = 2579660;

-- Changes by JOE
REPLACE INTO `gameobject` VALUES ( 49308, 180502, 1, -6945.62, 1186.37, 10.2785, 0, 0, 0, 0, 1, 900, 900, 100, 1, 0, 0);

-- Changes by SHANG
DELETE FROM creature WHERE guid=2579337;
DELETE FROM creature_addon WHERE guid=2579337;
DELETE FROM creature_movement WHERE id=2579337;
DELETE FROM game_event_creature WHERE guid=2579337;
DELETE FROM game_event_creature_data WHERE guid=2579337;
DELETE FROM creature_battleground WHERE guid=2579337;
