
-- Changes by COUN
REPLACE INTO `gameobject` VALUES ( 5010650, 1000373, 1, -7562.36, -2366.75, -179.645, 6.18877, 0, 0, 0.0471924, -0.998886, 300, 300, 100, 1, 1, 200);
REPLACE INTO `game_tele` (`id`, `position_x`, `position_y`, `position_z`, `orientation`, `map`, `name`) VALUES (855,-7594.107910,-2351.300293,-188.580887,2.125116,1,'hardknocks');
REPLACE INTO `gameobject` VALUES ( 5010651, 1000373, 1, -54.2158, -3544.66, 27.3126, 2.91694, 0, 0, 0.993698, 0.112089, 300, 300, 100, 1, 1, 200);

-- Changes by WILL
REPLACE INTO `creature` VALUES (2572560,50534,0,0,0,1,-6983.41,-4816.34,9.17795,5.00651,25,25,0,100,100,0,0,0);
UPDATE creature SET position_x = '-6983.915039', position_y = '-4815.628906', position_z = '9.124573', orientation = '5.183225' WHERE guid = '2572560';
DELETE FROM creature WHERE guid=2572560;
DELETE FROM creature_addon WHERE guid=2572560;
DELETE FROM creature_movement WHERE id=2572560;
DELETE FROM game_event_creature WHERE guid=2572560;
DELETE FROM game_event_creature_data WHERE guid=2572560;
DELETE FROM creature_battleground WHERE guid=2572560;
REPLACE INTO `creature` VALUES (2572561,50534,0,0,0,1,-6982.95,-4816.22,9.11633,4.66094,25,25,0,100,100,0,0,0);
