
-- Changes by JOE
REPLACE INTO `gameobject` VALUES ( 364871, 180905, 0, -8827.44, 629.039, 95.2552, 3.12412, 0, 0, 0.999962, 0.00873464, 120, 120, 255, 0, 0, 0);
REPLACE INTO `gameobject` VALUES ( 364869, 180905, 0, -8826.96, 629.81, 95.2083, 3.6652, 0, 0, -0.965925, 0.258821, 120, 120, 255, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 364882, 180905, 0, -8826.96, 629.81, 95.2083, 0.418879, 0, 0, 0.207912, 0.978148, 120, 120, 255, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 364869, 180905, 0, -8826.25, 629.471, 95.2549, 3.6652, 0, 0, -0.965925, 0.258821, 120, 120, 255, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 363829, 180699, 0, -8850.57, 668.362, 97.7822, 5.37562, 0, 0, -0.438371, 0.898794, 0, 0, 255, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 363827, 180699, 0, -8855.83, 664.344, 97.3201, 5.35816, 0, 0, -0.446198, 0.894934, 0, 0, 255, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 363834, 180698, 0, -8853.03, 665.896, 97.5917, 5.41052, 0, 0, -0.422618, 0.906308, 120, 120, 255, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 363861, 180905, 0, -8852.94, 665.349, 98.7662, 0.890117, 0, 0, 0.43051, 0.902586, 120, 120, 255, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 363809, 180905, 0, -8852.48, 665.91, 98.7662, 0.610863, 0, 0, 0.300705, 0.953717, 120, 120, 255, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 363828, 180905, 0, -8853.64, 665.62, 98.7662, 0, 0, 0, 0, 1, 120, 120, 255, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 363846, 180905, 0, -8852.68, 666.528, 98.7661, 4.66003, 0, 0, -0.725374, 0.688355, 120, 120, 255, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 363856, 180905, 0, -8853.43, 666.312, 98.7664, 4.11898, 0, 0, -0.882947, 0.469473, 120, 120, 255, 1, 0, 0);
UPDATE creature SET position_x = '-8819.912109', position_y = '647.349609', position_z = '94.411621', orientation = '1.695260' WHERE guid = '2561113';
UPDATE creature SET position_x = '-8816.546875', position_y = '648.534058', position_z = '94.408012', orientation = '2.814453' WHERE guid = '2561117';
REPLACE INTO `gameobject` VALUES ( 363859, 180699, 0, -8794.68, 628.109, 94.8941, 2.58308, 0, 0, 0.961261, 0.27564, 0, 0, 255, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 363859, 180699, 0, -8794.68, 628.109, 94.8941, 2.25682, 0, 0, 0.903733, 0.428097, 0, 0, 255, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 363773, 180699, 0, -8832.75, 644.223, 94.798, 4.66003, 0, 0, -0.725374, 0.688355, 0, 0, 255, 1, 0, 0);
UPDATE creature SET position_x = '-8846.916016', position_y = '625.776550', position_z = '94.454506', orientation = '0.344364' WHERE guid = '2558347';
REPLACE INTO `gameobject` VALUES ( 363771, 180699, 0, -8846.4, 629.041, 94.8314, 0.59341, 0, 0, 0.292371, 0.956305, 0, 0, 255, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '363771';
DELETE FROM game_event_gameobject WHERE guid = '363771';
DELETE FROM gameobject_battleground WHERE guid = '363771';
