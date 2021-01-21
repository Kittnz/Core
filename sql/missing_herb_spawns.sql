
-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=-3591.59, `position_y`=-2435.67, `position_z`=87.8097, `orientation`=4.11898, `rotation0`=0, `rotation1`=0, `rotation2`=-0.882947, `rotation3`=0.469473 WHERE `guid`=4196;
UPDATE `gameobject` SET `position_x`=-863.463, `position_y`=-2444.09, `position_z`=64.1538, `orientation`=4.13643, `rotation0`=0, `rotation1`=0, `rotation2`=-0.878817, `rotation3`=0.47716 WHERE `guid`=4105;
UPDATE `gameobject` SET `position_x`=-3611.91, `position_y`=-2615.64, `position_z`=74.1496, `orientation`=2.58308, `rotation0`=0, `rotation1`=0, `rotation2`=0.961261, `rotation3`=0.27564 WHERE `guid`=4218;
UPDATE `gameobject` SET `position_x`=779.101, `position_y`=625.206, `position_z`=128.977, `orientation`=2.05949, `rotation0`=0, `rotation1`=0, `rotation2`=0.857167, `rotation3`=0.515038 WHERE `guid`=4239;
UPDATE `gameobject` SET `position_x`=-5272.45, `position_y`=-1654.83, `position_z`=-38.2928, `orientation`=2.02458, `rotation0`=0, `rotation1`=0, `rotation2`=0.848047, `rotation3`=0.529921 WHERE `guid`=4246;
UPDATE `gameobject` SET `position_x`=-4296.05, `position_y`=-960.712, `position_z`=-38.4282, `orientation`=3.82227, `rotation0`=0, `rotation1`=0, `rotation2`=-0.942641, `rotation3`=0.333808 WHERE `guid`=3924;


INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1084, 1, 'Wild Steelbloom in Badlands', 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1209, 1, 'Wild Steelbloom in Hillsbrad Foothills', 0, 0, 0, 10);


-- Missing spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3629, 1623, 0, -676.339, -2124.9, 58.6958, 1.0472, 0, 0, 0.5, 0.866025, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3629, 1185, 'Wild Steelbloom');


-- Missing spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3601, 1623, 0, -6568.56, -2539.25, 297.132, 3.49067, 0, 0, -0.984807, 0.173652, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3601, 1084, 'Wild Steelbloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3638, 1623, 0, -6550.07, -3412.83, 283.882, 2.35619, 0, 0, 0.92388, 0.382683, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3638, 1084, 'Wild Steelbloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3663, 1623, 0, -6602.11, -2640.38, 268.07, 3.42085, 0, 0, -0.990268, 0.139175, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3663, 1084, 'Wild Steelbloom');


-- Missing spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3626, 1623, 0, -402.397, -1151.77, 74.8978, 1.97222, 0, 0, 0.833885, 0.551938, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3626, 1209, 'Wild Steelbloom');


-- Missing spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3664, 1623, 1, -4292.32, -2272.08, 109.006, 3.4034, 0, 0, -0.991445, 0.130528, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3664, 1168, 'Wild Steelbloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3699, 1623, 1, -3333.73, -1774.43, 115.264, 1.8675, 0, 0, 0.803857, 0.594823, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3699, 1168, 'Wild Steelbloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3723, 1623, 1, -2763.43, -2346.12, 145.385, 3.17653, 0, 0, -0.999847, 0.0174693, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3723, 1168, 'Wild Steelbloom');


-- Missing spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3586, 1623, 0, -3571.57, -2417.75, 75.7175, 1.25664, 0, 0, 0.587785, 0.809017, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3586, 1152, 'Wild Steelbloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3661, 1623, 0, -3517.36, -3438.22, 72.0767, 3.82227, 0, 0, -0.942641, 0.333808, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3661, 1152, 'Wild Steelbloom');




-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=150.503, `position_y`=-3022.87, `position_z`=128.217, `orientation`=1.53589, `rotation0`=0, `rotation1`=0, `rotation2`=0.694658, `rotation3`=0.71934 WHERE `guid`=16213;
UPDATE `gameobject` SET `position_x`=1450.26, `position_y`=-1706.9, `position_z`=69.4751, `orientation`=5.70723, `rotation0`=0, `rotation1`=0, `rotation2`=-0.284015, `rotation3`=0.95882 WHERE `guid`=16205;
UPDATE `gameobject` SET `position_x`=-4645.59, `position_y`=1801.94, `position_z`=93.4592, `orientation`=6.00393, `rotation0`=0, `rotation1`=0, `rotation2`=-0.139173, `rotation3`=0.990268 WHERE `guid`=16267;


INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1223, 1, 'Sungrass in Silithus', 0, 0, 0, 10);


-- Missing spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13692, 142142, 1, 3619.93, -4289.52, 101.905, 1.48353, 0, 0, 0.67559, 0.737278, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13692, 1240, 'Sungrass');


-- Missing spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13684, 142142, 0, 3118.34, -4087.81, 98.5636, 1.13446, 0, 0, 0.537299, 0.843392, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13684, 1320, 'Sungrass');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13686, 142142, 0, 1846.9, -3946.46, 125.684, 3.22886, 0, 0, -0.999048, 0.0436193, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13686, 1320, 'Sungrass');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13687, 142142, 0, 1631.8, -4090.24, 151.421, 6.14356, 0, 0, -0.0697555, 0.997564, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13687, 1320, 'Sungrass');


-- Missing spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13691, 142142, 1, -6965.77, 366.89, 6.02273, 1.41372, 0, 0, 0.649447, 0.760406, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13691, 1223, 'Sungrass');


-- Missing spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13685, 142142, 0, -13.5662, -4215.74, 121.354, 0.785397, 0, 0, 0.382683, 0.92388, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13685, 1250, 'Sungrass');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13688, 142142, 0, 312.959, -3978.31, 125.032, 1.51844, 0, 0, 0.688354, 0.725375, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13688, 1250, 'Sungrass');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13689, 142142, 0, 191.367, -4060.45, 119.505, 4.27606, 0, 0, -0.843391, 0.5373, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13689, 1250, 'Sungrass');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13690, 142142, 0, -223.719, -3525.59, 144.542, 1.39626, 0, 0, 0.642787, 0.766045, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13690, 1250, 'Sungrass');


INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (999, 1, 'Stranglekelp in Alterac Mountains', 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1000, 1, 'Stranglekelp in The Hinterlands', 0, 0, 0, 10);


-- Missing spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7398, 2045, 0, 1309.05, 5.4962, -13.3285, 6.02139, 0, 0, -0.130526, 0.991445, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7398, 999, 'Stranglekelp');


-- Missing spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7537, 2045, 1, 6615.66, 601.808, -13.2324, 1.13446, 0, 0, 0.537299, 0.843392, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7537, 1322, 'Stranglekelp');


-- Missing spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7401, 2045, 0, -1081.05, -713.958, -3.80395, 1.15192, 0, 0, 0.544639, 0.838671, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7401, 1123, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7402, 2045, 0, -1742.04, -1111.16, -50.7961, 5.28835, 0, 0, -0.477158, 0.878817, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7402, 1123, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7404, 2045, 0, -1109.09, -484.259, -42.2045, 2.07694, 0, 0, 0.861628, 0.507539, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7404, 1123, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7405, 2045, 0, -1548, -988.021, -39.3629, 1.0821, 0, 0, 0.515037, 0.857168, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7405, 1123, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7410, 2045, 0, -1698.15, -1045.93, -42.8583, 0.977383, 0, 0, 0.469471, 0.882948, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7410, 1123, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7411, 2045, 0, -1116.11, -189.95, -3.40162, 3.3685, 0, 0, -0.993571, 0.113208, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7411, 1123, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7446, 2045, 0, -1174.06, -777.817, -5.35076, 3.15906, 0, 0, -0.999962, 0.00873464, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7446, 1123, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7462, 2045, 0, -1181.64, 45.6704, -7.18421, 3.24635, 0, 0, -0.998629, 0.0523532, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7462, 1123, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7463, 2045, 0, -1153.73, -439.879, -41.0976, 5.34071, 0, 0, -0.45399, 0.891007, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7463, 1123, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7468, 2045, 0, -1141.71, -545.092, -41.2592, 3.56047, 0, 0, -0.978148, 0.207912, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7468, 1123, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7471, 2045, 0, -1677.83, -1121.21, -3.60723, 5.16618, 0, 0, -0.529919, 0.848048, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7471, 1123, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7478, 2045, 0, -1216.22, -648.269, -43.7294, 2.1293, 0, 0, 0.874619, 0.48481, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7478, 1123, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7481, 2045, 0, -1051.87, -408.556, -4.19282, 3.38594, 0, 0, -0.992546, 0.12187, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7481, 1123, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7486, 2045, 0, -1212.53, -211.741, -42.0522, 5.53269, 0, 0, -0.366501, 0.930418, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7486, 1123, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7487, 2045, 0, -1620.5, -1026.73, -40.5638, 2.65289, 0, 0, 0.970295, 0.241925, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7487, 1123, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7492, 2045, 0, -1169.77, -249.171, -33.6806, 5.74214, 0, 0, -0.267238, 0.963631, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7492, 1123, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7493, 2045, 0, -1516.17, -1054.35, -7.40376, 4.50295, 0, 0, -0.777145, 0.629321, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7493, 1123, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7528, 2045, 0, -1352.52, -948.247, -6.47859, 5.93412, 0, 0, -0.173648, 0.984808, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7528, 1123, 'Stranglekelp');


-- Missing spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7459, 2045, 0, 628.255, 736.648, 19.9124, 4.41568, 0, 0, -0.803857, 0.594823, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7459, 1065, 'Stranglekelp');


-- Missing spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7403, 2045, 0, -12503.7, 231.236, -16.9338, 0.645772, 0, 0, 0.317305, 0.948324, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7403, 1171, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7438, 2045, 0, -13574.2, 813.761, -10.0162, 3.03684, 0, 0, 0.998629, 0.0523532, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7438, 1171, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7495, 2045, 0, -14065.5, 473.215, -14.4825, 0.244346, 0, 0, 0.121869, 0.992546, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7495, 1171, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7502, 2045, 0, -13603.6, 419.877, -33.2804, 2.04204, 0, 0, 0.85264, 0.522499, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7502, 1171, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7504, 2045, 0, -13113.1, 803.91, -38.3111, 1.5708, 0, 0, 0.707107, 0.707107, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7504, 1171, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7509, 2045, 0, -12549.2, 534.619, -47.1639, 5.42798, 0, 0, -0.414693, 0.909962, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7509, 1171, 'Stranglekelp');


-- Missing spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7539, 2045, 1, -1456.03, -3980.45, -5.35221, 2.30383, 0, 0, 0.913545, 0.406738, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7539, 1064, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7556, 2045, 1, -1915.85, -3779.82, -4.68931, 6.00393, 0, 0, -0.139173, 0.990268, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7556, 1064, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7557, 2045, 1, -940.056, -3951.62, -50.5944, 0.85521, 0, 0, 0.414693, 0.909962, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7557, 1064, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7559, 2045, 1, -868.215, -3953.02, -30.5721, 3.6652, 0, 0, -0.965925, 0.258821, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7559, 1064, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7564, 2045, 1, -1831.07, -3862.04, -8.43423, 5.2709, 0, 0, -0.484809, 0.87462, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7564, 1064, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7567, 2045, 1, -1107.98, -4256.02, -9.86849, 5.88176, 0, 0, -0.199367, 0.979925, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7567, 1064, 'Stranglekelp');


