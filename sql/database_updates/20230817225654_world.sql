
-- Changes by QUARRIONPTR
REPLACE INTO `creature` VALUES (2578694,10440,0,0,0,0,1590.15,-5730.48,121.68,2.05753,120,120,5,100,100,1,0,0);
UPDATE creature_template SET faction = '21' WHERE entry = '10440';
UPDATE creature_template SET faction = '21' WHERE entry = '10440';
UPDATE creature_template SET faction = '20' WHERE entry = '10440';

-- Changes by DRAGUNOVI
DELETE FROM creature WHERE guid=2564143;
DELETE FROM creature_addon WHERE guid=2564143;
DELETE FROM creature_movement WHERE id=2564143;
DELETE FROM game_event_creature WHERE guid=2564143;
DELETE FROM game_event_creature_data WHERE guid=2564143;
DELETE FROM creature_battleground WHERE guid=2564143;
