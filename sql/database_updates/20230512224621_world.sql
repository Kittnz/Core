
-- Changes by SHANG
REPLACE INTO `creature` VALUES (2577000,60742,0,0,0,1,5043.87,-1850.89,1329.78,1.75895,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2577000;
DELETE FROM creature_addon WHERE guid=2577000;
DELETE FROM creature_movement WHERE id=2577000;
DELETE FROM game_event_creature WHERE guid=2577000;
DELETE FROM game_event_creature_data WHERE guid=2577000;
DELETE FROM creature_battleground WHERE guid=2577000;
REPLACE INTO `creature` VALUES (2577001,61212,0,0,0,1,5044.41,-1853.74,1329.9,1.75895,120,120,0,100,100,0,0,0);