-- Missing spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7412, 2045, 0, -777.527, -4570.92, -23.8076, 5.68977, 0, 0, -0.292372, 0.956305, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7412, 1000, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7432, 2045, 0, -785.381, -4656.31, -24.7362, 5.044, 0, 0, -0.580703, 0.814116, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7432, 1000, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7439, 2045, 0, -291.338, -4744.9, -25.2299, 4.25861, 0, 0, -0.848047, 0.529921, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7439, 1000, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7441, 2045, 0, -199.985, -4725.92, -28.7294, 1.85005, 0, 0, 0.798635, 0.601815, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7441, 1000, 'Stranglekelp');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7456, 2045, 0, -485.871, -4719.62, -29.8458, 2.74016, 0, 0, 0.979924, 0.19937, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7456, 1000, 'Stranglekelp');


-- Missing spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7524, 2045, 0, -3612.66, -620.549, -13.8343, 0.471238, 0, 0, 0.233445, 0.97237, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7524, 1149, 'Stranglekelp');



-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=1037.78, `position_y`=1133.19, `position_z`=44.5143, `orientation`=5.8294, `rotation0`=0, `rotation1`=0, `rotation2`=-0.224951, `rotation3`=0.97437 WHERE `guid`=1042;
UPDATE `gameobject` SET `position_x`=2177.47, `position_y`=759.348, `position_z`=35.6046, `orientation`=0.366518, `rotation0`=0, `rotation1`=0, `rotation2`=0.182235, `rotation3`=0.983255 WHERE `guid`=1103;
UPDATE `gameobject` SET `position_x`=2294.16, `position_y`=1106.62, `position_z`=35.745, `orientation`=2.3911, `rotation0`=0, `rotation1`=0, `rotation2`=0.930417, `rotation3`=0.366502 WHERE `guid`=980;
UPDATE `gameobject` SET `position_x`=1256.76, `position_y`=1151.34, `position_z`=50.9408, `orientation`=0.226893, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=515;
UPDATE `gameobject` SET `position_x`=1107.05, `position_y`=1313.31, `position_z`=37.6295, `orientation`=5.72468, `rotation0`=0, `rotation1`=0, `rotation2`=-0.275637, `rotation3`=0.961262 WHERE `guid`=1128;
UPDATE `gameobject` SET `position_x`=1109.29, `position_y`=1928.59, `position_z`=15.1003, `orientation`=4.85202, `rotation0`=0, `rotation1`=0, `rotation2`=-0.656058, `rotation3`=0.75471 WHERE `guid`=993;
UPDATE `gameobject` SET `position_x`=2062.22, `position_y`=948.025, `position_z`=38.142, `orientation`=4.01426, `rotation0`=0, `rotation1`=0, `rotation2`=-0.906307, `rotation3`=0.422619 WHERE `guid`=641;
UPDATE `gameobject` SET `position_x`=-1433.81, `position_y`=-370.969, `position_z`=-43.0002, `orientation`=3.83973, `rotation0`=0, `rotation1`=0, `rotation2`=-0.939692, `rotation3`=0.342021 WHERE `guid`=638;
UPDATE `gameobject` SET `position_x`=478.513, `position_y`=-4947.25, `position_z`=33.4624, `orientation`=1.79769, `rotation0`=0, `rotation1`=0, `rotation2`=0.782608, `rotation3`=0.622515 WHERE `guid`=615;
UPDATE `gameobject` SET `position_x`=-1281.33, `position_y`=-396.379, `position_z`=-38.5493, `orientation`=2.80997, `rotation0`=0, `rotation1`=0, `rotation2`=0.986285, `rotation3`=0.16505 WHERE `guid`=647;
UPDATE `gameobject` SET `position_x`=-255.43, `position_y`=-4707.5, `position_z`=34.3226, `orientation`=3.80482, `rotation0`=0, `rotation1`=0, `rotation2`=-0.945518, `rotation3`=0.325568 WHERE `guid`=1090;
UPDATE `gameobject` SET `position_x`=-1935.18, `position_y`=118.191, `position_z`=36.5683, `orientation`=0.733038, `rotation0`=0, `rotation1`=0, `rotation2`=0.358368, `rotation3`=0.933581 WHERE `guid`=594;
UPDATE `gameobject` SET `position_x`=-2083.43, `position_y`=103.156, `position_z`=46.6551, `orientation`=4.79966, `rotation0`=0, `rotation1`=0, `rotation2`=-0.67559, `rotation3`=0.737278 WHERE `guid`=1129;
UPDATE `gameobject` SET `position_x`=-2049.12, `position_y`=-291.195, `position_z`=-7.16006, `orientation`=1.43117, `rotation0`=0, `rotation1`=0, `rotation2`=0.656058, `rotation3`=0.75471 WHERE `guid`=830;
UPDATE `gameobject` SET `position_x`=-1571.92, `position_y`=-575.409, `position_z`=-48.7972, `orientation`=2.58308, `rotation0`=0, `rotation1`=0, `rotation2`=0.961261, `rotation3`=0.27564 WHERE `guid`=743;

-- Missing spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10264, 1617, 1, 1402.2, -4671.18, 32.9784, 2.02458, 0, 0, 0.848047, 0.529921, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10264, 1022, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10376, 1617, 1, 654.602, -4906.94, 25.1601, 4.64258, 0, 0, -0.731354, 0.681998, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10376, 1022, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10397, 1617, 1, 821.031, -4890.18, 35.3849, 1.0472, 0, 0, 0.5, 0.866025, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10397, 1022, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10398, 1617, 1, 1056.99, -5000.04, 17.4907, 4.92183, 0, 0, -0.62932, 0.777146, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10398, 1022, 'Silverleaf');

