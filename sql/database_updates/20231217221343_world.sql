
-- Changes by SHANG
REPLACE INTO `creature` VALUES (2582235,61890,0,0,0,0,-4033.75,-3443.32,283.312,0.889304,300,300,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582235,61890,0,0,0,0,-4033.75,-3443.32,283.312,0.889304,300,300,0,100,100,0,0,0);

-- Changes by WOJI
REPLACE INTO `gameobject` VALUES ( 5017894, 1000318, 0, 3176.91, -2542.43, 101.994, 3.79091, 0, 0, 0.94776, -0.318985, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370400545324175654, 0.600000);
REPLACE INTO `gameobject` VALUES ( 5017894, 1000318, 0, 3176.91, -2542.43, 101.994, 3.79091, 0, 0, 0.94776, -0.318985, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017894, 1000318, 0, 3177.31, -2542.43, 101.994, 3.79091, 0, 0, 0.94776, -0.318985, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017894, 1000318, 0, 3176.91, -2542.43, 101.994, 3.79091, 0, 0, 0.94776, -0.318985, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017894, 1000318, 0, 3176.51, -2542.43, 101.994, 3.79091, 0, 0, 0.94776, -0.318985, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017894, 1000318, 0, 3176.11, -2542.43, 101.994, 3.79091, 0, 0, 0.94776, -0.318985, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370400545324175654, 0.800000);
REPLACE INTO `gameobject` VALUES ( 5017894, 1000318, 0, 3176.11, -2542.43, 101.994, 3.79091, 0, 0, 0.94776, -0.318985, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017894, 1000318, 0, 3175.91, -2542.43, 101.994, 3.79091, 0, 0, 0.94776, -0.318985, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017894, 1000318, 0, 3176.11, -2542.43, 101.994, 3.79091, 0, 0, 0.94776, -0.318985, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017894, 1000318, 0, 3176.31, -2542.43, 101.994, 3.79091, 0, 0, 0.94776, -0.318985, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017894, 1000318, 0, 3176.31, -2542.43, 102.194, 3.79091, 0, 0, 0.94776, -0.318985, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017894, 1000318, 0, 3176.31, -2542.43, 101.994, 3.79091, 0, 0, 0.94776, -0.318985, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017894, 1000318, 0, 3176.31, -2542.43, 101.794, 3.79091, 0, 0, 0.94776, -0.318985, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017894, 1000318, 0, 3176.31, -2542.43, 101.994, 3.79091, 0, 0, 0.94776, -0.318985, 300, 300, 100, 1, 0, 0);

