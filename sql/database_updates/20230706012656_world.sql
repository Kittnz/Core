
-- Changes by VOJI
DELETE FROM creature WHERE guid=2568918;
DELETE FROM creature_addon WHERE guid=2568918;
DELETE FROM creature_movement WHERE id=2568918;
DELETE FROM game_event_creature WHERE guid=2568918;
DELETE FROM game_event_creature_data WHERE guid=2568918;
DELETE FROM creature_battleground WHERE guid=2568918;

-- Changes by TAMMO
REPLACE INTO `creature` VALUES (2577969,80216,0,0,0,0,4317.7,-2859.2,3.45551,5.50519,120,120,0,100,100,0,0,0);
UPDATE `creature` SET `position_x` = 4317.765137, `position_y` = -2859.378906, `position_z` = 3.405743, `orientation` = 5.067662 WHERE `guid` = 2577969;
UPDATE `creature` SET `position_x` = 4317.708008, `position_y` = -2859.416016, `position_z` = 3.396971, `orientation` = 5.106071 WHERE `guid` = 2577969;
UPDATE `creature` SET `position_x` = 4317.708008, `position_y` = -2859.416016, `position_z` = 3.386971, `orientation` = 4.795841 WHERE `guid` = 2577969;

-- Changes by SHANG
REPLACE INTO `creature` VALUES (2577970,61575,0,0,0,0,2298.59,-5251.73,83.7061,1.15153,120,120,0,100,100,0,0,0);
DELETE FROM creature WHERE guid=2577970;
DELETE FROM creature_addon WHERE guid=2577970;
DELETE FROM creature_movement WHERE id=2577970;
DELETE FROM game_event_creature WHERE guid=2577970;
DELETE FROM game_event_creature_data WHERE guid=2577970;
DELETE FROM creature_battleground WHERE guid=2577970;
REPLACE INTO `creature` VALUES (2577971,61576,0,0,0,0,1869.75,-4462.94,73.9879,0.796386,120,120,0,100,100,0,0,0);
UPDATE `creature` SET `position_x` = 1857.434692, `position_y` = -4521.032227, `position_z` = 76.016197, `orientation` = 2.638147 WHERE `guid` = 2577971;
REPLACE INTO `creature` VALUES (2577972,13958,0,0,0,0,2839.62,-3981.2,103.514,0.604444,120,120,5,100,100,1,0,0);
DELETE FROM creature WHERE guid=2577972;
DELETE FROM creature_addon WHERE guid=2577972;
DELETE FROM creature_movement WHERE id=2577972;
DELETE FROM game_event_creature WHERE guid=2577972;
DELETE FROM game_event_creature_data WHERE guid=2577972;
DELETE FROM creature_battleground WHERE guid=2577972;
REPLACE INTO `creature` VALUES (2577973,10425,0,0,0,0,2839.89,-3979.2,103.948,1.11103,120,120,5,100,100,1,0,0);
DELETE FROM creature WHERE guid=2577973;
DELETE FROM creature_addon WHERE guid=2577973;
DELETE FROM creature_movement WHERE id=2577973;
DELETE FROM game_event_creature WHERE guid=2577973;
DELETE FROM game_event_creature_data WHERE guid=2577973;
DELETE FROM creature_battleground WHERE guid=2577973;
REPLACE INTO `creature` VALUES (2577974,10426,0,0,0,0,2964.95,-4044.16,102.868,5.13462,120,120,5,100,100,1,0,0);
DELETE FROM creature WHERE guid=2577974;
DELETE FROM creature_addon WHERE guid=2577974;
DELETE FROM creature_movement WHERE id=2577974;
DELETE FROM game_event_creature WHERE guid=2577974;
DELETE FROM game_event_creature_data WHERE guid=2577974;
DELETE FROM creature_battleground WHERE guid=2577974;
REPLACE INTO `creature` VALUES (2577975,10418,0,0,0,0,2964.95,-4044.16,102.868,5.13462,120,120,5,100,100,1,0,0);
DELETE FROM creature WHERE guid=2577975;
DELETE FROM creature_addon WHERE guid=2577975;
DELETE FROM creature_movement WHERE id=2577975;
DELETE FROM game_event_creature WHERE guid=2577975;
DELETE FROM game_event_creature_data WHERE guid=2577975;
DELETE FROM creature_battleground WHERE guid=2577975;
REPLACE INTO `creature` VALUES (2577976,10991,0,0,0,0,3018.33,-4304.74,98.0954,4.87544,120,120,5,100,100,1,0,0);
DELETE FROM creature WHERE guid=2577976;
DELETE FROM creature_addon WHERE guid=2577976;
DELETE FROM creature_movement WHERE id=2577976;
DELETE FROM game_event_creature WHERE guid=2577976;
DELETE FROM game_event_creature_data WHERE guid=2577976;
DELETE FROM creature_battleground WHERE guid=2577976;
REPLACE INTO `creature` VALUES (2577977,11840,0,0,0,0,3018.33,-4304.74,98.0954,4.87544,120,120,5,100,100,1,0,0);
DELETE FROM creature WHERE guid=2577977;
DELETE FROM creature_addon WHERE guid=2577977;
DELETE FROM creature_movement WHERE id=2577977;
DELETE FROM game_event_creature WHERE guid=2577977;
DELETE FROM game_event_creature_data WHERE guid=2577977;
DELETE FROM creature_battleground WHERE guid=2577977;