-- Missing spawns in Elwynn Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (748, 1617, 0, -9127.98, -15.8528, 85.698, 6.14356, 0, 0, -0.0697555, 0.997564, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (748, 1013, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (914, 1617, 0, -10004.4, -51.3555, 30.7997, 6.23083, 0, 0, -0.0261765, 0.999657, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (914, 1013, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (954, 1617, 0, -10009.4, 465.371, 31.1393, 1.25664, 0, 0, 0.587785, 0.809017, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (954, 1013, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1035, 1617, 0, -9394.66, -1293.73, 54.1131, 2.25147, 0, 0, 0.902585, 0.430512, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1035, 1013, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1079, 1617, 0, -9442.58, -1496.34, 63.4883, 5.77704, 0, 0, -0.25038, 0.968148, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1079, 1013, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1080, 1617, 0, -9740.14, -1205.03, 45.0785, 2.04204, 0, 0, 0.85264, 0.522499, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1080, 1013, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1095, 1617, 0, -9737.88, 727.222, 27.5254, 1.69297, 0, 0, 0.748956, 0.66262, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1095, 1013, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1113, 1617, 0, -9785.34, 225.803, 44.7786, 5.86431, 0, 0, -0.207912, 0.978148, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1113, 1013, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1156, 1617, 0, -9198.81, -1258.92, 77.0887, 0.314158, 0, 0, 0.156434, 0.987688, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1156, 1013, 'Silverleaf');

-- Missing spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (588, 1617, 0, -4749.33, -3077.36, 313.461, 5.96903, 0, 0, -0.156434, 0.987688, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (588, 1162, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (614, 1617, 0, -4884.1, -3106.54, 322.733, 2.1293, 0, 0, 0.874619, 0.48481, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (614, 1162, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1172, 1617, 0, -4837.14, -2743.59, 326.137, 4.20625, 0, 0, -0.861628, 0.507539, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1172, 1162, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1179, 1617, 0, -5443.69, -2982.44, 356.83, 5.86431, 0, 0, -0.207912, 0.978148, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1179, 1162, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (9720, 1617, 0, -5108.3, -2945.94, 334.151, 5.77704, 0, 0, -0.25038, 0.968148, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (9720, 1162, 'Silverleaf');

-- Missing spawns in Mulgore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10262, 1617, 1, -1240.85, -573.591, -55.5674, 6.10865, 0, 0, -0.0871553, 0.996195, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10262, 1027, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10278, 1617, 1, -1395.45, -244.261, 3.18103, 3.45576, 0, 0, -0.987688, 0.156436, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10278, 1027, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10291, 1617, 1, -2813.88, 244.206, 79.3017, 1.01229, 0, 0, 0.484809, 0.87462, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10291, 1027, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10627, 1617, 1, -909.978, -990.789, 23.0142, 0.890117, 0, 0, 0.43051, 0.902586, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10627, 1027, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10639, 1617, 1, -2257.43, 235.841, 81.6378, 3.85718, 0, 0, -0.936671, 0.35021, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10639, 1027, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10640, 1617, 1, -935.092, -851.219, 3.78136, 4.67748, 0, 0, -0.719339, 0.694659, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10640, 1027, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (18277, 1617, 1, -2483.28, -920.769, -4.42509, 2.86233, 0, 0, 0.990268, 0.139175, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (18277, 1027, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (19969, 1617, 1, -906.076, -97.406, 2.42219, 1.98967, 0, 0, 0.83867, 0.54464, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (19969, 1027, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (18271, 1617, 1, -940.065, 15.0219, 16.501, 5.96903, 0, 0, -0.156434, 0.987688, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (18271, 1027, 'Silverleaf');

-- Missing spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (582, 1617, 0, 1397.55, 1006.83, 53.7419, 1.0821, 0, 0, 0.515037, 0.857168, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (582, 1042, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (788, 1617, 0, 992.227, 1595.33, 30.3211, 3.71755, 0, 0, -0.958819, 0.284016, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (788, 1042, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (960, 1617, 0, 896.103, 1337.66, 45.1423, 1.93731, 0, 0, 0.824125, 0.566408, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (960, 1042, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (8402, 1617, 0, 1129.89, 1426.89, 37.3946, 3.57793, 0, 0, -0.976295, 0.216442, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (8402, 1042, 'Silverleaf');

-- Missing spawns in Teldrassil.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10283, 1617, 1, 10232, 1437.95, 1332.42, 1.02974, 0, 0, 0.492423, 0.870356, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10283, 1003, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (19972, 1617, 1, 10044.2, 1254.35, 1325.02, 4.95674, 0, 0, -0.615661, 0.788011, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (19972, 1003, 'Silverleaf');

-- Missing spawns in Tirisfal Glades.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (475, 1617, 0, 2060.01, 4.3954, 43.3182, 0.925024, 0, 0, 0.446198, 0.894934, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (475, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (500, 1617, 0, 1701.92, 705.036, 63.8095, 2.28638, 0, 0, 0.909961, 0.414694, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (500, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (557, 1617, 0, 2504.55, 276.301, 45.7606, 2.56563, 0, 0, 0.958819, 0.284016, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (557, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (569, 1617, 0, 2717.51, 236.582, 34.224, 1.3439, 0, 0, 0.622514, 0.782609, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (569, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (587, 1617, 0, 2928.26, 384.147, 32.2781, 0.733038, 0, 0, 0.358368, 0.933581, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (587, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (607, 1617, 0, 2357.97, 33.8889, 26.3059, 4.39823, 0, 0, -0.809016, 0.587786, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (607, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (626, 1617, 0, 2315.77, 1683.72, 46.5538, 4.92183, 0, 0, -0.62932, 0.777146, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (626, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (637, 1617, 0, 2228.95, 1147.06, 37.3862, 3.9619, 0, 0, -0.91706, 0.39875, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (637, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (677, 1617, 0, 2196.37, -359.505, 75.1928, 0.279252, 0, 0, 0.139173, 0.990268, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (677, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (757, 1617, 0, 1670.8, -412.24, 44.7601, 2.23402, 0, 0, 0.898793, 0.438373, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (757, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (801, 1617, 0, 2254.86, 623.59, 34.8548, 6.00393, 0, 0, -0.139173, 0.990268, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (801, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (825, 1617, 0, 2200.77, 789.698, 34.3001, 3.54302, 0, 0, -0.979924, 0.19937, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (825, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (832, 1617, 0, 2842.78, 23.8514, 26.0168, 3.82227, 0, 0, -0.942641, 0.333808, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (832, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (863, 1617, 0, 1966.1, -593.648, 56.9309, 2.42601, 0, 0, 0.936672, 0.350207, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (863, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (880, 1617, 0, 2937.52, 1069.4, 98.3469, 6.17847, 0, 0, -0.0523357, 0.99863, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (880, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (895, 1617, 0, 2849.01, 257.817, 31.8816, 4.31097, 0, 0, -0.833885, 0.551938, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (895, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (967, 1617, 0, 2720.47, 856.41, 113.721, 3.4383, 0, 0, -0.989016, 0.147811, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (967, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (9708, 1617, 0, 2339.24, -353.655, 69.7924, 5.21854, 0, 0, -0.507538, 0.861629, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (9708, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10260, 1617, 0, 1604.38, -641.317, 52.6502, 1.97222, 0, 0, 0.833885, 0.551938, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10260, 1007, 'Silverleaf');

-- Missing spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1108, 1617, 0, -10128.5, 1001.42, 37.3444, 0.279252, 0, 0, 0.139173, 0.990268, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1108, 1106, 'Silverleaf');



-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=4010.14, `position_y`=-5017.9, `position_z`=149.252, `orientation`=2.40855, `rotation0`=0, `rotation1`=0, `rotation2`=0.93358, `rotation3`=0.358368 WHERE `guid`=19679;


-- Missing spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (16622, 176586, 0, -7972.84, -2678.18, 195.698, 5.75959, 0, 0, -0.258819, 0.965926, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (16622, 1302, 'Mountain Silversage');


-- Missing spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (16623, 176586, 0, 2115.36, -5366.65, 125.839, 2.40855, 0, 0, 0.93358, 0.358368, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (16623, 1269, 'Mountain Silversage');


-- Missing spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (16626, 176586, 1, -8085.21, 1152.72, 30.9524, 2.11185, 0, 0, 0.870356, 0.492424, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (16626, 1222, 'Mountain Silversage');


-- Missing spawns in Un'Goro Crater.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (16624, 176586, 1, -6437.51, -623.797, -243.002, 5.63741, 0, 0, -0.317305, 0.948324, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (16624, 1218, 'Mountain Silversage');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (16625, 176586, 1, -6960.88, -2322.74, -224.537, 3.22886, 0, 0, -0.999048, 0.0436193, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (16625, 1218, 'Mountain Silversage');


-- Missing spawns in Winterspring.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (16637, 176586, 1, 6679.09, -3216.58, 627.622, 3.54302, 0, 0, -0.979924, 0.19937, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (16637, 1237, 'Mountain Silversage');



-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=1115.69, `position_y`=-254.806, `position_z`=32.94, `orientation`=2.30383, `rotation0`=0, `rotation1`=0, `rotation2`=0.913545, `rotation3`=0.406738 WHERE `guid`=7396;
UPDATE `gameobject` SET `position_x`=-3077.74, `position_y`=-1994.2, `position_z`=7.12134, `orientation`=4.79966, `rotation0`=0, `rotation1`=0, `rotation2`=-0.67559, `rotation3`=0.737278 WHERE `guid`=7417;


INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (998, 1, 'Liferoot in Hillsbrad Foothills', 0, 0, 0, 10);


-- Missing spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6777, 2041, 0, 352.731, -1452.43, 39.5358, 2.58308, 0, 0, 0.961261, 0.27564, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6777, 1063, 'Liferoot');

-- Missing spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6681, 2041, 0, -1853.69, -2548.98, 54.381, 4.76475, 0, 0, -0.688354, 0.725375, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6681, 1184, 'Liferoot');

-- Missing spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (21386, 2041, 1, -1659.96, 1469.15, 59.5975, 2.54818, 0, 0, 0.956305, 0.292372, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (21386, 1144, 'Liferoot');

-- Missing spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (19441, 2041, 1, -4085.57, -3025.3, 31.9925, 4.53786, 0, 0, -0.766044, 0.642789, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (19441, 1104, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (19442, 2041, 1, -2791.54, -3519.12, 29.3699, 0.209439, 0, 0, 0.104528, 0.994522, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (19442, 1104, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (19444, 2041, 1, -2786.07, -3127.25, 30.1961, 2.93214, 0, 0, 0.994521, 0.104535, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (19444, 1104, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (20971, 2041, 1, -4107.86, -3427.9, 30.6956, 2.11185, 0, 0, 0.870356, 0.492424, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (20971, 1104, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (21106, 2041, 1, -4200.37, -3329.22, 30.2588, 3.07177, 0, 0, 0.999391, 0.0349061, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (21106, 1104, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (21109, 2041, 1, -3731.32, -3187.41, 32.0722, 5.60251, 0, 0, -0.333807, 0.942641, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (21109, 1104, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (21120, 2041, 1, -3563.34, -2881.77, 29.8927, 2.74016, 0, 0, 0.979924, 0.19937, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (21120, 1104, 'Liferoot');

-- Missing spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (21443, 2041, 1, -3042.13, 1967.54, 28.5348, 4.85202, 0, 0, -0.656058, 0.75471, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (21443, 1193, 'Liferoot');

-- Missing spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6664, 2041, 0, -290.843, -1114.09, 36.566, 1.74533, 0, 0, 0.766044, 0.642789, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6664, 998, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6724, 2041, 0, -363.167, -1073.16, 35.5518, 3.97936, 0, 0, -0.913545, 0.406738, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6724, 998, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6778, 2041, 0, -181.093, -1135.63, 38.3253, 4.36332, 0, 0, -0.819152, 0.573577, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6778, 998, 'Liferoot');

-- Missing spawns in Scarlet Monastery.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (21576, 2041, 189, 938.935, 1398.88, 18.34, 2.42601, 0, 0, 0.936672, 0.350207, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (21576, 1054, 'Liferoot');

-- Missing spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6642, 2041, 0, -12423.7, -335.87, 15.0723, 4.85202, 0, 0, -0.656058, 0.75471, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6642, 1179, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6656, 2041, 0, -13349.2, 745.214, 4.4602, 0.90757, 0, 0, 0.438371, 0.898794, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6656, 1179, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10614, 2041, 0, -13985.5, 368.891, 29.6164, 6.03884, 0, 0, -0.121869, 0.992546, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10614, 1179, 'Liferoot');

-- Missing spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6648, 2041, 0, -10607.5, -4078.95, 19.2055, 4.34587, 0, 0, -0.824126, 0.566406, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6648, 1317, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6687, 2041, 0, -10761.8, -4158.78, 19.8357, 0.523598, 0, 0, 0.258819, 0.965926, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6687, 1317, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6773, 2041, 0, -10195.8, -4084.3, 19.2791, 5.96903, 0, 0, -0.156434, 0.987688, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6773, 1317, 'Liferoot');

-- Missing spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6779, 2041, 0, -3009.18, -2612.51, 7.93079, 0.104719, 0, 0, 0.0523357, 0.99863, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6779, 1153, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6781, 2041, 0, -3144.12, -2672.27, 7.48634, 1.41372, 0, 0, 0.649447, 0.760406, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6781, 1153, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10234, 2041, 0, -3197.96, -2636.1, 7.63684, 2.26892, 0, 0, 0.906307, 0.422619, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10234, 1153, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10613, 2041, 0, -3013.65, -2502.55, 8.11191, 3.87463, 0, 0, -0.93358, 0.358368, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10613, 1153, 'Liferoot');


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=-6447, `position_y`=-3315.48, `position_z`=241.667, `orientation`=2.91469, `rotation0`=0, `rotation1`=0, `rotation2`=0.993571, `rotation3`=0.113208 WHERE `guid`=4321;
UPDATE `gameobject` SET `position_x`=-855.681, `position_y`=88.6056, `position_z`=39.3379, `orientation`=1.309, `rotation0`=0, `rotation1`=0, `rotation2`=0.608761, `rotation3`=0.793354 WHERE `guid`=4409;
UPDATE `gameobject` SET `position_x`=-96.4679, `position_y`=-58.3431, `position_z`=142.345, `orientation`=5.55015, `rotation0`=0, `rotation1`=0, `rotation2`=-0.358368, `rotation3`=0.933581 WHERE `guid`=33197;
UPDATE `gameobject` SET `position_x`=-305.608, `position_y`=-560.832, `position_z`=55.8194, `orientation`=5.42798, `rotation0`=0, `rotation1`=0, `rotation2`=-0.414693, `rotation3`=0.909962 WHERE `guid`=4350;
UPDATE `gameobject` SET `position_x`=-6616.12, `position_y`=-3272.91, `position_z`=241.628, `orientation`=0.541051, `rotation0`=0, `rotation1`=0, `rotation2`=0.267238, `rotation3`=0.963631 WHERE `guid`=4336;
UPDATE `gameobject` SET `position_x`=-2414.87, `position_y`=-3147.57, `position_z`=33.3783, `orientation`=0.558504, `rotation0`=0, `rotation1`=0, `rotation2`=0.275637, `rotation3`=0.961262 WHERE `guid`=12566;
UPDATE `gameobject` SET `position_x`=-3119.02, `position_y`=-2246.05, `position_z`=94.0295, `orientation`=1.18682, `rotation0`=0, `rotation1`=0, `rotation2`=0.559193, `rotation3`=0.829038 WHERE `guid`=4390;


-- Missing spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3938, 1624, 0, 55.5641, -50.3888, 99.1906, 5.044, 0, 0, -0.580703, 0.814116, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3938, 1057, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3964, 1624, 0, -128.134, 349.505, 84.4771, 5.70723, 0, 0, -0.284015, 0.95882, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3964, 1057, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4029, 1624, 0, -190.381, 251.907, 89.6564, 4.32842, 0, 0, -0.829037, 0.559194, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4029, 1057, 'Kingsblood');


-- Missing spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4021, 1624, 0, -1250.13, -3383.25, 37.3728, 2.84488, 0, 0, 0.989016, 0.147811, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4021, 1180, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4030, 1624, 0, -1816.56, -2881.86, 61.0276, 1.91986, 0, 0, 0.819152, 0.573577, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4030, 1180, 'Kingsblood');


-- Missing spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (9854, 1624, 1, 3152.67, -1811.98, 175.534, 6.21337, 0, 0, -0.0348988, 0.999391, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (9854, 1078, 'Kingsblood');

-- Missing spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3920, 1624, 0, -6813.04, -2683.8, 241.826, 4.08407, 0, 0, -0.891007, 0.453991, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3920, 1284, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3921, 1624, 0, -6718.24, -3248.64, 240.744, 1.41372, 0, 0, 0.649447, 0.760406, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3921, 1284, 'Kingsblood');


-- Missing spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10371, 1624, 1, -1646.38, 2346.47, 88.3708, 0.418879, 0, 0, 0.207912, 0.978148, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10371, 1138, 'Kingsblood');


-- Missing spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4046, 1624, 1, -2837.37, -2825.55, 34.6673, 3.35105, 0, 0, -0.994521, 0.104535, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4046, 1039, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (9856, 1624, 1, -2720.66, -3549.57, 33.7416, 5.86431, 0, 0, -0.207912, 0.978148, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (9856, 1039, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (9861, 1624, 1, -2799.21, -3227.14, 31.9061, 4.20625, 0, 0, -0.861628, 0.507539, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (9861, 1039, 'Kingsblood');

-- Missing spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3965, 1624, 0, -443.955, 218.854, 80.0781, 1.83259, 0, 0, 0.793353, 0.608762, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3965, 1051, 'Kingsblood');

-- Missing spawns in Scarlet Monastery.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10445, 1624, 189, 1796.03, 1417.5, 14.4893, 3.59538, 0, 0, -0.97437, 0.224951, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10445, 1054, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (12027, 1624, 189, 1746.37, 1410.68, 22.1887, 0.226893, 0, 0, 0.113203, 0.993572, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (12027, 1054, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (12679, 1624, 189, 1739.89, 1377.57, 17.521, 5.21854, 0, 0, -0.507538, 0.861629, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (12679, 1054, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (14457, 1624, 189, 1836.24, 1408.23, 21.7179, 2.51327, 0, 0, 0.951056, 0.309017, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (14457, 1054, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (14459, 1624, 189, 1818.8, 1241, 17.5499, 3.90954, 0, 0, -0.927183, 0.374608, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (14459, 1054, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (17730, 1624, 189, 1775.33, 1288.49, 17.5497, 3.73501, 0, 0, -0.956305, 0.292372, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (17730, 1054, 'Kingsblood');


-- Missing spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10294, 1624, 1, 1727.06, 791.881, 134.26, 2.37364, 0, 0, 0.927183, 0.374608, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10294, 1088, 'Kingsblood');


-- Missing spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3953, 1624, 0, -12451.9, -11.4759, 2.76284, 3.76991, 0, 0, -0.951056, 0.309017, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3953, 1170, 'Kingsblood');


-- Missing spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3946, 1624, 0, -10348.1, -3110.08, 22.1766, 4.85202, 0, 0, -0.656058, 0.75471, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3946, 1326, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3948, 1624, 0, -10305.2, -4099.95, 22.0213, 0.610863, 0, 0, 0.300705, 0.953717, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3948, 1326, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3991, 1624, 0, -10538.6, -4057.57, 21.6968, 1.09956, 0, 0, 0.522498, 0.852641, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3991, 1326, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3995, 1624, 0, -10741.6, -4204.1, 21.8815, 1.48353, 0, 0, 0.67559, 0.737278, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3995, 1326, 'Kingsblood');


-- Missing spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4038, 1624, 1, -2381.14, -2293.68, 91.6667, 2.25147, 0, 0, 0.902585, 0.430512, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4038, 1038, 'Kingsblood');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4043, 1624, 1, -3652.89, -2094.61, 92.8224, 2.11185, 0, 0, 0.870356, 0.492424, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4043, 1038, 'Kingsblood');


-- Missing spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10415, 1624, 1, -5371.23, -1649.36, -54.8743, 0.575957, 0, 0, 0.284015, 0.95882, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10415, 1136, 'Kingsblood');


-- Missing spawns in Wailing Caverns.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4032, 1624, 1, -583.072, -2260.18, 38.7323, 0.785397, 0, 0, 0.382683, 0.92388, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4032, 1053, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4036, 1624, 1, -564.824, -2200.06, 50.2902, 5.044, 0, 0, -0.580703, 0.814116, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4036, 1053, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10429, 1624, 1, -682.903, -2338.59, 17.1252, 1.36136, 0, 0, 0.62932, 0.777146, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10429, 1053, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10441, 1624, 1, -605.093, -2352.9, 24.3262, 4.67748, 0, 0, -0.719339, 0.694659, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10441, 1053, 'Kingsblood');


-- Missing spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3963, 1624, 0, -3936.86, -2670.8, 36.8535, 6.02139, 0, 0, -0.130526, 0.991445, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3963, 1155, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4008, 1624, 0, -3484.03, -2444.53, 47.452, 1.02974, 0, 0, 0.492423, 0.870356, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4008, 1155, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4027, 1624, 0, -3367.87, -3122.86, 25.0722, 4.76475, 0, 0, -0.688354, 0.725375, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4027, 1155, 'Kingsblood');




-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=-6881.08, `position_y`=-2492.59, `position_z`=246.156, `orientation`=3.94445, `rotation0`=0, `rotation1`=0, `rotation2`=-0.920505, `rotation3`=0.390732 WHERE `guid`=8016;
UPDATE `gameobject` SET `position_x`=143.652, `position_y`=-93.971, `position_z`=115.869, `orientation`=0.436332, `rotation0`=0, `rotation1`=0, `rotation2`=0.216439, `rotation3`=0.976296 WHERE `guid`=7843;
UPDATE `gameobject` SET `position_x`=-10537.3, `position_y`=-4171.27, `position_z`=22.8462, `orientation`=6.07375, `rotation0`=0, `rotation1`=0, `rotation2`=-0.104528, `rotation3`=0.994522 WHERE `guid`=8185;
UPDATE `gameobject` SET `position_x`=-4505.21, `position_y`=-3679.75, `position_z`=39.7749, `orientation`=4.97419, `rotation0`=0, `rotation1`=0, `rotation2`=-0.608761, `rotation3`=0.793354 WHERE `guid`=11971;


INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1055, 1, 'Khadgars Whisker in Azshara', 0, 0, 0, 10);


-- Missing spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7065, 2043, 0, -1111.34, -3313.98, 50.7871, 1.88495, 0, 0, 0.809016, 0.587786, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7065, 1182, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7115, 2043, 0, -873.379, -2402.82, 57.2111, 3.64774, 0, 0, -0.968147, 0.250381, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7115, 1182, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7185, 2043, 0, -1803.52, -3141.65, 41.2629, 3.45576, 0, 0, -0.987688, 0.156436, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7185, 1182, "Khadgar's Whisker");


-- Missing spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7347, 2043, 1, 3820.44, -4898.04, 148.32, 0.244346, 0, 0, 0.121869, 0.992546, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7347, 1055, "Khadgar's Whisker");


-- Missing spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7201, 2043, 1, -4259.72, -3484.04, 42.4232, 3.17653, 0, 0, -0.999847, 0.0174693, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7201, 1102, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7205, 2043, 1, -4975.66, -3709.25, 42.2869, 5.88176, 0, 0, -0.199367, 0.979925, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7205, 1102, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7226, 2043, 1, -2673.08, -3158.31, 44.6691, 0.174532, 0, 0, 0.0871553, 0.996195, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7226, 1102, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7244, 2043, 1, -4431.83, -3681.06, 38.826, 3.26377, 0, 0, -0.998135, 0.0610518, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7244, 1102, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7283, 2043, 1, -3680.71, -2954.99, 34.8736, 1.46608, 0, 0, 0.66913, 0.743145, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7283, 1102, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7327, 2043, 1, -3644.71, -2894.66, 36.3016, 4.10152, 0, 0, -0.887011, 0.461749, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7327, 1102, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7332, 2043, 1, -3651.61, -2773.03, 35.1337, 0.558504, 0, 0, 0.275637, 0.961262, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7332, 1102, "Khadgar's Whisker");


-- Missing spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7333, 2043, 1, -3498.04, 1972.02, 44.8768, 3.89209, 0, 0, -0.930417, 0.366502, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7333, 1189, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7346, 2043, 1, -5341.18, 1113.72, 65.19, 4.7473, 0, 0, -0.694658, 0.71934, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7346, 1189, "Khadgar's Whisker");


-- Missing spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7078, 2043, 0, -12909.8, -309.647, 14.1951, 3.15906, 0, 0, -0.999962, 0.00873464, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7078, 1173, "Khadgar's Whisker");


-- Missing spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7103, 2043, 0, -10201.5, -3447.1, 22.3132, 5.79449, 0, 0, -0.241921, 0.970296, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7103, 1310, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7162, 2043, 0, -10523.5, -4182.17, 23.6343, 2.89724, 0, 0, 0.992546, 0.12187, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7162, 1310, "Khadgar's Whisker");


-- Missing spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7163, 2043, 0, 281.061, -4074.91, 125.109, 4.17134, 0, 0, -0.870356, 0.492424, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7163, 1248, "Khadgar's Whisker");


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=-6732.99, `position_y`=-3184.11, `position_z`=249.668, `orientation`=5.98648, `rotation0`=0, `rotation1`=0, `rotation2`=-0.147809, `rotation3`=0.989016 WHERE `guid`=9188;
UPDATE `gameobject` SET `position_x`=-6447.5, `position_y`=-3366.45, `position_z`=244.277, `orientation`=4.08407, `rotation0`=0, `rotation1`=0, `rotation2`=-0.891007, `rotation3`=0.453991 WHERE `guid`=9083;
UPDATE `gameobject` SET `position_x`=-1033.84, `position_y`=-2618.83, `position_z`=57.3154, `orientation`=1.27409, `rotation0`=0, `rotation1`=0, `rotation2`=0.594822, `rotation3`=0.803857 WHERE `guid`=8780;
UPDATE `gameobject` SET `position_x`=129.425, `position_y`=-4091.16, `position_z`=151.222, `orientation`=6.14356, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0697555, `rotation3`=0.997564 WHERE `guid`=8975;
UPDATE `gameobject` SET `position_x`=349.219, `position_y`=-4016.42, `position_z`=122.159, `orientation`=0.872664, `rotation0`=0, `rotation1`=0, `rotation2`=0.422618, `rotation3`=0.906308 WHERE `guid`=8977;
UPDATE `gameobject` SET `position_x`=-753.136, `position_y`=-2057.97, `position_z`=39.9314, `orientation`=3.71755, `rotation0`=0, `rotation1`=0, `rotation2`=-0.958819, `rotation3`=0.284016 WHERE `guid`=9058;
UPDATE `gameobject` SET `position_x`=-1181.47, `position_y`=-3084.28, `position_z`=44.6811, `orientation`=6.17847, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0523357, `rotation3`=0.99863 WHERE `guid`=8803;


-- Missing spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6985, 2046, 0, -1847.43, -2637.66, 59.014, 5.0091, 0, 0, -0.594823, 0.803857, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6985, 1181, 'Goldthorn');


-- Missing spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6993, 2046, 1, -4974.11, -3864.3, 56.3607, 4.99164, 0, 0, -0.601814, 0.798636, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6993, 1103, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7001, 2046, 1, -4374.49, -3313.25, 34.4254, 1.20428, 0, 0, 0.566406, 0.824126, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7001, 1103, 'Goldthorn');


-- Missing spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7002, 2046, 1, -3519.39, 1858.88, 73.0516, 3.15906, 0, 0, -0.999962, 0.00873464, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7002, 1191, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7021, 2046, 1, -5420.75, 1183.68, 66.5455, 4.2237, 0, 0, -0.857167, 0.515038, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7021, 1191, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7032, 2046, 1, -5868.21, 1210.25, 95.1845, 2.46091, 0, 0, 0.942641, 0.333808, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7032, 1191, 'Goldthorn');


-- Missing spawns in Scarlet Monastery.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6294, 2046, 189, 914.922, 1401.31, 18.0233, 1.15192, 0, 0, 0.544639, 0.838671, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6294, 1054, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7757, 2046, 189, 916.203, 1420.49, 17.9942, 0.244346, 0, 0, 0.121869, 0.992546, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7757, 1054, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7775, 2046, 189, 944.069, 1421.18, 18.0233, 1.37881, 0, 0, 0.636078, 0.771625, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7775, 1054, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7800, 2046, 189, 1008.59, 1436.93, 27.3057, 4.62512, 0, 0, -0.737277, 0.675591, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7800, 1054, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7814, 2046, 189, 1034.61, 1432.18, 27.3034, 6.10865, 0, 0, -0.0871553, 0.996195, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7814, 1054, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7825, 2046, 189, 1037.43, 1401.24, 27.3085, 6.02139, 0, 0, -0.130526, 0.991445, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7825, 1054, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7877, 2046, 189, 937.827, 1377.36, 18.0233, 4.71239, 0, 0, -0.707107, 0.707107, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7877, 1054, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7887, 2046, 189, 1034.54, 1368.88, 27.3046, 2.23402, 0, 0, 0.898793, 0.438373, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7887, 1054, 'Goldthorn');


-- Missing spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6909, 2046, 0, -13053.3, -293.556, 11.6449, 4.72984, 0, 0, -0.700909, 0.713251, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6909, 1174, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6964, 2046, 0, -13360.6, -16.135, 22.3618, 5.44543, 0, 0, -0.406736, 0.913545, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6964, 1174, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6990, 2046, 0, -11836.9, 48.4786, 15.7018, 4.88692, 0, 0, -0.642787, 0.766045, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6990, 1174, 'Goldthorn');


-- Missing spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6966, 2046, 0, -155.668, -4041.4, 122.494, 1.58825, 0, 0, 0.71325, 0.70091, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6966, 1249, 'Goldthorn');


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=-6722.4, `position_y`=-3084.47, `position_z`=282.649, `orientation`=1.3439, `rotation0`=0, `rotation1`=0, `rotation2`=0.622514, `rotation3`=0.782609 WHERE `guid`=7745;
UPDATE `gameobject` SET `position_x`=-1044.92, `position_y`=-3256.63, `position_z`=39.844, `orientation`=3.10665, `rotation0`=0, `rotation1`=0, `rotation2`=0.999847, `rotation3`=0.0174693 WHERE `guid`=7793;
UPDATE `gameobject` SET `position_x`=-10164, `position_y`=-3209.01, `position_z`=24.4014, `orientation`=3.927, `rotation0`=0, `rotation1`=0, `rotation2`=-0.923879, `rotation3`=0.382686 WHERE `guid`=7706;


INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1054, 1, 'Herbs in Scarlet Monastery', 0, 0, 0, 10);


-- Missing spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6817, 2042, 0, -16.0845, 377.3, 48.6796, 1.6057, 0, 0, 0.719339, 0.694659, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6817, 1071, 'Fadeleaf');


-- Missing spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6820, 2042, 1, -2683.35, -2891.58, 35.377, 5.91667, 0, 0, -0.182235, 0.983255, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6820, 1328, 'Fadeleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6824, 2042, 1, -2695.31, -3196.42, 32.9254, 1.58825, 0, 0, 0.71325, 0.70091, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6824, 1328, 'Fadeleaf');


-- Missing spawns in Scarlet Monastery.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6830, 2042, 189, 166.831, -253.104, 19.0757, 5.68977, 0, 0, -0.292372, 0.956305, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6830, 1054, 'Fadeleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6832, 2042, 189, 187.977, -277.975, 18.7038, 5.34071, 0, 0, -0.45399, 0.891007, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6832, 1054, 'Fadeleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6838, 2042, 189, 1651.27, -346.265, 18.1489, 5.07891, 0, 0, -0.566406, 0.824126, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6838, 1054, 'Fadeleaf');



-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=908.785, `position_y`=1462.15, `position_z`=35.2878, `orientation`=3.85718, `rotation0`=0, `rotation1`=0, `rotation2`=-0.936671, `rotation3`=0.35021 WHERE `guid`=1827;
UPDATE `gameobject` SET `position_x`=378.769, `position_y`=1152.34, `position_z`=92.5748, `orientation`=4.45059, `rotation0`=0, `rotation1`=0, `rotation2`=-0.793353, `rotation3`=0.608762 WHERE `guid`=1840;
UPDATE `gameobject` SET `position_x`=-9614.35, `position_y`=-2156.73, `position_z`=73.633, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=1820;
UPDATE `gameobject` SET `position_x`=1313.98, `position_y`=-4928.83, `position_z`=9.16377, `orientation`=1.91986, `rotation0`=0, `rotation1`=0, `rotation2`=0.819152, `rotation3`=0.573577 WHERE `guid`=1795;
UPDATE `gameobject` SET `position_x`=1138.76, `position_y`=-4902.47, `position_z`=17.5071, `orientation`=6.0912, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0958452, `rotation3`=0.995396 WHERE `guid`=1996;
UPDATE `gameobject` SET `position_x`=-998.674, `position_y`=-1065.87, `position_z`=46.8172, `orientation`=4.57276, `rotation0`=0, `rotation1`=0, `rotation2`=-0.754709, `rotation3`=0.656059 WHERE `guid`=18596;


-- Missing spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1873, 1619, 1, -233.734, -4837.06, 28.8369, 0.733038, 0, 0, 0.358368, 0.933581, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1873, 1021, 'Earthroot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1874, 1619, 1, 912.638, -4033.78, -11.5388, 3.35105, 0, 0, -0.994521, 0.104535, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1874, 1021, 'Earthroot');


-- Missing spawns in Elwynn Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1753, 1619, 0, -9242.07, -500.695, 72.2388, 2.58308, 0, 0, 0.961261, 0.27564, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1753, 1011, 'Earthroot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1803, 1619, 0, -9735.58, -1411.31, 57.8482, 3.07177, 0, 0, 0.999391, 0.0349061, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1803, 1011, 'Earthroot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1806, 1619, 0, -9804.1, -1442.02, 43.9482, 5.65487, 0, 0, -0.309016, 0.951057, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1806, 1011, 'Earthroot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1838, 1619, 0, -9819.25, -1392.68, 53.7645, 3.08918, 0, 0, 0.999657, 0.0262017, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1838, 1011, 'Earthroot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1842, 1619, 0, -9785.67, -1340.88, 52.0721, 5.48033, 0, 0, -0.390731, 0.920505, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1842, 1011, 'Earthroot');


-- Missing spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1872, 1619, 0, -5521.8, -3031.14, 361.204, 0.942477, 0, 0, 0.45399, 0.891007, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1872, 1160, 'Earthroot');


-- Missing spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1603, 1619, 0, -9655.55, -2019.22, 56.6992, 3.61284, 0, 0, -0.972369, 0.233448, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1603, 1124, 'Earthroot');


-- Missing spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1597, 1619, 0, 357.362, 713.061, 45.0774, 0.785397, 0, 0, 0.382683, 0.92388, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1597, 1040, 'Earthroot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1653, 1619, 0, 889.81, 1172.69, 49.8807, 3.61284, 0, 0, -0.972369, 0.233448, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1653, 1040, 'Earthroot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1666, 1619, 0, 275.478, 1292.72, 79.5945, 4.71239, 0, 0, -0.707107, 0.707107, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1666, 1040, 'Earthroot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1670, 1619, 0, 827.243, 1324.17, 54.6776, 0.820303, 0, 0, 0.398748, 0.91706, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1670, 1040, 'Earthroot');


-- Missing spawns in Tirisfal Glades.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1093, 1619, 0, 2057.79, 22.5872, 41.5133, 1.44862, 0, 0, 0.66262, 0.748956, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1093, 1005, 'Earthroot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1623, 1619, 0, 2785.7, 501.149, 26.605, 5.18363, 0, 0, -0.522498, 0.852641, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1623, 1005, 'Earthroot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1628, 1619, 0, 2992.24, 441.681, 24.7336, 1.11701, 0, 0, 0.529919, 0.848048, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1628, 1005, 'Earthroot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1640, 1619, 0, 1963.52, -625.277, 61.4846, 0.523598, 0, 0, 0.258819, 0.965926, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1640, 1005, 'Earthroot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1669, 1619, 0, 1892.15, -682.06, 50.8038, 2.75761, 0, 0, 0.981627, 0.190812, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1669, 1005, 'Earthroot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1766, 1619, 0, 1761.84, -737.912, 59.9442, 0.95993, 0, 0, 0.461748, 0.887011, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1766, 1005, 'Earthroot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1788, 1619, 0, 2422.79, -372.752, 68.532, 1.71042, 0, 0, 0.754709, 0.656059, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1788, 1005, 'Earthroot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1860, 1619, 0, 1854.79, -199.715, 49.3374, 1.67551, 0, 0, 0.743144, 0.669132, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1860, 1005, 'Earthroot');



-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=2943.9, `position_y`=-4100.04, `position_z`=104.091, `orientation`=2.82743, `rotation0`=0, `rotation1`=0, `rotation2`=0.987688, `rotation3`=0.156436 WHERE `guid`=39930;


-- Missing spawns in Azshara.
INSERT	INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (16406, 176584, 1, 3320.05, -4643.19, 97.123, 4.62512, 0, 0, -0.737277, 0.675591, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (16406, 1242, 'Dreamfoil');


-- Missing spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (16325, 176584, 0, 3036.89, -4329.2, 98.7749, 2.54818, 0, 0, 0.956305, 0.292372, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (16325, 1267, 'Dreamfoil');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (16376, 176584, 0, 2202.17, -5249.67, 81.2344, 3.54302, 0, 0, -0.979924, 0.19937, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (16376, 1267, 'Dreamfoil');


-- Missing spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (16381, 176584, 1, -6449.85, 1330.59, 1.34675, 4.66003, 0, 0, -0.725374, 0.688355, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (16381, 1221, 'Dreamfoil');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (16385, 176584, 1, -6840.39, 1052.12, 2.4004, 3.15906, 0, 0, -0.999962, 0.00873464, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (16385, 1221, 'Dreamfoil');


-- Missing spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (16339, 176584, 0, 1857.36, -2116.71, 68.6316, 3.31614, 0, 0, -0.996194, 0.087165, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (16339, 1260, 'Dreamfoil');




-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=1901.47, `position_y`=734.731, `position_z`=36.8667, `orientation`=0.191985, `rotation0`=0, `rotation1`=0, `rotation2`=0.0958452, `rotation3`=0.995396 WHERE `guid`=1698;
UPDATE `gameobject` SET `position_x`=1729.3, `position_y`=738.43, `position_z`=51.1099, `orientation`=0.750491, `rotation0`=0, `rotation1`=0, `rotation2`=0.366501, `rotation3`=0.930418 WHERE `guid`=1652;
UPDATE `gameobject` SET `position_x`=2178.24, `position_y`=71.7921, `position_z`=28.6869, `orientation`=3.47321, `rotation0`=0, `rotation1`=0, `rotation2`=-0.986285, `rotation3`=0.16505 WHERE `guid`=1453;
UPDATE `gameobject` SET `position_x`=2106.63, `position_y`=1055.04, `position_z`=33.1502, `orientation`=5.68977, `rotation0`=0, `rotation1`=0, `rotation2`=-0.292372, `rotation3`=0.956305 WHERE `guid`=1651;
UPDATE `gameobject` SET `position_x`=1166.19, `position_y`=-4927.81, `position_z`=16.5958, `orientation`=4.13643, `rotation0`=0, `rotation1`=0, `rotation2`=-0.878817, `rotation3`=0.47716 WHERE `guid`=1352;
UPDATE `gameobject` SET `position_x`=1317.86, `position_y`=-4986.07, `position_z`=2.62448, `orientation`=2.46091, `rotation0`=0, `rotation1`=0, `rotation2`=0.942641, `rotation3`=0.333808 WHERE `guid`=1676;
UPDATE `gameobject` SET `position_x`=482.284, `position_y`=-4083.93, `position_z`=30.2554, `orientation`=2.87979, `rotation0`=0, `rotation1`=0, `rotation2`=0.991445, `rotation3`=0.130528 WHERE `guid`=1543;
UPDATE `gameobject` SET `position_x`=1771.03, `position_y`=-506.915, `position_z`=40.7929, `orientation`=0.453785, `rotation0`=0, `rotation1`=0, `rotation2`=0.224951, `rotation3`=0.97437 WHERE `guid`=1549;
UPDATE `gameobject` SET `position_x`=-1819.37, `position_y`=153.606, `position_z`=25.2146, `orientation`=0.226893, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=1615;
UPDATE `gameobject` SET `position_x`=1989.74, `position_y`=986.886, `position_z`=33.0626, `orientation`=1.0821, `rotation0`=0, `rotation1`=0, `rotation2`=0.515037, `rotation3`=0.857168 WHERE `guid`=1482;
UPDATE `gameobject` SET `position_x`=-2483.92, `position_y`=-1381.26, `position_z`=7.91413, `orientation`=2.63544, `rotation0`=0, `rotation1`=0, `rotation2`=0.968147, `rotation3`=0.250381 WHERE `guid`=1530;
UPDATE `gameobject` SET `position_x`=-1282.12, `position_y`=322.474, `position_z`=-0.953603, `orientation`=5.65487, `rotation0`=0, `rotation1`=0, `rotation2`=-0.309016, `rotation3`=0.951057 WHERE `guid`=1558;
UPDATE `gameobject` SET `position_x`=-847.561, `position_y`=-718.053, `position_z`=-20.1135, `orientation`=1.23918, `rotation0`=0, `rotation1`=0, `rotation2`=0.580703, `rotation3`=0.814116 WHERE `guid`=1638;


-- Missing spawns in Dun Morogh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1313, 1618, 0, -5090.68, 442.544, 407.868, 6.03884, 0, 0, -0.121869, 0.992546, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1313, 1017, 'Peacebloom');

-- Missing spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1314, 1618, 1, 809.231, -5008.37, 10.3425, 0.436332, 0, 0, 0.216439, 0.976296, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1314, 1020, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1315, 1618, 1, 1049.16, -4971.99, 15.5962, 0.157079, 0, 0, 0.0784588, 0.996917, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1315, 1020, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1316, 1618, 1, 872.486, -4636.95, 14.7904, 5.63741, 0, 0, -0.317305, 0.948324, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1316, 1020, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1317, 1618, 1, 81.6812, -4855.03, 16.2339, 4.57276, 0, 0, -0.754709, 0.656059, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1317, 1020, 'Peacebloom');

-- Missing spawns in Elwynn Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1318, 1618, 0, -9819.93, -1534.26, 38.1285, 0.506145, 0, 0, 0.25038, 0.968148, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1318, 1012, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1319, 1618, 0, -9401.43, -772.841, 63.7403, 2.37364, 0, 0, 0.927183, 0.374608, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1319, 1012, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1320, 1618, 0, -9724.51, -1535.47, 51.8514, 0.418879, 0, 0, 0.207912, 0.978148, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1320, 1012, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1321, 1618, 0, -9910.36, -1381.62, 30.7112, 0.85521, 0, 0, 0.414693, 0.909962, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1321, 1012, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1322, 1618, 0, -9824.13, -842.282, 40.8678, 1.64061, 0, 0, 0.731353, 0.681999, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1322, 1012, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1323, 1618, 0, -9965.29, 188.475, 32.6272, 3.76991, 0, 0, -0.951056, 0.309017, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1323, 1012, 'Peacebloom');

-- Missing spawns in Mulgore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1324, 1618, 1, -1003.55, -983.244, 7.90341, 2.70526, 0, 0, 0.976295, 0.216442, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1324, 1026, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1325, 1618, 1, -1151.82, -648.848, -58.1973, 5.0091, 0, 0, -0.594823, 0.803857, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1325, 1026, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1326, 1618, 1, -1284.96, -776.862, -34.4384, 4.08407, 0, 0, -0.891007, 0.453991, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1326, 1026, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1327, 1618, 1, -1150.75, -917.353, -3.13117, 5.28835, 0, 0, -0.477158, 0.878817, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1327, 1026, 'Peacebloom');

-- Missing spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1328, 1618, 0, 1233.81, 933.051, 36.8226, 4.86947, 0, 0, -0.649447, 0.760406, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1328, 1041, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1329, 1618, 0, 1262.32, 1024.38, 43.5392, 2.54818, 0, 0, 0.956305, 0.292372, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1329, 1041, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1330, 1618, 0, 1298.74, 1153.24, 52.504, 0.401425, 0, 0, 0.199367, 0.979925, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1330, 1041, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1331, 1618, 0, 1348.36, 1005.2, 52.2037, 2.61799, 0, 0, 0.965925, 0.258821, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1331, 1041, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1332, 1618, 0, -246.822, 1142.97, 61.4903, 0.837758, 0, 0, 0.406736, 0.913545, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1332, 1041, 'Peacebloom');

-- Missing spawns in Teldrassil.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1333, 1618, 1, 9948.93, 1773.71, 1333.29, 0.890117, 0, 0, 0.43051, 0.902586, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1333, 1002, 'Peacebloom');

-- Missing spawns in Tirisfal Glades.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1334, 1618, 0, 2117.82, 295.336, 60.9441, 0.296705, 0, 0, 0.147809, 0.989016, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1334, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1335, 1618, 0, 1886.88, -220.493, 38.492, 4.83456, 0, 0, -0.66262, 0.748956, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1335, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1336, 1618, 0, 2363.27, 1298.64, 32.7865, 0.680677, 0, 0, 0.333806, 0.942642, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1336, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1337, 1618, 0, 2314.25, 49.2733, 31.3656, 4.93928, 0, 0, -0.622514, 0.782609, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1337, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1338, 1618, 0, 2314.62, 1553.87, 33.5216, 3.97936, 0, 0, -0.913545, 0.406738, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1338, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1339, 1618, 0, 1691.54, 646.112, 49.5556, 3.24635, 0, 0, -0.998629, 0.0523532, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1339, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1340, 1618, 0, 2458.25, 192.079, 32.4518, 4.62512, 0, 0, -0.737277, 0.675591, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1340, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1341, 1618, 0, 2689.26, 22.6892, 26.7711, 3.52557, 0, 0, -0.981627, 0.190812, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1341, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1342, 1618, 0, 2004.82, 430.121, 36.5728, 3.7001, 0, 0, -0.961261, 0.27564, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1342, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1343, 1618, 0, 2529.39, 1329.26, 28.9393, 4.06662, 0, 0, -0.894934, 0.446199, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1343, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1344, 1618, 0, 2006.02, 694.037, 41.9342, 6.0912, 0, 0, -0.0958452, 0.995396, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1344, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1354, 1618, 0, 2643.64, 916.569, 110.331, 5.044, 0, 0, -0.580703, 0.814116, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1354, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1359, 1618, 0, 2205.07, 438.51, 62.0898, 6.26573, 0, 0, -0.00872612, 0.999962, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1359, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1366, 1618, 0, 1631.95, -654.718, 47.0466, 1.39626, 0, 0, 0.642787, 0.766045, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1366, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1378, 1618, 0, 1636.3, -436.567, 44.9996, 1.02974, 0, 0, 0.492423, 0.870356, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1378, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1381, 1618, 0, 1801.63, -302.715, 37.7097, 0.436332, 0, 0, 0.216439, 0.976296, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1381, 1006, 'Peacebloom');


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=-6451.54, `position_y`=-3418.86, `position_z`=229.71, `orientation`=2.00713, `rotation0`=0, `rotation1`=0, `rotation2`=0.843391, `rotation3`=0.5373 WHERE `guid`=15916;
UPDATE `gameobject` SET `position_x`=-6930.42, `position_y`=-4351.05, `position_z`=11.3895, `orientation`=5.75959, `rotation0`=0, `rotation1`=0, `rotation2`=-0.258819, `rotation3`=0.965926 WHERE `guid`=17308;
UPDATE `gameobject` SET `position_x`=-6964.21, `position_y`=-4412.08, `position_z`=10.5654, `orientation`=0.0174525, `rotation0`=0, `rotation1`=0, `rotation2`=0.00872612, `rotation3`=0.999962 WHERE `guid`=17305;
UPDATE `gameobject` SET `position_x`=-4884.26, `position_y`=1158.3, `position_z`=81.752, `orientation`=1.0821, `rotation0`=0, `rotation1`=0, `rotation2`=0.515037, `rotation3`=0.857168 WHERE `guid`=15932;
UPDATE `gameobject` SET `position_x`=3248.19, `position_y`=-4352.48, `position_z`=128.272, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=39933;
UPDATE `gameobject` SET `position_x`=3435.67, `position_y`=-4595.98, `position_z`=104.199, `orientation`=1.64061, `rotation0`=0, `rotation1`=0, `rotation2`=0.731353, `rotation3`=0.681999 WHERE `guid`=39934;


-- Missing spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (15885, 142140, 1, 3655.02, -5225.06, 84.9615, 6.05629, 0, 0, -0.113203, 0.993572, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (15885, 1239, 'Purple Lotus');

-- Missing spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (15869, 142140, 1, -3093.81, 1941.48, 29.1315, 4.64258, 0, 0, -0.731354, 0.681998, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (15869, 1324, 'Purple Lotus');

-- Missing spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (15807, 142140, 0, -195.593, -4092.25, 152.112, 0.610863, 0, 0, 0.300705, 0.953717, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (15807, 1254, 'Purple Lotus');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (15796, 142140, 0, -170.906, -3785.24, 238.499, 0.837758, 0, 0, 0.406736, 0.913545, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (15796, 1254, 'Purple Lotus');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (15791, 142140, 0, 330.611, -3794.22, 164.849, 0.750491, 0, 0, 0.366501, 0.930418, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (15791, 1254, 'Purple Lotus');



-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=1316.55, `position_y`=680.78, `position_z`=35.2747, `orientation`=4.50295, `rotation0`=0, `rotation1`=0, `rotation2`=-0.777145, `rotation3`=0.629321 WHERE `guid`=2298;
UPDATE `gameobject` SET `position_x`=-9495.91, `position_y`=-2337.42, `position_z`=69.3455, `orientation`=0.977383, `rotation0`=0, `rotation1`=0, `rotation2`=0.469471, `rotation3`=0.882948 WHERE `guid`=2243;
UPDATE `gameobject` SET `position_x`=849.742, `position_y`=1241.85, `position_z`=33.9615, `orientation`=1.29154, `rotation0`=0, `rotation1`=0, `rotation2`=0.601814, `rotation3`=0.798636 WHERE `guid`=2251;
UPDATE `gameobject` SET `position_x`=718.524, `position_y`=1453.72, `position_z`=61.1236, `orientation`=2.84488, `rotation0`=0, `rotation1`=0, `rotation2`=0.989016, `rotation3`=0.147811 WHERE `guid`=2090;
UPDATE `gameobject` SET `position_x`=-81.7723, `position_y`=-770.163, `position_z`=56.3972, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=2399;
UPDATE `gameobject` SET `position_x`=-9670.18, `position_y`=-1768.52, `position_z`=55.2737, `orientation`=4.7822, `rotation0`=0, `rotation1`=0, `rotation2`=-0.681998, `rotation3`=0.731354 WHERE `guid`=2288;


-- Missing spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2014, 1620, 1, 2939.44, -3543.78, 109.3, 1.36136, 0, 0, 0.62932, 0.777146, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2014, 1077, 'Mageroyal');

-- Missing spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2015, 1620, 1, 1131.9, -4685.81, 20.0887, 4.2237, 0, 0, -0.857167, 0.515038, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2015, 1023, 'Mageroyal');

-- Missing spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2024, 1620, 0, -4799.45, -3015.7, 305.452, 4.57276, 0, 0, -0.754709, 0.656059, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2024, 1163, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2032, 1620, 0, -5042.01, -3358.18, 298.81, 5.48033, 0, 0, -0.390731, 0.920505, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2032, 1163, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2033, 1620, 0, -5856.29, -3448.97, 318.345, 3.71755, 0, 0, -0.958819, 0.284016, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2033, 1163, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2047, 1620, 0, -5011.31, -3508.53, 299.731, 0.95993, 0, 0, 0.461748, 0.887011, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2047, 1163, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2059, 1620, 0, -5407.17, -2842.9, 349.277, 5.77704, 0, 0, -0.25038, 0.968148, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2059, 1163, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2074, 1620, 0, -4992.66, -3306.73, 299.76, 5.65487, 0, 0, -0.309016, 0.951057, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2074, 1163, 'Mageroyal');

-- Missing spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2077, 1620, 0, 958.84, 1069.46, 36.558, 6.21337, 0, 0, -0.0348988, 0.999391, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2077, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2094, 1620, 0, 676.372, 1213.96, 65.2791, 4.67748, 0, 0, -0.719339, 0.694659, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2094, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2102, 1620, 0, 1212.28, 1081.24, 38.5364, 5.95157, 0, 0, -0.165047, 0.986286, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2102, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2132, 1620, 0, 1336.83, 743.906, 34.2843, 2.54818, 0, 0, 0.956305, 0.292372, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2132, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2157, 1620, 0, 809.661, 1477.3, 33.4895, 2.75761, 0, 0, 0.981627, 0.190812, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2157, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2215, 1620, 0, 805.578, 1547.65, 43.077, 4.57276, 0, 0, -0.754709, 0.656059, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2215, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2239, 1620, 0, 708.846, 1229.78, 62.9129, 4.34587, 0, 0, -0.824126, 0.566406, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2239, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2248, 1620, 0, 868.94, 1162.26, 35.5119, 4.13643, 0, 0, -0.878817, 0.47716, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2248, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2269, 1620, 0, -293.199, 1221.4, 47.9139, 3.78737, 0, 0, -0.948323, 0.317306, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2269, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2302, 1620, 0, 886.554, 1540.91, 26.2854, 2.3911, 0, 0, 0.930417, 0.366502, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2302, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2331, 1620, 0, 1123.37, 1095.89, 40.1016, 3.90954, 0, 0, -0.927183, 0.374608, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2331, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2364, 1620, 0, 1284.96, 910.183, 39.4659, 0.279252, 0, 0, 0.139173, 0.990268, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2364, 1043, 'Mageroyal');

-- Missing spawns in Wailing Caverns.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2368, 1620, 1, -545.644, -2245.66, 42.6309, 2.96704, 0, 0, 0.996194, 0.087165, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2368, 1053, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2371, 1620, 1, -652.396, -2330.84, 19.6195, 5.93412, 0, 0, -0.173648, 0.984808, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2371, 1053, 'Mageroyal');

-- Missing spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2373, 1620, 0, -4232.42, -2674.76, 41.5726, 3.17653, 0, 0, -0.999847, 0.0174693, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2373, 1154, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2391, 1620, 0, -3065.17, -2583.33, 11.2463, 3.31614, 0, 0, -0.996194, 0.087165, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2391, 1154, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2396, 1620, 0, -3847.47, -2681.57, 31.1856, 5.39307, 0, 0, -0.43051, 0.902586, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2396, 1154, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2416, 1620, 0, -3918.23, -2716.54, 26.4426, 5.20108, 0, 0, -0.515037, 0.857168, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2416, 1154, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2435, 1620, 0, -3139.51, -2545.52, 9.23924, 2.30383, 0, 0, 0.913545, 0.406738, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2435, 1154, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2449, 1620, 0, -3348.16, -3278.91, 23.1451, 2.28638, 0, 0, 0.909961, 0.414694, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2449, 1154, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2465, 1620, 0, -2962.5, -2679.83, 13.754, 4.29351, 0, 0, -0.83867, 0.54464, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2465, 1154, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2484, 1620, 0, -3317.16, -2676.49, 14.5292, 6.02139, 0, 0, -0.130526, 0.991445, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2484, 1154, 'Mageroyal');


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=3082.94, `position_y`=-3554.52, `position_z`=132.872, `orientation`=0.977383, `rotation0`=0, `rotation1`=0, `rotation2`=0.469471, `rotation3`=0.882948 WHERE `guid`=19970;
UPDATE `gameobject` SET `position_x`=3181.9, `position_y`=-3130.97, `position_z`=154.537, `orientation`=1.16937, `rotation0`=0, `rotation1`=0, `rotation2`=0.551936, `rotation3`=0.833886 WHERE `guid`=20094;
UPDATE `gameobject` SET `position_x`=2495.23, `position_y`=-4580.06, `position_z`=78.383, `orientation`=4.10152, `rotation0`=0, `rotation1`=0, `rotation2`=-0.887011, `rotation3`=0.461749 WHERE `guid`=19905;
UPDATE `gameobject` SET `position_x`=2019.04, `position_y`=-4695.94, `position_z`=91.3082, `orientation`=2.94959, `rotation0`=0, `rotation1`=0, `rotation2`=0.995396, `rotation3`=0.0958512 WHERE `guid`=19955;
UPDATE `gameobject` SET `position_x`=1711.95, `position_y`=-3935.5, `position_z`=130.9, `orientation`=4.55531, `rotation0`=0, `rotation1`=0, `rotation2`=-0.760405, `rotation3`=0.649449 WHERE `guid`=19910;
UPDATE `gameobject` SET `position_x`=2239.62, `position_y`=-5264.17, `position_z`=75.2423, `orientation`=2.28638, `rotation0`=0, `rotation1`=0, `rotation2`=0.909961, `rotation3`=0.414694 WHERE `guid`=20127;


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=-6800.22, `position_y`=-4753.86, `position_z`=9.97542, `orientation`=5.42798, `rotation0`=0, `rotation1`=0, `rotation2`=-0.414693, `rotation3`=0.909962 WHERE `guid`=12252;
UPDATE `gameobject` SET `position_x`=-7221.24, `position_y`=-1565.34, `position_z`=254.58, `orientation`=3.00195, `rotation0`=0, `rotation1`=0, `rotation2`=0.997563, `rotation3`=0.0697661 WHERE `guid`=31322;
UPDATE `gameobject` SET `position_x`=-6551.81, `position_y`=-3283.02, `position_z`=241.864, `orientation`=2.11185, `rotation0`=0, `rotation1`=0, `rotation2`=0.870356, `rotation3`=0.492424 WHERE `guid`=12306;


-- Missing spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (9980, 2866, 0, -6872.54, -1692.59, 247.038, 4.43314, 0, 0, -0.798635, 0.601815, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (9980, 1291, 'Firebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (9991, 2866, 0, -7319.13, -934.882, 244.218, 3.194, 0, 0, -0.999657, 0.0262017, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (9991, 1291, 'Firebloom');




-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=461.656, `position_y`=202.05, `position_z`=42.4419, `orientation`=6.21337, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0348988, `rotation3`=0.999391 WHERE `guid`=3853;
UPDATE `gameobject` SET `position_x`=359.451, `position_y`=1396.92, `position_z`=132.017, `orientation`=0.802851, `rotation0`=0, `rotation1`=0, `rotation2`=0.390731, `rotation3`=0.920505 WHERE `guid`=3750;
UPDATE `gameobject` SET `position_x`=-2585.17, `position_y`=-2386.27, `position_z`=80.2662, `orientation`=5.32326, `rotation0`=0, `rotation1`=0, `rotation2`=-0.461748, `rotation3`=0.887011 WHERE `guid`=3531;
UPDATE `gameobject` SET `position_x`=-465.653, `position_y`=-1409.62, `position_z`=89.7087, `orientation`=5.72468, `rotation0`=0, `rotation1`=0, `rotation2`=-0.275637, `rotation3`=0.961262 WHERE `guid`=3833;
UPDATE `gameobject` SET `position_x`=-9109.17, `position_y`=-2640.52, `position_z`=120.736, `orientation`=0.0523589, `rotation0`=0, `rotation1`=0, `rotation2`=0.0261765, `rotation3`=0.999657 WHERE `guid`=3182;
UPDATE `gameobject` SET `position_x`=-4246.6, `position_y`=-2604.91, `position_z`=84.7081, `orientation`=2.51327, `rotation0`=0, `rotation1`=0, `rotation2`=0.951056, `rotation3`=0.309017 WHERE `guid`=2960;
UPDATE `gameobject` SET `position_x`=-6059.98, `position_y`=-3502.83, `position_z`=-51.4185, `orientation`=4.13643, `rotation0`=0, `rotation1`=0, `rotation2`=-0.878817, `rotation3`=0.47716 WHERE `guid`=3647;
UPDATE `gameobject` SET `position_x`=-4971.19, `position_y`=-1936.63, `position_z`=-37.8026, `orientation`=2.56563, `rotation0`=0, `rotation1`=0, `rotation2`=0.958819, `rotation3`=0.284016 WHERE `guid`=3616;
UPDATE `gameobject` SET `position_x`=-271.263, `position_y`=-1279.71, `position_z`=83.612, `orientation`=6.14356, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0697555, `rotation3`=0.997564 WHERE `guid`=3569;
UPDATE `gameobject` SET `position_x`=-3872.2, `position_y`=-2602.69, `position_z`=52.5481, `orientation`=2.14675, `rotation0`=0, `rotation1`=0, `rotation2`=0.878817, `rotation3`=0.47716 WHERE `guid`=3581;
UPDATE `gameobject` SET `position_x`=-870.382, `position_y`=1478.65, `position_z`=70.024, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=3814;
UPDATE `gameobject` SET `position_x`=-4331.15, `position_y`=-2649.06, `position_z`=96.4845, `orientation`=3.31614, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996194, `rotation3`=0.087165 WHERE `guid`=3487;
UPDATE `gameobject` SET `position_x`=-1676.69, `position_y`=1979.87, `position_z`=60.7538, `orientation`=6.26573, `rotation0`=0, `rotation1`=0, `rotation2`=-0.00872612, `rotation3`=0.999962 WHERE `guid`=3772;
UPDATE `gameobject` SET `position_x`=-4399.95, `position_y`=-1006.17, `position_z`=-53.1422, `orientation`=4.2237, `rotation0`=0, `rotation1`=0, `rotation2`=-0.857167, `rotation3`=0.515038 WHERE `guid`=3697;
UPDATE `gameobject` SET `position_x`=-9853.16, `position_y`=1047.78, `position_z`=33.4548, `orientation`=0.488691, `rotation0`=0, `rotation1`=0, `rotation2`=0.241921, `rotation3`=0.970296 WHERE `guid`=3795;


INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1052, 1, 'Bruiseweed in Arathi Highlands', 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1053, 1, 'Herbs in Wailing Caverns', 0, 0, 0, 10);


-- Missing spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2917, 1622, 0, -98.9951, 244.966, 53.2755, 4.67748, 0, 0, -0.719339, 0.694659, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2917, 1056, 'Bruiseweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2929, 1622, 0, 49.357, 437.539, 41.9076, 5.49779, 0, 0, -0.382683, 0.92388, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2929, 1056, 'Bruiseweed');

-- Missing spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2941, 1622, 0, -1075.52, -2794.77, 42.197, 3.6652, 0, 0, -0.965925, 0.258821, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2941, 1052, 'Bruiseweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3062, 1622, 0, -863.799, -2067.71, 34.5095, 4.90438, 0, 0, -0.636078, 0.771625, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3062, 1052, 'Bruiseweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3074, 1622, 0, -1096.9, -2921.88, 42.197, 4.71239, 0, 0, -0.707107, 0.707107, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3074, 1052, 'Bruiseweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3079, 1622, 0, -869.361, -2011.93, 34.3577, 1.78023, 0, 0, 0.777145, 0.629321, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3079, 1052, 'Bruiseweed');

-- Missing spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2957, 1622, 1, 2688.04, -3632.16, 99.4288, 4.53786, 0, 0, -0.766044, 0.642789, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2957, 1072, 'Bruiseweed');

-- Missing spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2966, 1622, 0, -495.436, 128.488, 56.6126, 4.92183, 0, 0, -0.62932, 0.777146, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2966, 1048, 'Bruiseweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2969, 1622, 0, -1032.7, -258.556, 24.9987, 4.27606, 0, 0, -0.843391, 0.5373, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2969, 1048, 'Bruiseweed');

-- Missing spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2970, 1622, 0, -195.068, 955.452, 65.7338, 3.76991, 0, 0, -0.951056, 0.309017, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2970, 1047, 'Bruiseweed');

-- Missing spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2972, 1622, 1, -185.075, -496.055, 9.14996, 3.57793, 0, 0, -0.976295, 0.216442, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2972, 1086, 'Bruiseweed');

-- Missing spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2988, 1622, 1, -4755.94, -1052.56, -55.8106, 2.56563, 0, 0, 0.958819, 0.284016, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2988, 1133, 'Bruiseweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3031, 1622, 1, -4652.88, -1281.84, -45.4742, 1.90241, 0, 0, 0.814116, 0.580703, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3031, 1133, 'Bruiseweed');

-- Missing spawns in Wailing Caverns.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3035, 1622, 1, -735.582, -2128.8, 66.6034, 3.45576, 0, 0, -0.987688, 0.156436, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3035, 1053, 'Bruiseweed');

-- Missing spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3043, 1622, 0, -4212.26, -2354.9, 204.552, 4.32842, 0, 0, -0.829037, 0.559194, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3043, 1150, 'Bruiseweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3059, 1622, 0, -3574.38, -2477.01, 72.7115, 1.76278, 0, 0, 0.771625, 0.636078, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3059, 1150, 'Bruiseweed');




-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=1570.34, `position_y`=-1310.87, `position_z`=63.0546, `orientation`=2.42601, `rotation0`=0, `rotation1`=0, `rotation2`=0.936672, `rotation3`=0.350207 WHERE `guid`=16002;
UPDATE `gameobject` SET `position_x`=1748.99, `position_y`=-909.477, `position_z`=66.7775, `orientation`=3.85718, `rotation0`=0, `rotation1`=0, `rotation2`=-0.936671, `rotation3`=0.35021 WHERE `guid`=15980;
UPDATE `gameobject` SET `position_x`=1270.88, `position_y`=-1507.6, `position_z`=58.8005, `orientation`=2.1293, `rotation0`=0, `rotation1`=0, `rotation2`=0.874619, `rotation3`=0.48481 WHERE `guid`=15968;


-- Missing spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (15892, 142141, 0, 1543.4, -1647.88, 69.2486, 5.0091, 0, 0, -0.594823, 0.803857, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (15892, 1259, "Arthas' Tears");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (15948, 142141, 0, 1455.01, -1599.38, 67.2372, 3.927, 0, 0, -0.923879, 0.382686, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (15948, 1259, "Arthas' Tears");



-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=-633.39, `position_y`=-1566.65, `position_z`=64.1649, `orientation`=0.418879, `rotation0`=0, `rotation1`=0, `rotation2`=0.207912, `rotation3`=0.978148 WHERE `guid`=2869;
UPDATE `gameobject` SET `position_x`=502.74, `position_y`=1208.63, `position_z`=87.6672, `orientation`=1.51844, `rotation0`=0, `rotation1`=0, `rotation2`=0.688354, `rotation3`=0.725375 WHERE `guid`=2727;
UPDATE `gameobject` SET `position_x`=9.14334, `position_y`=1086.47, `position_z`=68.8772, `orientation`=3.68265, `rotation0`=0, `rotation1`=0, `rotation2`=-0.96363, `rotation3`=0.267241 WHERE `guid`=42968;
UPDATE `gameobject` SET `position_x`=-10273.4, `position_y`=841.916, `position_z`=42.2785, `orientation`=5.11382, `rotation0`=0, `rotation1`=0, `rotation2`=-0.551936, `rotation3`=0.833886 WHERE `guid`=2622;
UPDATE `gameobject` SET `position_x`=-10448.7, `position_y`=-1362.45, `position_z`=79.5184, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=2595;


-- Missing spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2543, 1621, 0, -11105.6, -731.904, 56.4545, 0.820303, 0, 0, 0.398748, 0.91706, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2543, 1113, 'Briarthorn');                        

-- Missing spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2568, 1621, 0, -952.438, 185.32, 39.5891, 1.27409, 0, 0, 0.594822, 0.803857, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2568, 1050, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2587, 1621, 0, -507.498, 242.908, 73.3424, 1.02974, 0, 0, 0.492423, 0.870356, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2587, 1050, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2588, 1621, 0, -523.583, 434.796, 85.6967, 4.27606, 0, 0, -0.843391, 0.5373, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2588, 1050, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2597, 1621, 0, -921.657, 75.1367, 36.0038, 3.35105, 0, 0, -0.994521, 0.104535, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2597, 1050, 'Briarthorn');                        

-- Missing spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2613, 1621, 0, -5259.97, -3520.82, 300.448, 6.07375, 0, 0, -0.104528, 0.994522, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2613, 1165, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2617, 1621, 0, -5177.44, -3443.42, 304.83, 3.22886, 0, 0, -0.999048, 0.0436193, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2617, 1165, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2626, 1621, 0, -5147.11, -3496.26, 304.571, 2.35619, 0, 0, 0.92388, 0.382683, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2626, 1165, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2658, 1621, 0, -4874.16, -3374.26, 308.717, 1.3439, 0, 0, 0.622514, 0.782609, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2658, 1165, 'Briarthorn');                        

-- Missing spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2692, 1621, 0, -9100.39, -2601.51, 117.783, 2.30383, 0, 0, 0.913545, 0.406738, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2692, 1127, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2693, 1621, 0, -9567.76, -2131.51, 74.0443, 0.890117, 0, 0, 0.43051, 0.902586, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2693, 1127, 'Briarthorn');                        

-- Missing spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2704, 1621, 0, 691.563, 1286.89, 74.3206, 4.04917, 0, 0, -0.898793, 0.438373, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2704, 1046, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2730, 1621, 0, 729.797, 1482.48, 62.22, 0.174532, 0, 0, 0.0871553, 0.996195, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2730, 1046, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2788, 1621, 0, -322.612, 1153.8, 70.5041, 2.77507, 0, 0, 0.983254, 0.182238, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2788, 1046, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2789, 1621, 0, -495.378, 1155, 63.7513, 4.5204, 0, 0, -0.771625, 0.636078, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2789, 1046, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2794, 1621, 0, -493.935, 1189.47, 61.2801, 2.61799, 0, 0, 0.965925, 0.258821, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2794, 1046, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2795, 1621, 0, -517.273, 1045.46, 91.7688, 5.20108, 0, 0, -0.515037, 0.857168, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2795, 1046, 'Briarthorn');                        

-- Missing spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2815, 1621, 1, -213.583, -511.994, 10.9339, 2.25147, 0, 0, 0.902585, 0.430512, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2815, 1087, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2823, 1621, 1, 284.004, 238.587, 68.6627, 3.76991, 0, 0, -0.951056, 0.309017, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2823, 1087, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2837, 1621, 1, 1839.3, 957.335, 149.863, 5.02655, 0, 0, -0.587785, 0.809017, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2837, 1087, 'Briarthorn');                        

-- Missing spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2853, 1621, 0, -10605.6, 1229.34, 33.087, 0.436332, 0, 0, 0.216439, 0.976296, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2853, 1109, 'Briarthorn');                        

-- Missing spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2894, 1621, 0, -3925.27, -2591.35, 43.6762, 4.15388, 0, 0, -0.874619, 0.48481, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2894, 1151, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2895, 1621, 0, -3141.5, -2912.14, 21.8747, 4.15388, 0, 0, -0.874619, 0.48481, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2895, 1151, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`,`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2896, 1621, 0, -3326.56, -3155.95, 24.4531, 5.93412, 0, 0, -0.173648, 0.984808, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2896, 1151, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (30009, 1621, 0, -3402.69, -3235.19, 23.3302, 4.10152, 0, 0, -0.887011, 0.461749, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (30009, 1151, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (48641, 1621, 0, -3334.19, -2619.98, 10.2918, 1.6057, 0, 0, 0.719339, 0.694659, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (48641, 1151, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (48751, 1621, 0, -3526.27, -2432.7, 56.1001, 3.38594, 0, 0, -0.992546, 0.12187, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (48751, 1151, 'Briarthorn');
