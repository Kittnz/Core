
-- Changes by TAMMO
DELETE FROM gameobject WHERE guid = '5012234';
DELETE FROM game_event_gameobject WHERE guid = '5012234';
DELETE FROM gameobject_battleground WHERE guid = '5012234';
REPLACE INTO `gameobject` VALUES ( 5012318, 2000001, 813, -2679.68, 1146.27, 52.99, 2.06552, 0, 0, 0.858715, 0.512453, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5012318, 2000001, 813, -2679.68, 1146.27, 52.99, 2.06552, 0, 0, 0.858715, 0.512453, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '4001298';
DELETE FROM game_event_gameobject WHERE guid = '4001298';
DELETE FROM gameobject_battleground WHERE guid = '4001298';
