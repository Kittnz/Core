
-- Changes by TAMMO
REPLACE INTO `creature` VALUES (2573706,81049,0,0,0,813,-2623.12,1172.17,57.416,3.36672,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2573707,50035,0,0,0,813,-2624.22,1172.27,57.2502,0.138734,120,120,0,100,100,0,0,0);
UPDATE creature SET position_x = '-2624.389404', position_y = '1172.160522', position_z = '57.211205', orientation = '0.108890' WHERE guid = '2573707';
REPLACE INTO `creature` VALUES (2573707,50035,0,0,0,813,-2624.22,1172.27,57.2502,0.138734,300,300,0,100,100,0,128,0);
UPDATE creature SET position_x = '-2623.459717', position_y = '1172.259888', position_z = '57.362045', orientation = '0.187431' WHERE guid = '2573707';
DELETE FROM creature WHERE guid=2573707;
DELETE FROM creature_addon WHERE guid=2573707;
DELETE FROM creature_movement WHERE id=2573707;
DELETE FROM game_event_creature WHERE guid=2573707;
DELETE FROM game_event_creature_data WHERE guid=2573707;
DELETE FROM creature_battleground WHERE guid=2573707;
REPLACE INTO `creature` VALUES (2573708,50035,0,0,0,813,-2623.88,1172.18,57.2872,0.187431,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2573708,50035,0,0,0,813,-2623.88,1172.18,57.2872,0.187431,300,300,0,100,100,0,128,0);
DELETE FROM creature WHERE guid=2573708;
DELETE FROM creature_addon WHERE guid=2573708;
DELETE FROM creature_movement WHERE id=2573708;
DELETE FROM game_event_creature WHERE guid=2573708;
DELETE FROM game_event_creature_data WHERE guid=2573708;
DELETE FROM creature_battleground WHERE guid=2573708;
DELETE FROM creature WHERE guid=2573706;
DELETE FROM creature_addon WHERE guid=2573706;
DELETE FROM creature_movement WHERE id=2573706;
DELETE FROM game_event_creature WHERE guid=2573706;
DELETE FROM game_event_creature_data WHERE guid=2573706;
DELETE FROM creature_battleground WHERE guid=2573706;
REPLACE INTO `creature` VALUES (2573709,80237,0,0,0,813,-2680.29,1136.37,52.1799,5.28702,120,120,0,100,100,0,0,0);
UPDATE creature SET position_x = '-2680.316162', position_y = '1136.770020', position_z = '52.173180', orientation = '4.726243' WHERE guid = '2573709';
UPDATE creature SET position_x = '-2675.207764', position_y = '1141.996216', position_z = '54.969097', orientation = '3.887438' WHERE guid = '2573709';
DELETE FROM creature WHERE guid=2573709;
DELETE FROM creature_addon WHERE guid=2573709;
DELETE FROM creature_movement WHERE id=2573709;
DELETE FROM game_event_creature WHERE guid=2573709;
DELETE FROM game_event_creature_data WHERE guid=2573709;
DELETE FROM creature_battleground WHERE guid=2573709;
