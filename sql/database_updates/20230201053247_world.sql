
-- Changes by JOE
DELETE FROM gameobject WHERE guid = '40024';
DELETE FROM game_event_gameobject WHERE guid = '40024';
DELETE FROM gameobject_battleground WHERE guid = '40024';
DELETE FROM gameobject WHERE guid = '40023';
DELETE FROM game_event_gameobject WHERE guid = '40023';
DELETE FROM gameobject_battleground WHERE guid = '40023';
REPLACE INTO `creature` VALUES (2574448,61027,0,0,0,1,1839.95,2077.24,69.8282,3.4524,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2574449,61027,0,0,0,1,1839.24,2041.56,69.6245,2.92069,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2574450,61027,0,0,0,1,1840.05,2023.43,69.2561,5.2651,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2574451,61027,0,0,0,1,1809.24,2027.13,65.8065,0.86294,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2574452,61027,0,0,0,1,1804.24,2059.51,75.2196,0.972896,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2574453,61027,0,0,0,1,1795.9,2090.57,75.1625,1.11034,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2574454,61027,0,0,0,1,1812.2,2101.12,69.8656,4.45614,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2574455,61027,0,0,0,1,1855.48,2052.84,70.2595,6.23112,120,120,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2574449,61027,0,0,0,1,1839.24,2041.56,69.6245,2.92069,300,300,10,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574449,61027,0,0,0,1,1839.24,2041.56,69.6245,2.92069,300,300,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574455,61027,0,0,0,1,1855.48,2052.84,70.2595,6.23112,300,300,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574448,61027,0,0,0,1,1839.95,2077.24,69.8282,3.4524,300,300,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574448,61027,0,0,0,1,1839.95,2077.24,69.8282,3.4524,300,300,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574454,61027,0,0,0,1,1812.2,2101.12,69.8656,4.45614,300,300,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574453,61027,0,0,0,1,1795.9,2090.57,75.1625,1.11034,300,300,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574452,61027,0,0,0,1,1804.24,2059.51,75.2196,0.972896,300,300,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574451,61027,0,0,0,1,1809.24,2027.13,65.8065,0.86294,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574450,61027,0,0,0,1,1840.05,2023.43,69.2561,5.2651,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574449,61027,0,0,0,1,1839.24,2041.56,69.6245,2.92069,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574455,61027,0,0,0,1,1855.48,2052.84,70.2595,6.23112,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574448,61027,0,0,0,1,1839.95,2077.24,69.8282,3.4524,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574452,61027,0,0,0,1,1804.24,2059.51,75.2196,0.972896,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574453,61027,0,0,0,1,1795.9,2090.57,75.1625,1.11034,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574454,61027,0,0,0,1,1812.2,2101.12,69.8656,4.45614,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574449,61027,0,0,0,1,1839.24,2041.56,69.6245,2.92069,300,300,0,100,100,0,0,0);
REPLACE INTO `creature` VALUES (2574454,61027,0,0,0,1,1812.2,2101.12,69.8656,4.45614,300,300,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574453,61027,0,0,0,1,1795.9,2090.57,75.1625,1.11034,300,300,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574448,61027,0,0,0,1,1839.95,2077.24,69.8282,3.4524,300,300,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574450,61027,0,0,0,1,1839.05,2041.01,69.6621,4.69961,300,300,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2574451,61027,0,0,0,1,1809.24,2027.13,65.8065,0.86294,300,300,5,100,100,1,0,0);

-- Changes by TINYFIN
DELETE FROM creature WHERE guid=2570061;
DELETE FROM creature_addon WHERE guid=2570061;
DELETE FROM creature_movement WHERE id=2570061;
DELETE FROM game_event_creature WHERE guid=2570061;
DELETE FROM game_event_creature_data WHERE guid=2570061;
DELETE FROM creature_battleground WHERE guid=2570061;
