
-- Changes by TORTA
DELETE FROM creature WHERE guid=2561215;
DELETE FROM creature_addon WHERE guid=2561215;
DELETE FROM creature_movement WHERE id=2561215;
DELETE FROM game_event_creature WHERE guid=2561215;
DELETE FROM game_event_creature_data WHERE guid=2561215;
DELETE FROM creature_battleground WHERE guid=2561215;

-- Changes by SHANG
DELETE FROM creature WHERE guid=73954;
DELETE FROM creature_addon WHERE guid=73954;
DELETE FROM creature_movement WHERE id=73954;
DELETE FROM game_event_creature WHERE guid=73954;
DELETE FROM game_event_creature_data WHERE guid=73954;
DELETE FROM creature_battleground WHERE guid=73954;
DELETE FROM creature WHERE guid=74062;
DELETE FROM creature_addon WHERE guid=74062;
DELETE FROM creature_movement WHERE id=74062;
DELETE FROM game_event_creature WHERE guid=74062;
DELETE FROM game_event_creature_data WHERE guid=74062;
DELETE FROM creature_battleground WHERE guid=74062;
DELETE FROM creature WHERE guid=73962;
DELETE FROM creature_addon WHERE guid=73962;
DELETE FROM creature_movement WHERE id=73962;
DELETE FROM game_event_creature WHERE guid=73962;
DELETE FROM game_event_creature_data WHERE guid=73962;
DELETE FROM creature_battleground WHERE guid=73962;
DELETE FROM creature WHERE guid=74058;
DELETE FROM creature_addon WHERE guid=74058;
DELETE FROM creature_movement WHERE id=74058;
DELETE FROM game_event_creature WHERE guid=74058;
DELETE FROM game_event_creature_data WHERE guid=74058;
DELETE FROM creature_battleground WHERE guid=74058;
DELETE FROM creature WHERE guid=74059;
DELETE FROM creature_addon WHERE guid=74059;
DELETE FROM creature_movement WHERE id=74059;
DELETE FROM game_event_creature WHERE guid=74059;
DELETE FROM game_event_creature_data WHERE guid=74059;
DELETE FROM creature_battleground WHERE guid=74059;
DELETE FROM creature WHERE guid=74057;
DELETE FROM creature_addon WHERE guid=74057;
DELETE FROM creature_movement WHERE id=74057;
DELETE FROM game_event_creature WHERE guid=74057;
DELETE FROM game_event_creature_data WHERE guid=74057;
DELETE FROM creature_battleground WHERE guid=74057;
DELETE FROM creature WHERE guid=74029;
DELETE FROM creature_addon WHERE guid=74029;
DELETE FROM creature_movement WHERE id=74029;
DELETE FROM game_event_creature WHERE guid=74029;
DELETE FROM game_event_creature_data WHERE guid=74029;
DELETE FROM creature_battleground WHERE guid=74029;
UPDATE creature SET position_x = '-3633.643066', position_y = '-3406.756104', position_z = '37.199360', orientation = '2.419388' WHERE guid = '30977';
REPLACE INTO `creature` VALUES (30977,2914,2914,0,0,1,-3633.64,-3406.76,37.1994,2.41939,300,300,10,100,0,1,0,0);
REPLACE INTO `gameobject` VALUES ( 5009634, 2010694, 1, -3740.1, -3421.37, 37.0116, 3.39249, 0, 0, 0.992142, -0.125119, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5009634';
DELETE FROM game_event_gameobject WHERE guid = '5009634';
DELETE FROM gameobject_battleground WHERE guid = '5009634';
REPLACE INTO `gameobject` VALUES ( 5009635, 2010693, 1, -3740.1, -3421.37, 37.0116, 3.39249, 0, 0, 0.992142, -0.125119, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5009635';
DELETE FROM game_event_gameobject WHERE guid = '5009635';
DELETE FROM gameobject_battleground WHERE guid = '5009635';
DELETE FROM creature WHERE guid=73394;
DELETE FROM creature_addon WHERE guid=73394;
DELETE FROM creature_movement WHERE id=73394;
DELETE FROM game_event_creature WHERE guid=73394;
DELETE FROM game_event_creature_data WHERE guid=73394;
DELETE FROM creature_battleground WHERE guid=73394;
DELETE FROM creature WHERE guid=73389;
DELETE FROM creature_addon WHERE guid=73389;
DELETE FROM creature_movement WHERE id=73389;
DELETE FROM game_event_creature WHERE guid=73389;
DELETE FROM game_event_creature_data WHERE guid=73389;
DELETE FROM creature_battleground WHERE guid=73389;
DELETE FROM creature WHERE guid=73387;
DELETE FROM creature_addon WHERE guid=73387;
DELETE FROM creature_movement WHERE id=73387;
DELETE FROM game_event_creature WHERE guid=73387;
DELETE FROM game_event_creature_data WHERE guid=73387;
DELETE FROM creature_battleground WHERE guid=73387;
DELETE FROM creature WHERE guid=73391;
DELETE FROM creature_addon WHERE guid=73391;
DELETE FROM creature_movement WHERE id=73391;
DELETE FROM game_event_creature WHERE guid=73391;
DELETE FROM game_event_creature_data WHERE guid=73391;
DELETE FROM creature_battleground WHERE guid=73391;
DELETE FROM creature WHERE guid=73388;
DELETE FROM creature_addon WHERE guid=73388;
DELETE FROM creature_movement WHERE id=73388;
DELETE FROM game_event_creature WHERE guid=73388;
DELETE FROM game_event_creature_data WHERE guid=73388;
DELETE FROM creature_battleground WHERE guid=73388;
DELETE FROM creature WHERE guid=73385;
DELETE FROM creature_addon WHERE guid=73385;
DELETE FROM creature_movement WHERE id=73385;
DELETE FROM game_event_creature WHERE guid=73385;
DELETE FROM game_event_creature_data WHERE guid=73385;
DELETE FROM creature_battleground WHERE guid=73385;
DELETE FROM creature WHERE guid=73386;
DELETE FROM creature_addon WHERE guid=73386;
DELETE FROM creature_movement WHERE id=73386;
DELETE FROM game_event_creature WHERE guid=73386;
DELETE FROM game_event_creature_data WHERE guid=73386;
DELETE FROM creature_battleground WHERE guid=73386;
DELETE FROM creature WHERE guid=73405;
DELETE FROM creature_addon WHERE guid=73405;
DELETE FROM creature_movement WHERE id=73405;
DELETE FROM game_event_creature WHERE guid=73405;
DELETE FROM game_event_creature_data WHERE guid=73405;
DELETE FROM creature_battleground WHERE guid=73405;
UPDATE creature SET position_x = '-2672.686035', position_y = '-3493.599854', position_z = '33.554554', orientation = '4.250914' WHERE guid = '73702';