-- Changes by REN
REPLACE INTO `gameobject` VALUES ( 5017812, 2010650, 0, 1499.48, 280.344, -60.5716, 1.14526, 0, 0, 0.541845, 0.840478, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017812, 2010650, 0, 1499.68, 280.344, -60.5716, 1.14526, 0, 0, 0.541845, 0.840478, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017837, 1000381, 0, 1497.27, 280.338, -57.8458, 1.15312, 0, 0, 0.545142, 0.838344, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5017837';
DELETE FROM game_event_gameobject WHERE guid = '5017837';
DELETE FROM gameobject_battleground WHERE guid = '5017837';
REPLACE INTO `gameobject` VALUES ( 5017832, 1000381, 0, 1498.27, 281.561, -57.7669, 3.46218, 0, 0, 0.98718, -0.159611, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5017832';
DELETE FROM game_event_gameobject WHERE guid = '5017832';
DELETE FROM gameobject_battleground WHERE guid = '5017832';
REPLACE INTO `gameobject` VALUES ( 5017838, 2010662, 0, 1504.73, 286.686, -61.1747, 0.964617, 0, 0, 0.463826, 0.885926, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017838, 2010662, 0, 1504.93, 286.686, -61.1747, 0.964617, 0, 0, 0.463826, 0.885926, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017836, 1000381, 0, 1501.13, 278.369, -57.7716, 1.28272, 0, 0, 0.598285, 0.801284, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5017836';
DELETE FROM game_event_gameobject WHERE guid = '5017836';
DELETE FROM gameobject_battleground WHERE guid = '5017836';
REPLACE INTO `gameobject` VALUES ( 5017831, 1000381, 0, 1501.07, 279.961, -57.7669, 5.27254, 0, 0, 0.484089, -0.875019, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5017831';
DELETE FROM game_event_gameobject WHERE guid = '5017831';
DELETE FROM gameobject_battleground WHERE guid = '5017831';
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1501.61, 283.645, -62.1718, 4.75812, 0, 0, 0.690756, -0.723088, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370417387837100327, 3.800000);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1501.61, 283.645, -62.1718, 4.75812, 0, 0, 0.690756, -0.723088, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1501.61, 283.645, -59.3718, 4.75812, 0, 0, 0.690756, -0.723088, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1501.61, 283.645, -56.5718, 4.75812, 0, 0, 0.690756, -0.723088, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1501.61, 283.645, -58.1718, 4.75812, 0, 0, 0.690756, -0.723088, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.01, 283.645, -58.1718, 4.75812, 0, 0, 0.690756, -0.723088, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.01, 285.245, -58.1718, 4.75812, 0, 0, 0.690756, -0.723088, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.01, 283.645, -58.1718, 4.75812, 0, 0, 0.690756, -0.723088, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.01, 282.045, -58.1718, 4.75812, 0, 0, 0.690756, -0.723088, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.01, 281.845, -58.1718, 4.75812, 0, 0, 0.690756, -0.723088, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.01, 281.645, -58.1718, 4.75812, 0, 0, 0.690756, -0.723088, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.01, 281.445, -58.1718, 4.75812, 0, 0, 0.690756, -0.723088, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.01, 281.245, -58.1718, 4.75812, 0, 0, 0.690756, -0.723088, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.21, 281.245, -58.1718, 4.75812, 0, 0, 0.690756, -0.723088, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.41, 281.245, -58.1718, 4.75812, 0, 0, 0.690756, -0.723088, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.61, 281.245, -58.1718, 4.75812, 0, 0, 0.690756, -0.723088, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.61, 281.245, -57.9718, 4.75812, 0, 0, 0.690756, -0.723088, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.61, 281.245, -57.9718, 5.05264, 0, 0, 0.57718, -0.816617, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.61, 281.245, -57.9718, 5.64169, 0, 0, 0.315278, -0.948999, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.61, 281.245, -57.9718, 5.43748, 0, 0, 0.410362, -0.911923, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.81, 281.245, -57.9718, 5.43748, 0, 0, 0.410362, -0.911923, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.81, 281.445, -57.9718, 5.43748, 0, 0, 0.410362, -0.911923, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.81, 281.245, -57.9718, 5.43748, 0, 0, 0.410362, -0.911923, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.81, 281.045, -57.9718, 5.43748, 0, 0, 0.410362, -0.911923, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.81, 280.845, -57.9718, 5.43748, 0, 0, 0.410362, -0.911923, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1500.81, 280.645, -57.9718, 5.43748, 0, 0, 0.410362, -0.911923, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1501.01, 280.645, -57.9718, 5.43748, 0, 0, 0.410362, -0.911923, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1501.21, 280.645, -57.9718, 5.43748, 0, 0, 0.410362, -0.911923, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1501.21, 280.445, -57.9718, 5.43748, 0, 0, 0.410362, -0.911923, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1501.21, 280.245, -57.9718, 5.43748, 0, 0, 0.410362, -0.911923, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1501.21, 280.045, -57.9718, 5.43748, 0, 0, 0.410362, -0.911923, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017895, 2004210, 0, 1501.21, 280.045, -57.7718, 5.43748, 0, 0, 0.410362, -0.911923, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1501.03, 283.411, -62.1713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370417387837100328, 3.800000);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1501.03, 283.411, -62.1713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1501.03, 283.411, -59.3713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1501.03, 283.411, -56.5713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1501.03, 283.411, -57.5713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1502.03, 283.411, -57.5713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1501.03, 283.411, -57.5713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1500.03, 283.411, -57.5713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1499.03, 283.411, -57.5713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1499.03, 282.411, -57.5713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1499.03, 281.411, -57.5713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1499.03, 282.411, -57.5713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1498.83, 282.411, -57.5713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1498.83, 282.211, -57.5713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1498.83, 282.011, -57.5713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1498.83, 281.811, -57.5713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1498.83, 281.611, -57.5713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1498.83, 281.611, -57.7713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1498.83, 281.411, -57.7713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1498.63, 281.411, -57.7713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1498.63, 281.411, -57.5713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1498.63, 281.411, -57.7713, 3.53682, 0, 0, 0.980538, -0.196328, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1498.63, 281.411, -57.7713, 2.46475, 0, 0, 0.943279, 0.332, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1498.63, 281.411, -57.7713, 1.22382, 0, 0, 0.57443, 0.818554, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1498.63, 281.411, -57.7713, 3.92951, 0, 0, 0.923396, -0.383848, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1498.63, 281.411, -57.7713, 3.22658, 0, 0, 0.999097, -0.0424812, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1498.63, 281.411, -57.7713, 3.75672, 0, 0, 0.953074, -0.302739, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1498.63, 281.411, -57.7713, 3.40722, 0, 0, 0.991193, -0.132424, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017897, 2004210, 0, 1500.69, 282.498, -61.6676, 4.56568, 0, 0, 0.757028, -0.653383, 300, 300, 100, 1, 0, 0);
DELETE FROM gameobject WHERE guid = '5017897';
DELETE FROM game_event_gameobject WHERE guid = '5017897';
DELETE FROM gameobject_battleground WHERE guid = '5017897';
DELETE FROM gameobject WHERE guid = '5017895';
DELETE FROM game_event_gameobject WHERE guid = '5017895';
DELETE FROM gameobject_battleground WHERE guid = '5017895';
REPLACE INTO `gameobject` VALUES ( 5017896, 2004210, 0, 1498.43, 281.411, -57.7713, 3.40722, 0, 0, 0.991193, -0.132424, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017898, 2004210, 0, 1500.69, 282.498, -61.6676, 4.37719, 0, 0, 0.815157, -0.579241, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017898, 2004210, 0, 1500.69, 282.498, -58.8676, 4.37719, 0, 0, 0.815157, -0.579241, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017898, 2004210, 0, 1500.69, 282.498, -57.8676, 4.37719, 0, 0, 0.815157, -0.579241, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017898, 2004210, 0, 1501.69, 282.498, -57.8676, 4.37719, 0, 0, 0.815157, -0.579241, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017898, 2004210, 0, 1501.69, 281.498, -57.8676, 4.37719, 0, 0, 0.815157, -0.579241, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017898, 2004210, 0, 1501.69, 280.498, -57.8676, 4.37719, 0, 0, 0.815157, -0.579241, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370417387837100330, 3.800000);
REPLACE INTO `gameobject` VALUES ( 5017898, 2004210, 0, 1501.69, 280.498, -57.8676, 4.37719, 0, 0, 0.815157, -0.579241, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017898, 2004210, 0, 1501.69, 280.498, -57.8676, 2.94383, 0, 0, 0.995115, 0.0987182, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017898, 2004210, 0, 1501.69, 280.498, -57.8676, 5.34715, 0, 0, 0.451117, -0.892465, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017898, 2004210, 0, 1501.49, 280.498, -57.8676, 5.34715, 0, 0, 0.451117, -0.892465, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017898, 2004210, 0, 1501.29, 280.498, -57.8676, 5.34715, 0, 0, 0.451117, -0.892465, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017898, 2004210, 0, 1501.29, 280.298, -57.8676, 5.34715, 0, 0, 0.451117, -0.892465, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017898, 2004210, 0, 1501.29, 280.098, -57.8676, 5.34715, 0, 0, 0.451117, -0.892465, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017898, 2004210, 0, 1501.29, 279.898, -57.8676, 5.34715, 0, 0, 0.451117, -0.892465, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017898, 2004210, 0, 1501.29, 279.898, -57.6676, 5.34715, 0, 0, 0.451117, -0.892465, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017898, 2004210, 0, 1501.29, 279.898, -57.8676, 5.34715, 0, 0, 0.451117, -0.892465, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1500.69, 282.498, -61.6676, 4.3654, 0, 0, 0.818557, -0.574426, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370417387837100331, 4.000000);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1500.69, 282.498, -61.6676, 4.3654, 0, 0, 0.818557, -0.574426, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1500.69, 282.498, -61.6676, 5.8498, 0, 0, 0.215003, -0.976613, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1500.69, 282.498, -61.6676, 2.61788, 0, 0, 0.965911, 0.258873, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1500.69, 282.498, -58.6676, 2.61788, 0, 0, 0.965911, 0.258873, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1500.69, 282.498, -58.2676, 2.61788, 0, 0, 0.965911, 0.258873, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.09, 282.498, -58.2676, 2.61788, 0, 0, 0.965911, 0.258873, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.09, 282.098, -58.2676, 2.61788, 0, 0, 0.965911, 0.258873, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.09, 281.698, -58.2676, 2.61788, 0, 0, 0.965911, 0.258873, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.09, 281.298, -58.2676, 2.61788, 0, 0, 0.965911, 0.258873, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.09, 281.298, -57.8676, 2.61788, 0, 0, 0.965911, 0.258873, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.09, 280.898, -57.8676, 2.61788, 0, 0, 0.965911, 0.258873, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.09, 280.498, -57.8676, 2.61788, 0, 0, 0.965911, 0.258873, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.09, 280.098, -57.8676, 2.61788, 0, 0, 0.965911, 0.258873, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.09, 279.698, -57.8676, 2.61788, 0, 0, 0.965911, 0.258873, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.09, 279.298, -57.8676, 2.61788, 0, 0, 0.965911, 0.258873, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.09, 279.298, -57.8676, 1.68326, 0, 0, 0.745729, 0.666249, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.09, 278.898, -57.8676, 1.68326, 0, 0, 0.745729, 0.666249, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1500.69, 278.898, -57.8676, 1.68326, 0, 0, 0.745729, 0.666249, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.09, 278.898, -57.8676, 1.68326, 0, 0, 0.745729, 0.666249, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.49, 278.898, -57.8676, 1.68326, 0, 0, 0.745729, 0.666249, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.89, 278.898, -57.8676, 1.68326, 0, 0, 0.745729, 0.666249, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.89, 278.498, -57.8676, 1.68326, 0, 0, 0.745729, 0.666249, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.89, 278.098, -57.8676, 1.68326, 0, 0, 0.745729, 0.666249, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.89, 278.098, -57.6676, 1.68326, 0, 0, 0.745729, 0.666249, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.89, 278.098, -57.8676, 1.68326, 0, 0, 0.745729, 0.666249, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.89, 278.098, -57.8676, 1.88745, 0, 0, 0.80975, 0.586775, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.89, 278.098, -57.8676, 1.61649, 0, 0, 0.723076, 0.690768, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.89, 278.098, -57.8676, 1.26698, 0, 0, 0.591963, 0.805965, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.89, 278.098, -57.8676, 1.47119, 0, 0, 0.671028, 0.741432, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.89, 278.098, -57.8676, 1.10991, 0, 0, 0.526903, 0.849925, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.89, 278.098, -57.8676, 1.75393, 0, 0, 0.768802, 0.639487, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.89, 278.098, -57.8676, 1.36516, 0, 0, 0.630797, 0.775948, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.89, 277.898, -57.8676, 1.36516, 0, 0, 0.630797, 0.775948, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1502.09, 277.898, -57.8676, 1.36516, 0, 0, 0.630797, 0.775948, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.89, 277.898, -57.8676, 1.36516, 0, 0, 0.630797, 0.775948, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.89, 277.898, -57.8676, 1.28662, 0, 0, 0.599846, 0.800115, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017899, 2004210, 0, 1501.89, 277.898, -57.8676, 1.49475, 0, 0, 0.679715, 0.733476, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 282.486, -62.1716, 3.52108, 0, 0, 0.982053, -0.188605, 300, 300, 100, 1, 0, 0);
REPLACE INTO `object_scaling` (`fullGuid`, `scale`) VALUES (17370417387837100332, 4.000000);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 282.486, -62.1716, 3.52108, 0, 0, 0.982053, -0.188605, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 282.486, -61.1716, 3.52108, 0, 0, 0.982053, -0.188605, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 282.486, -60.1716, 3.52108, 0, 0, 0.982053, -0.188605, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 282.486, -59.1716, 3.52108, 0, 0, 0.982053, -0.188605, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 282.486, -58.1716, 3.52108, 0, 0, 0.982053, -0.188605, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 282.486, -57.1716, 3.52108, 0, 0, 0.982053, -0.188605, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 282.486, -57.5716, 3.52108, 0, 0, 0.982053, -0.188605, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 282.486, -57.5716, 1.47511, 0, 0, 0.67248, 0.740115, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 282.486, -57.5716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.41, 282.486, -57.5716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.41, 282.086, -57.5716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.41, 281.686, -57.5716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.41, 281.286, -57.5716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.41, 280.886, -57.5716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 280.886, -57.5716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 280.486, -57.5716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 280.086, -57.5716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 280.086, -57.7716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1496.81, 280.086, -57.7716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1496.81, 279.886, -57.7716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1496.81, 280.086, -57.7716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1496.61, 280.086, -57.7716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1496.61, 280.286, -57.7716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1496.41, 280.286, -57.7716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1496.61, 280.286, -57.7716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1496.81, 280.286, -57.7716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1496.61, 280.286, -57.7716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1496.61, 280.486, -57.7716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1496.61, 280.286, -57.7716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1496.81, 280.286, -57.7716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 280.286, -57.7716, 1.26305, 0, 0, 0.590377, 0.807127, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 280.286, -57.7716, 1.40443, 0, 0, 0.645912, 0.763412, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 280.286, -57.7716, 0.764335, 0, 0, 0.372932, 0.927858, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 280.286, -57.7716, 1.00388, 0, 0, 0.481128, 0.87665, 300, 300, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES ( 5017900, 2004210, 0, 1497.01, 280.086, -57.7716, 1.00388, 0, 0, 0.481128, 0.87665, 300, 300, 100, 1, 0, 0);

