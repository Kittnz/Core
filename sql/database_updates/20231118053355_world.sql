-- Pathing for Argent Sentry Entry: 16378
SET @NPC := 53865;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`waittime`,`wander_distance`,`script_id`) VALUES
(@NPC,1,2280.1094,-5293.3145,83.82182,100,0,0,0),
(@NPC,2,2279.1226,-5278.7065,82.22971,100,0,0,0),
(@NPC,3,2278.774,-5266.625,81.37998,100,0,0,0),
(@NPC,4,2279.1226,-5278.7065,82.22971,100,0,0,0);
-- 0x204CB000000FFE8000000C0002428D8F .go xyz 2280.1094 -5293.3145 83.82182

-- This sentry is in group with the other one.
DELETE FROM `creature_movement` WHERE `id`=53866;
UPDATE `creature` SET `movement_type`=0 WHERE `guid`=53866;

-- Correct formation for Argent Sentry Entry: 16378
REPLACE INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (53865, 53866, 4, 1.56, 11);
REPLACE INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (53865, 53865, 0, 0, 11);

-- Pathing for Argent Sentry Entry: 16378
SET @NPC := 54752;
UPDATE `creature` SET `wander_distance`=0,`movement_type`=2,`position_x`=2272.21,`position_y`=-5376.8027,`position_z`=83.72495 WHERE `guid`=@NPC;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`waittime`,`wander_distance`,`script_id`) VALUES
(@NPC,1,2272.21,-5376.8027,83.72495,100,0,0,0),
(@NPC,2,2277.5042,-5377.518,84.207886,100,0,0,0),
(@NPC,3,2289.0894,-5379.7085,83.85406,100,0,0,0),
(@NPC,4,2296.1199,-5381.069,82.66928,100,0,0,0),
(@NPC,5,2307.0886,-5373.584,84.884315,100,0,0,0),
(@NPC,6,2311.0925,-5369.967,86.37994,100,0,0,0),
(@NPC,7,2316.6914,-5359.1455,87.52435,100,0,0,0),
(@NPC,8,2321.7026,-5351.0586,87.13342,100,0,0,0),
(@NPC,9,2315.9106,-5354.275,87.79889,100,0,0,0),
(@NPC,10,2321.9448,-5346.086,87.31865,100,0,0,0),
(@NPC,11,2326.913,-5331.1313,81.99626,100,0,0,0),
(@NPC,12,2334.154,-5321.8525,81.99626,100,0,0,0),
(@NPC,13,2333.5288,-5310.0923,81.99626,100,0,0,0),
(@NPC,14,2335.2712,-5301.103,82.213745,100,0,0,0),
(@NPC,15,2334.126,-5294.6426,81.89961,100,0,0,0),
(@NPC,16,2331.1467,-5283.6953,81.7762,100,0,0,0),
(@NPC,17,2321.9421,-5275.3467,82.077484,100,0,0,0),
(@NPC,18,2308.7708,-5265.974,82.424644,100,0,0,0),
(@NPC,19,2296.8872,-5266.1475,81.95648,100,0,0,0),
(@NPC,20,2290.3264,-5273.1562,81.842606,100,0,0,0),
(@NPC,21,2284.3933,-5279.98,82.27731,100,0,0,0),
(@NPC,22,2277.0366,-5282.314,82.37412,100,0,0,0),
(@NPC,23,2268.1338,-5288.585,82.17806,100,0,0,0),
(@NPC,24,2256.3801,-5289.5156,81.99177,100,0,0,0),
(@NPC,25,2243.6545,-5291.8906,82.59134,100,0,0,0),
(@NPC,26,2235.8628,-5300.807,82.10311,100,0,0,0),
(@NPC,27,2236.9993,-5318.815,82.09314,100,0,0,0),
(@NPC,28,2238.843,-5335.112,83.26499,100,0,0,0),
(@NPC,29,2246.8555,-5338.9165,86.114655,100,0,0,0),
(@NPC,30,2242.4248,-5343.108,86.09,100,0,0,0),
(@NPC,31,2240.2354,-5348.1484,85.832054,100,0,0,0),
(@NPC,32,2243.2659,-5361.3203,83.35728,100,0,0,0),
(@NPC,33,2252.572,-5363.632,84.30835,100,0,0,0),
(@NPC,34,2257.8555,-5363.7524,84.66276,100,0,0,0),
(@NPC,35,2264.4492,-5372.2505,83.034904,100,0,0,0);
-- 0x204CB000000FFE8000000C0001C28D92 .go xyz 2272.21 -5376.8027 83.72495

-- Pathing for Argent Rider Entry: 11102
SET @NPC := 68922;
UPDATE `creature` SET `wander_distance`=0,`movement_type`=2,`position_x`=2345.2505,`position_y`=-5295.3735,`position_z`=83.38345 WHERE `guid`=@NPC;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`waittime`,`wander_distance`,`script_id`) VALUES
(@NPC,1,2345.2505,-5295.3735,83.38345,100,0,0,0),
(@NPC,2,2325.7888,-5275.8696,81.9617,100,0,0,0),
(@NPC,3,2306.3225,-5265.407,82.330635,100,0,0,0),
(@NPC,4,2286.3445,-5260.949,81.44661,100,0,0,0),
(@NPC,5,2261.1724,-5259.142,77.82984,100,0,0,0),
(@NPC,6,2225.0198,-5261.5767,75.78875,100,0,0,0),
(@NPC,7,2199.779,-5263.6157,84.70892,100,0,0,0),
(@NPC,8,2174.3828,-5267.2393,92.300514,100,0,0,0),
(@NPC,9,2199.779,-5263.6157,84.70892,100,0,0,0),
(@NPC,10,2225.0198,-5261.5767,75.78875,100,0,0,0),
(@NPC,11,2261.1724,-5259.142,77.82984,100,0,0,0),
(@NPC,12,2286.3445,-5260.949,81.44661,100,0,0,0),
(@NPC,13,2306.3225,-5265.407,82.330635,100,0,0,0),
(@NPC,14,2325.7888,-5275.8696,81.9617,100,0,0,0);
-- 0x204CB000000AD78000000C0000428D92 .go xyz 2345.2505 -5295.3735 83.38345

-- This rider is in group with the other one.
DELETE FROM `creature_movement` WHERE `id`=68543;
UPDATE `creature` SET `movement_type`=0 WHERE `guid`=68543;

-- Correct formation for Argent Rider Entry: 11102
REPLACE INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (68922, 68543, 5, 1.56, 11);
REPLACE INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (68922, 68922, 0, 0, 11);

-- Delete wrongly spawned Argent Sentry NPC
-- Incorrectly spawned where Argent Outfitter spawns
DELETE FROM `creature` WHERE `guid` = 60003;
DELETE FROM `creature_movement` WHERE `id` = 60003;

