
-- Changes by SHANG
REPLACE INTO `creature` VALUES (2574581,61255,0,0,0,532,-10983.5,-1885.14,81.7296,4.59265,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2574582,61256,0,0,0,532,-10983.6,-1887.85,81.7296,4.5732,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2574583,307,0,0,0,532,-10899.7,-1848.85,93.6721,5.06093,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2574583;
DELETE FROM creature_addon WHERE guid=2574583;
DELETE FROM creature_movement WHERE id=2574583;
DELETE FROM game_event_creature WHERE guid=2574583;
DELETE FROM game_event_creature_data WHERE guid=2574583;
DELETE FROM creature_battleground WHERE guid=2574583;
REPLACE INTO `creature` VALUES (2574584,8883,0,0,0,532,-10900.3,-1847.39,93.6102,5.06093,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2574584;
DELETE FROM creature_addon WHERE guid=2574584;
DELETE FROM creature_movement WHERE id=2574584;
DELETE FROM game_event_creature WHERE guid=2574584;
DELETE FROM game_event_creature_data WHERE guid=2574584;
DELETE FROM creature_battleground WHERE guid=2574584;