-- Changes by DRAGU
DELETE FROM gameobject WHERE guid = '5017676';
DELETE FROM game_event_gameobject WHERE guid = '5017676';
DELETE FROM gameobject_battleground WHERE guid = '5017676';
REPLACE INTO `creature` VALUES (2582249,61892,0,0,0,0,-3899.84,-3367.3,286.813,4.3907,300,300,6,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582249,61892,0,0,0,0,-3899.84,-3367.3,286.813,4.3907,300,300,0,100,100,0,0,0);

-- Changes by WOJI
DELETE FROM creature WHERE guid=2560338;
DELETE FROM creature_addon WHERE guid=2560338;
DELETE FROM creature_movement WHERE id=2560338;
DELETE FROM game_event_creature WHERE guid=2560338;
DELETE FROM game_event_creature_data WHERE guid=2560338;
DELETE FROM creature_battleground WHERE guid=2560338;
DELETE FROM creature WHERE guid=2560347;
DELETE FROM creature_addon WHERE guid=2560347;
DELETE FROM creature_movement WHERE id=2560347;
DELETE FROM game_event_creature WHERE guid=2560347;
DELETE FROM game_event_creature_data WHERE guid=2560347;
DELETE FROM creature_battleground WHERE guid=2560347;
DELETE FROM creature WHERE guid=2560393;
DELETE FROM creature_addon WHERE guid=2560393;
DELETE FROM creature_movement WHERE id=2560393;
DELETE FROM game_event_creature WHERE guid=2560393;
DELETE FROM game_event_creature_data WHERE guid=2560393;
DELETE FROM creature_battleground WHERE guid=2560393;
DELETE FROM creature WHERE guid=2560348;
DELETE FROM creature_addon WHERE guid=2560348;
DELETE FROM creature_movement WHERE id=2560348;
DELETE FROM game_event_creature WHERE guid=2560348;
DELETE FROM game_event_creature_data WHERE guid=2560348;
DELETE FROM creature_battleground WHERE guid=2560348;
DELETE FROM creature WHERE guid=2561295;
DELETE FROM creature_addon WHERE guid=2561295;
DELETE FROM creature_movement WHERE id=2561295;
DELETE FROM game_event_creature WHERE guid=2561295;
DELETE FROM game_event_creature_data WHERE guid=2561295;
DELETE FROM creature_battleground WHERE guid=2561295;
DELETE FROM creature WHERE guid=2560395;
DELETE FROM creature_addon WHERE guid=2560395;
DELETE FROM creature_movement WHERE id=2560395;
DELETE FROM game_event_creature WHERE guid=2560395;
DELETE FROM game_event_creature_data WHERE guid=2560395;
DELETE FROM creature_battleground WHERE guid=2560395;
REPLACE INTO `creature` VALUES (2582618,1194,0,0,0,0,-5712.89,-4135.9,386.236,3.9218,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582619,1194,0,0,0,0,-5755.7,-4141.12,388.11,3.39165,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582620,1194,0,0,0,0,-5780.06,-4164.44,385.288,5.41405,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582621,1194,0,0,0,0,-5704.67,-4204.58,386.51,6.07379,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582622,1194,0,0,0,0,-5566.37,-4214.46,382.235,4.98994,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582623,1194,0,0,0,0,-5580.09,-4282.28,390.813,4.18099,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582624,1194,0,0,0,0,-5547.44,-4113.04,371.846,1.16506,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582625,1194,0,0,0,0,-5555.15,-4080.45,370.792,2.26462,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582626,1188,0,0,0,0,-5533.26,-4090.68,373.053,3.54482,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582627,1188,0,0,0,0,-5574.7,-4171,378.02,4.20847,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582628,1188,0,0,0,0,-5621.37,-4219.46,386.662,3.6744,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582629,1188,0,0,0,0,-5680.55,-4222.83,385.241,3.16479,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582630,1188,0,0,0,0,-5789.7,-4150.85,387.718,2.77995,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582631,1188,0,0,0,0,-5799.22,-4083.18,377.175,0.49758,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582632,1188,0,0,0,0,-5741.88,-4072.68,371.138,5.66158,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582633,1188,0,0,0,0,-5729.69,-4150.2,385.387,3.59991,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582634,1188,0,0,0,0,-5796.29,-4187.85,384.995,4.3272,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582635,1191,0,0,0,0,-5814.69,-4156.29,386.238,4.79878,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582635,1191,0,0,0,0,-5814.69,-4156.29,386.238,4.79878,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582630,1188,0,0,0,0,-5789.7,-4150.85,387.718,2.77995,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582620,1194,0,0,0,0,-5780.06,-4164.44,385.288,5.41405,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582619,1194,0,0,0,0,-5755.7,-4141.12,388.11,3.39165,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582636,1191,0,0,0,0,-5758.73,-4163.08,386.714,5.74911,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582636,1191,0,0,0,0,-5758.73,-4163.08,386.714,5.74911,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582637,1191,0,0,0,0,-5737.27,-4192.56,383.358,5.44281,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582637,1191,0,0,0,0,-5737.27,-4192.56,383.358,5.44281,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582621,1194,0,0,0,0,-5704.67,-4204.58,386.51,6.07379,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582638,1191,0,0,0,0,-5690.53,-4188.57,386.247,6.27925,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582639,1191,0,0,0,0,-5612.31,-4184.14,389.398,5.47029,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582639,1191,0,0,0,0,-5612.31,-4184.14,389.398,5.47029,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582627,1188,0,0,0,0,-5574.7,-4171,378.02,4.20847,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582622,1194,0,0,0,0,-5566.37,-4214.46,382.235,4.98994,300,300,3,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582640,1191,0,0,0,0,-5586.81,-4237.35,380.835,4.65349,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582641,1191,0,0,0,0,-5561.16,-4276.5,387.325,5.32892,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582642,1191,0,0,0,0,-5541.15,-4305.03,393.495,1.11133,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582643,1191,0,0,0,0,-5594.22,-4307.45,398.694,3.69136,120,120,5,100,100,1,0,0);
REPLACE INTO `creature` VALUES (2582644,1191,0,0,0,0,-5632.22,-4338.54,403.578,1.28019,120,120,5,100,100,1,0,0);
DELETE FROM creature WHERE guid=2560474;
DELETE FROM creature_addon WHERE guid=2560474;
DELETE FROM creature_movement WHERE id=2560474;
DELETE FROM game_event_creature WHERE guid=2560474;
DELETE FROM game_event_creature_data WHERE guid=2560474;
DELETE FROM creature_battleground WHERE guid=2560474;
DELETE FROM creature WHERE guid=2560472;
DELETE FROM creature_addon WHERE guid=2560472;
DELETE FROM creature_movement WHERE id=2560472;
DELETE FROM game_event_creature WHERE guid=2560472;
DELETE FROM game_event_creature_data WHERE guid=2560472;
DELETE FROM creature_battleground WHERE guid=2560472;
DELETE FROM creature WHERE guid=2560473;
DELETE FROM creature_addon WHERE guid=2560473;
DELETE FROM creature_movement WHERE id=2560473;
DELETE FROM game_event_creature WHERE guid=2560473;
DELETE FROM game_event_creature_data WHERE guid=2560473;
DELETE FROM creature_battleground WHERE guid=2560473;
