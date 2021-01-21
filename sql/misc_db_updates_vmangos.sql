

-- remove lvl 50 scrolls from wendigos
DELETE FROM `creature_loot_template` WHERE `entry`=1135 && `item`=10306 && `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=1135 && `item`=10308 && `groupid`=0;

-- deviate lurkers shouldn't drop crisp spider meat
DELETE FROM `creature_loot_template` WHERE  `entry`=3641 && `item`=1081 && `groupid`=0;

-- deviate lurkers should drop Threshadon Fang
INSERT INTO `creature_loot_template` VALUES (3641, 5516, 19, 0, 1, 1, 0, 0, 10);

-- defias cutpurse drop stacks of 3 inen instead of 2
UPDATE `creature_loot_template` SET `maxcount`=2 WHERE `entry`=94 && `item`=2589;

-- defias bandit drops 4 linen instead of 2
UPDATE `creature_loot_template` SET `maxcount`=2 WHERE `entry`=116 && `item`=2589;

-- riverpaw gnoll shouldn't drop wool
DELETE FROM `creature_loot_template` WHERE `entry`=117 && `item`=2592 && `groupid`=0;

-- slightly increased drop rate of linen for riverpaw gnoll
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=45 WHERE `entry`=117 && `item`=2589;

-- remove all loot from stratholme phantoms
DELETE FROM `creature_loot_template` WHERE entry = 10389;
UPDATE `creature_template` SET `loot_id`=0 WHERE `entry`=10389;
DELETE FROM `creature_loot_template` WHERE entry = 10388;
UPDATE `creature_template` SET `loot_id`=0 WHERE `entry`=10388;





-- Kolkar Wrangler should run away from rooted target.
DELETE FROM `creature_ai_events` WHERE `creature_id`=3272;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (327201, 3272, 0, 2, 0, 100, 0, 15, 0, 0, 0, 327201, 0, 0, 'Kolkar Wrangler - Flee at 15\% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (327202, 3272, 0, 33, 0, 100, 1, 20000, 20000, 0, 0, 327202, 0, 0, 'Kolkar Wrangler - Run Away from Target when Rooted');
DELETE FROM `creature_ai_scripts` WHERE `id`=327202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (327202, 0, 20, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 2428, 'Kolkar Wrangler - Move Away from Target');

-- Moonkins should not be skinnable.
UPDATE `creature_template` SET `skinning_loot_id`=0 WHERE `entry` IN (2927, 2928, 2929, 8210, 10157, 10158, 10159, 10160);

-- Move wolf stuck in statue in Ashenvale.
UPDATE `creature` SET `position_x`=2719.96, `position_y`=-99.9314, `position_z`=94.7723 WHERE `guid`=34977;

-- Remove Mulgore Spice Bread from Riverpaw Gnoll.
DELETE FROM `creature_loot_template` WHERE `item`=4544 && `entry`=117;

-- Mossy Tumor drop chance should be around 50%.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-50 WHERE `item`=5170;

-- Correct drop chance of Thresher Eye.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-40 WHERE `item`=5412 && `entry`=2185;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-10 WHERE `item`=5412 && `entry`=2187;



-- Quest Proof of Demise should require At War With The Scarlet Crusade Part 1.
UPDATE `quest_template` SET `PrevQuestId`=427 WHERE `entry`=374;

-- Move wolves spawned too close to tree.
UPDATE `creature` SET `position_x`=-9368.2, `position_y`=-229.018, `position_z`=65.965 WHERE `guid`=81096;
UPDATE `creature` SET `position_x`=-9356.6, `position_y`=-217.255, `position_z`=66.484 WHERE `guid`=81097;
UPDATE `creature` SET `position_x`=-8863.68, `position_y`=-301.456, `position_z`=77.612 WHERE `guid`=80134;

-- Fix Cannon for quest Death From Below.
INSERT INTO `spell_mod` (`Id`, `AttributesEx2`, `Comment`) VALUES (4170, 4, 'Quest Death From Below: Cannon Ball - Ignore LoS');

-- Events list for Rot Hide Mystic
DELETE FROM `creature_ai_events` WHERE `creature_id`=1773;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (177301, 1773, 0, 6, 0, 20, 0, 0, 0, 0, 0, 177301, 0, 0, 'Rot Hide Mystic - Spawn Nightlash on death');
DELETE FROM `creature_ai_scripts` WHERE `id` IN (177301, 177302, 177303);
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (177301, 0, 10, 1983, 150000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 1078.49, 1541.23, 28.9379, 0.113425, 0, 'Rot Hide Mystic - Summon Creature Nightlash');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (17730, 'Silverpine Forest - Rot Hide Mystic', 3237, 100, 1, 0, 0, 0, 2, 12, 30, 45, 0, 332, 100, 15, 0, 0, 0, 14, 22, 14, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=17730 WHERE `entry`=1773;

-- Lady Vespia should drop Ring of Zoram.
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10559, 5445, -100, 0, 1, 1, 0, 0, 10);

-- Correct drop chance for Pridewing Venom Sac.
DELETE FROM `creature_loot_template` WHERE `item`=5808;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5928, 5808, -5, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4011, 5808, -30, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4012, 5808, -35, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4013, 5808, -35, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4014, 5808, -35, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4015, 5808, -15, 0, 1, 1, 0, 0, 10);
UPDATE `creature_template` SET `loot_id`=0 WHERE `entry`=6141;

-- Quest Supplies for the Crossroads should require completing Disrupt the Attacks first.
UPDATE `quest_template` SET `PrevQuestId`=871 WHERE `entry`=5041;

-- Correct drop chances for Magic Dust.
DELETE FROM `creature_loot_template` WHERE `item`=2091;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (99, 2091, 2, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5809, 2091, 2, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1936, 2091, 5, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (832, 2091, 15, 0, 1, 1, 0, 0, 10);

-- Fix target for script to despawn ooze for quest A Little Slime Goes a Long Way Part 2.
DELETE FROM `spell_scripts` WHERE `id`=15702;
INSERT INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15702, 0, 17, 11954, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Empty Pure Sample Jar - Create Item Filled Pure Sample Jar');
INSERT INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15702, 0, 18, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Empty Pure Sample Jar - Despawn Creature');

-- Correct unit flags for White Kitten.
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=7386;

-- Remove custom version of following gameobjects:
-- Quilboar Watering Hole, Spring Well, Ruins of Stardust Fountain
DELETE FROM `gameobject_template` WHERE `entry` IN (300146, 300147, 300148);
DELETE FROM `gameobject` WHERE `id` IN (300146, 300147, 300148);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `script_name`) VALUES (107045, 8, 299, 'Spring Well', 1, 226, 5, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `script_name`) VALUES (107046, 8, 299, 'Quilboar Watering Hole', 1, 224, 25, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `script_name`) VALUES (107047, 8, 299, 'Ruins of Stardust Fountain', 1, 223, 5, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `state`) VALUES (99863, 107045, 0, -43.4367, -923.198, 55.8714, 5.75401, 0, 0, 0.261511, -0.9652, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `state`) VALUES (99864, 107046, 1, -3573.24, -1864.45, 82.4975, 4.13904, 0, 0, 0.878194, -0.478305, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `state`) VALUES (99862, 107047, 1, 2079.39, -234.624, 98.9194, 6.04, 0, 0, 0.121293, -0.992617, 1);

-- Correct drop chance for Highborne Relic.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-40 WHERE `item`=5360;

-- Correct drop chance for Fine Crab Chunks.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-40 WHERE `item`=12237;

-- Correct drop chance for Worn Parchment.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-45 WHERE `item`=5348;

-- Correct drop chance for Top of Gelkak's Key.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-20 WHERE `item`=7498;

-- Correct drop chance for Middle of Gelkak's Key.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-10 WHERE `item`=7499 && `entry` IN (2208, 2207);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-1 WHERE `item`=7499 && `entry` NOT IN (2208, 2207);

-- Correct drop chance for Bottom of Gelkak's Key.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-20 WHERE `item`=7500 && `entry`=2236;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-5 WHERE `item`=7500 && `entry`=2233;

-- Correct drop chance for Fine Moonstalker Pelt.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-40 WHERE `item`=5386;



-- Imp Minion should say text on aggro.
DELETE FROM `creature_ai_events` WHERE `creature_id`=12922;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1292201, 12922, 0, 4, 0, 10, 2, 0, 0, 0, 0, 1292201, 1292202, 0, 'Imp Minion - Say Text on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=1292201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1292201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 746, 747, 749, 750, 0, 0, 0, 0, 0, 'Imp Minion - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=1292202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1292202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 751, 752, 753, 754, 0, 0, 0, 0, 0, 'Imp Minion - Say Text');



-- Add missing coordinates for Coarse Dynamite.
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`) VALUES (9002, 0, -2625, -2423, 79);
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`) VALUES (9003, 0, -2607, -2434, 80);
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`) VALUES (9004, 0, -2634, -2411, 81);

-- Remove Eranikus texts from custom table.
DELETE FROM `script_texts` WHERE `entry` IN (-1001012, -1001013, -1001014, -1001015, -1001016, -1001017, -1001018, 1001019);


-- Make Wizzlecrank's Shredder an active object so he can respawn in original grid.
UPDATE `creature` SET `spawn_flags`=1 WHERE `id`=3439;



-- Events list for Mottled Boar
DELETE FROM `creature_ai_events` WHERE `creature_id`=3098;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (309801, 3098, 3098, 10, 0, 100, 1, 1, 5, 10000, 10000, 309801, 0, 0, 'Mottled Boar - Run Away on Player In Combat Approaching');
DELETE FROM `creature_ai_scripts` WHERE `id`=309801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (309801, 0, 3, 2, 1000, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 'Mottled Boar - Run Away');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (3098, -1, 85, 119, 0, 0, 0);
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3098;



-- Gilthares Firebough is immune to both players and npcs by default.
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=3465;




-- Correct bounding radius.
UPDATE `creature_model_info` SET `bounding_radius`=0.9135 WHERE `modelid`=110;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=1569;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=1570;
UPDATE `creature_model_info` SET `bounding_radius`=0.214 WHERE `modelid`=1643;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=1891;
UPDATE `creature_model_info` SET `bounding_radius`=1.15 WHERE `modelid`=3216;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=3424;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=3426;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=3922;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=3930;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=4470;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=4592;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=4890;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=4956;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=4957;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=5550;
UPDATE `creature_model_info` SET `bounding_radius`=1.56 WHERE `modelid`=6085;
UPDATE `creature_model_info` SET `bounding_radius`=0.214 WHERE `modelid`=6546;
UPDATE `creature_model_info` SET `bounding_radius`=0.214 WHERE `modelid`=6548;
UPDATE `creature_model_info` SET `bounding_radius`=0.575 WHERE `modelid`=7853;
UPDATE `creature_model_info` SET `bounding_radius`=0.3672 WHERE `modelid`=11081;
UPDATE `creature_model_info` SET `bounding_radius`=3 WHERE `modelid`=11380;
UPDATE `creature_model_info` SET `bounding_radius`=0.214 WHERE `modelid`=11671;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=11894;
UPDATE `creature_model_info` SET `bounding_radius`=0.214 WHERE `modelid`=13150;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=13278;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=13279;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=13280;
UPDATE `creature_model_info` SET `bounding_radius`=0.9747 WHERE `modelid`=13281;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=13316;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=13322;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=13323;
UPDATE `creature_model_info` SET `bounding_radius`=0.9747 WHERE `modelid`=13325;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=13330;
UPDATE `creature_model_info` SET `bounding_radius`=0.4092 WHERE `modelid`=13415;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=13537;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=13540;
UPDATE `creature_model_info` SET `bounding_radius`=0.8725 WHERE `modelid`=13562;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=13670;
UPDATE `creature_model_info` SET `bounding_radius`=1.95 WHERE `modelid`=14012;
UPDATE `creature_model_info` SET `bounding_radius`=2.35375 WHERE `modelid`=14497;
UPDATE `creature_model_info` SET `bounding_radius`=2.0835 WHERE `modelid`=14511;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=14530;
UPDATE `creature_model_info` SET `bounding_radius`=0.4284 WHERE `modelid`=15218;
UPDATE `creature_model_info` SET `bounding_radius`=0.612 WHERE `modelid`=15267;
UPDATE `creature_model_info` SET `bounding_radius`=0.612 WHERE `modelid`=15268;
UPDATE `creature_model_info` SET `bounding_radius`=3 WHERE `modelid`=15288;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=16007;
UPDATE `creature_model_info` SET `bounding_radius`=0.208 WHERE `modelid`=16010;
UPDATE `creature_model_info` SET `bounding_radius`=0.830407 WHERE `modelid`=957;
UPDATE `creature_model_info` SET `bounding_radius`=0.2784 WHERE `modelid`=1236;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=1864;
UPDATE `creature_model_info` SET `bounding_radius`=0.389 WHERE `modelid`=2595;
UPDATE `creature_model_info` SET `bounding_radius`=1 WHERE `modelid`=2702;
UPDATE `creature_model_info` SET `bounding_radius`=0.208 WHERE `modelid`=3901;
UPDATE `creature_model_info` SET `bounding_radius`=0.50915 WHERE `modelid`=4535;
UPDATE `creature_model_info` SET `bounding_radius`=0.0875 WHERE `modelid`=6192;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=7050;
UPDATE `creature_model_info` SET `bounding_radius`=0.4 WHERE `modelid`=9572;
UPDATE `creature_model_info` SET `bounding_radius`=0.389 WHERE `modelid`=10858;
UPDATE `creature_model_info` SET `bounding_radius`=0.0875 WHERE `modelid`=10992;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=11441;
UPDATE `creature_model_info` SET `bounding_radius`=0.51 WHERE `modelid`=12194;
UPDATE `creature_model_info` SET `bounding_radius`=0.145 WHERE `modelid`=15992;
UPDATE `creature_model_info` SET `bounding_radius`=0.522 WHERE `modelid`=314;
UPDATE `creature_model_info` SET `bounding_radius`=0.7 WHERE `modelid`=2420;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=4451;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=4460;
UPDATE `creature_model_info` SET `bounding_radius`=0.3519 WHERE `modelid`=4493;
UPDATE `creature_model_info` SET `bounding_radius`=1.5 WHERE `modelid`=4910;
UPDATE `creature_model_info` SET `bounding_radius`=0.652 WHERE `modelid`=6633;
UPDATE `creature_model_info` SET `bounding_radius`=0.3519 WHERE `modelid`=6974;
UPDATE `creature_model_info` SET `bounding_radius`=0.389 WHERE `modelid`=6991;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=7210;
UPDATE `creature_model_info` SET `bounding_radius`=1.3275 WHERE `modelid`=7350;
UPDATE `creature_model_info` SET `bounding_radius`=0.3519 WHERE `modelid`=7952;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=12933;
UPDATE `creature_model_info` SET `bounding_radius`=0.63 WHERE `modelid`=15363;
UPDATE `creature_model_info` SET `bounding_radius`=0.75 WHERE `modelid`=15700;
UPDATE `creature_model_info` SET `bounding_radius`=0.2 WHERE `modelid`=15785;
UPDATE `creature_model_info` SET `bounding_radius`=0.7 WHERE `modelid`=1421;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=1923;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=2045;
UPDATE `creature_model_info` SET `bounding_radius`=1.593 WHERE `modelid`=2303;
UPDATE `creature_model_info` SET `bounding_radius`=0.7 WHERE `modelid`=2419;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=3933;
UPDATE `creature_model_info` SET `bounding_radius`=0.245 WHERE `modelid`=3956;
UPDATE `creature_model_info` SET `bounding_radius`=0.389 WHERE `modelid`=4161;
UPDATE `creature_model_info` SET `bounding_radius`=0.9932 WHERE `modelid`=4427;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=4428;
UPDATE `creature_model_info` SET `bounding_radius`=0.278 WHERE `modelid`=4465;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=4597;
UPDATE `creature_model_info` SET `bounding_radius`=1.176 WHERE `modelid`=4716;
UPDATE `creature_model_info` SET `bounding_radius`=0.3825 WHERE `modelid`=4961;
UPDATE `creature_model_info` SET `bounding_radius`=0.208 WHERE `modelid`=4968;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=4969;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=4970;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=4971;
UPDATE `creature_model_info` SET `bounding_radius`=1 WHERE `modelid`=5047;
UPDATE `creature_model_info` SET `bounding_radius`=0.3672 WHERE `modelid`=5534;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=6127;
UPDATE `creature_model_info` SET `bounding_radius`=0.139 WHERE `modelid`=6288;
UPDATE `creature_model_info` SET `bounding_radius`=0.139 WHERE `modelid`=6290;
UPDATE `creature_model_info` SET `bounding_radius`=0.2625 WHERE `modelid`=6589;
UPDATE `creature_model_info` SET `bounding_radius`=1.5 WHERE `modelid`=6763;
UPDATE `creature_model_info` SET `bounding_radius`=0.208 WHERE `modelid`=6792;
UPDATE `creature_model_info` SET `bounding_radius`=0.3519 WHERE `modelid`=6926;
UPDATE `creature_model_info` SET `bounding_radius`=0.8725 WHERE `modelid`=7376;
UPDATE `creature_model_info` SET `bounding_radius`=0.145 WHERE `modelid`=7920;
UPDATE `creature_model_info` SET `bounding_radius`=0.214 WHERE `modelid`=7922;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=8706;
UPDATE `creature_model_info` SET `bounding_radius`=0.795 WHERE `modelid`=9230;
UPDATE `creature_model_info` SET `bounding_radius`=0.275 WHERE `modelid`=9749;
UPDATE `creature_model_info` SET `bounding_radius`=0.3 WHERE `modelid`=9903;
UPDATE `creature_model_info` SET `bounding_radius`=0.564407 WHERE `modelid`=9913;
UPDATE `creature_model_info` SET `bounding_radius`=0.75 WHERE `modelid`=10046;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=10071;
UPDATE `creature_model_info` SET `bounding_radius`=0.214 WHERE `modelid`=10199;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=10249;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=10250;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=10251;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=10252;
UPDATE `creature_model_info` SET `bounding_radius`=0.25 WHERE `modelid`=10269;
UPDATE `creature_model_info` SET `bounding_radius`=0.6 WHERE `modelid`=10283;
UPDATE `creature_model_info` SET `bounding_radius`=0.6 WHERE `modelid`=10284;
UPDATE `creature_model_info` SET `bounding_radius`=0.208 WHERE `modelid`=10334;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=10340;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=10402;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=10460;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=10461;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=10462;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=10641;
UPDATE `creature_model_info` SET `bounding_radius`=0.1 WHERE `modelid`=10753;
UPDATE `creature_model_info` SET `bounding_radius`=0.3068 WHERE `modelid`=10819;
UPDATE `creature_model_info` SET `bounding_radius`=0.6 WHERE `modelid`=10919;
UPDATE `creature_model_info` SET `bounding_radius`=0.725 WHERE `modelid`=10983;
UPDATE `creature_model_info` SET `bounding_radius`=0.0875 WHERE `modelid`=10990;
UPDATE `creature_model_info` SET `bounding_radius`=0.105 WHERE `modelid`=10993;
UPDATE `creature_model_info` SET `bounding_radius`=0.45 WHERE `modelid`=11009;
UPDATE `creature_model_info` SET `bounding_radius`=1.5 WHERE `modelid`=11011;
UPDATE `creature_model_info` SET `bounding_radius`=1.59 WHERE `modelid`=11029;
UPDATE `creature_model_info` SET `bounding_radius`=0.35 WHERE `modelid`=11105;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=11272;
UPDATE `creature_model_info` SET `bounding_radius`=0.208 WHERE `modelid`=11300;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=11303;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=11307;
UPDATE `creature_model_info` SET `bounding_radius`=0.816949 WHERE `modelid`=11411;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=11442;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=11443;
UPDATE `creature_model_info` SET `bounding_radius`=0.208 WHERE `modelid`=11477;
UPDATE `creature_model_info` SET `bounding_radius`=1.75 WHERE `modelid`=11572;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=11589;
UPDATE `creature_model_info` SET `bounding_radius`=0.9747 WHERE `modelid`=11590;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=11591;
UPDATE `creature_model_info` SET `bounding_radius`=0.389 WHERE `modelid`=11592;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=11593;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=11594;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=11595;
UPDATE `creature_model_info` SET `bounding_radius`=0.533 WHERE `modelid`=11731;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=11749;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=11750;
UPDATE `creature_model_info` SET `bounding_radius`=0.43375 WHERE `modelid`=11830;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=11831;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=11832;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=11833;
UPDATE `creature_model_info` SET `bounding_radius`=0.2832 WHERE `modelid`=11978;
UPDATE `creature_model_info` SET `bounding_radius`=0.4464 WHERE `modelid`=11979;
UPDATE `creature_model_info` SET `bounding_radius`=0.2832 WHERE `modelid`=11980;
UPDATE `creature_model_info` SET `bounding_radius`=0.4464 WHERE `modelid`=11981;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=12169;
UPDATE `creature_model_info` SET `bounding_radius`=0.05 WHERE `modelid`=12191;
UPDATE `creature_model_info` SET `bounding_radius`=0.85 WHERE `modelid`=12196;
UPDATE `creature_model_info` SET `bounding_radius`=1.15 WHERE `modelid`=12234;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=12329;
UPDATE `creature_model_info` SET `bounding_radius`=0.9747 WHERE `modelid`=12969;
UPDATE `creature_model_info` SET `bounding_radius`=0.3519 WHERE `modelid`=13260;
UPDATE `creature_model_info` SET `bounding_radius`=0.3519 WHERE `modelid`=13261;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=13361;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=13362;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=13363;
UPDATE `creature_model_info` SET `bounding_radius`=0.9747 WHERE `modelid`=13364;
UPDATE `creature_model_info` SET `bounding_radius`=0.75 WHERE `modelid`=13509;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=13590;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=13591;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=13592;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=13593;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=13598;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=13599;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=13600;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=13601;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=13769;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=13770;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=13772;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=13776;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=13777;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=13778;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=13779;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=13780;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=13785;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=13786;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=13787;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=13788;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=13799;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=13800;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=13801;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=13802;
UPDATE `creature_model_info` SET `bounding_radius`=1.75 WHERE `modelid`=14152;
UPDATE `creature_model_info` SET `bounding_radius`=1.125 WHERE `modelid`=14352;
UPDATE `creature_model_info` SET `bounding_radius`=0.75 WHERE `modelid`=14379;
UPDATE `creature_model_info` SET `bounding_radius`=2.832 WHERE `modelid`=14522;
UPDATE `creature_model_info` SET `bounding_radius`=1.392 WHERE `modelid`=14528;
UPDATE `creature_model_info` SET `bounding_radius`=1 WHERE `modelid`=14542;
UPDATE `creature_model_info` SET `bounding_radius`=0.75 WHERE `modelid`=14888;
UPDATE `creature_model_info` SET `bounding_radius`=0.75 WHERE `modelid`=14889;
UPDATE `creature_model_info` SET `bounding_radius`=0.3 WHERE `modelid`=14932;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15172;
UPDATE `creature_model_info` SET `bounding_radius`=0.208 WHERE `modelid`=15173;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15174;
UPDATE `creature_model_info` SET `bounding_radius`=0.208 WHERE `modelid`=15175;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=15176;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=15177;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=15178;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=15179;
UPDATE `creature_model_info` SET `bounding_radius`=0.153 WHERE `modelid`=15181;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=15189;
UPDATE `creature_model_info` SET `bounding_radius`=0.208 WHERE `modelid`=15193;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15194;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=15197;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=15199;
UPDATE `creature_model_info` SET `bounding_radius`=0.3213 WHERE `modelid`=15201;
UPDATE `creature_model_info` SET `bounding_radius`=0.4 WHERE `modelid`=15204;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=15206;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=15207;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=15208;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=15209;
UPDATE `creature_model_info` SET `bounding_radius`=0.4284 WHERE `modelid`=15233;
UPDATE `creature_model_info` SET `bounding_radius`=1.5 WHERE `modelid`=15291;
UPDATE `creature_model_info` SET `bounding_radius`=1.5 WHERE `modelid`=15292;
UPDATE `creature_model_info` SET `bounding_radius`=2.8525 WHERE `modelid`=15334;
UPDATE `creature_model_info` SET `bounding_radius`=2.832 WHERE `modelid`=15335;
UPDATE `creature_model_info` SET `bounding_radius`=1.5 WHERE `modelid`=15336;
UPDATE `creature_model_info` SET `bounding_radius`=3.54 WHERE `modelid`=15338;
UPDATE `creature_model_info` SET `bounding_radius`=0.8 WHERE `modelid`=15340;
UPDATE `creature_model_info` SET `bounding_radius`=1.25 WHERE `modelid`=15343;
UPDATE `creature_model_info` SET `bounding_radius`=2 WHERE `modelid`=15345;
UPDATE `creature_model_info` SET `bounding_radius`=1.5 WHERE `modelid`=15346;
UPDATE `creature_model_info` SET `bounding_radius`=2.5 WHERE `modelid`=15347;
UPDATE `creature_model_info` SET `bounding_radius`=2.25 WHERE `modelid`=15351;
UPDATE `creature_model_info` SET `bounding_radius`=2 WHERE `modelid`=15354;
UPDATE `creature_model_info` SET `bounding_radius`=4.4825 WHERE `modelid`=15355;
UPDATE `creature_model_info` SET `bounding_radius`=4.425 WHERE `modelid`=15356;
UPDATE `creature_model_info` SET `bounding_radius`=1.5 WHERE `modelid`=15357;
UPDATE `creature_model_info` SET `bounding_radius`=2.5 WHERE `modelid`=15359;
UPDATE `creature_model_info` SET `bounding_radius`=1 WHERE `modelid`=15360;
UPDATE `creature_model_info` SET `bounding_radius`=0.575 WHERE `modelid`=15362;
UPDATE `creature_model_info` SET `bounding_radius`=1.6 WHERE `modelid`=15376;
UPDATE `creature_model_info` SET `bounding_radius`=2.5 WHERE `modelid`=15392;
UPDATE `creature_model_info` SET `bounding_radius`=0.778 WHERE `modelid`=15399;
UPDATE `creature_model_info` SET `bounding_radius`=1 WHERE `modelid`=15412;
UPDATE `creature_model_info` SET `bounding_radius`=1 WHERE `modelid`=15413;
UPDATE `creature_model_info` SET `bounding_radius`=1 WHERE `modelid`=15414;
UPDATE `creature_model_info` SET `bounding_radius`=0.3519 WHERE `modelid`=15418;
UPDATE `creature_model_info` SET `bounding_radius`=0.389 WHERE `modelid`=15419;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15420;
UPDATE `creature_model_info` SET `bounding_radius`=0.4668 WHERE `modelid`=15421;
UPDATE `creature_model_info` SET `bounding_radius`=0.389 WHERE `modelid`=15427;
UPDATE `creature_model_info` SET `bounding_radius`=0.389 WHERE `modelid`=15428;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15429;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15430;
UPDATE `creature_model_info` SET `bounding_radius`=1 WHERE `modelid`=15431;
UPDATE `creature_model_info` SET `bounding_radius`=1.25 WHERE `modelid`=15432;
UPDATE `creature_model_info` SET `bounding_radius`=1 WHERE `modelid`=15434;
UPDATE `creature_model_info` SET `bounding_radius`=0.6 WHERE `modelid`=15437;
UPDATE `creature_model_info` SET `bounding_radius`=3.26 WHERE `modelid`=15439;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=15460;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=15461;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=15462;
UPDATE `creature_model_info` SET `bounding_radius`=0.5 WHERE `modelid`=15464;
UPDATE `creature_model_info` SET `bounding_radius`=1.75 WHERE `modelid`=15465;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15466;
UPDATE `creature_model_info` SET `bounding_radius`=0.05 WHERE `modelid`=15467;
UPDATE `creature_model_info` SET `bounding_radius`=0.05 WHERE `modelid`=15468;
UPDATE `creature_model_info` SET `bounding_radius`=0.8725 WHERE `modelid`=15472;
UPDATE `creature_model_info` SET `bounding_radius`=0.3519 WHERE `modelid`=15480;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15481;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15482;
UPDATE `creature_model_info` SET `bounding_radius`=0.875 WHERE `modelid`=15483;
UPDATE `creature_model_info` SET `bounding_radius`=0.575 WHERE `modelid`=15487;
UPDATE `creature_model_info` SET `bounding_radius`=0.5 WHERE `modelid`=15488;
UPDATE `creature_model_info` SET `bounding_radius`=0.35 WHERE `modelid`=15489;
UPDATE `creature_model_info` SET `bounding_radius`=0.575 WHERE `modelid`=15490;
UPDATE `creature_model_info` SET `bounding_radius`=1.63 WHERE `modelid`=15491;
UPDATE `creature_model_info` SET `bounding_radius`=2.445 WHERE `modelid`=15492;
UPDATE `creature_model_info` SET `bounding_radius`=1.8745 WHERE `modelid`=15493;
UPDATE `creature_model_info` SET `bounding_radius`=0.5 WHERE `modelid`=15494;
UPDATE `creature_model_info` SET `bounding_radius`=1.593 WHERE `modelid`=15495;
UPDATE `creature_model_info` SET `bounding_radius`=1.3275 WHERE `modelid`=15496;
UPDATE `creature_model_info` SET `bounding_radius`=2.0355 WHERE `modelid`=15497;
UPDATE `creature_model_info` SET `bounding_radius`=0.885 WHERE `modelid`=15498;
UPDATE `creature_model_info` SET `bounding_radius`=1.5 WHERE `modelid`=15499;
UPDATE `creature_model_info` SET `bounding_radius`=1 WHERE `modelid`=15500;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15502;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=15503;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15508;
UPDATE `creature_model_info` SET `bounding_radius`=1.5 WHERE `modelid`=15512;
UPDATE `creature_model_info` SET `bounding_radius`=2 WHERE `modelid`=15533;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=15535;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=15536;
UPDATE `creature_model_info` SET `bounding_radius`=0.9747 WHERE `modelid`=15537;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=15539;
UPDATE `creature_model_info` SET `bounding_radius`=0.8725 WHERE `modelid`=15541;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=15542;
UPDATE `creature_model_info` SET `bounding_radius`=0.9747 WHERE `modelid`=15544;
UPDATE `creature_model_info` SET `bounding_radius`=0.4 WHERE `modelid`=15545;
UPDATE `creature_model_info` SET `bounding_radius`=1 WHERE `modelid`=15546;
UPDATE `creature_model_info` SET `bounding_radius`=1.05 WHERE `modelid`=15547;
UPDATE `creature_model_info` SET `bounding_radius`=0.6 WHERE `modelid`=15554;
UPDATE `creature_model_info` SET `bounding_radius`=1 WHERE `modelid`=15556;
UPDATE `creature_model_info` SET `bounding_radius`=3 WHERE `modelid`=15582;
UPDATE `creature_model_info` SET `bounding_radius`=2.75 WHERE `modelid`=15583;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15585;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=15650;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=15651;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=15653;
UPDATE `creature_model_info` SET `bounding_radius`=3 WHERE `modelid`=15655;
UPDATE `creature_model_info` SET `bounding_radius`=2.5 WHERE `modelid`=15656;
UPDATE `creature_model_info` SET `bounding_radius`=2 WHERE `modelid`=15657;
UPDATE `creature_model_info` SET `bounding_radius`=1.5 WHERE `modelid`=15658;
UPDATE `creature_model_info` SET `bounding_radius`=0.4092 WHERE `modelid`=15661;
UPDATE `creature_model_info` SET `bounding_radius`=0.8725 WHERE `modelid`=15664;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=15665;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15666;
UPDATE `creature_model_info` SET `bounding_radius`=1.5 WHERE `modelid`=15686;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15688;
UPDATE `creature_model_info` SET `bounding_radius`=0.389 WHERE `modelid`=15689;
UPDATE `creature_model_info` SET `bounding_radius`=0.389 WHERE `modelid`=15690;
UPDATE `creature_model_info` SET `bounding_radius`=0.389 WHERE `modelid`=15691;
UPDATE `creature_model_info` SET `bounding_radius`=0.389 WHERE `modelid`=15692;
UPDATE `creature_model_info` SET `bounding_radius`=12 WHERE `modelid`=15693;
UPDATE `creature_model_info` SET `bounding_radius`=10 WHERE `modelid`=15695;
UPDATE `creature_model_info` SET `bounding_radius`=4 WHERE `modelid`=15696;
UPDATE `creature_model_info` SET `bounding_radius`=0.8 WHERE `modelid`=15697;
UPDATE `creature_model_info` SET `bounding_radius`=0.3 WHERE `modelid`=15699;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15702;
UPDATE `creature_model_info` SET `bounding_radius`=0.4 WHERE `modelid`=15703;
UPDATE `creature_model_info` SET `bounding_radius`=1 WHERE `modelid`=15704;
UPDATE `creature_model_info` SET `bounding_radius`=0.5 WHERE `modelid`=15705;
UPDATE `creature_model_info` SET `bounding_radius`=1.25 WHERE `modelid`=15706;
UPDATE `creature_model_info` SET `bounding_radius`=0.6 WHERE `modelid`=15709;
UPDATE `creature_model_info` SET `bounding_radius`=1.75 WHERE `modelid`=15710;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=15717;
UPDATE `creature_model_info` SET `bounding_radius`=0.9747 WHERE `modelid`=15720;
UPDATE `creature_model_info` SET `bounding_radius`=0.8725 WHERE `modelid`=15721;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=15722;
UPDATE `creature_model_info` SET `bounding_radius`=0.8 WHERE `modelid`=15738;
UPDATE `creature_model_info` SET `bounding_radius`=1 WHERE `modelid`=15739;
UPDATE `creature_model_info` SET `bounding_radius`=0.6 WHERE `modelid`=15741;
UPDATE `creature_model_info` SET `bounding_radius`=1.5 WHERE `modelid`=15742;
UPDATE `creature_model_info` SET `bounding_radius`=2 WHERE `modelid`=15743;
UPDATE `creature_model_info` SET `bounding_radius`=0.3519 WHERE `modelid`=15775;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=15776;
UPDATE `creature_model_info` SET `bounding_radius`=0.208 WHERE `modelid`=15777;
UPDATE `creature_model_info` SET `bounding_radius`=1.5 WHERE `modelid`=15778;
UPDATE `creature_model_info` SET `bounding_radius`=1 WHERE `modelid`=15787;
UPDATE `creature_model_info` SET `bounding_radius`=1.6 WHERE `modelid`=15794;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=15811;
UPDATE `creature_model_info` SET `bounding_radius`=0.208 WHERE `modelid`=15812;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15813;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15814;
UPDATE `creature_model_info` SET `bounding_radius`=0.8725 WHERE `modelid`=15815;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15818;
UPDATE `creature_model_info` SET `bounding_radius`=0.389 WHERE `modelid`=15819;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=15821;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=15823;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=15824;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=15825;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=15826;
UPDATE `creature_model_info` SET `bounding_radius`=0.9747 WHERE `modelid`=15827;
UPDATE `creature_model_info` SET `bounding_radius`=0.8725 WHERE `modelid`=15828;
UPDATE `creature_model_info` SET `bounding_radius`=0.9747 WHERE `modelid`=15829;
UPDATE `creature_model_info` SET `bounding_radius`=0.8725 WHERE `modelid`=15830;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15831;
UPDATE `creature_model_info` SET `bounding_radius`=0.208 WHERE `modelid`=15832;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15833;
UPDATE `creature_model_info` SET `bounding_radius`=0.208 WHERE `modelid`=15834;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=15835;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=15836;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=15837;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=15838;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=15839;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15840;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15841;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15842;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15843;
UPDATE `creature_model_info` SET `bounding_radius`=0.9747 WHERE `modelid`=15844;
UPDATE `creature_model_info` SET `bounding_radius`=0.4164 WHERE `modelid`=15845;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=15847;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=15848;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=15849;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=15850;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=15851;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=15852;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=15853;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=15854;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=15855;
UPDATE `creature_model_info` SET `bounding_radius`=0.9747 WHERE `modelid`=15856;
UPDATE `creature_model_info` SET `bounding_radius`=0.8725 WHERE `modelid`=15857;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15858;
UPDATE `creature_model_info` SET `bounding_radius`=0.208 WHERE `modelid`=15859;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15860;
UPDATE `creature_model_info` SET `bounding_radius`=0.208 WHERE `modelid`=15861;
UPDATE `creature_model_info` SET `bounding_radius`=1 WHERE `modelid`=15866;
UPDATE `creature_model_info` SET `bounding_radius`=0.208 WHERE `modelid`=15967;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15982;
UPDATE `creature_model_info` SET `bounding_radius`=0.208 WHERE `modelid`=15999;
UPDATE `creature_model_info` SET `bounding_radius`=0.75 WHERE `modelid`=17251;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=2388;
UPDATE `creature_model_info` SET `bounding_radius`=2.5 WHERE `modelid`=7691;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=8591;
UPDATE `creature_model_info` SET `bounding_radius`=0.347 WHERE `modelid`=8597;
UPDATE `creature_model_info` SET `bounding_radius`=0.225 WHERE `modelid`=8909;
UPDATE `creature_model_info` SET `bounding_radius`=0.3475 WHERE `modelid`=12489;
UPDATE `creature_model_info` SET `bounding_radius`=1.2 WHERE `modelid`=14428;
UPDATE `creature_model_info` SET `bounding_radius`=4 WHERE `modelid`=15296;
UPDATE `creature_model_info` SET `bounding_radius`=1.5 WHERE `modelid`=15297;
UPDATE `creature_model_info` SET `bounding_radius`=1.5 WHERE `modelid`=15761;
UPDATE `creature_model_info` SET `bounding_radius`=1.75 WHERE `modelid`=15932;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=6878;
UPDATE `creature_model_info` SET `bounding_radius`=0.75 WHERE `modelid`=7906;
UPDATE `creature_model_info` SET `bounding_radius`=0.75 WHERE `modelid`=10812;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=14913;
UPDATE `creature_model_info` SET `bounding_radius`=0.2 WHERE `modelid`=14392;
UPDATE `creature_model_info` SET `bounding_radius`=0.236 WHERE `modelid`=15652;
UPDATE `creature_model_info` SET `bounding_radius`=10 WHERE `modelid`=15694;
UPDATE `creature_model_info` SET `bounding_radius`=0.372 WHERE `modelid`=15716;
UPDATE `creature_model_info` SET `bounding_radius`=0.383 WHERE `modelid`=15723;
UPDATE `creature_model_info` SET `bounding_radius`=0.306 WHERE `modelid`=15816;
UPDATE `creature_model_info` SET `bounding_radius`=0.389 WHERE `modelid`=15820;

-- Correct combat reach.
UPDATE `creature_model_info` SET `combat_reach`=2.25 WHERE `modelid`=110;
UPDATE `creature_model_info` SET `combat_reach`=10 WHERE `modelid`=800;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=1569;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=1570;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=1891;
UPDATE `creature_model_info` SET `combat_reach`=2.3 WHERE `modelid`=3216;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=3424;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=3426;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=4470;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=4592;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=4890;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=4956;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=4957;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=5550;
UPDATE `creature_model_info` SET `combat_reach`=2.275 WHERE `modelid`=6085;
UPDATE `creature_model_info` SET `combat_reach`=1.725 WHERE `modelid`=7853;
UPDATE `creature_model_info` SET `combat_reach`=1.8 WHERE `modelid`=11081;
UPDATE `creature_model_info` SET `combat_reach`=20 WHERE `modelid`=11380;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=11894;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=13278;
UPDATE `creature_model_info` SET `combat_reach`=4.05 WHERE `modelid`=13281;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=13322;
UPDATE `creature_model_info` SET `combat_reach`=4.05 WHERE `modelid`=13325;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=13330;
UPDATE `creature_model_info` SET `combat_reach`=1.65 WHERE `modelid`=13415;
UPDATE `creature_model_info` SET `combat_reach`=3.75 WHERE `modelid`=13562;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=13670;
UPDATE `creature_model_info` SET `combat_reach`=3.9 WHERE `modelid`=14012;
UPDATE `creature_model_info` SET `combat_reach`=2.625 WHERE `modelid`=14497;
UPDATE `creature_model_info` SET `combat_reach`=2.25 WHERE `modelid`=14511;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=14530;
UPDATE `creature_model_info` SET `combat_reach`=2.1 WHERE `modelid`=15218;
UPDATE `creature_model_info` SET `combat_reach`=3 WHERE `modelid`=15267;
UPDATE `creature_model_info` SET `combat_reach`=3 WHERE `modelid`=15268;
UPDATE `creature_model_info` SET `combat_reach`=15 WHERE `modelid`=15288;
UPDATE `creature_model_info` SET `combat_reach`=0.666102 WHERE `modelid`=957;
UPDATE `creature_model_info` SET `combat_reach`=0.8 WHERE `modelid`=1236;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=1864;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=2595;
UPDATE `creature_model_info` SET `combat_reach`=1 WHERE `modelid`=2702;
UPDATE `creature_model_info` SET `combat_reach`=1.0625 WHERE `modelid`=4535;
UPDATE `creature_model_info` SET `combat_reach`=0.25 WHERE `modelid`=6192;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=7050;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=10858;
UPDATE `creature_model_info` SET `combat_reach`=0.25 WHERE `modelid`=10992;
UPDATE `creature_model_info` SET `combat_reach`=1.275 WHERE `modelid`=12194;
UPDATE `creature_model_info` SET `combat_reach`=1.25 WHERE `modelid`=15992;
UPDATE `creature_model_info` SET `combat_reach`=0 WHERE `modelid`=16257;
UPDATE `creature_model_info` SET `combat_reach`=0 WHERE `modelid`=16259;
UPDATE `creature_model_info` SET `combat_reach`=0 WHERE `modelid`=16587;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=314;
UPDATE `creature_model_info` SET `combat_reach`=0.7 WHERE `modelid`=2420;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=4451;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=4460;
UPDATE `creature_model_info` SET `combat_reach`=1.725 WHERE `modelid`=4493;
UPDATE `creature_model_info` SET `combat_reach`=2.25 WHERE `modelid`=4910;
UPDATE `creature_model_info` SET `combat_reach`=0.6 WHERE `modelid`=6633;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=6991;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=7210;
UPDATE `creature_model_info` SET `combat_reach`=1.125 WHERE `modelid`=7350;
UPDATE `creature_model_info` SET `combat_reach`=1.725 WHERE `modelid`=7952;
UPDATE `creature_model_info` SET `combat_reach`=18 WHERE `modelid`=15363;
UPDATE `creature_model_info` SET `combat_reach`=1.125 WHERE `modelid`=15700;
UPDATE `creature_model_info` SET `combat_reach`=0.75 WHERE `modelid`=15785;
UPDATE `creature_model_info` SET `combat_reach`=0.7 WHERE `modelid`=1421;
UPDATE `creature_model_info` SET `combat_reach`=0 WHERE `modelid`=1555;
UPDATE `creature_model_info` SET `combat_reach`=10 WHERE `modelid`=1772;
UPDATE `creature_model_info` SET `combat_reach`=2 WHERE `modelid`=1923;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=2045;
UPDATE `creature_model_info` SET `combat_reach`=1.35 WHERE `modelid`=2303;
UPDATE `creature_model_info` SET `combat_reach`=0.7 WHERE `modelid`=2419;
UPDATE `creature_model_info` SET `combat_reach`=0.7 WHERE `modelid`=2420;
UPDATE `creature_model_info` SET `combat_reach`=1.05 WHERE `modelid`=3956;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=4161;
UPDATE `creature_model_info` SET `combat_reach`=1.95 WHERE `modelid`=4427;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=4460;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=4597;
UPDATE `creature_model_info` SET `combat_reach`=1 WHERE `modelid`=4716;
UPDATE `creature_model_info` SET `combat_reach`=1.875 WHERE `modelid`=4961;
UPDATE `creature_model_info` SET `combat_reach`=2 WHERE `modelid`=5047;
UPDATE `creature_model_info` SET `combat_reach`=1.8 WHERE `modelid`=5534;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=6127;
UPDATE `creature_model_info` SET `combat_reach`=0.625 WHERE `modelid`=6288;
UPDATE `creature_model_info` SET `combat_reach`=0.625 WHERE `modelid`=6290;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=6589;
UPDATE `creature_model_info` SET `combat_reach`=0.6 WHERE `modelid`=6633;
UPDATE `creature_model_info` SET `combat_reach`=2.25 WHERE `modelid`=6763;
UPDATE `creature_model_info` SET `combat_reach`=1.725 WHERE `modelid`=6926;
UPDATE `creature_model_info` SET `combat_reach`=1.125 WHERE `modelid`=7350;
UPDATE `creature_model_info` SET `combat_reach`=1 WHERE `modelid`=7920;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=8706;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=9230;
UPDATE `creature_model_info` SET `combat_reach`=0.5 WHERE `modelid`=9903;
UPDATE `creature_model_info` SET `combat_reach`=0.564407 WHERE `modelid`=9913;
UPDATE `creature_model_info` SET `combat_reach`=1.25 WHERE `modelid`=10046;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=10071;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=10249;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=10252;
UPDATE `creature_model_info` SET `combat_reach`=0.375 WHERE `modelid`=10269;
UPDATE `creature_model_info` SET `combat_reach`=3.75 WHERE `modelid`=10283;
UPDATE `creature_model_info` SET `combat_reach`=3.75 WHERE `modelid`=10284;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=10340;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=10402;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=10641;
UPDATE `creature_model_info` SET `combat_reach`=0.625 WHERE `modelid`=10753;
UPDATE `creature_model_info` SET `combat_reach`=1.3 WHERE `modelid`=10819;
UPDATE `creature_model_info` SET `combat_reach`=1.45 WHERE `modelid`=10983;
UPDATE `creature_model_info` SET `combat_reach`=0.25 WHERE `modelid`=10990;
UPDATE `creature_model_info` SET `combat_reach`=0.25 WHERE `modelid`=10993;
UPDATE `creature_model_info` SET `combat_reach`=0.45 WHERE `modelid`=11009;
UPDATE `creature_model_info` SET `combat_reach`=3 WHERE `modelid`=11011;
UPDATE `creature_model_info` SET `combat_reach`=3 WHERE `modelid`=11029;
UPDATE `creature_model_info` SET `combat_reach`=1.02119 WHERE `modelid`=11411;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=11442;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=11443;
UPDATE `creature_model_info` SET `combat_reach`=2.625 WHERE `modelid`=11572;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=11589;
UPDATE `creature_model_info` SET `combat_reach`=4.05 WHERE `modelid`=11590;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=11592;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=11731;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=11749;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=11750;
UPDATE `creature_model_info` SET `combat_reach`=1.875 WHERE `modelid`=11830;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=11831;
UPDATE `creature_model_info` SET `combat_reach`=1.8 WHERE `modelid`=11978;
UPDATE `creature_model_info` SET `combat_reach`=1.8 WHERE `modelid`=11979;
UPDATE `creature_model_info` SET `combat_reach`=1.8 WHERE `modelid`=11980;
UPDATE `creature_model_info` SET `combat_reach`=1.8 WHERE `modelid`=11981;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=12169;
UPDATE `creature_model_info` SET `combat_reach`=0.5 WHERE `modelid`=12191;
UPDATE `creature_model_info` SET `combat_reach`=0.85 WHERE `modelid`=12196;
UPDATE `creature_model_info` SET `combat_reach`=1.725 WHERE `modelid`=12234;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=12329;
UPDATE `creature_model_info` SET `combat_reach`=4.05 WHERE `modelid`=12969;
UPDATE `creature_model_info` SET `combat_reach`=1.725 WHERE `modelid`=13260;
UPDATE `creature_model_info` SET `combat_reach`=1.725 WHERE `modelid`=13261;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=13361;
UPDATE `creature_model_info` SET `combat_reach`=4.05 WHERE `modelid`=13364;
UPDATE `creature_model_info` SET `combat_reach`=1.25 WHERE `modelid`=13509;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=13590;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=13598;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=13769;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=13777;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=13785;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=13799;
UPDATE `creature_model_info` SET `combat_reach`=3.5 WHERE `modelid`=14152;
UPDATE `creature_model_info` SET `combat_reach`=3.75 WHERE `modelid`=14352;
UPDATE `creature_model_info` SET `combat_reach`=0.75 WHERE `modelid`=14379;
UPDATE `creature_model_info` SET `combat_reach`=2.4 WHERE `modelid`=14522;
UPDATE `creature_model_info` SET `combat_reach`=2 WHERE `modelid`=14528;
UPDATE `creature_model_info` SET `combat_reach`=0 WHERE `modelid`=14541;
UPDATE `creature_model_info` SET `combat_reach`=2.5 WHERE `modelid`=14888;
UPDATE `creature_model_info` SET `combat_reach`=2.5 WHERE `modelid`=14889;
UPDATE `creature_model_info` SET `combat_reach`=0 WHERE `modelid`=14932;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15172;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15176;
UPDATE `creature_model_info` SET `combat_reach`=1 WHERE `modelid`=15181;
UPDATE `creature_model_info` SET `combat_reach`=1.575 WHERE `modelid`=15201;
UPDATE `creature_model_info` SET `combat_reach`=0.5 WHERE `modelid`=15204;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15206;
UPDATE `creature_model_info` SET `combat_reach`=2.1 WHERE `modelid`=15233;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15291;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15292;
UPDATE `creature_model_info` SET `combat_reach`=2.625 WHERE `modelid`=15334;
UPDATE `creature_model_info` SET `combat_reach`=2.4 WHERE `modelid`=15335;
UPDATE `creature_model_info` SET `combat_reach`=3 WHERE `modelid`=15336;
UPDATE `creature_model_info` SET `combat_reach`=3 WHERE `modelid`=15338;
UPDATE `creature_model_info` SET `combat_reach`=3 WHERE `modelid`=15340;
UPDATE `creature_model_info` SET `combat_reach`=5 WHERE `modelid`=15343;
UPDATE `creature_model_info` SET `combat_reach`=12 WHERE `modelid`=15345;
UPDATE `creature_model_info` SET `combat_reach`=6 WHERE `modelid`=15346;
UPDATE `creature_model_info` SET `combat_reach`=3.75 WHERE `modelid`=15347;
UPDATE `creature_model_info` SET `combat_reach`=3.375 WHERE `modelid`=15351;
UPDATE `creature_model_info` SET `combat_reach`=3 WHERE `modelid`=15354;
UPDATE `creature_model_info` SET `combat_reach`=4.125 WHERE `modelid`=15355;
UPDATE `creature_model_info` SET `combat_reach`=3.75 WHERE `modelid`=15356;
UPDATE `creature_model_info` SET `combat_reach`=4.5 WHERE `modelid`=15357;
UPDATE `creature_model_info` SET `combat_reach`=3.75 WHERE `modelid`=15359;
UPDATE `creature_model_info` SET `combat_reach`=6 WHERE `modelid`=15360;
UPDATE `creature_model_info` SET `combat_reach`=1.725 WHERE `modelid`=15362;
UPDATE `creature_model_info` SET `combat_reach`=6 WHERE `modelid`=15376;
UPDATE `creature_model_info` SET `combat_reach`=10 WHERE `modelid`=15392;
UPDATE `creature_model_info` SET `combat_reach`=3 WHERE `modelid`=15399;
UPDATE `creature_model_info` SET `combat_reach`=10 WHERE `modelid`=15412;
UPDATE `creature_model_info` SET `combat_reach`=10 WHERE `modelid`=15413;
UPDATE `creature_model_info` SET `combat_reach`=10 WHERE `modelid`=15414;
UPDATE `creature_model_info` SET `combat_reach`=1.725 WHERE `modelid`=15418;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15419;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15420;
UPDATE `creature_model_info` SET `combat_reach`=1.8 WHERE `modelid`=15421;
UPDATE `creature_model_info` SET `combat_reach`=3 WHERE `modelid`=15431;
UPDATE `creature_model_info` SET `combat_reach`=12.5 WHERE `modelid`=15432;
UPDATE `creature_model_info` SET `combat_reach`=3 WHERE `modelid`=15434;
UPDATE `creature_model_info` SET `combat_reach`=0 WHERE `modelid`=15435;
UPDATE `creature_model_info` SET `combat_reach`=2.25 WHERE `modelid`=15437;
UPDATE `creature_model_info` SET `combat_reach`=3 WHERE `modelid`=15439;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15464;
UPDATE `creature_model_info` SET `combat_reach`=2.625 WHERE `modelid`=15465;
UPDATE `creature_model_info` SET `combat_reach`=3.75 WHERE `modelid`=15472;
UPDATE `creature_model_info` SET `combat_reach`=1.725 WHERE `modelid`=15480;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15481;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15482;
UPDATE `creature_model_info` SET `combat_reach`=2.625 WHERE `modelid`=15483;
UPDATE `creature_model_info` SET `combat_reach`=1.725 WHERE `modelid`=15487;
UPDATE `creature_model_info` SET `combat_reach`=1.05 WHERE `modelid`=15489;
UPDATE `creature_model_info` SET `combat_reach`=1.725 WHERE `modelid`=15490;
UPDATE `creature_model_info` SET `combat_reach`=2.25 WHERE `modelid`=15492;
UPDATE `creature_model_info` SET `combat_reach`=1.725 WHERE `modelid`=15493;
UPDATE `creature_model_info` SET `combat_reach`=1.35 WHERE `modelid`=15495;
UPDATE `creature_model_info` SET `combat_reach`=1.125 WHERE `modelid`=15496;
UPDATE `creature_model_info` SET `combat_reach`=1.725 WHERE `modelid`=15497;
UPDATE `creature_model_info` SET `combat_reach`=0.75 WHERE `modelid`=15498;
UPDATE `creature_model_info` SET `combat_reach`=2.25 WHERE `modelid`=15499;
UPDATE `creature_model_info` SET `combat_reach`=10 WHERE `modelid`=15500;
UPDATE `creature_model_info` SET `combat_reach`=5 WHERE `modelid`=15512;
UPDATE `creature_model_info` SET `combat_reach`=4 WHERE `modelid`=15533;
UPDATE `creature_model_info` SET `combat_reach`=4.05 WHERE `modelid`=15537;
UPDATE `creature_model_info` SET `combat_reach`=3.75 WHERE `modelid`=15541;
UPDATE `creature_model_info` SET `combat_reach`=4.05 WHERE `modelid`=15544;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15545;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15546;
UPDATE `creature_model_info` SET `combat_reach`=7.5 WHERE `modelid`=15547;
UPDATE `creature_model_info` SET `combat_reach`=1 WHERE `modelid`=15554;
UPDATE `creature_model_info` SET `combat_reach`=3 WHERE `modelid`=15582;
UPDATE `creature_model_info` SET `combat_reach`=4.125 WHERE `modelid`=15583;
UPDATE `creature_model_info` SET `combat_reach`=2.25 WHERE `modelid`=15655;
UPDATE `creature_model_info` SET `combat_reach`=3.75 WHERE `modelid`=15656;
UPDATE `creature_model_info` SET `combat_reach`=2.25 WHERE `modelid`=15658;
UPDATE `creature_model_info` SET `combat_reach`=1.65 WHERE `modelid`=15661;
UPDATE `creature_model_info` SET `combat_reach`=3.75 WHERE `modelid`=15664;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15666;
UPDATE `creature_model_info` SET `combat_reach`=12 WHERE `modelid`=15686;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15688;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15689;
UPDATE `creature_model_info` SET `combat_reach`=18 WHERE `modelid`=15693;
UPDATE `creature_model_info` SET `combat_reach`=15 WHERE `modelid`=15695;
UPDATE `creature_model_info` SET `combat_reach`=6 WHERE `modelid`=15696;
UPDATE `creature_model_info` SET `combat_reach`=3 WHERE `modelid`=15697;
UPDATE `creature_model_info` SET `combat_reach`=1.125 WHERE `modelid`=15699;
UPDATE `creature_model_info` SET `combat_reach`=1.125 WHERE `modelid`=15700;
UPDATE `creature_model_info` SET `combat_reach`=1.875 WHERE `modelid`=15705;
UPDATE `creature_model_info` SET `combat_reach`=1.875 WHERE `modelid`=15706;
UPDATE `creature_model_info` SET `combat_reach`=2.25 WHERE `modelid`=15709;
UPDATE `creature_model_info` SET `combat_reach`=2.625 WHERE `modelid`=15710;
UPDATE `creature_model_info` SET `combat_reach`=4.05 WHERE `modelid`=15720;
UPDATE `creature_model_info` SET `combat_reach`=3.75 WHERE `modelid`=15721;
UPDATE `creature_model_info` SET `combat_reach`=3 WHERE `modelid`=15738;
UPDATE `creature_model_info` SET `combat_reach`=3 WHERE `modelid`=15739;
UPDATE `creature_model_info` SET `combat_reach`=3 WHERE `modelid`=15740;
UPDATE `creature_model_info` SET `combat_reach`=2.25 WHERE `modelid`=15741;
UPDATE `creature_model_info` SET `combat_reach`=6 WHERE `modelid`=15742;
UPDATE `creature_model_info` SET `combat_reach`=8 WHERE `modelid`=15743;
UPDATE `creature_model_info` SET `combat_reach`=1.725 WHERE `modelid`=15775;
UPDATE `creature_model_info` SET `combat_reach`=4.5 WHERE `modelid`=15778;
UPDATE `creature_model_info` SET `combat_reach`=0.75 WHERE `modelid`=15785;
UPDATE `creature_model_info` SET `combat_reach`=0 WHERE `modelid`=15787;
UPDATE `creature_model_info` SET `combat_reach`=6 WHERE `modelid`=15794;
UPDATE `creature_model_info` SET `combat_reach`=3.75 WHERE `modelid`=15815;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15821;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15823;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15825;
UPDATE `creature_model_info` SET `combat_reach`=4.05 WHERE `modelid`=15827;
UPDATE `creature_model_info` SET `combat_reach`=3.75 WHERE `modelid`=15828;
UPDATE `creature_model_info` SET `combat_reach`=4.05 WHERE `modelid`=15829;
UPDATE `creature_model_info` SET `combat_reach`=3.75 WHERE `modelid`=15830;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15831;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15833;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15837;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15842;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15843;
UPDATE `creature_model_info` SET `combat_reach`=4.05 WHERE `modelid`=15844;
UPDATE `creature_model_info` SET `combat_reach`=1.8 WHERE `modelid`=15845;
UPDATE `creature_model_info` SET `combat_reach`=4.05 WHERE `modelid`=15856;
UPDATE `creature_model_info` SET `combat_reach`=3.75 WHERE `modelid`=15857;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15860;
UPDATE `creature_model_info` SET `combat_reach`=0 WHERE `modelid`=15866;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=15967;
UPDATE `creature_model_info` SET `combat_reach`=9.75 WHERE `modelid`=17251;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=2388;
UPDATE `creature_model_info` SET `combat_reach`=2.5 WHERE `modelid`=7691;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=8591;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=8597;
UPDATE `creature_model_info` SET `combat_reach`=0.3 WHERE `modelid`=8909;
UPDATE `creature_model_info` SET `combat_reach`=1.5625 WHERE `modelid`=12489;
UPDATE `creature_model_info` SET `combat_reach`=3 WHERE `modelid`=14428;
UPDATE `creature_model_info` SET `combat_reach`=6 WHERE `modelid`=15296;
UPDATE `creature_model_info` SET `combat_reach`=3.75 WHERE `modelid`=15297;
UPDATE `creature_model_info` SET `combat_reach`=4.5 WHERE `modelid`=15761;
UPDATE `creature_model_info` SET `combat_reach`=26.25 WHERE `modelid`=15932;
UPDATE `creature_model_info` SET `combat_reach`=4.86 WHERE `modelid`=2026;
UPDATE `creature_model_info` SET `combat_reach`=1.5 WHERE `modelid`=6878;
UPDATE `creature_model_info` SET `combat_reach`=0.75 WHERE `modelid`=7906;
UPDATE `creature_model_info` SET `combat_reach`=1.125 WHERE `modelid`=10812;
UPDATE `creature_model_info` SET `combat_reach`=0.3 WHERE `modelid`=14392;
UPDATE `creature_model_info` SET `combat_reach`=15 WHERE `modelid`=15694;



-- Correct attack speed for Lord Skwol.
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15305 && `patch`=9;
-- Correct attack speed for Prince Skaldrenox.
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=15203 && `patch`=9;
-- Correct attack speed for High Marshal Whirlaxis.
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15204 && `patch`=9;
-- Correct attack speed for Baron Kazum.
UPDATE `creature_template` SET `base_attack_time`=3000 WHERE `entry`=15205 && `patch`=9;
-- Correct attack speed for Infernal.
UPDATE `creature_template` SET `base_attack_time`=2000, `ranged_attack_time`=2000 WHERE `entry`=89;
-- Correct attack speed for Colossus of Zora.
UPDATE `creature_template` SET `base_attack_time`=2000, `ranged_attack_time`=2000 WHERE `entry`=15740;
-- Correct attack speed for Colossus of Ashi.
UPDATE `creature_template` SET `base_attack_time`=2000, `ranged_attack_time`=2000 WHERE `entry`=15742;
-- Correct attack speed for Senior Sergeant Kai'jin.
UPDATE `creature_template` SET `base_attack_time`=2000, `ranged_attack_time`=2000 WHERE `entry`=15704;
-- Correct attack speed for Anubisath Warrior.
UPDATE `creature_template` SET `base_attack_time`=2000, `ranged_attack_time`=2000 WHERE `entry`=15537;
-- Correct attack speed for Vem.
UPDATE `creature_template` SET `base_attack_time`=2500, `ranged_attack_time`=2000 WHERE `entry`=15544;
-- Correct attack speed for Zealot Zath.
UPDATE `creature_template` SET `base_attack_time`=2000, `ranged_attack_time`=2000 WHERE `entry`=11348;
-- Correct attack speed for Herald of Thrall.
UPDATE `creature_template` SET `base_attack_time`=2000, `ranged_attack_time`=2000 WHERE `entry`=10719;
-- Correct attack speed for Anachronos the Ancient.
UPDATE `creature_template` SET `base_attack_time`=2000, `ranged_attack_time`=2000 WHERE `entry`=15381;

-- Mass melee attack speed updates.
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=60;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=603;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=873;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=954;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1089;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1090;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1091;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1092;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1115;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1116;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1117;
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=1118;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1134;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=1154;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=1155;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=1156;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1161;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1165;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1167;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1178;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1179;
UPDATE `creature_template` SET `base_attack_time`=3000 WHERE `entry`=1180;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1181;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1183;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=1187;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1214;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1222;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1237;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=1254;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=1255;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=1256;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1271;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1277;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1281;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1282;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1283;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1329;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1330;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1344;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1345;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1355;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1358;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1360;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1374;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1375;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1393;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1433;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1679;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1685;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1686;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1687;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1697;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1698;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1701;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1959;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=1977;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2225;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2745;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3162;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3343;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3545;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3625;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4969;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5314;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5441;
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=5809;
UPDATE `creature_template` SET `base_attack_time`=2600 WHERE `entry`=5824;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5826;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5832;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5838;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5849;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6071;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6123;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6124;
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=6143;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6177;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8508;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10364;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10367;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10930;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10991;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11347;
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=11370;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11373;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11387;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11388;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11391;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11583;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11725;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11726;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11728;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11729;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11807;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11837;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11838;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11839;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11840;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11946;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12097;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12474;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12475;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12476;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12498;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13085;
UPDATE `creature_template` SET `base_attack_time`=2800 WHERE `entry`=13089;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13328;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13441;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13448;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13616;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14185;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14186;
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=14448;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14480;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14487;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14515;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14768;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14769;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14825;
UPDATE `creature_template` SET `base_attack_time`=800 WHERE `entry`=14880;
UPDATE `creature_template` SET `base_attack_time`=1000 WHERE `entry`=14882;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14883;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14946;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14948;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15042;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15067;
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=15083;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=15084;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15111;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15114;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15117;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15119;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15206;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15208;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15209;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15211;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15212;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15220;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15307;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15354;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=16107;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=16110;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2630;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2675;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2983;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3270;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3451;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3455;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3844;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3902;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3911;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4509;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5780;
UPDATE `creature_template` SET `base_attack_time`=3000 WHERE `entry`=5786;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5830;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5841;
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=5859;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5873;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5874;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5879;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5919;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5921;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5932;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6111;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=6867;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7399;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7403;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7413;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7416;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7466;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7484;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7560;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7845;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9526;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11101;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11901;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12123;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14842;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15102;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16085;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=17041;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=17048;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=17049;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=17050;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=17051;
UPDATE `creature_template` SET `base_attack_time`=2800 WHERE `entry`=678;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=679;
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=680;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=710;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=775;
UPDATE `creature_template` SET `base_attack_time`=1700 WHERE `entry`=813;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=815;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=875;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1060;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1388;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1492;
UPDATE `creature_template` SET `base_attack_time`=2800 WHERE `entry`=1559;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2184;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2541;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2624;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2667;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3903;
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=5359;
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=5360;
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=5361;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5916;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7666;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7772;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7851;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8019;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8609;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11690;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15224;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15807;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15808;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=314;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=575;
UPDATE `creature_template` SET `base_attack_time`=2600 WHERE `entry`=1119;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1205;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1206;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1207;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1376;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1377;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1378;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1694;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1702;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1755;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1827;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1832;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1834;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=1843;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1846;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1855;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1871;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1893;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1896;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2191;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2299;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2345;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2346;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2447;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2523;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2583;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2585;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2602;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2603;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2623;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2671;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2678;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2773;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2779;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2992;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3414;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3470;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3527;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3529;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3531;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3560;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3573;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3579;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3799;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3906;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3907;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3908;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3909;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3912;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3984;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3985;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4504;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4789;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4795;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5392;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5848;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5913;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5920;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5922;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5923;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5925;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5926;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5927;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5929;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5933;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5934;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5935;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6016;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6017;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6021;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6066;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6110;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6112;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6238;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6240;
UPDATE `creature_template` SET `base_attack_time`=1200 WHERE `entry`=6243;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6490;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6650;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6651;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7016;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7044;
UPDATE `creature_template` SET `base_attack_time`=3000 WHERE `entry`=7137;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7360;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7366;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7367;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7368;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7398;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7400;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7402;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7412;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7414;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7415;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7425;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7464;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7465;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7469;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7483;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7486;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7487;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7527;
UPDATE `creature_template` SET `base_attack_time`=1000 WHERE `entry`=7769;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7844;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7918;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7977;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8018;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8204;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8219;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8281;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8297;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8317;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8392;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8446;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8978;
UPDATE `creature_template` SET `base_attack_time`=2600 WHERE `entry`=8979;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9297;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9398;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9459;
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=9462;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9477;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9516;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=9683;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9687;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9689;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10183;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10323;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10383;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10557;
UPDATE `creature_template` SET `base_attack_time`=250 WHERE `entry`=10577;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10581;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10608;
UPDATE `creature_template` SET `base_attack_time`=1200 WHERE `entry`=10639;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10697;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10699;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10720;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10807;
UPDATE `creature_template` SET `base_attack_time`=1700 WHERE `entry`=10836;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10876;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10919;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=10925;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10929;
UPDATE `creature_template` SET `base_attack_time`=1600 WHERE `entry`=10943;
UPDATE `creature_template` SET `base_attack_time`=3000 WHERE `entry`=10988;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10996;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11064;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11141;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11196;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11197;
UPDATE `creature_template` SET `base_attack_time`=3000 WHERE `entry`=11521;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11721;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11723;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11730;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11731;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11732;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11733;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11734;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11876;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11886;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11887;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12116;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12140;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=12257;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=12265;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12369;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12416;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12420;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12422;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12578;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12581;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12921;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12940;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13096;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13136;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13421;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13540;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13542;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13543;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13545;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13546;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13553;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13556;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13777;
UPDATE `creature_template` SET `base_attack_time`=2300 WHERE `entry`=14101;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14223;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14227;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14262;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14264;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14278;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14281;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14302;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14337;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14347;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14433;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14474;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14475;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14527;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14528;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14529;
UPDATE `creature_template` SET `base_attack_time`=1000 WHERE `entry`=14605;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14668;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14754;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14781;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14862;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14884;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14986;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14987;
UPDATE `creature_template` SET `base_attack_time`=1600 WHERE `entry`=14988;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15009;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15047;
UPDATE `creature_template` SET `base_attack_time`=1600 WHERE `entry`=15068;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15077;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15088;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15112;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15168;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15196;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15229;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15230;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15233;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15235;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15236;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15240;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15247;
UPDATE `creature_template` SET `base_attack_time`=1600 WHERE `entry`=15249;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15263;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15264;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15276;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15277;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15286;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15288;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15290;
UPDATE `creature_template` SET `base_attack_time`=1300 WHERE `entry`=15299;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15311;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15316;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15317;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15318;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15319;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15320;
UPDATE `creature_template` SET `base_attack_time`=800 WHERE `entry`=15323;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15324;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15325;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15327;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15333;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15335;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15336;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15338;
UPDATE `creature_template` SET `base_attack_time`=1800 WHERE `entry`=15339;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15340;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15341;
UPDATE `creature_template` SET `base_attack_time`=1300 WHERE `entry`=15344;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15348;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15355;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15362;
UPDATE `creature_template` SET `base_attack_time`=1200 WHERE `entry`=15369;
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=15370;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15378;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15379;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15380;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15385;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15386;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15387;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15388;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15389;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15390;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15391;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15392;
UPDATE `creature_template` SET `base_attack_time`=4000 WHERE `entry`=15428;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15459;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15460;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15461;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15462;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15464;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15469;
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=15473;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15477;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15500;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15502;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15504;
UPDATE `creature_template` SET `base_attack_time`=1200 WHERE `entry`=15505;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15508;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15509;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15510;
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=15511;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15512;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15515;
UPDATE `creature_template` SET `base_attack_time`=1200 WHERE `entry`=15516;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15521;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15522;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15525;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15527;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15528;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15529;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15532;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15533;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15534;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15535;
UPDATE `creature_template` SET `base_attack_time`=1300 WHERE `entry`=15538;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15540;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15541;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15543;
UPDATE `creature_template` SET `base_attack_time`=1000 WHERE `entry`=15546;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15555;
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=15589;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15614;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=15621;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15622;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15630;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15634;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15696;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15699;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15700;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15702;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15707;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15708;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15727;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15739;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15743;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15744;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15748;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15749;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15751;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15752;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15754;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15756;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15758;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15759;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15810;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15811;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15818;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15852;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15853;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15854;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15857;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15858;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15859;
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=15860;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15861;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15862;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15866;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15868;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15869;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15870;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15964;
UPDATE `creature_template` SET `base_attack_time`=1600 WHERE `entry`=15984;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16031;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16091;
UPDATE `creature_template` SET `base_attack_time`=1200 WHERE `entry`=16093;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1000;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1001;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9437;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9445;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9637;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14122;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15146;
UPDATE `creature_template` SET `base_attack_time`=3000 WHERE `entry`=15163;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15275;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15963;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=639;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1531;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7667;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7728;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7729;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8304;
UPDATE `creature_template` SET `base_attack_time`=1400 WHERE `entry`=9708;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10217;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10218;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11263;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12141;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12143;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14350;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14500;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=895;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=912;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=916;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=926;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=945;
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=1104;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4277;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5352;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8416;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10467;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14362;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15741;

-- Mass ranged attack speed upates.
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=60;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=603;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=691;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=696;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=873;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=954;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1089;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1090;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1091;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1092;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1115;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1116;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1117;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1118;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1134;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1154;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1155;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1156;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1161;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1165;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1167;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1178;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1179;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1180;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1181;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1183;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1185;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1187;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1189;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1192;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1194;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1214;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1222;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1237;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1254;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1255;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1256;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1271;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1277;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1281;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1282;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1283;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1329;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1330;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1344;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1345;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1355;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1358;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1360;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1374;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1375;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1393;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1433;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1558;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1679;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1685;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1686;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1687;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1689;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1697;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1698;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1701;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1959;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1977;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2225;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3101;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3102;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3112;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3119;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3121;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3128;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3129;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3160;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3162;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3192;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3205;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3206;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3207;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3343;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3545;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3625;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4969;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5809;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5824;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5826;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5832;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5941;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6071;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6123;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6124;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6177;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8508;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10364;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10367;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10930;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10991;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11583;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11807;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11837;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11838;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11839;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11840;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11946;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12097;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12121;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12122;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13089;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13153;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13176;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13218;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13328;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13439;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13441;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13448;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13616;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13798;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14029;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14031;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14185;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14186;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14448;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14480;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14487;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14515;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14768;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14769;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14770;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14771;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14772;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14773;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14774;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14775;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14776;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14777;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14946;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14948;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15069;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15083;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15084;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15114;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15117;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15119;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15140;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15203;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15205;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15206;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15208;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15209;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15211;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15212;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15220;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15305;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15307;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2630;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2675;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2983;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3451;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3455;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3680;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3844;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3902;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3911;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4263;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4509;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5780;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5834;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5873;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5874;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5879;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5919;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5921;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6111;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6867;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7380;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7387;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7391;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7392;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7399;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7403;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7413;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7416;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7466;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7484;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7560;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7845;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=9526;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10259;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10598;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11101;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11326;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12123;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14842;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15102;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=16085;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=16547;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=16548;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=17041;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=17048;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=17049;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=17050;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=17051;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=667;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=669;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=670;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=672;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=674;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=675;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=676;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=677;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=678;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=679;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=680;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=698;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=710;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=756;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=775;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=780;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=781;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=782;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=783;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=784;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=813;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=815;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=875;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=978;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=979;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1059;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1060;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1388;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1449;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1551;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2521;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2530;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2534;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2537;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2541;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2546;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2547;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2548;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2549;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2550;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2551;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2624;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2634;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2667;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2672;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3903;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4505;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4506;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5916;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6366;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7772;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7802;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11690;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14890;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15224;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=314;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1119;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1205;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1206;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1207;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1376;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1377;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1378;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1694;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1702;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1755;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1843;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1871;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1893;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1896;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2191;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2523;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2602;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2603;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2623;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2671;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2673;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2674;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2678;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2779;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=2992;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3527;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3529;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3531;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3560;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3573;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3579;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3799;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3864;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3906;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3907;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3908;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3909;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3912;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4059;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4504;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4781;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4787;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4795;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4798;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4799;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4805;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4807;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4815;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4818;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4819;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4820;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4821;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4822;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4831;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4887;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5392;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5848;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5913;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5920;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5922;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5923;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5925;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5926;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5927;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5929;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5934;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5935;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6016;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6017;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6021;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6066;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6110;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6112;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6238;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6240;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6243;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6490;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6493;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6498;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6500;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=6650;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7016;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7360;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7366;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7367;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7368;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7383;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7394;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7398;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7400;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7402;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7412;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7414;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7415;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7425;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7464;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7465;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7469;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7483;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7486;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7487;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7527;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7543;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7544;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7545;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7549;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7550;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7769;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7844;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7918;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8204;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8219;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8281;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8297;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8299;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8301;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8317;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8376;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8392;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8446;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8836;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8937;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8978;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8979;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=9297;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=9398;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=9477;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=9662;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=9683;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=9687;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=9689;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=9937;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10183;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10323;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10383;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10441;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10461;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10536;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10557;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10577;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10581;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10697;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10699;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10717;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10719;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10720;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10836;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10876;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10919;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10925;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10943;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10980;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10988;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10996;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11064;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11141;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11196;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11197;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11199;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11200;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11325;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11327;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11521;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11636;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11637;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11677;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11817;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11819;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11875;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11876;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11886;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11887;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12116;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12120;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12140;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12152;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12257;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12265;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12369;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12416;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12420;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12422;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12581;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12902;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12921;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12940;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13096;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13136;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13421;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13540;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13542;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13543;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13545;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13546;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13553;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13556;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14101;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14223;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14227;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14262;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14264;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14281;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14302;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14337;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14366;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14433;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14465;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14466;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14474;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14475;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14528;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14668;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14751;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14752;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14862;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14878;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14884;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14965;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14986;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14987;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14988;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14989;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15009;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15010;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15041;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15045;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15046;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15047;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15062;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15063;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15064;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15065;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15066;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15068;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15071;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15072;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15074;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15075;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15077;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15086;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15087;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15088;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15089;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15101;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15107;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15108;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15112;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15168;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15263;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15264;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15276;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15286;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15288;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15290;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15299;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15304;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15316;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15318;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15319;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15320;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15323;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15324;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15325;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15327;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15333;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15335;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15336;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15338;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15339;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15340;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15341;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15344;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15355;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15362;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15369;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15370;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15378;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15379;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15380;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15381;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15385;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15386;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15387;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15388;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15389;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15390;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15391;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15392;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15428;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15461;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15462;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15464;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15477;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15502;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15503;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15504;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15505;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15508;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15509;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15510;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15511;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15515;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15516;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15521;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15527;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15528;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15538;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15543;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15546;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15555;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15589;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15634;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15696;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15699;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15700;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15702;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15707;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15708;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15727;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15739;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15743;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15744;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15818;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15852;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15853;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15854;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15857;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15858;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15859;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15862;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15866;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15868;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15869;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15870;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15964;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15984;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=16031;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=16549;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=747;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=922;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1000;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1001;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=9437;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=9445;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=9637;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=9656;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=9916;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12473;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14122;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15146;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15163;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15204;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15275;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15963;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=643;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7729;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8300;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8612;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=9707;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=9708;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10217;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10218;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10359;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11263;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12141;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12143;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14350;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14500;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=895;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=912;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=916;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=926;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=945;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=1104;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4277;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5352;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8416;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=10467;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14362;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14421;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15741;

-- Correct run speed for Kinelory.
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=2713;
-- Correct walk speed for Kerlonian Evershade.
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11218;
-- Correct run speed for Crypt Scarab.
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry`=10577;
-- Correct run and walk speed for Argent Rider.
UPDATE `creature_template` SET `speed_walk`=1, `speed_run`=1.38571 WHERE `entry`=11102;
-- Correct walk speed for Risen Guardian.
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11598;
-- Correct run and walk speed for Plagued Insect.
UPDATE `creature_template` SET `speed_walk`=1, `speed_run`=1.14286 WHERE `entry`=10461;

-- Mass run speed corrections.
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=2170;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=2171;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=2630;
UPDATE `creature_template` SET `speed_run`=0.571429 WHERE `entry`=2675;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=2951;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=2952;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=2953;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=2954;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=2966;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=2975;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=2989;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=2990;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=3068;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=3229;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=3680;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=3844;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=3902;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=3911;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=4196;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=5786;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=5873;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=5874;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=5879;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=5919;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=5921;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=5932;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=6111;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7399;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7403;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7413;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7416;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7466;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7484;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7845;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=8554;
UPDATE `creature_template` SET `speed_run`=4.28571 WHERE `entry`=9526;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=11101;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=12034;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=698;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=756;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=1122;
UPDATE `creature_template` SET `speed_run`=1.07143 WHERE `entry`=1559;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=2522;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=2667;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=3903;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=4034;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=4661;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=7939;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=11690;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=14890;
UPDATE `creature_template` SET `speed_run`=0.428571 WHERE `entry`=15224;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=15806;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=1115;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=1116;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=1123;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=1124;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=1134;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=1689;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=2523;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=2623;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=2673;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=2674;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=2992;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=3527;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=3560;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=3573;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=3579;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=3864;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=3906;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=3907;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=3908;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=3909;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=3912;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=3921;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=3922;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=3923;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=3926;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=3987;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=4059;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=4107;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=4109;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=4634;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=4636;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=4637;
UPDATE `creature_template` SET `speed_run`=0.714286 WHERE `entry`=4781;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=5300;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=5304;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=5913;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=5920;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=5922;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=5923;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=5925;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=5926;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=5927;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=5929;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=6016;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=6017;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=6066;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=6110;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=6112;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=6240;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=6378;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=6651;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=7153;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=7154;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=7155;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7366;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7367;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7368;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7398;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7400;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7402;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7412;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7414;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7415;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7425;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7464;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7465;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7469;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7483;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7486;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7487;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7527;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=7844;
UPDATE `creature_template` SET `speed_run`=0.285714 WHERE `entry`=8317;
UPDATE `creature_template` SET `speed_run`=1.57143 WHERE `entry`=8446;
UPDATE `creature_template` SET `speed_run`=0.714286 WHERE `entry`=8937;
UPDATE `creature_template` SET `speed_run`=4.28571 WHERE `entry`=9297;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=9462;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=9464;
UPDATE `creature_template` SET `speed_run`=1.21429 WHERE `entry`=9683;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=9687;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=9689;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=9937;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=10183;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=10557;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=10581;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=10639;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=10807;
UPDATE `creature_template` SET `speed_run`=1.07143 WHERE `entry`=11199;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=11360;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=11361;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=11365;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=11380;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=11382;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=11561;
UPDATE `creature_template` SET `speed_run`=4.28571 WHERE `entry`=11583;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=11620;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=11621;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=11710;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=11727;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=11732;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=11875;
UPDATE `creature_template` SET `speed_run`=0.714286 WHERE `entry`=12120;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=12265;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=12416;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=12420;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=12422;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=12581;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=12677;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=12921;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=13136;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=13318;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=14081;
UPDATE `creature_template` SET `speed_run`=0.714286 WHERE `entry`=14227;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=14465;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=14466;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=14474;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=14509;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=14515;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=14532;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=14605;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=14751;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=14752;
UPDATE `creature_template` SET `speed_run`=2.57143 WHERE `entry`=14862;
UPDATE `creature_template` SET `speed_run`=2.42857 WHERE `entry`=14880;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=14881;
UPDATE `creature_template` SET `speed_run`=0.571429 WHERE `entry`=14884;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=14986;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=14987;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=14988;
UPDATE `creature_template` SET `speed_run`=0.285714 WHERE `entry`=15009;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15041;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15068;
UPDATE `creature_template` SET `speed_run`=1.25714 WHERE `entry`=15077;
UPDATE `creature_template` SET `speed_run`=1.25714 WHERE `entry`=15078;
UPDATE `creature_template` SET `speed_run`=1.25714 WHERE `entry`=15079;
UPDATE `creature_template` SET `speed_run`=1.25714 WHERE `entry`=15088;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=15101;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=15107;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=15108;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=15112;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15192;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15206;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15212;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15229;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15230;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15233;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15235;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15236;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15240;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15246;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15247;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=15250;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15252;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15262;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15263;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15264;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15276;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15277;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=15286;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=15288;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=15290;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15299;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=15300;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=15304;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15305;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15307;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15311;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15312;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=15316;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=15317;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15318;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15319;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15320;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15323;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15324;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15325;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15327;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15335;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15336;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15338;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=15339;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15340;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15341;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=15343;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=15344;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15348;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15355;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15369;
UPDATE `creature_template` SET `speed_run`=0.428571 WHERE `entry`=15370;
UPDATE `creature_template` SET `speed_run`=1.85714 WHERE `entry`=15378;
UPDATE `creature_template` SET `speed_run`=1.85714 WHERE `entry`=15379;
UPDATE `creature_template` SET `speed_run`=1.85714 WHERE `entry`=15380;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15385;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15386;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15387;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15388;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15389;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15390;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15391;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15392;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=15414;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=15421;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=15422;
UPDATE `creature_template` SET `speed_run`=0.571429 WHERE `entry`=15428;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=15458;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15461;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15462;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=15464;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=15475;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=15476;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15521;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15527;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15537;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=15538;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=15539;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=15541;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=15545;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15546;
UPDATE `creature_template` SET `speed_run`=0.714286 WHERE `entry`=15555;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=15589;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15621;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=15700;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=15701;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=15720;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=15727;
UPDATE `creature_template` SET `speed_run`=2.85714 WHERE `entry`=15740;
UPDATE `creature_template` SET `speed_run`=2.85714 WHERE `entry`=15742;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=15743;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=15744;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=15747;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=15750;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=15753;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=15757;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=15803;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=15812;
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry`=15813;
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=15814;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=15817;
UPDATE `creature_template` SET `speed_run`=2.85714 WHERE `entry`=15818;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=15854;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=15857;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=15862;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=15896;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=16139;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=9637;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=15114;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=15141;
UPDATE `creature_template` SET `speed_run`=0.714286 WHERE `entry`=15163;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=15204;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=15205;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15211;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15275;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=15963;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=603;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=1531;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=1534;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=8612;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=9707;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=10217;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=10218;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=10359;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=10991;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=11837;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=11838;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=11839;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=11840;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=12141;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=12143;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=13441;
UPDATE `creature_template` SET `speed_run`=1.85714 WHERE `entry`=14350;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=14772;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=14773;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=14776;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=14777;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=4277;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=10467;
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=14421;
UPDATE `creature_template` SET `speed_run`=2.85714 WHERE `entry`=15741;

-- Mass walk speed corrections.
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE `entry`=691;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=954;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1089;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1090;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1091;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1092;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1115;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1116;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1117;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1118;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1122;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1123;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1124;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1134;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1161;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1165;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1167;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1169;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1179;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1185;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1189;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1192;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1194;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1222;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1237;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1254;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1255;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1256;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1277;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1281;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1282;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1283;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1329;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1330;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1355;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1358;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1360;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1374;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1375;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1433;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1679;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1689;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1697;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1698;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1701;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1959;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1977;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2173;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2225;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2653;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2654;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2686;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2693;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2694;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2723;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2745;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=3068;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3101;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3102;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3112;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=3119;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3121;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3128;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3129;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3160;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3162;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3192;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3206;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3207;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3545;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=3696;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3752;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3754;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3755;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3757;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3848;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3920;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=3926;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=3932;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=3987;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4493;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4619;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4969;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5314;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5598;
UPDATE `creature_template` SET `speed_walk`=0.7 WHERE `entry`=5809;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5826;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=5838;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5849;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5941;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6071;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6123;
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE `entry`=6143;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6176;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6177;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6196;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6352;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6707;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6766;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6768;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6771;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6777;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6779;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7007;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7108;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7323;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7324;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7325;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7430;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7431;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7432;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7433;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7434;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7780;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8309;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8442;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8508;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9318;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10618;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10619;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10918;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10930;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11030;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11140;
UPDATE `creature_template` SET `speed_walk`=2 WHERE `entry`=11583;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11706;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11718;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11725;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11726;
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE `entry`=11727;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11728;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11729;
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE `entry`=11746;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11751;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11776;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11803;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11804;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12256;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12384;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=12474;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=12475;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=12476;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12498;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12759;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12999;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13085;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13936;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14029;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14031;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=14448;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14449;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14459;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14480;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14515;
UPDATE `creature_template` SET `speed_walk`=2 WHERE `entry`=14532;
UPDATE `creature_template` SET `speed_walk`=2 WHERE `entry`=14880;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15069;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15105;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15106;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=15114;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=15117;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15119;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15140;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15176;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15179;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15180;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15183;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15187;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15189;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15190;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15191;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15200;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=15205;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=15208;
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE `entry`=15211;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15270;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15282;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15306;
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE `entry`=15307;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16107;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1860;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1863;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=2170;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=2171;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2206;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2630;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2675;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2951;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2952;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2953;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2954;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2966;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2975;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2982;
UPDATE `creature_template` SET `speed_walk`=2 WHERE `entry`=2983;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2984;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2989;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2990;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3051;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3229;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3270;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3271;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3393;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3438;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3455;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3503;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3680;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3683;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3684;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3695;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3711;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3844;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3846;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3902;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3911;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3939;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4196;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4263;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4509;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5766;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5786;
UPDATE `creature_template` SET `speed_walk`=1.38889 WHERE `entry`=5830;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=5841;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5859;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5873;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5874;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5879;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5919;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5921;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6111;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6494;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6867;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7287;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7380;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7387;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7391;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7392;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7399;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7403;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7413;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7416;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7466;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7484;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7560;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7845;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8554;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10259;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10598;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11101;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11318;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11319;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11320;
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE `entry`=11321;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11326;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11901;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12034;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12717;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12719;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12721;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12736;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12757;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12863;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12961;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12962;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14842;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15102;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16547;
UPDATE `creature_template` SET `speed_walk`=0.444444 WHERE `entry`=16548;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17038;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17041;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17048;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17049;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17050;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17051;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=680;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=775;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=815;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1449;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=1551;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=1559;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2176;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=2177;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2178;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2184;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2530;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=2537;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2546;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2624;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2634;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2667;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2672;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2687;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3546;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3667;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3700;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3732;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3733;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3903;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3936;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3943;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3944;
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE `entry`=4034;
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE `entry`=4661;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4885;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4886;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4888;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4941;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5327;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5328;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5359;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5360;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5361;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5385;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5393;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5508;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6000;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6001;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6002;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6003;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7666;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7736;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7764;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7772;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7802;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7826;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7851;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7852;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7877;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7878;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7879;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7880;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7900;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7903;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7904;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7941;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7942;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7943;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7945;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7946;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7947;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7948;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7949;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8019;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8022;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8157;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8178;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8609;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8679;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9540;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10059;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10293;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=11690;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11717;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11824;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11825;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14374;
UPDATE `creature_template` SET `speed_walk`=2 WHERE `entry`=14890;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=15224;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16013;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=314;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=543;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=1012;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1018;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1019;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1031;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1205;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1206;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1207;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1259;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1296;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1376;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1377;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1694;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1702;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1755;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1827;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1832;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1834;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1846;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1854;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1855;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=1871;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1883;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1896;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2084;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2092;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=2172;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2238;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2243;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2245;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2250;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2299;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2303;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2306;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2318;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2345;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2346;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2403;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2447;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2449;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2462;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2523;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2557;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2573;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2574;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2583;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2585;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2609;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=2623;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2671;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=2678;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2679;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2682;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2684;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=2773;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2803;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2986;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2992;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3298;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3414;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3470;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3527;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3529;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3531;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3560;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3573;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3579;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3585;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3616;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3758;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3759;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3762;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3763;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3779;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3791;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3799;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3801;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3802;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3803;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3804;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3806;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3807;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3808;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3864;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3880;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3901;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3906;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3907;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3908;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3909;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3912;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=3921;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=3922;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=3923;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3942;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3984;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3985;
UPDATE `creature_template` SET `speed_walk`=3.6 WHERE `entry`=4059;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4194;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4195;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4420;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4421;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4422;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4424;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4427;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4428;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4435;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4436;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4437;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4438;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4440;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4442;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4480;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4494;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4498;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4504;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4508;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4510;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4511;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4512;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4514;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4515;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4516;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4517;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4518;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4519;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4523;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4525;
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE `entry`=4528;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4530;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4531;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4532;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4534;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4535;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4538;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4539;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4541;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4623;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4625;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=4634;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=4636;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=4637;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4670;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4671;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4672;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4673;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4674;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4675;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4685;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4695;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4702;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4711;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4712;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4713;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4714;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4715;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4716;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4718;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4719;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4781;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4787;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4789;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4798;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4799;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4805;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4807;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4815;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4818;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4819;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4820;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4821;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4822;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4824;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4831;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4887;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5292;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5300;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5304;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5331;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5392;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5395;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=5398;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5412;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5501;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=5600;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=5601;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5636;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5641;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5913;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5920;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5922;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5923;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5925;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5926;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5927;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5929;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=5933;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=5935;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6016;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6017;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6019;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6035;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6066;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=6068;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6110;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6112;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6168;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6198;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6199;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6200;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6201;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6202;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6238;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6240;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6243;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6349;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6350;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6351;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=6378;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=6412;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=6493;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6516;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6585;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=6651;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7044;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7107;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7110;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7115;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7125;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7137;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=7149;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=7153;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=7154;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=7155;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7360;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7366;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7367;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7368;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7383;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7394;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7398;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7400;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7402;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7412;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7414;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7415;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7425;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7464;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7465;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7469;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7483;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7486;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7487;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7527;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=7543;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=7544;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=7545;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7549;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7550;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7769;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7844;
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE `entry`=7918;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7977;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8018;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8023;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8152;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8153;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=8297;
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE `entry`=8317;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8376;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8392;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8408;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8420;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8446;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8477;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8506;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8517;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8522;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8878;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8937;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9177;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9454;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=9459;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=9462;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=9464;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9465;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9516;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9560;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9561;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9562;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9565;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9622;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9636;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9662;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=9683;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9687;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9689;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9937;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10183;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10301;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10383;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10427;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10441;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10536;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10557;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10581;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10608;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=10639;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10648;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10697;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10699;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10717;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10719;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=10720;
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE `entry`=10807;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=10836;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10876;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10925;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10929;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10940;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=10943;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10979;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10980;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11016;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11079;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11181;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11197;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11199;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=11200;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11259;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11325;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11327;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11561;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11611;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11613;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11614;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11620;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11621;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11637;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11710;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11712;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11721;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11723;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11730;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11731;
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE `entry`=11732;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11733;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11734;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11817;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11819;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11863;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11875;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11876;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11886;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11887;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11936;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12116;
UPDATE `creature_template` SET `speed_walk`=0.4 WHERE `entry`=12120;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12140;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12152;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12178;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12179;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12257;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12347;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12369;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=12422;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12578;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12581;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12677;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12777;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12778;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12779;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12780;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12781;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12782;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12783;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12784;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12785;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12786;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12787;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=12818;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12902;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=12921;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12940;
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE `entry`=13136;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13421;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=13717;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13777;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14081;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=14227;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14278;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14280;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14337;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14347;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14366;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14465;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14466;
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE `entry`=14474;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14522;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14527;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14528;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14529;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14668;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14751;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14752;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14754;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14781;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14862;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14878;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=14884;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14964;
UPDATE `creature_template` SET `speed_walk`=2 WHERE `entry`=14965;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14987;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14988;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14989;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=15009;
UPDATE `creature_template` SET `speed_walk`=2 WHERE `entry`=15041;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15045;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15046;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15047;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=15062;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15063;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15064;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15065;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15066;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15068;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15071;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15072;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15074;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15075;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15077;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15078;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15079;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15086;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15087;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15089;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15101;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15107;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15108;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15112;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15169;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15192;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15196;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15213;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15229;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=15230;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=15233;
UPDATE `creature_template` SET `speed_walk`=2 WHERE `entry`=15240;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=15246;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=15247;
UPDATE `creature_template` SET `speed_walk`=2.8 WHERE `entry`=15250;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=15252;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15262;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15263;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=15264;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=15277;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15293;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15299;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15300;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15304;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=15311;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15312;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15315;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15316;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15335;
UPDATE `creature_template` SET `speed_walk`=2.8 WHERE `entry`=15343;
UPDATE `creature_template` SET `speed_walk`=2.8 WHERE `entry`=15344;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15362;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15369;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=15370;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15378;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15379;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15380;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15383;
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE `entry`=15414;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15419;
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE `entry`=15421;
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE `entry`=15422;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=15428;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15431;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15432;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15434;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15437;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15445;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15446;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15448;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15450;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15451;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15452;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15453;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15455;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15456;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15457;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15459;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15460;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15464;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15469;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15476;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15498;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15499;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15500;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15502;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15503;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15504;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15510;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15512;
UPDATE `creature_template` SET `speed_walk`=2.8 WHERE `entry`=15516;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15522;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15525;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15528;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15529;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15532;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15533;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15534;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15535;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15537;
UPDATE `creature_template` SET `speed_walk`=2.8 WHERE `entry`=15538;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15539;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15540;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15541;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15544;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15545;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15546;
UPDATE `creature_template` SET `speed_walk`=2 WHERE `entry`=15555;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15589;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15610;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15614;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15621;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15630;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15693;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15696;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15700;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15701;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15704;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15707;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15708;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15709;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=15720;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15727;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15731;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15733;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15734;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15735;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15739;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15740;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15742;
UPDATE `creature_template` SET `speed_walk`=4.8 WHERE `entry`=15743;
UPDATE `creature_template` SET `speed_walk`=4.8 WHERE `entry`=15744;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15797;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15798;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15799;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15801;
UPDATE `creature_template` SET `speed_walk`=4.8 WHERE `entry`=15818;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15842;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15849;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15850;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15896;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15962;
UPDATE `creature_template` SET `speed_walk`=2.8 WHERE `entry`=15984;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16031;
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE `entry`=16043;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16091;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16184;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16543;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=747;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=752;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=922;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1000;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1001;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9637;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9656;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9916;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=12473;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14122;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15141;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15163;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=598;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1530;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1531;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1534;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=1658;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2520;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=4416;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7667;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7728;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7729;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8304;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8612;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9707;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9708;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10217;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10218;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10359;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11258;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=11263;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12141;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12143;
UPDATE `creature_template` SET `speed_walk`=1.55556 WHERE `entry`=14350;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14500;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14637;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=895;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=912;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=916;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=926;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=945;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1104;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8416;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10467;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14362;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14421;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15741;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16012;


-- Correct unit flags for OOX escort npcs.
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry` IN (7784, 7807, 7806);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (648, 3, 4, 46, 512, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Homing Robot OOX-17/TN - Remove Immune to NPC flag');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (836, 3, 4, 46, 512, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Remove Immune to NPC flag');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2767, 3, 4, 46, 512, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Homing Robot OOX-22/FE - Remove Immune to NPC flag');



-- Correct unit flags for Heart of Hakkar.
UPDATE `creature_template` SET `unit_flags`=33555200 WHERE `entry`=15069;

-- Correct initial faction for Vaelastrasz the Corrupt.
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=13020;

-- Correct initial faction for Big Will.
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=6238;

-- Correct initial faction for Ice Totem.
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=12141;

-- Correct unit flags for Pat's Splash Guy.
UPDATE `creature_template` SET `unit_flags`=33555200 WHERE `entry`=15140;

-- Correct unit flags for Lesser Resonating Crystal.
UPDATE `creature_template` SET `unit_flags`=33554496 WHERE `entry`=15804;

-- Correct unit flags for Greater Resonating Crystal.
UPDATE `creature_template` SET `unit_flags`=33554496 WHERE `entry`=15770;

-- Correct unit flags for Resonating Crystal.
UPDATE `creature_template` SET `unit_flags`=33554496 WHERE `entry`=15769;

-- Correct unit flags for C'Thun Portal.
UPDATE `creature_template` SET `unit_flags`=33554496 WHERE `entry`=15896;

-- Correct unit flags for Minor Resonating Crystal.
UPDATE `creature_template` SET `unit_flags`=33554496 WHERE `entry`=15805;

-- Correct unit flags for Major Resonating Crystal.
UPDATE `creature_template` SET `unit_flags`=33554496 WHERE `entry`=15771;

-- Correct unit flags for Lord Azrethoc's Image.
UPDATE `creature_template` SET `unit_flags`=33555200 WHERE `entry`=5772;

-- Correct unit flags for Demon Portal.
UPDATE `creature_template` SET `unit_flags`=33555200 WHERE `entry`=14081;

-- Correct unit flags for Captured Arko'narin.
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=11016;

-- Correct unit flags for Warpwood Spores.
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=14366;

-- Correct unit flags for Portal of Madness.
UPDATE `creature_template` SET `unit_flags`=33555200 WHERE `entry`=15141;

-- Correct creature factions.
UPDATE `creature_template` SET `faction`=39 WHERE `entry`=603;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=954;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1089;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1090;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1091;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1092;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1154;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1155;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1187;
UPDATE `creature_template` SET `faction`=189 WHERE `entry`=1192;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1214;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1237;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1254;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1255;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1256;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1344;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1345;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1355;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1374;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1375;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=1433;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1685;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1686;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1687;
UPDATE `creature_template` SET `faction`=189 WHERE `entry`=1689;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1697;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1698;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1701;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1977;
UPDATE `creature_template` SET `faction`=14 WHERE `entry`=2173;
UPDATE `creature_template` SET `faction`=123 WHERE `entry`=3128;
UPDATE `creature_template` SET `faction`=123 WHERE `entry`=3129;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=3162;
UPDATE `creature_template` SET `faction`=123 WHERE `entry`=3192;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=3545;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=3848;
UPDATE `creature_template` SET `faction`=123 WHERE `entry`=5809;
UPDATE `creature_template` SET `faction`=54 WHERE `entry`=6123;
UPDATE `creature_template` SET `faction`=122 WHERE `entry`=6177;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=8508;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=10930;
UPDATE `creature_template` SET `faction`=39 WHERE `entry`=10991;
UPDATE `creature_template` SET `faction`=14 WHERE `entry`=11583;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=11807;
UPDATE `creature_template` SET `faction`=1214 WHERE `entry`=11946;
UPDATE `creature_template` SET `faction`=1214 WHERE `entry`=12121;
UPDATE `creature_template` SET `faction`=1214 WHERE `entry`=12122;
UPDATE `creature_template` SET `faction`=1214 WHERE `entry`=13153;
UPDATE `creature_template` SET `faction`=1214 WHERE `entry`=13328;
UPDATE `creature_template` SET `faction`=1214 WHERE `entry`=13441;
UPDATE `creature_template` SET `faction`=1214 WHERE `entry`=13448;
UPDATE `creature_template` SET `faction`=1214 WHERE `entry`=13616;
UPDATE `creature_template` SET `faction`=1214 WHERE `entry`=13798;
UPDATE `creature_template` SET `faction`=14 WHERE `entry`=14448;
UPDATE `creature_template` SET `faction`=14 WHERE `entry`=14515;
UPDATE `creature_template` SET `faction`=1534 WHERE `entry`=14768;
UPDATE `creature_template` SET `faction`=1534 WHERE `entry`=14769;
UPDATE `creature_template` SET `faction`=1214 WHERE `entry`=14770;
UPDATE `creature_template` SET `faction`=1214 WHERE `entry`=14771;
UPDATE `creature_template` SET `faction`=1214 WHERE `entry`=14772;
UPDATE `creature_template` SET `faction`=1214 WHERE `entry`=14773;
UPDATE `creature_template` SET `faction`=1214 WHERE `entry`=14774;
UPDATE `creature_template` SET `faction`=1214 WHERE `entry`=14775;
UPDATE `creature_template` SET `faction`=1214 WHERE `entry`=14776;
UPDATE `creature_template` SET `faction`=1214 WHERE `entry`=14777;
UPDATE `creature_template` SET `faction`=1216 WHERE `entry`=14946;
UPDATE `creature_template` SET `faction`=1216 WHERE `entry`=14948;
UPDATE `creature_template` SET `faction`=14 WHERE `entry`=15069;
UPDATE `creature_template` SET `faction`=37 WHERE `entry`=15083;
UPDATE `creature_template` SET `faction`=37 WHERE `entry`=15084;
UPDATE `creature_template` SET `faction`=107 WHERE `entry`=15114;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=15119;
UPDATE `creature_template` SET `faction`=114 WHERE `entry`=15140;
UPDATE `creature_template` SET `faction`=14 WHERE `entry`=15307;
UPDATE `creature_template` SET `faction`=104 WHERE `entry`=2982;
UPDATE `creature_template` SET `faction`=104 WHERE `entry`=2984;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=3695;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=3846;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=3911;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=4072;
UPDATE `creature_template` SET `faction`=312 WHERE `entry`=4263;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=4509;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=5873;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=5874;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=5879;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=5919;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=6111;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=6867;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7380;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7387;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7391;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7392;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7399;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7403;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7413;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7416;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7466;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7560;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7845;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=9526;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=10259;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=10598;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=11101;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=11326;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=16548;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=16701;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=16817;
UPDATE `creature_template` SET `faction`=774 WHERE `entry`=17041;
UPDATE `creature_template` SET `faction`=774 WHERE `entry`=17048;
UPDATE `creature_template` SET `faction`=774 WHERE `entry`=17049;
UPDATE `creature_template` SET `faction`=774 WHERE `entry`=17050;
UPDATE `creature_template` SET `faction`=774 WHERE `entry`=17051;
UPDATE `creature_template` SET `faction`=74 WHERE `entry`=2541;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=3546;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=3700;
UPDATE `creature_template` SET `faction`=118 WHERE `entry`=3732;
UPDATE `creature_template` SET `faction`=118 WHERE `entry`=3733;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=3936;
UPDATE `creature_template` SET `faction`=123 WHERE `entry`=5393;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=5508;
UPDATE `creature_template` SET `faction`=124 WHERE `entry`=5806;
UPDATE `creature_template` SET `faction`=1575 WHERE `entry`=6000;
UPDATE `creature_template` SET `faction`=1575 WHERE `entry`=6001;
UPDATE `creature_template` SET `faction`=1575 WHERE `entry`=6002;
UPDATE `creature_template` SET `faction`=1575 WHERE `entry`=6003;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7736;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7764;
UPDATE `creature_template` SET `faction`=1575 WHERE `entry`=7851;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=7852;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7877;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7878;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7879;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7880;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7900;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7903;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7904;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7941;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7942;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7943;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7945;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7946;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7947;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7948;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7949;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=8019;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=8022;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=8157;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=8178;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=8609;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=9540;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=10059;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=10293;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=11717;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=11824;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=11825;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=14374;
UPDATE `creature_template` SET `faction`=370 WHERE `entry`=15804;
UPDATE `creature_template` SET `faction`=1618 WHERE `entry`=16013;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=543;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=1296;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1376;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1377;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1378;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1694;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1702;
UPDATE `creature_template` SET `faction`=67 WHERE `entry`=1843;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=1854;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=2084;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=2092;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=2299;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=2303;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=2306;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=2318;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=2523;
UPDATE `creature_template` SET `faction`=123 WHERE `entry`=2583;
UPDATE `creature_template` SET `faction`=123 WHERE `entry`=2585;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=2671;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=2679;
UPDATE `creature_template` SET `faction`=74 WHERE `entry`=2779;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=2803;
UPDATE `creature_template` SET `faction`=104 WHERE `entry`=2986;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=3298;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=3527;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=3560;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=3573;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=3579;
UPDATE `creature_template` SET `faction`=124 WHERE `entry`=3585;
UPDATE `creature_template` SET `faction`=124 WHERE `entry`=3616;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=3779;
UPDATE `creature_template` SET `faction`=118 WHERE `entry`=3804;
UPDATE `creature_template` SET `faction`=118 WHERE `entry`=3806;
UPDATE `creature_template` SET `faction`=118 WHERE `entry`=3807;
UPDATE `creature_template` SET `faction`=118 WHERE `entry`=3808;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=3880;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=3901;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=3906;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=3907;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=3908;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=3909;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=3912;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=4194;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=4195;
UPDATE `creature_template` SET `faction`=123 WHERE `entry`=4480;
UPDATE `creature_template` SET `faction`=68 WHERE `entry`=4498;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=4504;
UPDATE `creature_template` SET `faction`=69 WHERE `entry`=4508;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=4781;
UPDATE `creature_template` SET `faction`=124 WHERE `entry`=4795;
UPDATE `creature_template` SET `faction`=129 WHERE `entry`=4815;
UPDATE `creature_template` SET `faction`=18 WHERE `entry`=4818;
UPDATE `creature_template` SET `faction`=18 WHERE `entry`=4819;
UPDATE `creature_template` SET `faction`=18 WHERE `entry`=4820;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=5392;
UPDATE `creature_template` SET `faction`=125 WHERE `entry`=5395;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=5501;
UPDATE `creature_template` SET `faction`=90 WHERE `entry`=5772;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=5913;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=5920;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=5922;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=5923;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=5925;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=5926;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=5927;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=5929;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=5934;
UPDATE `creature_template` SET `faction`=49 WHERE `entry`=5935;
UPDATE `creature_template` SET `faction`=152 WHERE `entry`=6021;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=6110;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=6112;
UPDATE `creature_template` SET `faction`=18 WHERE `entry`=6243;
UPDATE `creature_template` SET `faction`=21 WHERE `entry`=6412;
UPDATE `creature_template` SET `faction`=74 WHERE `entry`=6650;
UPDATE `creature_template` SET `faction`=88 WHERE `entry`=7360;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7366;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7367;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7368;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7383;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7398;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7400;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7402;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7412;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7414;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7415;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7425;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7464;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7465;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7469;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7483;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7486;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7487;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7527;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7543;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7544;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7545;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7549;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7550;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=7844;
UPDATE `creature_template` SET `faction`=104 WHERE `entry`=8152;
UPDATE `creature_template` SET `faction`=104 WHERE `entry`=8153;
UPDATE `creature_template` SET `faction`=45 WHERE `entry`=8297;
UPDATE `creature_template` SET `faction`=37 WHERE `entry`=8317;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=8376;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=8392;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=8446;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=8517;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=8836;
UPDATE `creature_template` SET `faction`=104 WHERE `entry`=8878;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=8937;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=9177;
UPDATE `creature_template` SET `faction`=104 WHERE `entry`=9297;
UPDATE `creature_template` SET `faction`=54 WHERE `entry`=9398;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=9465;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=9560;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=9562;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=9565;
UPDATE `creature_template` SET `faction`=104 WHERE `entry`=9636;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=9662;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=9687;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=9937;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=10301;
UPDATE `creature_template` SET `faction`=21 WHERE `entry`=10383;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=10441;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=10461;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=10536;
UPDATE `creature_template` SET `faction`=14 WHERE `entry`=10581;
UPDATE `creature_template` SET `faction`=21 WHERE `entry`=10697;
UPDATE `creature_template` SET `faction`=21 WHERE `entry`=10836;
UPDATE `creature_template` SET `faction`=21 WHERE `entry`=10876;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=10943;
UPDATE `creature_template` SET `faction`=250 WHERE `entry`=11016;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=11079;
UPDATE `creature_template` SET `faction`=90 WHERE `entry`=11141;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=11181;
UPDATE `creature_template` SET `faction`=21 WHERE `entry`=11197;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=11199;
UPDATE `creature_template` SET `faction`=104 WHERE `entry`=11259;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=11325;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=11327;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=11636;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=11637;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=11712;
UPDATE `creature_template` SET `faction`=311 WHERE `entry`=11721;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=11817;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=11819;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=11875;
UPDATE `creature_template` SET `faction`=954 WHERE `entry`=11876;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=11886;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=11887;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=12116;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=12140;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=12152;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=12257;
UPDATE `creature_template` SET `faction`=54 WHERE `entry`=12265;
UPDATE `creature_template` SET `faction`=74 WHERE `entry`=12369;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=12578;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=12581;
UPDATE `creature_template` SET `faction`=1097 WHERE `entry`=12677;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=12778;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=12779;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=12780;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=12781;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=12785;
UPDATE `creature_template` SET `faction`=74 WHERE `entry`=12940;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=13136;
UPDATE `creature_template` SET `faction`=1214 WHERE `entry`=13421;
UPDATE `creature_template` SET `faction`=1216 WHERE `entry`=13777;
UPDATE `creature_template` SET `faction`=103 WHERE `entry`=14081;
UPDATE `creature_template` SET `faction`=40 WHERE `entry`=14101;
UPDATE `creature_template` SET `faction`=7 WHERE `entry`=14223;
UPDATE `creature_template` SET `faction`=49 WHERE `entry`=14227;
UPDATE `creature_template` SET `faction`=14 WHERE `entry`=14366;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=14465;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=14466;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=14475;
UPDATE `creature_template` SET `faction`=103 WHERE `entry`=14605;
UPDATE `creature_template` SET `faction`=954 WHERE `entry`=14668;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=14752;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=14862;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=14878;
UPDATE `creature_template` SET `faction`=28 WHERE `entry`=14965;
UPDATE `creature_template` SET `faction`=28 WHERE `entry`=14986;
UPDATE `creature_template` SET `faction`=28 WHERE `entry`=14988;
UPDATE `creature_template` SET `faction`=28 WHERE `entry`=15009;
UPDATE `creature_template` SET `faction`=188 WHERE `entry`=15010;
UPDATE `creature_template` SET `faction`=28 WHERE `entry`=15041;
UPDATE `creature_template` SET `faction`=1577 WHERE `entry`=15045;
UPDATE `creature_template` SET `faction`=412 WHERE `entry`=15046;
UPDATE `creature_template` SET `faction`=28 WHERE `entry`=15047;
UPDATE `creature_template` SET `faction`=1577 WHERE `entry`=15062;
UPDATE `creature_template` SET `faction`=1577 WHERE `entry`=15063;
UPDATE `creature_template` SET `faction`=412 WHERE `entry`=15064;
UPDATE `creature_template` SET `faction`=190 WHERE `entry`=15065;
UPDATE `creature_template` SET `faction`=190 WHERE `entry`=15066;
UPDATE `creature_template` SET `faction`=28 WHERE `entry`=15068;
UPDATE `creature_template` SET `faction`=190 WHERE `entry`=15071;
UPDATE `creature_template` SET `faction`=190 WHERE `entry`=15072;
UPDATE `creature_template` SET `faction`=1577 WHERE `entry`=15074;
UPDATE `creature_template` SET `faction`=412 WHERE `entry`=15075;
UPDATE `creature_template` SET `faction`=1577 WHERE `entry`=15086;
UPDATE `creature_template` SET `faction`=412 WHERE `entry`=15087;
UPDATE `creature_template` SET `faction`=412 WHERE `entry`=15089;
UPDATE `creature_template` SET `faction`=28 WHERE `entry`=15101;
UPDATE `creature_template` SET `faction`=1577 WHERE `entry`=15107;
UPDATE `creature_template` SET `faction`=412 WHERE `entry`=15108;
UPDATE `creature_template` SET `faction`=15 WHERE `entry`=15168;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15229;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15230;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15233;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15235;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15236;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15240;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15246;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15247;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15249;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15250;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15252;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15262;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15263;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15264;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15276;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15277;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15286;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15288;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15290;
UPDATE `creature_template` SET `faction`=14 WHERE `entry`=15299;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15300;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15311;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15312;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=15315;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15318;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15319;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15320;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15323;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15324;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15325;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15327;
UPDATE `creature_template` SET `faction`=148 WHERE `entry`=15335;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15336;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15339;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15340;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15341;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15343;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15344;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15348;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15369;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15370;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=15381;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=15383;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15385;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15386;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15387;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15388;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15389;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15390;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15391;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15392;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15414;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15421;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15422;
UPDATE `creature_template` SET `faction`=250 WHERE `entry`=15423;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15424;
UPDATE `creature_template` SET `faction`=114 WHERE `entry`=15428;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=15431;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=15432;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=15437;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=15445;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=15446;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=15448;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=15451;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=15452;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=15453;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=15457;
UPDATE `creature_template` SET `faction`=68 WHERE `entry`=15459;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15461;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15462;
UPDATE `creature_template` SET `faction`=188 WHERE `entry`=15475;
UPDATE `creature_template` SET `faction`=104 WHERE `entry`=15477;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15505;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15509;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15510;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15511;
UPDATE `creature_template` SET `faction`=68 WHERE `entry`=15512;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15514;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15516;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15521;
UPDATE `creature_template` SET `faction`=68 WHERE `entry`=15525;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15527;
UPDATE `creature_template` SET `faction`=104 WHERE `entry`=15528;
UPDATE `creature_template` SET `faction`=68 WHERE `entry`=15529;
UPDATE `creature_template` SET `faction`=104 WHERE `entry`=15532;
UPDATE `creature_template` SET `faction`=104 WHERE `entry`=15535;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15543;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15544;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15546;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15555;
UPDATE `creature_template` SET `faction`=370 WHERE `entry`=15589;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15621;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15622;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15630;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=15663;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=15701;
UPDATE `creature_template` SET `faction`=104 WHERE `entry`=15702;
UPDATE `creature_template` SET `faction`=68 WHERE `entry`=15703;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=15708;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=15709;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=15720;
UPDATE `creature_template` SET `faction`=370 WHERE `entry`=15727;
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=15731;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=15734;
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=15735;
UPDATE `creature_template` SET `faction`=126 WHERE `entry`=15737;
UPDATE `creature_template` SET `faction`=68 WHERE `entry`=15738;
UPDATE `creature_template` SET `faction`=104 WHERE `entry`=15739;
UPDATE `creature_template` SET `faction`=370 WHERE `entry`=15769;
UPDATE `creature_template` SET `faction`=370 WHERE `entry`=15770;
UPDATE `creature_template` SET `faction`=370 WHERE `entry`=15771;
UPDATE `creature_template` SET `faction`=1613 WHERE `entry`=15797;
UPDATE `creature_template` SET `faction`=1613 WHERE `entry`=15798;
UPDATE `creature_template` SET `faction`=1613 WHERE `entry`=15799;
UPDATE `creature_template` SET `faction`=370 WHERE `entry`=15805;
UPDATE `creature_template` SET `faction`=777 WHERE `entry`=15839;
UPDATE `creature_template` SET `faction`=777 WHERE `entry`=15840;
UPDATE `creature_template` SET `faction`=777 WHERE `entry`=15841;
UPDATE `creature_template` SET `faction`=777 WHERE `entry`=15842;
UPDATE `creature_template` SET `faction`=777 WHERE `entry`=15843;
UPDATE `creature_template` SET `faction`=777 WHERE `entry`=15848;
UPDATE `creature_template` SET `faction`=777 WHERE `entry`=15849;
UPDATE `creature_template` SET `faction`=777 WHERE `entry`=15850;
UPDATE `creature_template` SET `faction`=777 WHERE `entry`=15852;
UPDATE `creature_template` SET `faction`=777 WHERE `entry`=15856;
UPDATE `creature_template` SET `faction`=777 WHERE `entry`=15863;
UPDATE `creature_template` SET `faction`=777 WHERE `entry`=15865;
UPDATE `creature_template` SET `faction`=370 WHERE `entry`=15896;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15962;
UPDATE `creature_template` SET `faction`=114 WHERE `entry`=15964;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15984;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=16549;
UPDATE `creature_template` SET `faction`=54 WHERE `entry`=9437;
UPDATE `creature_template` SET `faction`=54 WHERE `entry`=9445;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=9656;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=12473;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=14122;
UPDATE `creature_template` SET `faction`=14 WHERE `entry`=15141;
UPDATE `creature_template` SET `faction`=37 WHERE `entry`=15163;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15275;
UPDATE `creature_template` SET `faction`=17 WHERE `entry`=646;
UPDATE `creature_template` SET `faction`=38 WHERE `entry`=8300;
UPDATE `creature_template` SET `faction`=40 WHERE `entry`=9707;
UPDATE `creature_template` SET `faction`=40 WHERE `entry`=9708;
UPDATE `creature_template` SET `faction`=233 WHERE `entry`=11263;
UPDATE `creature_template` SET `faction`=54 WHERE `entry`=12143;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=14350;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=14500;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=895;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=912;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=916;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=926;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=945;
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=1104;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=4277;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=10467;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=14362;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=14421;
UPDATE `creature_template` SET `faction`=90 WHERE `entry`=14527;
UPDATE `creature_template` SET `faction`=90 WHERE `entry`=14528;
UPDATE `creature_template` SET `faction`=777 WHERE `entry`=15846;
UPDATE `creature_template` SET `faction`=777 WHERE `entry`=15851;
UPDATE `creature_template` SET `faction`=777 WHERE `entry`=15867;
UPDATE `creature_template` SET `faction`=1619 WHERE `entry`=16012;


-- Correct quest details.
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0 WHERE `entry`=93;
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0 WHERE `entry`=106;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=107;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=111;
UPDATE `quest_template` SET `DetailsEmote1`=10 WHERE `entry`=117;
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0 WHERE `entry`=212;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=332;
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0, `DetailsEmote3`=0 WHERE `entry`=333;
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0 WHERE `entry`=334;
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0, `DetailsEmote3`=0 WHERE `entry`=343;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=399;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=470;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=745;
UPDATE `quest_template` SET `DetailsEmote1`=3 WHERE `entry`=747;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=6 WHERE `entry`=752;
UPDATE `quest_template` SET `DetailsEmote3`=2 WHERE `entry`=991;
UPDATE `quest_template` SET `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=2000 WHERE `entry`=1033;
UPDATE `quest_template` SET `DetailsEmote2`=0, `DetailsEmote3`=0 WHERE `entry`=1140;
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0, `DetailsEmote3`=0 WHERE `entry`=1395;
UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1477;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=1579;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=1656;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8166;
UPDATE `quest_template` SET `DetailsEmote1`=2, `DetailsEmote2`=1 WHERE `entry`=583;
UPDATE `quest_template` SET `DetailsEmote1`=6, `DetailsEmote2`=1, `DetailsEmote3`=0, `DetailsEmoteDelay2`=1000 WHERE `entry`=997;
UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4243;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=9319;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=9322;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=9323;
UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=742;
UPDATE `quest_template` SET `DetailsEmote1`=2, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=743;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=744;
UPDATE `quest_template` SET `DetailsEmote1`=2 WHERE `entry`=746;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=748;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=749;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=750;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=753;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=755;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=757;
UPDATE `quest_template` SET `DetailsEmote1`=50, `DetailsEmote2`=50, `DetailsEmote3`=50, `DetailsEmote4`=1 WHERE `entry`=758;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=761;
UPDATE `quest_template` SET `DetailsEmote1`=25 WHERE `entry`=763;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=766;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=767;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=771;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=772;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=773;
UPDATE `quest_template` SET `DetailsEmote1`=29 WHERE `entry`=775;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=776;
UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=780;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=819;
UPDATE `quest_template` SET `DetailsEmote1`=6, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=821;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=822;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=5, `DetailsEmote3`=1, `DetailsEmote4`=0, `DetailsEmoteDelay2`=2000, `DetailsEmoteDelay3`=1000 WHERE `entry`=833;
UPDATE `quest_template` SET `DetailsEmoteDelay1`=1500 WHERE `entry`=840;
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmoteDelay1`=3000 WHERE `entry`=843;
UPDATE `quest_template` SET `DetailsEmote3`=1, `DetailsEmoteDelay2`=0 WHERE `entry`=846;
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmoteDelay1`=0 WHERE `entry`=848;
UPDATE `quest_template` SET `DetailsEmote1`=2, `DetailsEmote2`=1, `DetailsEmoteDelay1`=500 WHERE `entry`=854;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=861;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=868;
UPDATE `quest_template` SET `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=871;
UPDATE `quest_template` SET `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=872;
UPDATE `quest_template` SET `DetailsEmoteDelay1`=100 WHERE `entry`=875;
UPDATE `quest_template` SET `DetailsEmote2`=5, `DetailsEmote3`=1, `DetailsEmote4`=5 WHERE `entry`=891;
UPDATE `quest_template` SET `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=893;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmote4`=1 WHERE `entry`=894;
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1, `DetailsEmote3`=6 WHERE `entry`=898;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=25 WHERE `entry`=899;
UPDATE `quest_template` SET `DetailsEmoteDelay1`=100 WHERE `entry`=903;
UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=905;
UPDATE `quest_template` SET `DetailsEmote2`=16, `DetailsEmoteDelay2`=7000 WHERE `entry`=913;
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=5 WHERE `entry`=959;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=962;
UPDATE `quest_template` SET `DetailsEmote2`=6, `DetailsEmote3`=1, `DetailsEmote4`=5 WHERE `entry`=1058;
UPDATE `quest_template` SET `DetailsEmote2`=5, `DetailsEmoteDelay2`=1000 WHERE `entry`=1062;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmoteDelay2`=1000 WHERE `entry`=1065;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmoteDelay1`=0 WHERE `entry`=1069;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1093;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1094;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1095;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1221;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=1 WHERE `entry`=1483;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=1486;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=1487;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1492;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1505;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3091;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=3301;
UPDATE `quest_template` SET `DetailsEmote2`=2, `DetailsEmote3`=0 WHERE `entry`=3369;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3376;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=3921;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3923;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5041;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=5722;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=5723;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=5725;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5726;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5727;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=5729;
UPDATE `quest_template` SET `DetailsEmote1`=6, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=5730;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=5761;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6301;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6361;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=6393;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6421;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=6441;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6442;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6461;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6523;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6541;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=6542;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6543;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=6563;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6629;
UPDATE `quest_template` SET `DetailsEmote2`=1, `DetailsEmote3`=5 WHERE `entry`=6641;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=5 WHERE `entry`=9368;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=25;
UPDATE `quest_template` SET `DetailsEmote2`=25 WHERE `entry`=494;
UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=496;
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0, `DetailsEmote3`=0 WHERE `entry`=498;
UPDATE `quest_template` SET `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=501;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=11, `DetailsEmote3`=0 WHERE `entry`=502;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=513;
UPDATE `quest_template` SET `DetailsEmote4`=29 WHERE `entry`=527;
UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=528;
UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=547;
UPDATE `quest_template` SET `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=552;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=553;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=568;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=569;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=570;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=572;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=673;
UPDATE `quest_template` SET `DetailsEmote2`=6, `DetailsEmote3`=1 WHERE `entry`=676;
UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=677;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=678;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=679;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=847;
UPDATE `quest_template` SET `DetailsEmote1`=9, `DetailsEmote2`=1, `DetailsEmote3`=25, `DetailsEmoteDelay2`=3000, `DetailsEmoteDelay3`=3000 WHERE `entry`=849;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=25 WHERE `entry`=1048;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=1049;
UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=1088;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1096;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=5, `DetailsEmote3`=1, `DetailsEmote4`=29 WHERE `entry`=1102;
UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1104;
UPDATE `quest_template` SET `DetailsEmoteDelay2`=1000 WHERE `entry`=1105;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=5, `DetailsEmoteDelay1`=2000, `DetailsEmoteDelay2`=0 WHERE `entry`=1106;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=1109;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=1113;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1115;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=1124;
UPDATE `quest_template` SET `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=1145;
UPDATE `quest_template` SET `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=1146;
UPDATE `quest_template` SET `DetailsEmote1`=9, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=6 WHERE `entry`=1147;
UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1149;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1176;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1178;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1180;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1183;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1184;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=11 WHERE `entry`=1186;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=5 WHERE `entry`=1187;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1361;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=1373;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1431;
UPDATE `quest_template` SET `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=1432;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1433;
UPDATE `quest_template` SET `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=1434;
UPDATE `quest_template` SET `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=1435;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1436;
UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1481;
UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1482;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1484;
UPDATE `quest_template` SET `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=1488;
UPDATE `quest_template` SET `DetailsEmote2`=0, `DetailsEmote3`=0 WHERE `entry`=1712;
UPDATE `quest_template` SET `DetailsEmote2`=0, `DetailsEmote3`=0 WHERE `entry`=1718;
UPDATE `quest_template` SET `DetailsEmote2`=25 WHERE `entry`=1719;
UPDATE `quest_template` SET `DetailsEmote2`=0, `DetailsEmote3`=0 WHERE `entry`=1791;
UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=2342;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2521;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=2581;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=2583;
UPDATE `quest_template` SET `DetailsEmote1`=6, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=1 WHERE `entry`=2585;
UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=2601;
UPDATE `quest_template` SET `DetailsEmote1`=6, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=2602;
UPDATE `quest_template` SET `DetailsEmote2`=5, `DetailsEmote3`=5 WHERE `entry`=2603;
UPDATE `quest_template` SET `DetailsEmote1`=7, `DetailsEmote2`=5 WHERE `entry`=2606;
UPDATE `quest_template` SET `DetailsEmote2`=11 WHERE `entry`=2641;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2661;
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0, `DetailsEmoteDelay2`=0 WHERE `entry`=2801;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=0, `DetailsEmote3`=0 WHERE `entry`=2879;
UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=2943;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2964;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=18, `DetailsEmoteDelay2`=200 WHERE `entry`=3446;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3447;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=4 WHERE `entry`=3825;
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0, `DetailsEmote3`=0 WHERE `entry`=3908;
UPDATE `quest_template` SET `DetailsEmoteDelay2`=200 WHERE `entry`=3909;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=5, `DetailsEmote3`=1, `DetailsEmote4`=1 WHERE `entry`=4182;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=66 WHERE `entry`=4183;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=4184;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=1 WHERE `entry`=4185;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=25 WHERE `entry`=4186;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=4223;
UPDATE `quest_template` SET `DetailsEmote1`=11, `DetailsEmote2`=6, `DetailsEmote3`=1, `DetailsEmote4`=1 WHERE `entry`=4224;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=25, `DetailsEmote3`=1, `DetailsEmote4`=11 WHERE `entry`=4241;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=1 WHERE `entry`=4242;
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=1 WHERE `entry`=4282;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=4322;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=5 WHERE `entry`=4341;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmote4`=5 WHERE `entry`=4729;
UPDATE `quest_template` SET `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=4767;
UPDATE `quest_template` SET `DetailsEmote1`=20, `DetailsEmote2`=5 WHERE `entry`=4770;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4808;
UPDATE `quest_template` SET `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=4821;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=4841;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmote4`=5, `DetailsEmoteDelay4`=2000 WHERE `entry`=4862;
UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=4865;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4881;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4902;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=18, `DetailsEmote3`=1 WHERE `entry`=4904;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=5062;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5084;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5088;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5151;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=11, `DetailsEmote3`=11 WHERE `entry`=5163;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=5203;
UPDATE `quest_template` SET `DetailsEmote3`=2 WHERE `entry`=5204;
UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5212;
UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=5213;
UPDATE `quest_template` SET `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=5251;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5386;
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1 WHERE `entry`=5501;
UPDATE `quest_template` SET `DetailsEmote2`=6, `DetailsEmote3`=1 WHERE `entry`=5534;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5535;
UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5543;
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0, `DetailsEmote3`=0, `DetailsEmote4`=0 WHERE `entry`=5544;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=5561;
UPDATE `quest_template` SET `DetailsEmoteDelay3`=1000 WHERE `entry`=5601;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5742;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5762;
UPDATE `quest_template` SET `DetailsEmote2`=2, `DetailsEmoteDelay2`=2000 WHERE `entry`=5763;
UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5781;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5881;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5892;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6142;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6143;
UPDATE `quest_template` SET `DetailsEmote2`=5, `DetailsEmote3`=0, `DetailsEmote4`=0 WHERE `entry`=6164;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=1, `DetailsEmoteDelay1`=1000, `DetailsEmoteDelay2`=2000, `DetailsEmoteDelay3`=3000, `DetailsEmoteDelay4`=4000 WHERE `entry`=6182;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=6, `DetailsEmoteDelay1`=1000, `DetailsEmoteDelay2`=2000, `DetailsEmoteDelay3`=3000, `DetailsEmoteDelay4`=4000 WHERE `entry`=6183;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=1, `DetailsEmoteDelay1`=1000, `DetailsEmoteDelay2`=2000, `DetailsEmoteDelay3`=3000, `DetailsEmoteDelay4`=4000 WHERE `entry`=6184;
UPDATE `quest_template` SET `DetailsEmoteDelay3`=0, `DetailsEmoteDelay4`=0 WHERE `entry`=6185;
UPDATE `quest_template` SET `DetailsEmote1`=33, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=25, `DetailsEmoteDelay1`=1000, `DetailsEmoteDelay2`=2000, `DetailsEmoteDelay3`=3000, `DetailsEmoteDelay4`=4000 WHERE `entry`=6186;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6282;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6283;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6381;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=5 WHERE `entry`=6402;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=6 WHERE `entry`=6403;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=6481;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=6482;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmote4`=1 WHERE `entry`=6501;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=1 WHERE `entry`=6502;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=5 WHERE `entry`=6504;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=6521;
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1 WHERE `entry`=6544;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=6565;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6571;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6603;
UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=6621;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=25 WHERE `entry`=6761;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=6762;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6982;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7121;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=1 WHERE `entry`=7261;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=7282;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=7301;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7494;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=8053;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=8054;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=8055;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8170;
UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=8275;
UPDATE `quest_template` SET `DetailsEmote1`=20, `DetailsEmote2`=6, `DetailsEmoteDelay2`=1000 WHERE `entry`=8277;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=8286;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=8288;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=6 WHERE `entry`=8304;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8318;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8371;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8460;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=8461;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=8464;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8465;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8470;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8471;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=6, `DetailsEmoteDelay2`=1000 WHERE `entry`=8492;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8494;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=5, `DetailsEmoteDelay2`=1000 WHERE `entry`=8503;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=6, `DetailsEmoteDelay2`=1000 WHERE `entry`=8505;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8509;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=6, `DetailsEmoteDelay2`=1000 WHERE `entry`=8511;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8513;
UPDATE `quest_template` SET `DetailsEmote1`=4, `DetailsEmote2`=5, `DetailsEmote3`=6, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8515;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=6, `DetailsEmoteDelay2`=1000 WHERE `entry`=8517;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8520;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8522;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=6, `DetailsEmote3`=1, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8524;
UPDATE `quest_template` SET `DetailsEmote1`=6, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8526;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8528;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8532;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8542;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8549;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8580;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8582;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8588;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8590;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8600;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8604;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8607;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8609;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8611;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8630;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8655;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8695;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8792;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8793;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8794;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8795;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8796;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1000 WHERE `entry`=8797;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=8857;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=8859;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=1 WHERE `entry`=9023;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=11;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=15;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=21;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=32;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=33;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=40;
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0 WHERE `entry`=52;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=54;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=59;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=84;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=85;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=86;
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0 WHERE `entry`=88;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=172;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=239;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=264;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=363;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=370;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=375;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=381;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=382;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=409;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=427;
UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=450;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=530;
UPDATE `quest_template` SET `DetailsEmote1`=25 WHERE `entry`=649;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=818;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=910;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=911;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=915;
UPDATE `quest_template` SET `DetailsEmote1`=15, `DetailsEmote2`=5, `DetailsEmote3`=1 WHERE `entry`=1004;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=1097;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=1123;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1218;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=5 WHERE `entry`=1657;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=1800;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1944;
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0 WHERE `entry`=1948;
UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1949;
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0 WHERE `entry`=1953;
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0 WHERE `entry`=1954;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1961;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=2158;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3101;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3161;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3517;
UPDATE `quest_template` SET `DetailsEmote3`=5, `DetailsEmote4`=1 WHERE `entry`=3821;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3903;
UPDATE `quest_template` SET `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=1 WHERE `entry`=3906;
UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3912;
UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3913;
UPDATE `quest_template` SET `DetailsEmote2`=6, `DetailsEmote3`=0 WHERE `entry`=3941;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=0, `DetailsEmote3`=0 WHERE `entry`=3942;
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0 WHERE `entry`=3961;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=0, `DetailsEmote3`=0 WHERE `entry`=3962;
UPDATE `quest_template` SET `DetailsEmote2`=2, `DetailsEmote3`=0, `DetailsEmote4`=0, `DetailsEmoteDelay2`=200 WHERE `entry`=4005;
UPDATE `quest_template` SET `DetailsEmote3`=1, `DetailsEmote4`=1 WHERE `entry`=4061;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=0, `DetailsEmote3`=0, `DetailsEmote4`=0 WHERE `entry`=4084;
UPDATE `quest_template` SET `DetailsEmote3`=11 WHERE `entry`=4505;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=5 WHERE `entry`=4742;
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=25 WHERE `entry`=4941;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=5, `DetailsEmote3`=35, `DetailsEmote4`=5 WHERE `entry`=4974;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=1 WHERE `entry`=4981;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=1 WHERE `entry`=4982;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=5 WHERE `entry`=4983;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=5502;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=6 WHERE `entry`=5821;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=5943;
UPDATE `quest_template` SET `DetailsEmote1`=193, `DetailsEmote2`=193, `DetailsEmote3`=0, `DetailsEmote4`=0 WHERE `entry`=5961;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=6566;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=66 WHERE `entry`=6567;
UPDATE `quest_template` SET `DetailsEmote1`=6, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=1 WHERE `entry`=6568;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=5 WHERE `entry`=6570;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=6582;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=1 WHERE `entry`=6602;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=18 WHERE `entry`=7044;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7082;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7142;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=7161;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=5 WHERE `entry`=7241;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=1, `DetailsEmoteDelay1`=500, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1500, `DetailsEmoteDelay4`=2000 WHERE `entry`=7441;
UPDATE `quest_template` SET `DetailsEmote1`=6, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=2, `DetailsEmoteDelay1`=500, `DetailsEmoteDelay2`=1000, `DetailsEmoteDelay3`=1500, `DetailsEmoteDelay4`=2000 WHERE `entry`=7461;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7492;
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1, `DetailsEmote3`=5 WHERE `entry`=7926;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=8061;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=8070;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=8071;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=5 WHERE `entry`=8322;
UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=8367;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8439;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=25, `DetailsEmote3`=1 WHERE `entry`=8979;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=8980;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8982;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=8983;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=8984;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=1222;

-- Correct quest offer reward.
UPDATE `quest_template` SET `OfferRewardText`='Ah!  I can\'t stand us being apart.  I have to see her!!' WHERE `entry`=106;
UPDATE `quest_template` SET `OfferRewardText`='My heart goes out to those two poor souls, Maybell and Tommy Joe.  I remember being young and in love, once.$B$BThere must be something I can do to help them!  Let me think...' WHERE `entry`=107;
UPDATE `quest_template` SET `OfferRewardEmote1`=0 WHERE `entry`=111;
UPDATE `quest_template` SET `OfferRewardText`='You got them.  Good show!  Now, just one moment while I concoct the potion...' WHERE `entry`=112;
UPDATE `quest_template` SET `OfferRewardText`='Oh...my!  I feel guilty deceiving my family, but my feelings for Tommy Joe are too strong to ignore.$B$BThank you, $N.  I\'ll drink this liquor as soon as I have the chance and sneak away to my love.$B$BAnd for you... please take this.' WHERE `entry`=114;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardText`='Hm... I have heard of this \"Collector\" but I don\'t know whom he\'s working for.  Thank you for the schedule.  It will help us solve this mystery.' WHERE `entry`=123;
UPDATE `quest_template` SET `OfferRewardText`='You found him?  Well done, $N.  He won\'t be \"collecting\" from the Elwynn Mines again!$B$BAnd this ring you found is interesting... it\'s a membership ring for the old Stonemason\'s Guild in Stormwind.  Why would a lowly thief have an artisan guild ring, and why are the Defias Thieves collecting money from our mines?$B$BDifficult questions.  I hope one day we\'ll have answers.' WHERE `entry`=147;
UPDATE `quest_template` SET `OfferRewardEmote1`=66, `OfferRewardText`='Excellent work, $c!  Your efforts will help provide the Alliance with the resources it needs.' WHERE `entry`=8392;
UPDATE `quest_template` SET `OfferRewardEmote1`=66, `OfferRewardText`='Excellent work, $c!  Your efforts will help provide the Alliance with the resources it needs.' WHERE `entry`=8397;
UPDATE `quest_template` SET `OfferRewardEmote1`=66, `OfferRewardText`='Good work, $N.  Thanks to you, our natural defenses in Ashenvale will remain intact for another day.' WHERE `entry`=8406;
UPDATE `quest_template` SET `OfferRewardEmote1`=66, `OfferRewardText`='Good work, $N.  Thanks to you, our natural defenses in Ashenvale will remain intact for another day.' WHERE `entry`=8407;
UPDATE `quest_template` SET `OfferRewardText`='Thank you, $N.  I will study these legends to see if there is some link between the trolls and the evil that has possessed Colonel Kurzen.' WHERE `entry`=207;
UPDATE `quest_template` SET `OfferRewardEmote2`=0, `OfferRewardText`='Ah, the powerstones!  The mages will be happy to see these!$B$BMany thanks, $N.  I know your trip from Darkshire was not an easy one.' WHERE `entry`=1395;
UPDATE `quest_template` SET `OfferRewardText`='Arr Me Hearty!   Gaining one Trinket be not enough to make ye master of the Arena!    Now tis the time to truly prove your steel.\n' WHERE `entry`=7810;
UPDATE `quest_template` SET `OfferRewardText`='Welcome to the new frontier, $N.  Ashenvale is a land of opportunity, one where a young $c like yourself is able to find boundless chances to prove their mettle.  Look around the outpost here, and be sure to travel out to the Zoram Strand, as the Horde has another outpost there as well.$B$BYour presence here tells me that you\'ve come to learn more about the hunt.  Listen close, and I will gladly share with you what you need to know.' WHERE `entry`=742;
UPDATE `quest_template` SET `OfferRewardText`='Thank you for your help, $N.$B$BMy part in my brother\'s ceremony is almost complete. Giving him his headdress and witnessing the ceremony are all my duty requires of me.' WHERE `entry`=744;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=745;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Thank you, $N.  This will calm the beasts of Mulgore.  And, spirits willing, it will teach the dwarves that hollowing the land is not the path to knowledge.' WHERE `entry`=746;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='The tauren of Narache thank you, $n. You show much promise.' WHERE `entry`=747;
UPDATE `quest_template` SET `OfferRewardText`='You have done well, $N.  I will take these and bind their power into a totem of cleansing.' WHERE `entry`=748;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='The tauren of Narache thank you for these provisions, $n. With your skill in the ways of the hunt you will surely be revered in Thunder Bluff someday.' WHERE `entry`=750;
UPDATE `quest_template` SET `OfferRewardEmote1`=24 WHERE `entry`=752;
UPDATE `quest_template` SET `OfferRewardEmote1`=6, `OfferRewardEmote2`=1 WHERE `entry`=753;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=2, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='News of your deed reached me moments ago -- already the beasts near the well drink from it eagerly.$B$BYou have done a great thing for the land, $N.  And you have done a great thing for the Tauren people.' WHERE `entry`=754;
UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=755;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='Thank you, $N.  The purity with which these beasts hunt is vital in the creation of the next cleansing totem.$B$BThe goblins will never learn the difference between contending with the land, and living in harmony with it.' WHERE `entry`=756;
UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=757;
UPDATE `quest_template` SET `OfferRewardEmote1`=50, `OfferRewardEmote2`=50, `OfferRewardEmote3`=50, `OfferRewardEmote4`=1, `OfferRewardText`='Ancestors of the Thunderhorn clan spoke to me in a dream, praising you for your actions near their well.$B$BFor their gratitude, they wish to give you this...' WHERE `entry`=758;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='Very good, $N.  I can feel the sacrifice of the land in this offering, and my spirit swells with sadness, and pride.' WHERE `entry`=759;
UPDATE `quest_template` SET `OfferRewardText`='You\'ve done it.  You have cleaned the wells, and healed our land.  Bloodhoof village is grateful, $N.$B$BMay the wind whisper your deeds for a hundred seasons, and may the waters of Mulgore remain clean forever.' WHERE `entry`=760;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='I know that gathering these quills was not an easy task, $N.  In doing this, you prove that you are a $c of merit.  It is good to have you at Bloodhoof Village.' WHERE `entry`=761;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=763;
UPDATE `quest_template` SET `OfferRewardText`='My anger is somewhat lessened at the news that the villain Fizsprocket is dead. I will go through his personal effects and see if there is any additional information about what the Venture Co. has planned for the future. Thank you for your efforts, $n.' WHERE `entry`=765;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=3000, `OfferRewardText`='Ah, thank you, $n. Using the items you brought me, I will be able to create the remedy I need to stop the spread of the infection and, eventually, cure it completely. I owe you my life in thanks.$b$bBut I\'ll never forget that screeching call when Mazzranache came upon me, the blaze of color as its beak descended...$b$bBe wary on your travels.' WHERE `entry`=766;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='I see you have learned to gather from our sacred land, $n. It will take but a moment for me to brew the Water of the Seers.' WHERE `entry`=771;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='Be not afraid, $n. You have successfully passed the Rite of Vision.' WHERE `entry`=772;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='You have shown great diligence in your yearning to pass the Rites of the Earthmother, $n.$b$bWe, the Ancestral Spirits, represent the mighty tauren who gave their lives bravely to found and protect our great city of Thunder Bluff. I hereby pass the duty of that protection over to you.$b$bYou have passed the Rite of Wisdom, young $c. Enter Thunder Bluff with pride.' WHERE `entry`=773;
UPDATE `quest_template` SET `OfferRewardEmote1`=3, `OfferRewardText`='Hail, young $c. I see you found your way to my doorstep.' WHERE `entry`=775;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=21, `OfferRewardText`='Well done! A fine kill that was.$b$bI will send a gathering party to collect the carcass so we can retrieve the hide and meat.$b$bYou have done a great deed for your people, $n.' WHERE `entry`=776;
UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=780;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=819;
UPDATE `quest_template` SET `OfferRewardEmote1`=5, `OfferRewardEmote2`=1, `OfferRewardText`='Haha... I never thought I\'d make more of this stuff ever again.$B$BYou\'ve stirred in me a great sense of nostalgia, $N. Kind of reminds me of the last time I made a batch of trogg brew. Thank you. The memories warm my stomach.' WHERE `entry`=821;
UPDATE `quest_template` SET `OfferRewardEmote1`=11, `OfferRewardEmote2`=1 WHERE `entry`=822;
UPDATE `quest_template` SET `OfferRewardEmoteDelay1`=100, `OfferRewardText`='Oh, so Takrin sent you? He\'s an excellent scout, I\'m not sure what I\'d do without him.$B$BI\'ll sign your recruitment letter, but what we really need is someone at the Crossroads.' WHERE `entry`=840;
UPDATE `quest_template` SET `OfferRewardText`='Alright, $N. You want to earn your keep with the Horde? Well there\'s plenty to do here, so listen close and do what you\'re told.$b$b $gI see that look in your eyes, do not think I will tolerate any insolence. Thrall himself has declared the Hordes females to be on equal footing with you men. Disrespect me in the slightest, and you will know true pain. : I\'m happy to have met you. Thrall will be glad to know that more females like you and I are taking the initiative to push forward in the Barrens.;' WHERE `entry`=842;
UPDATE `quest_template` SET `OfferRewardText`='Khazgorm met the fate he earned. I feel no remorse for the fool. He was an infidel on these lands.$b$bMay his death serve as a warning to all those who threaten to disrupt our way of life.$b$bNow let me take a moment to study the dwarf\'s journal....' WHERE `entry`=843;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardEmote2`=1, `OfferRewardText`='Very good, $N.  With the plainstriders gone we\'ll have an easier time keeping our supply chains intact.  And I hope you learned a few tricks out there in the Barrens, for your next prey has a little more fire in its blood than the plainstriders...' WHERE `entry`=844;
UPDATE `quest_template` SET `OfferRewardText`='Not bad, $N.  Those zhevra hold a lot of strength in their legs.  A sharp kick from them can knock even a tauren on its haunches!$B$BIt looks like you have some strength in you too.  Are you ready for a real challenge?' WHERE `entry`=845;
UPDATE `quest_template` SET `OfferRewardEmote1`=9, `OfferRewardText`='Ah, yes.  These are good specimens.  Potent.$B$BI am Forsaken, and we honor our contracts.  Here is your reward, $N.' WHERE `entry`=848;
UPDATE `quest_template` SET `OfferRewardText`='Well done, $N.  The centaur are low, brutish creatures, but a few have the wit and vision to lead.  And those are the most dangerous.$B$BBarak was such a centaur.  It is good that he is dead.' WHERE `entry`=850;
UPDATE `quest_template` SET `OfferRewardText`='Very good.  You must have really stirred up those centaur -- our guards spotted activity down near the Stagnant Oasis, which was probably you.$B$BYou should be proud of your deed, $N.  There is much bravery in you.' WHERE `entry`=851;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=66, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='I commend you, $N.  These centaur are undisciplined and cannot focus their rage as the orcs can, but they are fierce nonetheless.  In defeating them, your valor is proven.' WHERE `entry`=852;
UPDATE `quest_template` SET `OfferRewardText`='Ah, the spores from the Barrens that Helbrim was gathering.  He garnered your aid in delivering them?  Good.$B$BAnd the emulsion is still potent, so you must have wasted no time in the delivery.  Well done, $c.' WHERE `entry`=853;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardEmote2`=1, `OfferRewardText`='It is good to see that more of our $r allies have come to assist us from as far away as Thunder Bluff. Again, I welcome you.' WHERE `entry`=854;
UPDATE `quest_template` SET `OfferRewardText`='Nicely done.  I\'m sure you\'ve struck fear into the surviving centaurs, $N.  If they have sense, they\'ll now calm themselves and stop their advances.$B$BBut I don\'t think they will, and that is unfortunate.$B$BUnfortunate...for them.' WHERE `entry`=855;
UPDATE `quest_template` SET `OfferRewardText`='Yep, this looks like the right key. Let me just make sure I know how to work this thing...$b$bHmm... rotation control... This regulates speed and stability... fine arm movement control. Just look at this! I can\'t believe the Venture Company could design something this much better than ours. I\'ve got to get this back to Ratchet!' WHERE `entry`=858;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='You want to hunt in the Barrens?$B$BYour eyes are eager, and young.  They\'re not yet squinted from tracking your prey across this land\'s dry plains.$B$BBut worry not. We\'ll toughen your body and your mind.  And we\'ll teach you that there is more to hunting than finding and killing your quarry.$B$BPrepare yourself.  Your journey begins.  Now.' WHERE `entry`=860;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Skorn Whitecloud is a wise tauren.  He has hunted for years and years, and although his body is old, his spirit burns fiercely.  We are honored to have him with us.$B$BIf Skorn sent you to me, then  you too must have the hunter\'s spirit.  And to have gathered these claws shows your burgeoning skills.$B$BPerhaps you are ready to walk the path.' WHERE `entry`=861;
UPDATE `quest_template` SET `OfferRewardText`='Hopefully we\'ll be able to get something of value from the wrecked shredder prototype... my time\'s running out! I\'ll dispatch a salvage team to Wizzlecrank\'s location on the double.$b$bOh, let me give you something for your trouble, too.' WHERE `entry`=863;
UPDATE `quest_template` SET `OfferRewardText`='Great, you got them!  Now I just need to ground them down and mix them with some wine, and...' WHERE `entry`=865;
UPDATE `quest_template` SET `OfferRewardEmoteDelay1`=300, `OfferRewardText`='Oh, these are nice. Real nice... Good job, $n. I look forward to seeing more of your work in the future.' WHERE `entry`=867;
UPDATE `quest_template` SET `OfferRewardText`='You got rid of the raptors!$B$BThank you, $N.  You are a $c of worth.' WHERE `entry`=869;
UPDATE `quest_template` SET `OfferRewardText`='You found a fissure in the earth, with gases bubbling from it?  Strange.  This may be an answer to our questions, but we cannot yet be sure.$B$BBut it is a clue.  And I am grateful that you found it.' WHERE `entry`=870;
UPDATE `quest_template` SET `OfferRewardEmoteDelay2`=0 WHERE `entry`=872;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='My brother sent you, did he?  Then you must have proven yourself to him.  If you have earned the respect of Jorn, then you have my respect as well.$B$BAre you ready to tread farther down the hunter\'s path?' WHERE `entry`=874;
UPDATE `quest_template` SET `OfferRewardEmoteDelay1`=50 WHERE `entry`=875;
UPDATE `quest_template` SET `OfferRewardEmoteDelay1`=100, `OfferRewardText`='HA! Well done, $n! Very well done... I wasn\'t sure you were up to the task, but you\'ve proved yourself quite the cut-throat. Thank you again for helping us suppress the Harpy epidemic. Here is your reward, use it well.' WHERE `entry`=876;
UPDATE `quest_template` SET `OfferRewardText`='Your findings are amazing!  The seeds I gave you were dried, and dead.  Whatever rests under these oases can create life from nothing!$B$BWe must study this more...' WHERE `entry`=877;
UPDATE `quest_template` SET `OfferRewardText`='Yes, yes... filled with joy because finally <snort> the Bristleback know my tribe\'s pain, $r. That is how I should feel, but that <snort> is not the case.$B$BYou aid your people and they honor you. Mangletooth aids his people, and what do they do? They turn their backs on him. They forget him and leave him to rot in cage!$B$BI aid them even from locked behind bars and they send no one to save me!' WHERE `entry`=878;
UPDATE `quest_template` SET `OfferRewardText`='It is done then. Better it ends this way, says Mangletooth. <snort> They should have <snort> made sure I was dead when they turned their backs on me instead of leaving <snort> me here in this forsaken cage.$B$BThere is but one task left for you to finish, $r.' WHERE `entry`=879;
UPDATE `quest_template` SET `OfferRewardText`='Thank you, $N.  Studying the beasts of an area can tell much about the area itself.  We shall see what tale these shells tell.$B$BPlease accept my gratitude for your aid ... and perhaps you can use these coins.  I find that I do not need them.' WHERE `entry`=880;
UPDATE `quest_template` SET `OfferRewardText`='You\'ve beaten Echeyakee, and though his days of hunting are over... his spirit is with you.  He will show you the strength found in subtlety, and the honor in mercy.$B$BYour path is still long, $c.  Let\'s hope you stride it well.' WHERE `entry`=881;
UPDATE `quest_template` SET `OfferRewardEmote2`=2, `OfferRewardEmoteDelay2`=500, `OfferRewardText`='This fang is merely a token, but what it represents is profound.$B$BIshamuhale\'s strength is in you, $N.  May you use it with temperance.  That is your burden.$B$BThat is your honor.' WHERE `entry`=882;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Lakota\'mani is called \"Earthshaker\" in our language, and his steps are like gathered thunder.  He is with you now, and his courage mingles with yours.  Together there is no conflict you cannot face.$B$BWalk tall, $N.  Walk tall, Earthshaker.' WHERE `entry`=883;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=2, `OfferRewardEmoteDelay2`=500, `OfferRewardText`='The thunder lizard Owatanka is called \"Bluebolt\" by the tauren, for within him resides a speed that belies his size.  It is said that lightning struck Bluebolt long ago and, fed from the sky\'s rage, the great beast\'s energy is without limit.$B$BMay his energy flow through you, $N.  For you now keep pace with Owatanka.' WHERE `entry`=884;
UPDATE `quest_template` SET `OfferRewardEmote2`=2, `OfferRewardEmoteDelay2`=500, `OfferRewardText`='The thunderhawk is a rare beast of the Barrens, and its death can portend great fortune, or great doom.$B$BBut Washte Pawne, called \"Spirit Biter\" in Taurahe, can bring neither... or both.$B$BThe pain you felt from hunting Spirit Biter is the pang all feel who make great gains at great costs.  The sting you felt is the pain of regret.$B$BBut I can see you have conquered this.  You have learned that regret turns to wisdom, and that through pain one gains strength.$B$BYou have learned much, $N.' WHERE `entry`=885;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='My brethren in Thunder Bluff were wise to send you, young $c.  For the mystery of the Barrens is one that I alone cannot unravel.$B$BWith your aid, let us hope we can find answers to our questions.' WHERE `entry`=886;
UPDATE `quest_template` SET `OfferRewardText`='You did good, kid. A little more work like that, and it\'ll be one less thing I\'ll have to worry about. Hopefully they\'ll be convinced that they should relocate their operation elsewhere.$b$bIn the meantime, there is the small matter of getting back the goods they stole from me!' WHERE `entry`=887;
UPDATE `quest_template` SET `OfferRewardText`='It\'s a relief to get all this stuff back, so thanks for your help, $n. You know, I could use a $r like you to help out with my operation here. If you\'re ever looking for work, don\'t forget about how well Gazlowe pays for service!' WHERE `entry`=888;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=1, `OfferRewardText`='Good. Go with Agamaggan\'s spirit as your guide, $r. Return to me if you desire more of Agamaggan\'s magics.' WHERE `entry`=889;
UPDATE `quest_template` SET `OfferRewardText`='Ah, Gazlowe sent you, did he? Just a moment, let me take a look here and check my own logs and make sure I didn\'t have Gazlowe\'s shipment sent to the wrong place.$b$bBet he\'s waiting for those boots from Drizzlek...' WHERE `entry`=890;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardEmote3`=66, `OfferRewardText`='Alas, the righteous Alliance guns have been silenced. You shall be rewarded for your aid, $n.$b$bNow to tend to the grim task of recovering the bodies of the dead....' WHERE `entry`=891;
UPDATE `quest_template` SET `OfferRewardText`='No dice, eh? I guess it must have been the Freebooters then... Dizzywig\'s on the level, I\'m sure he wouldn\'t cheat me like that. After all, he is on the payroll.$b$bLooks like I\'ve got some goods to get back, $n. What do you say?' WHERE `entry`=892;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardText`='Excellent, excellent specimens indeed.$B$BThe quilboar are further along than I had expected.$B$BHere, $c, take this and get out of my way. I\'d better take a closer look at these weapons. We may have underestimated our enemy, and that\'s the kind of mistake we can\'t afford to make.' WHERE `entry`=893;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardText`='Ahhhh! That sort of business. You know, I saw the Heedless once on the open seas. Fearsome ship, or was that boat... those sailors are so particular!$b$bAnyways, watching her glide across the water was quite a sight to see. I\'m glad her infamous captain will trouble my ships no longer.' WHERE `entry`=895;
UPDATE `quest_template` SET `OfferRewardText`='Look at the size of that thing, $n! We\'re going to be rich! Let\'s see, according to the rates I\'ve seen on gems going into Undermine, I should be able to figure out your cut--fifty percent, don\'t worry!$b$bNow let\'s see... I think this should do about right. Pleasure doing business with you, $n.' WHERE `entry`=896;
UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=899;
UPDATE `quest_template` SET `OfferRewardText`='Ah, I see you\'ve been busy, lurking in the grasses and hunting prowlers.  Do you think, then, it is time to face a champion among them?' WHERE `entry`=903;
UPDATE `quest_template` SET `OfferRewardText`='So you\'ve been to the nests and placed the feathers of your prey within them.  That took a fair portion of courage, no doubt about it.$B$BDo you feel a little tougher, $N?  Because you look tougher now then when you first came here.  I guess the Barrens is doing its job.' WHERE `entry`=905;
UPDATE `quest_template` SET `OfferRewardEmote3`=1, `OfferRewardEmoteDelay2`=0 WHERE `entry`=906;
UPDATE `quest_template` SET `OfferRewardText`='It is good to see you return with proof of victory.  And it is good to know you have done so with your bones unbroken.' WHERE `entry`=907;
UPDATE `quest_template` SET `OfferRewardText`='You, like the thunderhawk, should be proud.  You have bested every foe we set you before, and have done so with strength, courage and honor.$B$BBut your path, $N, continues.  In fact, you will find that true hunters forever strive, forever walk their path with the same pride you have shown me.$B$BNow, it is time to move on.' WHERE `entry`=913;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=2, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='You have done it, $N.  You killed the leaders of the Druids of the Fang.  My dreams are now free of their wicked faces, and you have helped save the Barrens from a cursed future.$B$BI thank you, $N.  I thank you for myself, for the druids of Thunder Bluff, and for the land.' WHERE `entry`=914;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardText`='Superb! And just as I was about to lose my job too! I will see to it that Gazlowe gets this gift immediately.$b$bThank you, $n. Nicely done, I say!' WHERE `entry`=959;
UPDATE `quest_template` SET `OfferRewardText`='Ahh, a letter from Darsok. I have not heard from him in many years.$B$BSo the last of the Bloodfeathers are dead, eh? That is good news, I can remember when my friend Rokhan went with that crazy mok\'nathal to kill her older sister. Ah, to be young again, like you.' WHERE `entry`=1060;
UPDATE `quest_template` SET `OfferRewardEmote2`=2, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='Bravely done, $N.$B$BWe may ultimately need the wisdom of tauren elders to calm the spirits of Stonetalon, but...$B$BRidding the Venture Company of its personnel is a good first move against them.' WHERE `entry`=1062;
UPDATE `quest_template` SET `OfferRewardText`='I bid you greetings.  You are here seeking counsel?' WHERE `entry`=1063;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='Magatha sent word of your coming, $N.  Although my heart beats no longer, I still feel sorrow for the spirits of Stonetalon.$B$BThe Forsaken are eager to offer what help we can.' WHERE `entry`=1064;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=3, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='You got them!  Thank you!$B$BI\'ll have these sent to Dizzywig and get them shipped to Booty Bay.  I can already taste the profits!$B$BHere is your cut, $N.  I couldn\'t have made this deal without you.' WHERE `entry`=1069;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1093;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1094;
UPDATE `quest_template` SET `OfferRewardText`='So, $N, you have come.  Now, are you prepared to journey through distant lands?$B$BIf so, young $c, then listen on...' WHERE `entry`=1130;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=1483;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=2, `OfferRewardText`='As a Disciple of Naralex, I commend your bravery, $n.$b$bYour aid in ridding the caverns is the first step in our long plight to see the Barrens restored.$b$bThank you and may you prosper.' WHERE `entry`=1487;
UPDATE `quest_template` SET `OfferRewardText`='I bid you greetings, $N.  You are welcome here, and I suggest you gather all your strength.  For the task we now set before you ... is a dire one.' WHERE `entry`=1489;
UPDATE `quest_template` SET `OfferRewardEmote2`=0, `OfferRewardText`='Yes, it is true.  I know of the druids in the Wailing Caverns.  I have seen their twisted, scaled faces.  I know their crimes, and I know their plans.$B$BYou must stop them, $N.' WHERE `entry`=1490;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Great, you got it!  I can\'t wait to try it out.  This is going to make me a fortune, I just know it!$B$BThank you, $N.  Take this, and after I\'m rich I\'ll send you more, I promise!' WHERE `entry`=1491;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='A small enough crate. Yes, I should be able to find room for this aboard the ship. It sails with the next tide, I trust this is soon enough? Excellent. Let me just enter it into my ledger.$b$bAll taken care of! Good day to you, $c.' WHERE `entry`=1492;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Ah.  I see you have defeated the thunder lizards, which proves you are tough.  Now I will show you how tough skin and shrewd movements can combine to form an impenetrable wall of defense.$B$BLearn your lesson well, $N.  And be ready for future instruction.' WHERE `entry`=1498;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Hello, young one.  Here for some instruction, are you?' WHERE `entry`=1505;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardText`='Ah, the furs I was expecting. Thank you.$B$BThese came faster than I had expected. They will make good blankets for anyone who wishes to stay here.$B$BPlease feel free to stay as long as you like. My inn is always open and all of our people are welcome here. And don\'t underestimate a good night\'s rest, it can make a great difference while you\'re out traveling.' WHERE `entry`=1656;
UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1823;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Each of us plays a role in our tribe. Each of us must also go through all the same rites. Do not ever let your pride tell you otherwise.$B$BI remain here to train new warriors that seek the glory of battle and who follow the ways of our oldest ancestors. When you feel ready, come back to me and I will do what I can to train you further. Go with the tribe\'s blessing, $N.' WHERE `entry`=3091;
UPDATE `quest_template` SET `OfferRewardText`='Aha!  So the raptors did hide the silver at their lair.  It\'s hard to believe these beasts would have the desire for silver.  Perhaps the stories of their intelligence are not as far from the mark as I thought!$B$BThank you, $N.  Take this as a reward for your service to us, and know that the guards of the crossroads owe their next month\'s pay to you.' WHERE `entry`=3281;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=0, `OfferRewardEmote3`=0, `OfferRewardEmote4`=0, `OfferRewardEmoteDelay3`=0, `OfferRewardText`='Falla sent you to me? Well now, let\'s see that shard that you say she was so hesitant to talk about...$B$B<Hamuul peers into the shard>$B$BOh... I didn\'t... Well.$B$B$N, thank you for delivering this to me. It isn\'t wise to speak of things such as this, though, I advise you. These are matters that you should not concern yourself with.$B$BLet\'s just say that things in the Emerald Dream are not as we thought...$B$BPerhaps in the future, our paths may cross again.\n' WHERE `entry`=3369;
UPDATE `quest_template` SET `OfferRewardText`='Justice has been served on this day by your swift actions, $N.  Let this deed serve as a warning to all who would threaten our home.$B$BYou have earned this reward to help you on your sojourn, young $c.' WHERE `entry`=3376;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Oh, what\'s this?  A samophlange, you say?  What\'s a samophlange??$B$BAh... but look at the way it moves when you handle it.  And there\'s the sound of intricate gears inside.  Oh my!  I want to fix it and see what it does, don\'t you??' WHERE `entry`=3921;
UPDATE `quest_template` SET `OfferRewardText`='Great, you got them!  Now I can get to work...' WHERE `entry`=3922;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='What\'s this?  Why, it\'s a samophlange!  Where did you get this thing?  Have you been poking around the Venture Company holdings in the Barrens?$B$BYou must be very brave, or very stupid.' WHERE `entry`=3923;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardText`='I understand. Thank you, $c.' WHERE `entry`=4921;
UPDATE `quest_template` SET `OfferRewardEmoteDelay2`=0 WHERE `entry`=5041;
UPDATE `quest_template` SET `OfferRewardText`='May your aim be unerring, and the mark of your weapon be true, $r.$B$BAgamaggan\'s spirit is with you. Return <snort> to me if you wish. Mangletooth will bless you again if the great boar god deems me worthy. <snort>' WHERE `entry`=5043;
UPDATE `quest_template` SET `OfferRewardText`='Your enemies should fear you even more, $r. <snort>$B$BTell Mangletooth tales of your cunning in battle when next we meet--be it in this life, or the next. <snort>' WHERE `entry`=5044;
UPDATE `quest_template` SET `OfferRewardText`='Our greatest warriors, and our greatest <snort> shamans would envy your will, $r.$B$BDefeat more of the Bristlebacks knowing that they cannot stop you! <snort>' WHERE `entry`=5045;
UPDATE `quest_template` SET `OfferRewardText`='Go to war, $r.' WHERE `entry`=5046;
UPDATE `quest_template` SET `OfferRewardText`='Ah, you do understand. <snort> My words were not lost on your ears, $r. Mangletooth may be caged, but no cage can stop Agamaggan\'s power! <snort>$B$BThe touch of the shard, the feel of it... it has been a long time, $r.$B$BDo you know what it is like? To have your power severed from you?$B$BBut, that is a tale for another time. I promised you information. I promised you Agamaggan\'s power. My people turned their backs on Mangletooth. Now, I lose you upon them. <snort>' WHERE `entry`=5052;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardEmote2`=1, `OfferRewardText`='Excellent, $N. Thank you.$B$BMagatha told me that if you were successful in finding her clansman that you be given this. Please, take it in thanks.' WHERE `entry`=5724;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Good, $c. You have done well in serving the Dark Lady. Your continued perseverance and ambition will be of great use to the Lady\'s subjects. Return to me again in the future. Perhaps I will have other tasks for you that will aid the Dark Lady in her attempts at overtaking the Lich King and completely freeing the Scourge.' WHERE `entry`=5725;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardText`='Good, $N! The spirits be praised, perhaps you are the one who will finally put my greatest fears to rest! Who would suspect someone so young and so brave would rise up and champion our cause? You remind me of myself when I was younger. I will ensure that you are justly rewarded for your efforts if we both survive the coming storm.$B$BBut there is time for more praise later. You\'ve not accomplished anything in comparison to what you will face... but this is a good start.' WHERE `entry`=5726;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardText`='Excellent! Most excellent, $c!$B$BWhat you have done this day is only the first step in a much broader foundation--a foundation that we will build the destruction of the Shadow Council on, once and for all.$B$BTell me all he said... and leave not one word out--it may be more important than you realize.' WHERE `entry`=5727;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=1 WHERE `entry`=5728;
UPDATE `quest_template` SET `OfferRewardEmote1`=5, `OfferRewardEmote2`=2, `OfferRewardText`='What is it?! Oh, you, $c... my apologies. My anger rivals that of a rabid kodo bull... but perhaps it is my own fault. In sending travelers into Ragefire Chasm, I should have seen the possibility that some harm would come from it. It seems both Bazzalan and Jergosh were taken unaware and slain by some of Thrall\'s do-gooders. A most inopportune time, but there is nothing that can be done about it now.' WHERE `entry`=5729;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=4, `OfferRewardText`='Ashenvale? Hmm, I had not heard of any presence of the Council or the Burning Blade in Ashenvale. My spies will investigate, $N. You have done well.$B$BFor now, rest, and keep yourself occupied with other tasks. I will call upon you again soon.$B$BLok-Tar Ogar!' WHERE `entry`=5730;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=1, `OfferRewardText`='Ha! You\'ve done it! Thrall will be so pleased.$B$BI will ensure this heart is taken care of properly.$B$BFor now though, you must celebrate your victory. I will inform Thrall of your success.$B$BThank you for your aid, $c.' WHERE `entry`=5761;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='My goodness, my niece Kaya is alive! That is good news indeed. Thank you, $n.\n' WHERE `entry`=6401;
UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=6442;
UPDATE `quest_template` SET `OfferRewardText`='Sweet, mon! Good news, perhaps we will have fewer unwanted dinner guests tonight.$B$BMany thanks, $N.  We are forever in your debt.' WHERE `entry`=6461;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Kaya is alive! $n, I have you to thank for rescuing her.\n' WHERE `entry`=6523;
UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=6541;
UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=6562;
UPDATE `quest_template` SET `OfferRewardText`='Excellent!  You\'ve shown your worth by defending our operations in Warsong Gulch!  May word of your honor spread far and wide across our lands.' WHERE `entry`=8368;
UPDATE `quest_template` SET `OfferRewardText`='Excellent! It seems we\'ve appointed dutiful Flamekeepers this year if the bonfires are as well-kept as you claim. Thank you for inspecting them for me; here, take this as a small token of my esteem.' WHERE `entry`=9368;
UPDATE `quest_template` SET `OfferRewardText`='Most impressive, $N... the claw of Sharptalon could not have been easy to get!  The Ashenvale Hunt goes well for you!$B$BSharptalon had long terrorized the peons from the lumber camps near its path as they tried to travel here to Splintertree Post.  No doubt once the word gets out that it was you who put down the beast, many rousing songs of your bravery will be heard at campfires and lumber mills across Ashenvale!' WHERE `entry`=2;
UPDATE `quest_template` SET `OfferRewardText`='Ah, the paw of Ursangous!  Your skill is impressive, $c; he is credited with numerous kills.  The crescent on his paw is no doubt a sign that he was trained by the night elves that skulk about Ashenvale.  Ursangous is... was one of the mightiest bears you\'d find in these parts.  To have bested such a creature is a testament to your will and resolve.$B$BYour ancestors would be proud!' WHERE `entry`=23;
UPDATE `quest_template` SET `OfferRewardText`='A victory for $N in the Ashenvale Hunt!  Well done - the head of Shadumbra is a fitting trophy to claim for such an impressive fight, no doubt.$B$BShadumbra\'s savagery was well known throughout the post here.  Any trip to the west, especially on foot trying to get out to the Zoram Strand, was wrought with danger because of this tiger.  Thanks to you, this danger has abated.' WHERE `entry`=24;
UPDATE `quest_template` SET `OfferRewardText`='Yeah, I heard that someone tore up the lake out there like a dust devil through the Barrens.  From the sound of it too, we might be able to set up a possible observation area out there to keep an eye on our Alliance friends.  Well, that is if we can keep it on the down low...$B$BLooks like you ended up being quite useful after all; the transports between here and Stonetalon should have an easier time of it.  Take this - you\'ve earned it.' WHERE `entry`=25;
UPDATE `quest_template` SET `OfferRewardText`='Good work - I\'ll start my analysis on these now!  I can tell you right from the start though... these are nothing like any insect form I have ever seen.  It\'s almost as if these bugs are being controlled by an outside force or something.$B$BYou need to go talk to Fizzledowser right away; apparently there is an emergency that he needs your help with on the double!  I\'m not sure, but I think it involves more of the bugs in the Tanaris desert!' WHERE `entry`=82;
UPDATE `quest_template` SET `OfferRewardText`='You\'ve done well, $N!' WHERE `entry`=192;
UPDATE `quest_template` SET `OfferRewardText`='Nicely done, $g old chap : m\'lady;!' WHERE `entry`=194;
UPDATE `quest_template` SET `OfferRewardText`='Well done $c, well done!  I will continue to send forces to thin out the furbolg, but I can at least count on a different path that will be free of Alliance entanglements.  The Horde conquest of Ashenvale is now in full swing!$B$BYou\'ve earned your pay this day, hero.  I salute you!' WHERE `entry`=216;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardText`='$N, you have slain all three beasts that comprise the Ashenvale Hunt.  You have brought me adequate proof of their demise; there is no question of your strength and tenacity.  The blood of a hunter streaks through your veins, and you should be commended!$B$BPlease, accept this bauble as a sign of congratulations on your mighty deeds done in Ashenvale for the Horde today.  May your ancestors watch over you!' WHERE `entry`=247;
UPDATE `quest_template` SET `OfferRewardText`='You place the egg... distress beacon... inside the chicken... homing robot.$B$BHums and whirs are heard from inside the robot as it struggles to stand up.  After the robot comes to life, Oglethorpe\'s voice is heard once more, but now from inside the robot:$B$B\"OOX-17/TN is working at least, but it needs major repairs!  It is much too heavy for you to carry it... but I think I have an idea.  Are you up for watching over it some more?\"' WHERE `entry`=351;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Ah, most excellent.  Apothecary Renferrel has my utmost respect.  I am anxious to study his work.' WHERE `entry`=493;
UPDATE `quest_template` SET `OfferRewardEmote2`=21, `OfferRewardText`='The raven\'s cry from the west doth beckon?$b$bSuperb news!  Hillsbrad is ripe for attack.  We can carry out our plan of destruction now.  Varimathras will be pleased.' WHERE `entry`=494;
UPDATE `quest_template` SET `OfferRewardText`='You were sent by Shalindra? Very well then, you\'ll find I don\'t waste much time with idle chatter.$b$bMug\'Thol is an irritant, and we will deal with him quickly, thoroughly, and without incident.' WHERE `entry`=495;
UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=501;
UPDATE `quest_template` SET `OfferRewardEmote2`=0, `OfferRewardText`='Ah, the horrible reek of Mudsnout Blossoms.  At least those filthy Gnolls are good for something.' WHERE `entry`=509;
UPDATE `quest_template` SET `OfferRewardEmote3`=1, `OfferRewardText`='Apothecary Lydon sent you?  Ah, why didn\'t you say so!$b$bDespite his gloomy disposition, Apothecary Lydon is one of our most dedicated and skilled members.$b$bThe good chap sends Mudsnout Composite!  I know what our friend in Hillsbrad is up to now.  And I like the way he thinks.  The Dark Lady would be most impressed with the progress he is making toward the new plague.' WHERE `entry`=513;
UPDATE `quest_template` SET `OfferRewardEmote1`=66, `OfferRewardText`='At ease, $c.  I see you have returned from battle.  My sources tell me you performed well on the Hillsbrad front.' WHERE `entry`=527;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardText`='Ah, this is splendid.  This will have to be cleaned of course, but you really outdid yourself, $N.  I will have someone prepare the tiara and place it within our collection posthaste.$B$BAs I\'m sure you will agree, our gratitude is as grand as our collection.' WHERE `entry`=543;
UPDATE `quest_template` SET `OfferRewardText`='You have done a great service for the Forsaken, $N.  These artifacts have been sorely missed.$B$BAnd it is good to hear that Kegan and the other betrayers have found justice.' WHERE `entry`=544;
UPDATE `quest_template` SET `OfferRewardText`='Very good.  Those ruins should now be safe enough to search, if one is careful.$B$BThank you, $N.' WHERE `entry`=545;
UPDATE `quest_template` SET `OfferRewardEmote1`=21, `OfferRewardText`='You found it!  Most excellent, $N!' WHERE `entry`=552;
UPDATE `quest_template` SET `OfferRewardText`='These will do nicely.  Although it looks like their magic is faded, it would be best if the Magus\' initial experiments were on inert specimens such as these.$B$BThank you, $N.' WHERE `entry`=556;
UPDATE `quest_template` SET `OfferRewardText`='You found them.  I trust the elementals from which you removed these bracers were amenable?$B$BHm...death has not only stopped my heart, but robbed me of my comedic timing, it seems.$B$BWell thank you, $N.  You serve the Magus, and hence the Dark Lady, well.' WHERE `entry`=557;
UPDATE `quest_template` SET `OfferRewardEmote1`=66, `OfferRewardText`='You are quite the bounty hunter, $c.  Well done.' WHERE `entry`=567;
UPDATE `quest_template` SET `OfferRewardText`='Your duty was performed with honor, $c.' WHERE `entry`=568;
UPDATE `quest_template` SET `OfferRewardEmote1`=66, `OfferRewardText`='Well done.  You have served the Warchief with honor.' WHERE `entry`=569;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Your knowledge of the jungle is strong, $n.  These specimens will be perfect.  I will thank the spirits for sacrificing such fine beasts for the cause of the Horde.' WHERE `entry`=570;
UPDATE `quest_template` SET `OfferRewardText`='These are good tusks, $N.  You prove that you have the strength to hunt the Bloodscalps.$B$BAnd that is good, because you are not done hunting them.' WHERE `entry`=581;
UPDATE `quest_template` SET `OfferRewardText`='Thank you, $N.  I will inspect these heads to ensure poor Yenniku was spared the headhunter\'s axe.' WHERE `entry`=582;
UPDATE `quest_template` SET `OfferRewardText`='Jolly nice to make your acquaintance, $n. Haven\'t seen a $c around these parts for some time.$b$bI situated myself with this expedition for one purpose: to hunt a great and elusive beast. Seeing that you\'re a hero of sorts I am willing to let you take part in the hunt, but you must first prove yourself.$b$bI shall teach the ways of raptor killing to you. Ajeck will train you with tiger hunting. And Sir Erlgadin is a master of panther tracking.$b$bProve your skill and I\'ll let you in on the big hunt.' WHERE `entry`=583;
UPDATE `quest_template` SET `OfferRewardText`='Ah, very good.  I will boil these, and leech them, and the spirits of their owners will weaken as I render their necklaces to paste!$B$BHere, $N.  This will repay my debt to you.' WHERE `entry`=596;
UPDATE `quest_template` SET `OfferRewardText`='How you doing, $c? The task set before us by Vol\'jin will be a difficult one, and any assistance you might provide will be appreciated and necessary.' WHERE `entry`=638;
UPDATE `quest_template` SET `OfferRewardText`='Ah!  You activated these shards.  Already I feel more myself!$B$BBut alas, I am still far from free...' WHERE `entry`=642;
UPDATE `quest_template` SET `OfferRewardText`='<Myzrael speaks through the stone.>$B$BYou have done it!  You opened the Stones of Binding!  I can feel the shackles about me loosen, and freedom draws ever closer.$B$BYou are a noble $c, $N.  My rescuer!' WHERE `entry`=651;
UPDATE `quest_template` SET `OfferRewardText`='Ah, Gor\'mul you speak of. Yes, from what he says, it seems he has never recovered from the death of Doomhammer.$b$bGor\'mul was a captive here when Thrall and Orgrim fought to free the camp, but as the earth shook and our brethren escaped, he was left behind. He wandered alone and lost for years without direction or hope, until we returned to establish ourselves here in Hammerfall.' WHERE `entry`=655;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardText`='So, you think you\'re strong enough to help Hammerfall? So be it.$B$BTallow either sent you to that ogre mound in the hopes that you would kill yourself or he thinks you\'re strong enough to aid us. Either way, you\'re here now and I am in need of more soldiers in our fight against the constant attacks.$B$BIf you plan on staying in Hammerfall then get some rest, and come speak to me again when you\'re ready. There\'s no shortage of fighting to be had.' WHERE `entry`=676;
UPDATE `quest_template` SET `OfferRewardEmote2`=11 WHERE `entry`=677;
UPDATE `quest_template` SET `OfferRewardText`='This globe... it is most disturbing.  Many of the more powerful elementals receive their power and energy through such devices.  To find one like this nearly intact is one thing - to find it so tainted is another.$B$BI will see that this globe is studied properly by the Earthen Ring.  Perhaps we can bring an end to this corruption of the elements.  Please - accept this as a fair exchange for bringing this globe to the attention of the Earthen Ring.' WHERE `entry`=824;
UPDATE `quest_template` SET `OfferRewardEmote1`=21, `OfferRewardText`='I see you are quite industrious, $c.$b$bNo doubt we shall soon have a fitting surprise for those dwarves.' WHERE `entry`=846;
UPDATE `quest_template` SET `OfferRewardText`='You have done well, $n! May you be revered in Thunder Bluff as a defender of sacred tauren lands and a champion of the lost tribe.' WHERE `entry`=849;
UPDATE `quest_template` SET `OfferRewardText`='I can\'t wait to show my friends! Now, just wait a moment while I attach these...$B$BPerfect!' WHERE `entry`=977;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='Very good.  This book will add nicely to my collections of the workings of Ur.  His knowledge was great, but his conscience held him from true power.  And so when the Scourge came and his strength was tested, it failed.$B$BWe of the Forsaken cannot afford such weakness, if we are to survive...$B$B...If we are to conquer.' WHERE `entry`=1013;
UPDATE `quest_template` SET `OfferRewardEmote1`=21, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardText`='Silverpine Forest is finally free from the vice of that wretch Arugal. You have done the Dark Lady a great service, $n. Your tenacity shall be rewarded.' WHERE `entry`=1014;
UPDATE `quest_template` SET `OfferRewardEmote1`=6, `OfferRewardEmote2`=1, `OfferRewardEmote3`=274, `OfferRewardText`='What makes you think I wish to be pestered by the likes of you, $c?  Wait - let me stop the important duties I attend to on a daily basis so I can help you locate a doodad somewhere.  By all means, the welfare of Darnassus - nay, all of Teldrassil - should come second to the acquisition of a bauble for your collection.$B$BThe fools in Moonglade waste my time with their call for assistance, and now I must endure this?' WHERE `entry`=1019;
UPDATE `quest_template` SET `OfferRewardEmote1`=5, `OfferRewardEmote2`=1, `OfferRewardEmote3`=2, `OfferRewardText`='The Compendium of the Fallen! I was beginning to wonder if the very book existed!$b$bYou have served the tauren of Thunder Bluff well, $n. Your dedication shall not be forgotten.' WHERE `entry`=1049;
UPDATE `quest_template` SET `OfferRewardEmote1`=18, `OfferRewardEmote2`=5, `OfferRewardEmote3`=18 WHERE `entry`=1051;
UPDATE `quest_template` SET `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='The destruction of the machines XT:4 and XT:9 have soothed many of the spirits of Stonetalon, $N.  With their loss, let us hope the Venture Company will remove itself from these mountains.$B$BFor if they do not, then I fear the atrocities this place has suffered will pale to what lies ahead.' WHERE `entry`=1068;
UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=1087;
UPDATE `quest_template` SET `OfferRewardEmote1`=11, `OfferRewardEmote2`=5, `OfferRewardEmoteDelay2`=3000, `OfferRewardText`='I knew Ordanus once, long ago. He had the arrogance of his kind, holding himself above even the Highborne.$b$bHis head does not rise so high now, does it, $n?$b$bI promised you a reward, and you shall have it. Attend to me.' WHERE `entry`=1088;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1095;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1096;
UPDATE `quest_template` SET `OfferRewardText`='Vincent\'s body lies broken, and still.$B$BAlthough Deathstalker Adamant will send his report to Hadrec... whatever additional details Vincent gained must remain with him.$B$BBut clutched in his hand is a small trinket...' WHERE `entry`=1098;
UPDATE `quest_template` SET `OfferRewardEmote1`=11, `OfferRewardText`='I see the nasty tribe of Razorfen Kraul now knows the pain of my people. Serves the foul beasts right.$b$bTo drive one from a holy land is a sin worthy of the most severe revenge.$b$bThank you, $n, for aiding me in my plight.' WHERE `entry`=1102;
UPDATE `quest_template` SET `OfferRewardEmote2`=5, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='All right!  This venom is going to work great!  Thanks, $N!$B$BNow I just need to boil it down, apply skipper-otomer, add a nega-catalyst, and... Drat!  Where are my notes!?' WHERE `entry`=1104;
UPDATE `quest_template` SET `OfferRewardEmote2`=5, `OfferRewardEmote3`=11, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='You got them!  Thanks, $N!$B$BWow, these shells are harder than I thought!  Heh, when I work with them I\'ll probably bend a whole box full of tools!' WHERE `entry`=1105;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Splendid! This is just the start we needed, $n.' WHERE `entry`=1109;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Whoa, look at all that!  There\'s some good stuff in that heap of junk.  I\'m sure I can pawn it off for a hefty sum.$B$BAnd... is that an ear I see squashed between those two sheets of metal??  Ouch!  Heh, I sure wouldn\'t want to be that pilot!$B$BThanks, $N.  Here\'s your pay.  And here\'s some advice, free of charge...$B$BIf you look hard enough, you can always find profit in someone else\'s tragedy.' WHERE `entry`=1110;
UPDATE `quest_template` SET `OfferRewardText`='Oh yes.  Parts for Kravel.  I\'m glad you\'re here.  These things have been sitting out here for days, and I was afraid they\'d rust!' WHERE `entry`=1111;
UPDATE `quest_template` SET `OfferRewardText`='Great, you got them!  Now we need to get them to the gnomes.  But first...$B$BLet\'s take out one small item...' WHERE `entry`=1112;
UPDATE `quest_template` SET `OfferRewardText`='My what an abundance of gore you have brought me, $n! Your efforts have been most excellent!' WHERE `entry`=1113;
UPDATE `quest_template` SET `OfferRewardText`='There they are!  My hydro ratchets and repeater bolts!  These will do just fine.  Thank you!' WHERE `entry`=1114;
UPDATE `quest_template` SET `OfferRewardText`='In defeating the creature Steelsnap, you have cleansed the Thousand Needles of a horrible taint.$B$BAnd that, $N, is your lesson this day.' WHERE `entry`=1131;
UPDATE `quest_template` SET `OfferRewardEmote2`=2, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='Both strength and cunning were needed to find and defeat Frostmaw, $N.  You have both.$B$BYour path has taken you to the valleys of Thousand Needles and to the high mountains of Alterac.  It will one day lead you through all the Earthmother\'s lands, for such is the way of the hunter.' WHERE `entry`=1136;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=9 WHERE `entry`=1145;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardEmote3`=1 WHERE `entry`=1146;
UPDATE `quest_template` SET `OfferRewardEmote3`=1, `OfferRewardEmote4`=2, `OfferRewardText`='Ha! That ichor you\'re covered in actually makes you prettier, $N! It certainly does make you reek at the same time though. Don\'t stand too close to the kodo; you\'ll either start a stampede or cause them to go into heat.$B$BI think my companions would agree that your smell alone is proof you\'ve done your part to help us against those insect creatures. Thank you, $N.\n' WHERE `entry`=1147;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardEmote3`=1 WHERE `entry`=1148;
UPDATE `quest_template` SET `OfferRewardText`='It is not until faced with unforeseen adversity that we begin to see how strong our spirits are. You took the leap of faith even though you had no guarantees that you would survive. Your mind is open, and your spirit is prepared for what is to come.$B$BIf you are willing, then the next of your tests is ready.' WHERE `entry`=1149;
UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1164;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1176;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1178;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1181;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1182;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='I was hoping that it would be already assembled, but this does present the unique opportunity to improve on the design from the ground up. Thanks, $n. I\'ll be able to sketch up some improved schematics, build the thing, and have it installed real soon.' WHERE `entry`=1183;
UPDATE `quest_template` SET `OfferRewardEmote1`=3, `OfferRewardText`='You\'re the $r that\'s been helping Pozzik out, right? I was like you once, running around the pit area, helping with whatever work the mechanics would let me do.$b$bNow look at me! The goblin racing team\'s pilot extraordinaire!' WHERE `entry`=1186;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1195;
UPDATE `quest_template` SET `OfferRewardText`='I sense a strange energy emanating from the Hoof... I have no doubt that we will discover surprising new information about the centaur from its study.$b$bMy thanks, $n. Now I must begin to decipher the mysteries you have brought to me.' WHERE `entry`=1197;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardText`='Great, you got them!  I can sell these to my contacts for a bundle!$B$BThanks for the delivery, $N!  You are a great partner. ' WHERE `entry`=1221;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Yes, I am recruiting.  This mission leads into Desolace, against the centaur there.  I will be brief so that you may quickly begin.' WHERE `entry`=1361;
UPDATE `quest_template` SET `OfferRewardText`='You are here on orders from Regthar?  Then you are here to deal with the centaur.  Good.$B$BI hope you\'re rested.  I don\'t know how our campaign against the centaur will end, but I know the struggle will be long.$B$BHave a seat, and listen.' WHERE `entry`=1362;
UPDATE `quest_template` SET `OfferRewardText`='Well done.  This swift act against the Kolkar is an effective show of strength, and strength is what the centaur understand best.$B$BThe death of the Kolkar leader will not only disrupt that clan, but give pause to the others.' WHERE `entry`=1365;
UPDATE `quest_template` SET `OfferRewardText`='By now, the centaur must know your name.  I\'m sure they know it, and respect it, and fear it.  And just as they know you, they know the banner under which you ride.$B$BThe banner of the Horde.' WHERE `entry`=1366;
UPDATE `quest_template` SET `OfferRewardText`='The earth speaks to me.  And it says you have killed many Magram.  This is good.$B$BIf you are a friend of the Gelkis, then listen.  I have more tasks for you.' WHERE `entry`=1368;
UPDATE `quest_template` SET `OfferRewardText`='Good.  I can hear the loud Magram bellies grumble from their village, far away!$B$BI will give this meat to the Gelkis.  And we will fight for many days without rest.$B$BWhat you did is good for the Gelkis, $N.' WHERE `entry`=1370;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardText`='Putanni, noble $c. I am Keldran, student of magic... and other mystical arts.$B$BThe business Craven sent you here to speak to me about requires a touch more subtlety than you\'ve previously needed, but that does not mean you can not still aid our cause.$B$BPlease, make yourself comfortable, and I shall tell you why the Warchief has need of my aid... and yours.$B$BIt starts with appearances, $N. How the Horde sees itself. How our allies see us. And most importantly, how our enemies see us.' WHERE `entry`=1431;
UPDATE `quest_template` SET `OfferRewardEmote3`=1, `OfferRewardText`='Greetings, $c. You bring news from Orgrimmar; that is good.$B$BThe demon infestation overwhelms this area even more than the smell of centaur dung. The horse-men claim this land as their own, but clearly there are influences out of their control that will crush them if not kept in check.$B$BIt does not please me that we aid the centaur indirectly, but it is for the good of the Horde, so I do my duty for the Warchief, even if it means helping the warlocks within the Horde.' WHERE `entry`=1432;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardText`='Ah, yes. Aid from those loyal to the Warchief is always appreciated.$B$BMy name is Maurin. I am here at the behest of Keldran and the Warchief cub Thrall. It is my desire to aid the youngling leader against the evils that threaten his rule.$B$BCome, come closer, $c. I shall explain to you my plan for removing the festering boil that is the Burning Blade.' WHERE `entry`=1433;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardText`='Ah, you\'ve returned successful. That is good. Give me the gems and I shall put them someplace safe....$B$BMy tasks for you are complete, $c. Speak to Takata when you are rested. He may have other tasks for you, or perhaps needs you to return to Orgrimmar to inform Keldran of our progress here in Desolace.' WHERE `entry`=1435;
UPDATE `quest_template` SET `OfferRewardEmote3`=2, `OfferRewardText`='You have returned from Desolace more than successful, $N. Thank you.$B$BThank you for your efforts, your time, and your understanding to my plea. Thrall understands and desires peace between the Horde and Alliance, and by taking measures to insure our appearance is acceptable, we will not provoke any further threats of unnecessary violence.$B$BI am indebted to you.' WHERE `entry`=1436;
UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1480;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardEmote3`=1 WHERE `entry`=1481;
UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1482;
UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1484;
UPDATE `quest_template` SET `OfferRewardText`='So he couldn\'t find his way back on his own? Figures.$b$bWell, I guess you deserve something for your troubles....' WHERE `entry`=1560;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Hello, warrior.  It\'s good to see you made it to Fray Island.  I hope you find it to your liking...' WHERE `entry`=1718;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardText`='Well done, $N.  You have passed The Affray!$B$BYou are a worthy warrior, and I am honored to teach you...' WHERE `entry`=1719;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='You have traveled far, young warrior.  I see fire in your eyes.  You seek a weapon of great power, yes?$B$BI can help you with your quest.  And you can help me with mine.' WHERE `entry`=1791;
UPDATE `quest_template` SET `OfferRewardEmote2`=5, `OfferRewardText`='You find a nasty ball of water and decide to bring it to me?  Who am I, the Earthen Ring or something?$B$BActually, that does give me an idea... perhaps you do need the Earthen Ring for this.  I mean, if it helps clear up the situation at the lake for good, then I\'m all for it.$B$BYou know who the Earthen Ring are, $N?' WHERE `entry`=1918;
UPDATE `quest_template` SET `OfferRewardEmote1`=5, `OfferRewardText`='How do you feel, $N? You radiate with the aura of the snickerfang--your strength, unmatched by mortals!$B$BUnfortunately, with the components you brought to me, I could only make enough of the assay for one tablet. I will require more components, should you require another tablet.' WHERE `entry`=2581;
UPDATE `quest_template` SET `OfferRewardEmote1`=5, `OfferRewardText`='The spirit of the boar illuminates your being, $N! I wonder, do you believe yourself to be as invulnerable as these beasts?\n' WHERE `entry`=2583;
UPDATE `quest_template` SET `OfferRewardText`='Fascinating. This has been the most difficult of all assays to analyze.$B$BTake a pinch of this residual salt and place it under your tongue. You should experience a slight feeling of euphoria followed by a state of unprecedented agility and quickness.' WHERE `entry`=2585;
UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=2601;
UPDATE `quest_template` SET `OfferRewardEmote1`=5, `OfferRewardEmote4`=1 WHERE `entry`=2603;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardText`='Oh, YOU\'RE the great savior of OOX-22/FE!  I cannot even begin to express my thanks for your assistance!  My homing robot series needs more development, but your recovery has saved me countless hours of extra rebuilding time, as well as many gold pieces in manufacture costs!$B$BPlease, take your choice of any of these items I have.  Thank you again for your generous assistance $n, my robots and I are in your debt!' WHERE `entry`=2767;
UPDATE `quest_template` SET `OfferRewardEmoteDelay1`=100 WHERE `entry`=2943;
UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=2944;
UPDATE `quest_template` SET `OfferRewardText`='As you touch the pedestal, the miniature discs from Uldaman hum and glow in your backpack.  A familiar feeling tingle washes over your hands, as the image of another Stone Watcher springs to life in front of the gates of Uldum.$B$B\"Salutations.  I am a guardian of entry.  The discs that have been used for access are missing the correct entry discs, the Plates of Uldum.  Please incorporate these plates with the disc structure and repeat your access sequencing.  Thank you.\"' WHERE `entry`=2946;
UPDATE `quest_template` SET `OfferRewardEmote1`=6, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=2000, `OfferRewardText`='The stone watcher\'s voice resonates with power and authority:$B$B\"Your discs will be returned to you once you access the pedestal.  When you have obtained the Plates of Uldum and incorporated them into your existing disc set, you may then enter the complex.\"' WHERE `entry`=2954;
UPDATE `quest_template` SET `OfferRewardText`='We\'re all in agreement then - the best plan of attack is putting this on hold until we can narrow down the areas where these plates might lie hidden.  You\'ve brought us this far $n, and I hope you will be the one to head back in to the field to unlock Uldum for us all!$B$BAllow me to give you this honorarium in the meantime; this should cover any expenses you\'ve encountered in assisting us, and a little something extra.  Be sure to check back with us soon... Uldum beckons!' WHERE `entry`=2964;
UPDATE `quest_template` SET `OfferRewardText`='They\'re that big? I might have to rethink my plan...$B$BBut you did hold up your end of the bargain, so here\'s what I promised.' WHERE `entry`=3362;
UPDATE `quest_template` SET `OfferRewardText`='Yes... This is the stone.$B$BIt\'s all coming back to me now, $N...' WHERE `entry`=3444;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=3449;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=1 WHERE `entry`=3461;
UPDATE `quest_template` SET `OfferRewardText`='Haha! You got them good, didn\'t you?!$B$BThis is great! That\'ll teach those Blood elves to betray their partners... especially someone as loyal as a goblin merchant! Bah, Blood elves...!$B$BWell, the least I can do for you is pay you for your time... just like I said I would.$B$BHere you go... those should be useful.' WHERE `entry`=3601;
UPDATE `quest_template` SET `OfferRewardEmote1`=0 WHERE `entry`=3661;
UPDATE `quest_template` SET `OfferRewardEmote1`=5, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1 WHERE `entry`=3701;
UPDATE `quest_template` SET `OfferRewardText`='Unload your precious cargo here, noble $c.  It must have been quite the burden... not unlike the burden I carry being a visionary.  Here is an honorarium for your work, as dictated by the Arch Druid himself.$B$BArch Druid Staghelm wants to speak with you again $N, but for his next task you will be aided if you have a journeyman\'s understanding of Herbalism.  If you don\'t know it though, you will still be able to aid the Circle!' WHERE `entry`=3764;
UPDATE `quest_template` SET `OfferRewardText`='Yes, this voucher is good for twenty packets of seeds.  If you run out, we have more that can be provided.  Unfortunately though, Tharlendris seeds are quite costly to produce in significant numbers.  This is why the Cenarion Circle asks that those who are assisting us help out by offsetting some of the cost.$B$BThose who return with morrowgrain find that the reward the Arch Druid offers far makes up for the cost.' WHERE `entry`=3781;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=11, `OfferRewardEmote4`=11 WHERE `entry`=3824;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardEmote4`=1, `OfferRewardText`='Outstanding work, soldier! Simply amazing! Oh I\'ll get the medal of bravery for this, er, I mean you\'ll be rewarded handsomely for this!\n' WHERE `entry`=3825;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3845;
UPDATE `quest_template` SET `OfferRewardText`='You got both our foodstuff AND our research equipment back!  You\'ve not only saved the expedition, you\'ve also saved our lives.  I and the rest of my team can\'t thank you enough; we just might make it here for a while now thanks to you.$B$BWhile we don\'t have much, I\'m certainly not going to leave you high and dry for the invaluable help you\'ve given us.  Thank you, $N - you\'ve got a friend in Marshal Expeditions!\n' WHERE `entry`=3881;
UPDATE `quest_template` SET `OfferRewardEmote2`=0, `OfferRewardEmote3`=0, `OfferRewardEmoteDelay2`=0, `OfferRewardEmoteDelay3`=0 WHERE `entry`=3882;
UPDATE `quest_template` SET `OfferRewardText`='Yes, this will do nicely.  You\'ve been a great help... I wish I could give you more than this, but being virtually stranded in the middle of a savage land does limit what I can and cannot give.  Rest assured though - the research done here would not have been possible without your assistance!' WHERE `entry`=3883;
UPDATE `quest_template` SET `OfferRewardText`='This blood amber will be used to find a means of defeating the corruption present in Felwood.  You\'ve proven to me that you\'re willing to do whatever it takes for the Cenarion Circle.  I trust you now, friend.$B$BIt might seem odd that killing the elementals proved yourself to me, but the end of saving countless sentient beings must justify the means we take.  You and I can now focus on the preservation of life through the salves I can make.$B$B$N, the time has come to cleanse Felwood.' WHERE `entry`=4101;
UPDATE `quest_template` SET `OfferRewardText`='Very well then, here are your Cenarion plant salves.  Scour Felwood for corrupted plants, $N!  Wherever they are, use the salve I have given you to purify them. ' WHERE `entry`=4103;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=4182;
UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=4184;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=4185;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=18, `OfferRewardText`='It could have been worse, I suppose...$B$B<Magistrate Solomon looks you over.>$B$BIt appears as if the fate of Lakeshire rests squarely on your shoulders.$B$B<You notice Magistrate Solomon blinking rapidly. He appears to be crying.>\n' WHERE `entry`=4186;
UPDATE `quest_template` SET `OfferRewardEmote1`=5, `OfferRewardEmote2`=1 WHERE `entry`=4224;
UPDATE `quest_template` SET `OfferRewardEmote1`=5, `OfferRewardEmote2`=5 WHERE `entry`=4241;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1 WHERE `entry`=4242;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardEmote2`=0, `OfferRewardEmote3`=0, `OfferRewardText`='Oh, you\'ve done it! Wonderful! Thank you, $N.$B$BOh, my poor, A-Me. Look at all those dents. We\'ll get her up and running perfectly with just a little work.$B$BThank you again, $N. I really appreciate it.' WHERE `entry`=4245;
UPDATE `quest_template` SET `OfferRewardEmote3`=0 WHERE `entry`=4267;
UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=4282;
UPDATE `quest_template` SET `OfferRewardEmote1`=5, `OfferRewardEmote2`=5 WHERE `entry`=4283;
UPDATE `quest_template` SET `OfferRewardEmote1`=5, `OfferRewardEmote2`=1, `OfferRewardEmote3`=5, `OfferRewardEmote4`=15 WHERE `entry`=4286;
UPDATE `quest_template` SET `OfferRewardText`='This will do nicely, $N. It seems Lar\'korwi eats well these days. Although, I wonder where he found a threshadon in this area. Odd.$B$BRegardless, I will hold onto this until you are ready for your confrontation with the beast. Do not worry for my safety--I am sure you\'ve angered Lar\'korwi enough that he will not kill me until after he\'s tasted your flesh.' WHERE `entry`=4290;
UPDATE `quest_template` SET `OfferRewardText`='The Earth Mother be praised! You\'ve done it! Fair play to you, $N. You have proven to be a great hunter in your own right. Your spirit is strong. Your bravery unmatched. And your strength has been fortified. I bow down to your skills.$B$BOnly the greatest of my ancestors could have accomplished something so incredible. Congratulations.' WHERE `entry`=4292;
UPDATE `quest_template` SET `OfferRewardText`='Ah, you found the tablet!  And your transcription is superb!  Are you sure you\'re a $c and not a scribe?$B$BHere you are, $N.  Here is the payment I promised.' WHERE `entry`=4296;
UPDATE `quest_template` SET `OfferRewardText`='Well done, $N. I am pleased. You have done a great thing here today.$B$BU\'cha was one of the greatest apes I had ever seen. The fact that you have bested his strength speaks well of your own strength... and courage.$B$BIt is only fitting that I give you this as a sign of respect. You have earned it.' WHERE `entry`=4301;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=5, `OfferRewardText`='Amazing, $N. Simply amazing. Windsor stormed through here not five minutes ago. He makes some grand claims but purports that they are supported by his evidence. He is on his way to Stormwind now to confront Bolvar and ... Lady Prestor.\n' WHERE `entry`=4322;
UPDATE `quest_template` SET `OfferRewardText`='You apply two Cenarion plant salves to the windblossom.  It immediately begins to shed its corrupted form, blossoming into a vibrant and healthy plant.' WHERE `entry`=4466;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmoteDelay1`=0, `OfferRewardText`='Ringo\'s not in the best shape, $N, but I am glad to have him back in one piece!$B$BThank you for finding him.' WHERE `entry`=4491;
UPDATE `quest_template` SET `OfferRewardText`='Yes, I gathered that Gracina sent you to me.  Your experience in fighting these beasties is priceless; no one to my knowledge has ever dealt with their kind before.  As for Gracina\'s idea that Un\'Goro Crater is their heart... perhaps it is.  Un\'Goro is a mysterious and dangerous jungle to the west of here.  Perhaps it is also one step closer to figuring out what the silithid are all about.' WHERE `entry`=4493;
UPDATE `quest_template` SET `OfferRewardText`='The scent gland, ah yes.  The membrane appears intact - excellent.  The soil, yes, this should work out perfectly.  With my special additions, I should be able to grind all this up into the perfect lure.$B$BGive me a moment to make the lure, $N.  Once it\'s ready, we\'ll be able to enact the next step that may hopefully stop the silithid before they overrun Gadgetzan... and the rest of Kalimdor.' WHERE `entry`=4496;
UPDATE `quest_template` SET `OfferRewardEmote2`=0 WHERE `entry`=4503;
UPDATE `quest_template` SET `OfferRewardEmote1`=15, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay1`=1000, `OfferRewardEmoteDelay2`=3000, `OfferRewardText`='More bad news! These centaurs have gone too far! They raided one of my supply caravans and slaughtered the whole party. This is an outrage, and it will not go unpunished!\n' WHERE `entry`=4542;
UPDATE `quest_template` SET `OfferRewardText`='It worked!  You got the essence!  Well done, $N!  Well done!$B$BThis essence will be invaluable in my research.  I hope to one day learn how to capture living dragons whelps, or perhaps capture their eggs.  If I could find a way to do that, then I would be the envy of dragon scholars around the world!$B$BMy employer would also be happy, and as I said before, he\'s someone you want to keep happy...' WHERE `entry`=4726;
UPDATE `quest_template` SET `OfferRewardEmote1`=5, `OfferRewardEmote2`=1 WHERE `entry`=4767;
UPDATE `quest_template` SET `OfferRewardEmote1`=5, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardText`='What!? If I knew that Pao\'ka Swiftmountain was going to snoop around Highperch, I would have chained him to a totem! His father was reluctant allowing him to come with me to Thousand Needles. We came here to study the different creatures that inhabit these beautiful lands.$B$BI appreciate the help you have shown Pao\'ka. I hope this covers any misfortunes this deed has cost you.' WHERE `entry`=4770;
UPDATE `quest_template` SET `OfferRewardText`='Yes, finally... the mysterious egg has finally been delivered to me. Now, let me take a closer look at this... What..! What is this..?\n' WHERE `entry`=4821;
UPDATE `quest_template` SET `OfferRewardText`='For my gratitude, this is for you, $n.' WHERE `entry`=4841;
UPDATE `quest_template` SET `OfferRewardText`='Yes, the demons there in Darkwhisper Gorge; I believe it is their presence that is affecting the land in this way. I am going to continue observing the hot springs here and see if I learn anything more.$B$BI\'d wait until you are a bit stronger if you have plans of heading farther into Darkwhisper Gorge.' WHERE `entry`=4842;
UPDATE `quest_template` SET `OfferRewardText`='Well, I expected to hear as much, $Glad:lass;. I figured that the crazed beasts destroyed all of my belongings...$B$BBut you did find my tools, and most importantly, the amulet! I wonder why the wildkin so fiercely defended this item... In any case, I\'ll think twice before heading their way again!' WHERE `entry`=4864;
UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4865;
UPDATE `quest_template` SET `OfferRewardEmoteDelay1`=1000, `OfferRewardText`='They come to kill me?  I will show them how a Tauren fights!' WHERE `entry`=4881;
UPDATE `quest_template` SET `OfferRewardText`='Thank you for your help, $n. I couldn\'t have held them off without you.' WHERE `entry`=4966;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='Time feels easier to mend now, thank you $N.  While you might not understand fully the consequences of a fractured timeline, I appreciate that you understand the urgency of countering what I suspect more and more to be a Scourge-driven malfeasance.$B$BI see no harm in rewarding you for your assistance, mortal.  Your greatest feats are to come, and the awarding of a bauble will certainly not alter your future destiny.  Your continued aid, however, is something that I and the dragonflight could use...' WHERE `entry`=4971;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardText`='These are exactly what I need, $N.  Thank you.$B$BAllow me to suitably reward you with this.  You may not understand what you would need with such a device.  You might not even know quite what it really is.  Alas, I cannot tell you when you will find it most useful; just know that at some point in the future, you may find this item to have extreme utility and function when consumed.  Whether or not you choose to hold on to it until then... this, my friend, is up to you.' WHERE `entry`=4972;
UPDATE `quest_template` SET `OfferRewardText`='I... I sense that the souls of those wolves you have put down now have rest.  They - and I - thank you for a merciful release.$B$BThe wolves are not alone in their suffering within this damnable place, $N.  Please, I have need of you once more.' WHERE `entry`=4984;
UPDATE `quest_template` SET `OfferRewardText`='\"I know that the grizzles have been put down, their torment at an end.  I... I have one more thing for you.  I wrote it down on... on this branch, sensing that my time in this realm had come to an end.$B$BIndeed... I am at that end.  Thank you again friend... the creatures of this accursed land may rest... and now shall I.\"$B$BWith that, a heavy sigh is uttered by the druid, followed by what sounds like a death rattle.  His body lies motionless on the cottage floor.' WHERE `entry`=4985;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='This... this is quite strange.  This druid - this tauren druid no less - entrusted you with a great deal of valuable information on the extent of the Scourge\'s plague.  I am surprised a tauren would give a $r such information, and freely at that if what you say is true.  We will make good use of this, I promise you.  Perhaps the tauren have not fallen as far from Cenarius as Fandral would believe...$B$BErm, anyway, please - accept this as a token of thanks from the Cenarion Circle.' WHERE `entry`=4986;
UPDATE `quest_template` SET `OfferRewardText`='A package in the barn that you might have otherwise overlooked now stands out amongst the decay and ruin.  Perhaps this is the one that the ghost of Janice Felstone was clamoring about...' WHERE `entry`=5021;
UPDATE `quest_template` SET `OfferRewardEmote1`=6, `OfferRewardText`='A package for an Emma Felstone, you say?  Last known address was Stormwind, four years ago?  Well let me see here...$B$BAccording to what we know, there was an Emma Felstone in the city about four years ago.  Well, I should say possibly - this census I refer to is from five years ago, and I don\'t have a report of her vacating the city.  This doesn\'t mean that she is still here though.$B$BWait a second... this package couldn\'t be for Ol\' Emma, could it?' WHERE `entry`=5022;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='My name is indeed Emma Felstone - you\'re the first person in years to call me that.  Who... who are you?$B$BYou say you knew... my sister?!  Is she still alive?  Who am I kidding, of course she isn\'t.  When the plague broke out in Lordaeron, I had come to expect the worst.  So many of my family died... or worse.  Here I am now, crazy Ol\' Emma, all alone.  What are you, a grave-robber or something?  Looking for your next target?$B$BWhat... you have a package for me from my sister?' WHERE `entry`=5048;
UPDATE `quest_template` SET `OfferRewardText`='You give the half-charm back to the apparition.  She looks at it, then at you expectantly.$B$B\"Honey, where did you put your half of the charm?  We can\'t be together unless we have both halves.  Honey... can you see me?\"' WHERE `entry`=5050;
UPDATE `quest_template` SET `OfferRewardText`='You hand the reassembled good luck charm to Janice Felstone\'s ghost.  As soon as she grasps it, you observe an almost immediate change in her.  Her ethereal form shimmers, and she looks upon you with clear yet sad eyes.$B$B\"You\'ve freed me... I no longer will need this charm.  Please, take it and perhaps it will give you the solace it has given me.\"' WHERE `entry`=5051;
UPDATE `quest_template` SET `OfferRewardText`='Using the key found on the skeleton of the former Mrs. Dalson, you unlock the door to the outhouse.  A bloodthirsty ghoul leaps from the outhouse, having been trapped inside for who knows how long.$B$BIt is clear by the bloodcurdling scream of the ghoul at your presence that the former Farmer Dalson is now beyond saving.' WHERE `entry`=5059;
UPDATE `quest_template` SET `OfferRewardText`='The key taken from Farmer Dalson\'s ghoulish remains fits the lock perfectly.  The doors of the cabinet swing open, revealing several items that remain intact and appear quite valuable.' WHERE `entry`=5060;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Good, you have gathered the essential amount of Incendia agave. This rare herb found only in Thousand Needles will help light the dormant sacred fire of life.$B$B<Magatha begins to enchant the Incendia agave.>' WHERE `entry`=5062;
UPDATE `quest_template` SET `OfferRewardText`='Great Spirit Totem! This is dire news indeed. I must begin to plan for whatever may come.$b$b$N, as promised, here is your reward for your brave service.\n' WHERE `entry`=5064;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Thanks so much, $N! Now I can get back to work here.$B$BDid you find anything of interest at the Winterfall camp?' WHERE `entry`=5082;
UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=5083;
UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=5085;
UPDATE `quest_template` SET `OfferRewardText`='<Donova examines the contents of the crate.>$B$BI wonder if consuming this substance makes the furbolg more aggressive. They do seem much larger...' WHERE `entry`=5087;
UPDATE `quest_template` SET `OfferRewardEmoteDelay2`=0, `OfferRewardText`='This does not make sense. Why would Arikara be after Cairne Bloodhoof? Magatha could not be wrong, she is our most powerful shaman.$B$B<Motega shakes his head.>$B$BRegardless, your great deed to the Horde shall not go unnoticed - please, choose one of these as a reward for your aid.' WHERE `entry`=5088;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardText`='My priests are reporting that our beacon trackers are picking up extremely strong signals on all four towers!  Dare I say it, but I believe you\'ve executed another mission with complete and total success!  Well played once again, $N!$B$BWith the towers marked, our preparations for the attack are now in place.  The time has come to take the fight to the Scourge!' WHERE `entry`=5097;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardText`='Hah! Well, this is excellent news! I was starting to think that he would never be brought to justice!$B$BHere you are, $N... and thanks. News of Arnak\'s foul deeds boiled my blood!' WHERE `entry`=5147;
UPDATE `quest_template` SET `OfferRewardText`='You found it!  You found my doll!  Oh, thank you!' WHERE `entry`=5149;
UPDATE `quest_template` SET `OfferRewardEmote2`=18, `OfferRewardEmote3`=1, `OfferRewardText`='You saw Pamela?  How is she?  Is she alive??  Oh, no!  Poor Pamela!  She was so young, and such a happy child...$B$BShe doesn\'t know what happened to her father, does she?  My brother, Joseph?$B$BNo... she couldn\'t understand what happened to Joseph.  And even if she could, I don\'t have the heart to tell her...' WHERE `entry`=5152;
UPDATE `quest_template` SET `OfferRewardText`='What is this?  A wedding ring?  Let me see...$B$BAh!  This ring was once on the hand of a great man, but there is much tragedy in that man\'s past.$B$BAre you here to help him?  It\'s far too late for him now... but perhaps we can help him in the past!' WHERE `entry`=5153;
UPDATE `quest_template` SET `OfferRewardEmote1`=6, `OfferRewardEmote2`=5, `OfferRewardText`='Well done, you found it!$B$BDid you read it?  Is Joseph Redpath mentioned?  If he is, then perhaps we can save him!$B$BAh.  The Annals of Darrowshire tell a very unsettling tale.  It says that during the battle, Joseph Redpath was corrupted and joined the ranks of the Scourge!  He then betrayed the defenders of Darrowshire.$B$BThat is an ill fate.  If we can, we should try to change that fate, don\'t you think?' WHERE `entry`=5154;
UPDATE `quest_template` SET `OfferRewardText`='Good, $N! With their numbers weakening, we can further press them.$B$BHow was your first taste of their power? Were they as strong as you thought they would be? Stronger? Or perhaps they were no challenge for you at all. Wouldn\'t that be something?$B$BWe can discuss the details of your exploits later. There are other things we must focus on now.' WHERE `entry`=5155;
UPDATE `quest_template` SET `OfferRewardText`='Good that you\'re alive, $N. Bad that the water still exists. I was hoping to find at least one pure source of water here in Felwood. It looks like my search has failed. The process of healing the land could have been made much easier with its existence.$B$BI will have to concern myself with saving what forest creatures I can while destroying those that have become so corrupt that they endanger themselves as much as travelers through this once-mighty forest.' WHERE `entry`=5156;
UPDATE `quest_template` SET `OfferRewardText`='This will do nicely, $N.$B$BNow all we have to do besides apply the waters to the braziers is to have it purified. That should not be difficult--it should only require a little travel.$B$BHopefully we can do this quickly.' WHERE `entry`=5157;
UPDATE `quest_template` SET `OfferRewardText`='Ah, you need the water from this Moon Well cleansed. Stopping this force of malice in Felwood seems noble enough, but it is not for me to decide if the water will be purified. I will ask the spirits of water--it will be up to them to decide if the cause is just.$B$BGive me a moment and I will tell them of your plea. I hope they are as sympathetic as I am to your cause.' WHERE `entry`=5158;
UPDATE `quest_template` SET `OfferRewardText`='This should be more than enough water for our purposes.$B$BI\'m glad to hear that Islen was able to help us. Her strength with the water spirits has always been a strong one. She is also wise, and rare is it that the spirits do not agree with her purpose. The fact that both of them have blessed our task gives me hope that we are on the right path.' WHERE `entry`=5159;
UPDATE `quest_template` SET `OfferRewardText`='I was able to see you with my spells as soon as the last brazier\'s flames died. Well done, $N.$B$BI learned a few things before the Shadow Council\'s warlocks were able to recast their spells. Hopefully it will be enough.$B$BFor now, rest. I will tell you what I\'ve learned in a moment.' WHERE `entry`=5165;
UPDATE `quest_template` SET `OfferRewardEmote1`=0 WHERE `entry`=5202;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=0, `OfferRewardEmote3`=0, `OfferRewardText`='You were the one who helped Arko escape? I\'m so glad you found me. She passed by here not too long ago on her way to Darnassus. She had Lightforge in tow and wouldn\'t even take time to speak to the druids to be healed. She said it was far too urgent.$B$BBut she did tell me about your encounter with Trey\'s spirit. What a terrible fate for a Knight of the Silver Hand. She didn\'t show it, but I know it\'s tearing her up inside, the thought of losing one of her closest friends.' WHERE `entry`=5203;
UPDATE `quest_template` SET `OfferRewardEmote1`=6, `OfferRewardEmote2`=1, `OfferRewardEmote3`=5, `OfferRewardText`='What is this book?  The Annals of Darrowshire?  That was my home before the war... my home before the battle that destroyed it!  Why did you bring me this book?$B$BBut look here!  At the end there are pages that tell tales of the days beyond the battle!  Here is a passage about me!  And one about my brother Joseph!  Is this book true?$B$BWe must discover the truth!' WHERE `entry`=5210;
UPDATE `quest_template` SET `OfferRewardText`='It is good to hear you found the tortured souls of my brethren and freed them.  My heart will weep less, knowing at least some of the defenders of Darrowshire no longer wallow in the vile subservience of the Scourge.' WHERE `entry`=5211;
UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5212;
UPDATE `quest_template` SET `OfferRewardText`='Astonishing! This will take months to dissect and analyze. The Argent Dawn thanks you for your efforts, $N.$B$BWith our blessing, take your pick between either this Seal of the Dawn or this Rune of the Dawn.  You can use either of them instead of a standard Argent Dawn Commission to collect scourgestones on our behalf.  Should you lose yours, speak with me and I\'ll get you a replacement.' WHERE `entry`=5213;
UPDATE `quest_template` SET `OfferRewardText`='The macabre key found on the cauldron lord easily slides into a keyhole and then disappears, allowing you permanent access to it.  Crude, viscous ichors pulsate through twisted tubes within the cauldrons underpinnings.$B$BThere is a small spigot that the bottle fits well enough under, allowing you to draw a sample for High Priestess MacDonnell back at Chillwind Point.' WHERE `entry`=5219;
UPDATE `quest_template` SET `OfferRewardEmote1`=21, `OfferRewardText`='Ah, there is plenty in here for study.  Well done, $N!$B$BFor now, the next step is in our hands.  We\'ll need to produce a list of reagents that, when combined with what is already in the cauldron, will act as its counter.$B$BThe only way we will be able to introduce this is by placing the reagents into the cauldron directly.  Alchemist Arbington will have more information on that, so be sure to speak with him at your earliest convenience.' WHERE `entry`=5220;
UPDATE `quest_template` SET `OfferRewardText`='The cauldron lord\'s key unlocks the access panel to this cauldron and then disappears, much like the other keys have for the previous two cauldrons you\'ve dealt of.  A putrid smelling substance churns violently beneath the platform of the cauldron.$B$BThere is a small spigot that the bottle fits well enough under, allowing you to draw a sample for High Priestess MacDonnell back at Chillwind Point.' WHERE `entry`=5222;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardText`='Another finely executed mission, $N!  This makes three cauldrons available to us to turn against the Scourge.  If Kel\'Thuzad\'s necromantic dominance over these lands wasn\'t as strong as it currently is, I\'d dare say you\'d shut them down completely!$B$BAlchemist Arbington will have a report on what this cauldron - as well as the other cauldrons subverted - will require to deliver our counter agent to the plague.  With that, the time has come to bring the last cauldron of the west under our influence!' WHERE `entry`=5223;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardText`='Congratulations $N, you\'ve unlocked the last cauldron for us!  Alchemist Arbington will soon know what this cauldron requires as far as reagents needed for the mix.$B$BAs for you, I am sure that Commander Valorfist will want to thank you personally for the assistance you\'ve given us.  Without you, our struggle against the Scourge would have been nearly insurmountable.  Thank you, hero!' WHERE `entry`=5226;
UPDATE `quest_template` SET `OfferRewardEmote1`=66, `OfferRewardText`='$N, your successful re-engineering of the cauldrons is a tremendous victory for us!$B$B<The commander clears his throat and begins to bellow loudly.>$B$BLet all within my presence hear: for service to the Kingdom of Stormwind and to the Alliance above and beyond the call of duty - in the face of overwhelming odds and incredible danger, might I add - I give $N this, and I extend upon $g him : her; our undying gratitude as a true hero of the Alliance.  Cheers, I say!' WHERE `entry`=5237;
UPDATE `quest_template` SET `OfferRewardText`='You\'ve seen Pamela?  She\'s alive?$B$BShe\'s dead?  No!  Oh, Pamela!  Why does your spirit still suffer in this world.  Why are you perished, while fortune keeps me alive?  In an instant I would switch places with you and wander dead Darrowshire, a ghost and alone!$B$BAh, but this news cannot change fate.  Thank you, $N.  Now my duty, my duty to revenge, burns hot as ever.  ' WHERE `entry`=5241;
UPDATE `quest_template` SET `OfferRewardText`='Earthmother be praised, $N! Thank you! This is a great day, indeed!$B$BThe Shadow Council will be hard pressed to scale to the same levels of power they once held with this blow to their hierarchy. You have done a great thing this day!' WHERE `entry`=5242;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5249;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='I know not what connection you have with my brother but it would seem he has trust with you, $C.$B$BI am Nataka Longhorn and would like to welcome you to Ghost Walker Post, we have many needs of a $C! Talk with others, perhaps there is need of you here.' WHERE `entry`=5361;
UPDATE `quest_template` SET `OfferRewardText`='Ah, the Demon Box. Give it to me, $c, and I shall open... and thus reveal to you the Hand of Iruxos.\n' WHERE `entry`=5381;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5386;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardText`='Congratulations, $N - I am pleased to award you with an Argent Dawn valor token!$B$BThe tokens serve two purposes.  One - they can be used to further your standing within the Argent Dawn; to do so may avail you options and rewards that are reserved for our honored and revered allies.  Two - they can be given to our quartermasters, along with coin, as payment for some of the Dawn\'s more prized items.$B$BWhatever you decide, know that you are earning your commission.  Well done!' WHERE `entry`=5402;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=5501;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Well met, $c.  I\'ve dedicated a fair portion of my recent studies to the Scholomance, and I believe I know a means by which you can acquire a key... one that will let you past the front door.$B$BI can only imagine what horrid sights are to be seen inside, $N.  I don\'t know how you heroic types do it sometimes...' WHERE `entry`=5533;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardText`='Haha! Wonderful!$B$BI\'ll be sure to find out what this is for and why Magus Rimtori--she\'s the cow that hired me--wanted it. Hah! I got you now, stinkin\' Blood elves! Kim\'jael! Ha! I\'ll teach them who the rats are!$B$BYa did good, $N. Thanks a bundle. Here, take this coin and be off with ya--I\'ve got some things to figure out.' WHERE `entry`=5534;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5537;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=5 WHERE `entry`=5542;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardEmote4`=5, `OfferRewardText`='You are a shining example of decency, $r! It has been long since I have felt the blood of heroes pump through my veins. Your acts of bravery are uplifting!' WHERE `entry`=5543;
UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5544;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='<Smeed Scrabblescrew begins counting.>$B$BThree, four, and five... excellent, I ask for five tamed kodos and I get five tamed kodos... I am going to be rich... yes, very rich! I hope to see the look on Bibbly\'s green face when he hears about my success!' WHERE `entry`=5561;
UPDATE `quest_template` SET `OfferRewardText`='Where is my sister Jessica?  She left so long ago, when I was just a little girl.  She cried so much when she went away.  I don\'t know why she cried!  Maybe she fell and hit her toe.$B$BWhen Jessica was here we used to play games and dance and pick pretty flowers around the house.  And sometimes we\'d hide when we saw daddy coming home, then jump out and surprise him!$B$BCome back, Jessica!  If you come back then maybe daddy will too and we can all play together again...' WHERE `entry`=5601;
UPDATE `quest_template` SET `OfferRewardText`='The elusive Sceptre of Light!  Your acquisition of it has removed a grave threat to the world.  Well done, $c, well done.\n' WHERE `entry`=5741;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Ah, this horn belongs to a Tauren, Roon Wildmane.  He and I had a good time hunting the beasts of Desolace.  So Roon is inviting me back, is he?$B$BWe\'re neck deep in the jungle right now, but thank you, $N.  Perhaps my next expedition will take me back to Desolace, the land of the centaurs.' WHERE `entry`=5763;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='<Tirion blinks to hold back tears.>$B$BIt was destiny that we meet, $N. You have blessed me with your kindness.\n' WHERE `entry`=5781;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardText`='It is as glorious now - even in its tattered state - as the day I looked upon it and took my oath of allegiance.$B$BHis redemption comes and perhaps mine with it...' WHERE `entry`=5845;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardEmote4`=1, `OfferRewardText`='How could I forget? Many of the spirits on this island are cursed to relive their last happy memory before they met their tragic end.$B$BI too am cursed, but not as they - I am one of the few that remembers all...$B$BPerhaps this thing that you ask me is why I haunt these ruins. Perhaps this thing I tell you shall set me free.' WHERE `entry`=5846;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=4 WHERE `entry`=5881;
UPDATE `quest_template` SET `OfferRewardText`='Very well then, here are your Cenarion plant salves.  Scour Felwood for corrupted plants, $N!  Wherever they are, use the salve I have given you to purify them. ' WHERE `entry`=5882;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=6, `OfferRewardText`='These will do nicely, $N. Thank you. Just look at them... so many of them all huddled up. I almost feel bad for the Crusade, but then again, it was never their mill to take, now, was it?' WHERE `entry`=5903;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardText`='Well done, $N. I\'m amazed you dealt with them so quickly. Thank you.$B$BI have yet to meet anyone that approves of the Scarlet Crusade and their methods. I believe in the Light as much as anyone else in Stormwind, but they\'ve demonstrated that they only want to kill anyone not loyal to their movement... even innocents.' WHERE `entry`=6004;
UPDATE `quest_template` SET `OfferRewardText`='Great, you got him!  And I hope you taught his gang a lesson too!' WHERE `entry`=6021;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardText`='Thank you, $N. You\'ve been more help than I could have hoped for. The air here just seems to suck my will. I feel tired, and I can tell I\'m not getting any better the longer I\'m here.$B$BI\'m not really sure how I\'m going to infiltrate Hearthglen itself and report on how strong the Scarlet Crusade\'s presence is.$B$BBut that\'s another matter, before you leave, here, take this... as payment for your help. Thank you again.' WHERE `entry`=6023;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardText`='You\'ve done it, $N! Thank you!$B$BI\'ll return to Elling... I mean Stormwind as soon as I can. Here, take this coin, it\'s the least I can do for you. You\'re a credit to your people, $N. Thank you and good luck.' WHERE `entry`=6025;
UPDATE `quest_template` SET `OfferRewardText`='The long lost Book of the Ancients!  I will ensure this book is passed on to the high council.  You\'ve done well today, and for that you are to be thanked... as a hero should be thanked!\n' WHERE `entry`=6027;
UPDATE `quest_template` SET `OfferRewardText`='Very resourceful, Gregor is.  He\'s been dealing with the Steamwheedle Cartel for some time now, and has become an expert on the \"art\" of goblin negotiations.  Though it\'s true that the goblins\' primary loyalties lie with those who have the largest coin purses, they also know and respect the value of diplomacy.  If anything, it provides them with repeat customers...$B$BAt any rate, the Argent Dawn acknowledges you for your effort.  Please have this, with our thanks.' WHERE `entry`=6028;
UPDATE `quest_template` SET `OfferRewardText`='This... this is a very special book you have brought me.  I\'d like to tell you that \"special\" in this case means \"unique and quite possibly illuminating\", but that remains to be seen.$B$B\"Ooooooo?\"  Who in their right mind thinks this up?$B$BWell now, I\'ve heard of this Umbranse that Gregor spoke of, so this isn\'t without merit.  I\'ll do my best to decipher it.  As for you... please, have this - courtesy of the Argent Dawn.  While you are here, perhaps there are some other things you can aid us with.' WHERE `entry`=6030;
UPDATE `quest_template` SET `OfferRewardText`='Perfect mon, this is just what the witch doctor told me to do for my headache. He says, \"Mai\'Lahii - go fish. It\'ll make you feel better\"$B$BWell, I feel better already, thanks mon!' WHERE `entry`=6142;
UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=6143;
UPDATE `quest_template` SET `OfferRewardEmote2`=2, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='There it is!  And oh my!  I forgot how full it was!$B$BThis is a glorious day, $N!  Stupendous!  Insanely good, I say!' WHERE `entry`=6164;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay1`=1000, `OfferRewardEmoteDelay2`=2000 WHERE `entry`=6182;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=6183;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay1`=1000, `OfferRewardEmoteDelay2`=1500 WHERE `entry`=6184;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardEmote4`=6 WHERE `entry`=6185;
UPDATE `quest_template` SET `OfferRewardEmoteDelay2`=1500, `OfferRewardEmoteDelay3`=2500, `OfferRewardEmoteDelay4`=3500 WHERE `entry`=6186;
UPDATE `quest_template` SET `OfferRewardText`='Already I feel the anger leave me. What will I do with my time? Knowing evil moves near my land kept my thoughts moving, though now they are silent. Perhaps this is a good thing... maybe now I can focus on the good, as all Tauren should.$B$BPlease accept this as a reward for your troubles.' WHERE `entry`=6283;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Ah, $N, you have the Gaea seeds. Watch and see how the blessing of the Earthmother can cause even these small kernels of life to bloom and flourish.$B$B<Tammra begins to chant.>' WHERE `entry`=6301;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='This is great victory for the land. In time, other things will come to pass: the Venture Co. will pack up their buzz saws and axes, the angry fire spirits will calm, and the harpies will be pushed out by the land.$B$BOnly then $N, will Stonetalon be truly at peace.$B$BYou have done well $c; take one of these items as thanks for the new life you have created here today.' WHERE `entry`=6381;
UPDATE `quest_template` SET `OfferRewardEmote1`=11, `OfferRewardEmote2`=4 WHERE `entry`=6389;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='The water spirits within me bubble with the excitement. $N, you have given me a glorious victory to report to the Tribunal of the Tides.' WHERE `entry`=6393;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=5 WHERE `entry`=6402;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardEmote4`=1 WHERE `entry`=6403;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardText`='Ah... Yes! That\'s it; the Resonite crystals have a trace of Earthen magic. The kobolds must have dug deep uncovering an Earthen.$B$BLegend states that the Earthen are creatures created by the Titans.  They were used to create the land our feet walk on. This most definitely is a threat that cannot be ignored.$B$B<Mor\'rogal shakes his head.>$B$BPerhaps I can enchant these ore samples to use against this kobold plot.' WHERE `entry`=6421;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='These are perfect, $N! Thanks for helping me out!$B$BOh, and this is for your time...' WHERE `entry`=6441;
UPDATE `quest_template` SET `OfferRewardText`='You found them!  Thank you!  Thank you, $N!  You do not know how great a thing you have done for me.$B$BA troll without $ghis:her; charm is like an orc without $ghis:her; battle scars...$B$BWorthless.' WHERE `entry`=6462;
UPDATE `quest_template` SET `OfferRewardEmote1`=6, `OfferRewardEmote2`=2, `OfferRewardEmoteDelay2`=1000 WHERE `entry`=6482;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='I should have known - a piece of the black dragon brood mother, Onyxia. How revolting...\n' WHERE `entry`=6501;
UPDATE `quest_template` SET `OfferRewardEmote2`=66, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='Very good, $N.  Your hunting skills are impressive...$B$BThe loss of those outrunners helps blind the Alliance, and when they lack intelligence they are less likely to launch attacks.' WHERE `entry`=6503;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=2 WHERE `entry`=6504;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=6522;
UPDATE `quest_template` SET `OfferRewardEmote1`=6, `OfferRewardEmote2`=66, `OfferRewardText`='So Torek\'s attack was successful!  Well done, $N.  Night elves are decent foes.  A little skinny, but strong and fierce!  I\'m sure the battle was something to see...$B$BAnd I hope you gained a scar or two!' WHERE `entry`=6544;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='This is interesting indeed. I am glad you have brought it to my attention.$B$BNow we have a name for our troubles... Lorgus Jett.' WHERE `entry`=6564;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=4, `OfferRewardText`='Excellent, $N. You\'ve saved me a lot of work!$B$BBut don\'t think that I\'m not grateful!' WHERE `entry`=6571;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=4 WHERE `entry`=6581;
UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=6603;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6604;
UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=6641;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardEmote2`=1, `OfferRewardText`='Yes $c, thank you for coming.  I apologize about the misunderstanding... the air is thick with mistrust between the Arch Druid here and Keeper Remulos in Moonglade.  Each suspect the other of chicanery, and the fact that strange corruptions of Teldrassil continue unabated are still an issue here.  It does little to quell mistrust.$B$BRegardless, our duty to the Cenarion Circle remains... even if those who lead it may disagree with one another.' WHERE `entry`=6761;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=2, `OfferRewardEmote3`=1, `OfferRewardText`='I am Rabine Saturna, and on behalf of Keeper Remulos and all of the denizens of this sacred glade I bid you welcome.$B$BI appreciate your interest and eagerness to assist the Cenarion Circle.  I also know that Arch Druid of Darnassus expressed his displeasure to you in your lending us aid.  Rest assured that it is for the greater good, and that you will be safe from any ill-conceived repercussions you may be the target of.$B$BYou are among friends here, $N.' WHERE `entry`=6762;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=5 WHERE `entry`=7027;
UPDATE `quest_template` SET `OfferRewardText`='It\'s good to see fresh troops here, $N, but with a little luck you\'ll get into some action and won\'t be fresh for long!$B$BSpeak with me again.  I have tasks I must discuss with you....' WHERE `entry`=7121;
UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=7141;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1 WHERE `entry`=7162;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=5, `OfferRewardText`='Let our enemies see that a soldier of rank has struck them down! Fight for the glory of Stormpike!\n' WHERE `entry`=7168;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=5, `OfferRewardText`='The king has been made aware of your battlefront heroics, $c. Continue in your stalwart defense of the Stormpike Guard!' WHERE `entry`=7169;
UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=7261;
UPDATE `quest_template` SET `OfferRewardEmote1`=5, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1 WHERE `entry`=7301;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=7848;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Know this, heathen: A catastrophe has brought us together. Your pagan ways are neither understood nor appreciated by Zandalar but we are a fair people. Wear this brand around your neck. It shall serve as both a warning to our enemies and a symbol of your friendship to Zandalar.$B$BContinue to serve our people and I will amplify the power of the brand.' WHERE `entry`=8045;
UPDATE `quest_template` SET `OfferRewardEmote1`=5, `OfferRewardEmote2`=1 WHERE `entry`=8053;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=8240;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=8271;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='It is as it should be - the great one has risen. My watch comes to an end...' WHERE `entry`=8286;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='Securing our resources in Arathi is an important task!  You\'ve done well, $N.' WHERE `entry`=8370;
UPDATE `quest_template` SET `OfferRewardEmote1`=66, `OfferRewardText`='You\'re not one to disappoint, $N!  What you\'ve learned goes beyond petty medals and commendations.  What you\'ve learned is what can only come with experience and the hardening of one\'s temper in the field of battle.$B$BYou\'ve done well, $c.  You\'re a true hero of the Alliance!' WHERE `entry`=8371;
UPDATE `quest_template` SET `OfferRewardEmote1`=66, `OfferRewardText`='Excellent work, $c!  Your efforts will help provide the Alliance with the resources it needs.' WHERE `entry`=8398;
UPDATE `quest_template` SET `OfferRewardEmote1`=66, `OfferRewardText`='Good work, $N.  Thanks to you, our natural defenses in Ashenvale will remain intact for another day.' WHERE `entry`=8408;
UPDATE `quest_template` SET `OfferRewardText`='There is risk in dispelling the evil from a scourgestone, for it attracts the attention of undead for countless miles.  But you are strong in the Light, $n, and I do not fear for you...' WHERE `entry`=8414;
UPDATE `quest_template` SET `OfferRewardText`='You have done as I asked without question, $n.$b$bTrust is achieved, it seems.  Perhaps I can reveal our plan in more detail to you now.' WHERE `entry`=8416;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardText`='This is excellent, $n.  I would say I am surprised, but I knew without question that you wouldn\'t let us down.$b$bIt is my honor to bestow one of the Holy Mightstones to you.  Use it well.' WHERE `entry`=8418;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='Well done, $c!  You\'ve helped ensure the Horde\'s ownership over Warsong Gulch!' WHERE `entry`=8432;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='Excellent work, $N!  As long as Arathi Basin stays under our control our supplies will be well stocked.' WHERE `entry`=8440;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='We suffer much from the events of the past.  Thank you for what you have done to help protect the Timbermaw.  As a sign of our growing friendship, please accept this humble offering.' WHERE `entry`=8460;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=2 WHERE `entry`=8461;
UPDATE `quest_template` SET `OfferRewardEmote2`=2, `OfferRewardText`='Ah... I have heard the word on the wind about those not of our tribe who seek to ally themselves with the Timbermaw furbolgs.  I welcome you, but you must be warned that my tribe reacts poorly to strangers.$B$BThese are trying times, and we can only trust those who choose to fight the corruption of the land along side of us... and have proven themselves to us accordingly.  Those who have not done so will be met with open hostility should they enter the Hold.' WHERE `entry`=8462;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=2, `OfferRewardText`='Thank you for what you have done, as saddening as it is.  Accept this as a token of thanks.$B$BI would ask of you to please continue helping us, $N.  We have very few allies on which to call upon, and without your aid, the threats against my tribe would surely be too much for us to handle alone.' WHERE `entry`=8464;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=2, `OfferRewardText`='Greetings, $c - I stand guard here as both a speaker for the Timbermaw here in Winterspring and as a defender of the tribe.$B$BOur Winterfall brethren here in this frigid land have fallen under the same corruptive sway as the furbolg of Felwood.  If you\'ve come here offering the Timbermaw furbolgs aid, then we are ready to accept such an offer.' WHERE `entry`=8465;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=8467;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Once again, you prove your honor to us!  I will make sure that your deeds are known amongst my kind.$B$BRemember to bring any of the Winterfall\'s beads you find to me.  For each set you continue to bring to me, I will speak on your behalf to the tribe.' WHERE `entry`=8469;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='This totem... I recognize it as one of the Deadwood\'s, but it is thick with the stench of decay.  Whatever foulness has turned our brethren against us is surely present in this object.$B$BYou were wise to bring this to us, $N.  Perhaps through study and ritual, we can uncover what it is that pollutes the minds of our brethren.  Thank you, friend - please accept these offerings in exchange for your find.' WHERE `entry`=8470;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='This thing... it is in the shape of a Winterfall Ritual Totem, but it has been twisted by forces I cannot begin to comprehend.  Whatever taint that has set the Winterfall against us is surely present in this object.$B$BDivine wisdom has brought both this and you to us, $N.  We will study this object intently; perhaps one day, the Winterfall will rage against us no longer.$B$BThank you, friend - please accept these offerings in exchange for your benevolence.' WHERE `entry`=8471;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=66, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='You did it, $g lad : lass;! We\'ll get those copper bars onto the pile and put them to good use making the war materiel right away. It\'s the efforts of people like you that make me proud to serve the Alliance. Good work, soldier!$B$BAnd if you should happen to come across more copper bars, make sure that they find their way to me.' WHERE `entry`=8492;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=66, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='Excellent work! Digging around for that copper and smelting it must have been quite an adventure. Unless you bought them at the auction house. Either way, it works for me. You are to be commended for your contribution to the war effort, $c. And please don\'t hesitate to bring me more copper bars if you have them.' WHERE `entry`=8493;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=1000 WHERE `entry`=8494;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=5, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='Hooray! That\'s another twenty down. You\'re the best. I suppose that I should get these all packed away before they wither. So much stranglekelp, so little time!$B$BThanks again, $c!' WHERE `entry`=8503;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=5, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='Oh goodness that\'s a quite a load of stranglekelp you have there. Quick, let\'s get that into a box to keep it fresh. You\'ve done me... us, the Alliance a great favor by bringing that batch in. I\'ll make sure that everyone knows that it was you, the great $N, that helped to tip the scales in the Ahn\'Qiraj war effort with your contribution of stranglekelp!' WHERE `entry`=8504;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=1000 WHERE `entry`=8505;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='I dare say the Alliance is going to be very happy with your skins here, $c. I\'ll make sure that not a one goes to waste. Thank you, and make sure that you check back in with me once I\'ve counted them up to see if we need more.' WHERE `entry`=8511;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=1000 WHERE `entry`=8512;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=1000 WHERE `entry`=8513;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='Golly, that sure is a lot of medium leather that you\'ve brought round, $g sir : ma\'am;! I\'m gonna make sure that all of that gets put to proper use, yes indeed. With your help we\'ll have filled our estimation for medium leather in no time!$B$BThanks, $N!' WHERE `entry`=8514;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=21, `OfferRewardEmote3`=5, `OfferRewardEmoteDelay2`=1000, `OfferRewardEmoteDelay3`=1000, `OfferRewardText`='Oh, I knew you could do it, $c, I just knew it! I\'ll get these into the right hands as soon as I can. Now, let\'s see here. Hmm, looks like our tally is coming along rather nicely. You should check back with me in just a moment once I\'m done counting to see if we need more.  Cuz if we do, you\'re the one I want out there gathering it up for me!' WHERE `entry`=8515;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=21, `OfferRewardEmote3`=4, `OfferRewardEmoteDelay2`=1000, `OfferRewardEmoteDelay3`=1000 WHERE `entry`=8516;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Many are the soldiers that will benefit from your contribution here today, $c. I shall see to it personally that the Alliance is made aware of your efforts. Allow me a moment to store these bandages properly and update my count, and then you should check back with me to see if I am in need of more.$B$BMay the Light of Elune shine upon you, $r!' WHERE `entry`=8517;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=2, `OfferRewardEmoteDelay2`=1000, `OfferRewardEmoteDelay3`=1000 WHERE `entry`=8518;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='$C, you did it! Thanks to you we are another step closer to achieving our goal with silk bandages. I\'ll get them stored away, and then we can talk more if you like.' WHERE `entry`=8520;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=1000 WHERE `entry`=8521;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='You are to be commended, $c, for your perseverance in this task. I shall put these bandages away, and then I should like to talk to you again about the possibility of your collecting even more runecloth bandages.' WHERE `entry`=8522;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=2, `OfferRewardEmoteDelay2`=1000 WHERE `entry`=8523;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardEmoteDelay3`=1000 WHERE `entry`=8524;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=11, `OfferRewardEmote3`=1, `OfferRewardEmoteDelay2`=2000, `OfferRewardEmoteDelay3`=1000, `OfferRewardText`='I knew that you had it in you, kid. You\'ve got the look of someone who knows what $g he : she; likes. Specifically that you like pleasing me and the powers that be. And that you have, I guarantee.$B$BHaha, ok, I\'ll just get these fish properly stashed away, and then you and I can have a little talk concerning you collecting another twenty albacore.' WHERE `entry`=8525;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=6, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='Gee, that\'s swell. Thanks for bringing me all of this burnt animal flesh, $c. I\'ll just put it onto the pile over there. I\'m sure that someone will take care of it. I suppose if you have some time on your hands that you might want to bring me more?' WHERE `entry`=8526;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='Wow, you\'re a real go-getter. You make me tired just looking at you. Anyway, thanks from the Alliance and all that. I\'ll make sure that all of that dead meat gets packed away. I guess you could check back with me later to see if we still need more of it, though it\'s starting to stink up the place if you ask me.' WHERE `entry`=8527;
UPDATE `quest_template` SET `OfferRewardText`='I see that you\'re no ordinary mortal, $N.  Your chances against the Old God, however infinitely small, are greater than ours at this point.  After all, while he expects dragons at his doorstep, he is not prepared for someone like you.$B$BJust as Anachronos and Staghelm defeated the Qiraji a thousand years ago through the alliance of mortal and dragon races, we too shall form a pact.  Gain the trust of the Bronze Dragonflight and you\'ll gain our trust.  Only then we shall make a true champion out of you.' WHERE `entry`=8579;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='A commendable effort, $c. I will measure these specimens for their appropriate usage and note your contribution. The purple lotus will then need to be properly stored until I am ready for them. As for you, if you are still available I should imagine that I\'ll still need more purple lotus. Please check back with me in a moment.' WHERE `entry`=8582;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=2, `OfferRewardEmoteDelay2`=1000, `OfferRewardEmoteDelay3`=1000 WHERE `entry`=8583;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='Oh, so you do have the heavy leather I needed. Your blade is sharp indeed, $c; these are good skins! Now that we\'ve gotten off on the right foot with one another I\'ll make sure that your contribution is put to good use. And if you happen to come across more heavy leather, bring it my way.' WHERE `entry`=8588;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=94, `OfferRewardEmote3`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardEmoteDelay3`=1000 WHERE `entry`=8589;
UPDATE `quest_template` SET `OfferRewardEmote1`=66, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='Good work, $c. I\'m sure that these thick leather skins will be put to use reinforcing zeppelins and making all manner of armor and weaponry. You have my thanks, and that of the Horde. Come back again if you come across more thick leather in your travels, and luck be with you.' WHERE `entry`=8590;
UPDATE `quest_template` SET `OfferRewardEmote1`=94, `OfferRewardEmote2`=1, `OfferRewardEmote3`=5, `OfferRewardEmoteDelay2`=1000, `OfferRewardEmoteDelay3`=1000, `OfferRewardText`='You did it, $N, I knew that you would! Once again, thank you on behalf of the entire Horde. Your efforts have been noted and are greatly appreciated. And if you find yourself with more thick leather that you\'d like to donate, bring them to me here.$B$BLok\'tar Ogar, $c!' WHERE `entry`=8591;
UPDATE `quest_template` SET `OfferRewardText`='You continue to serve us well, $N.  Our pact remains in place.' WHERE `entry`=8595;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=1000 WHERE `entry`=8600;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardEmoteDelay3`=1000 WHERE `entry`=8601;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='Surprising, yet acceptable. Perhaps I underestimated your \'abilities\', $c. Perhaps. You completed a very simple task, and for doing so you are to be rewarded out of proportion. But don\'t let it go to your head. If you really want to prove yourself you should get out there and bring me another bundle of mageweave bandages.' WHERE `entry`=8607;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardEmoteDelay3`=1000, `OfferRewardText`='Astounding, $c, you actually did it again! Well, they do say that I have good taste in those that I choose to place in my service. Very well, your contribution is noted and you will receive the social benefits that your efforts have afforded. I suggest though that you go back out and gather yet another bundle of mageweave bandages if you truly wish to prove your worth.' WHERE `entry`=8608;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=6, `OfferRewardEmoteDelay2`=1000, `OfferRewardEmoteDelay3`=1000, `OfferRewardText`='Ok, this stack of meat looks good to me. I\'ll salt them, and then pack them away and hopefully they\'ll keep fresh enough to be edible when the time comes.$B$BThanks for the contribution, $c. Do you think you could bring me another rack?' WHERE `entry`=8611;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='Smells like you, or someone you know, are quite the cook, $N. Those lean wolf steaks are making my mouth water; I suppose a few going missing won\'t be noticed. Anyway, good work. I\'ll make sure someone packs them away right so that they don\'t spoil too much.$B$BIf you come across more, you know where to find me.' WHERE `entry`=8612;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardEmoteDelay3`=1000, `OfferRewardText`='Throm\'ka, $c! Good to see so many of the Horde, such as yourself, $N, coming out to lend your support in laying the groundwork for the upcoming Ahn\'Qiraj War. The effort here will ensure that we are victorious against the Silithid and their evil masters hidden away inside Ahn\'Qiraj.$B$BSo now that you are here, be sure to speak with the various collectors and offer your assistance in gathering those materials that you are suited to.' WHERE `entry`=8792;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardEmoteDelay3`=1000, `OfferRewardText`='Throm\'ka, $c! Good to see so many of the Horde, such as yourself, $N, coming out to lend your support in laying the groundwork for the upcoming Ahn\'Qiraj War. The effort here will ensure that we are victorious against the Silithid and their evil masters hidden away inside Ahn\'Qiraj.$B$BSo now that you are here, be sure to speak with the various collectors and offer your assistance in gathering those materials that you are suited to.' WHERE `entry`=8793;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardEmoteDelay3`=1000, `OfferRewardText`='Throm\'ka, $c! Good to see so many of the Horde, such as yourself, $N, coming out to lend your support in laying the groundwork for the upcoming Ahn\'Qiraj War. The effort here will ensure that we are victorious against the Silithid and their evil masters hidden away inside Ahn\'Qiraj.$B$BSo now that you are here, be sure to speak with the various collectors and offer your assistance in gathering those materials that you are suited to.' WHERE `entry`=8794;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardEmoteDelay3`=1000, `OfferRewardText`='Hail and well met $g lad : lass;! Good to see so many of the Alliance, such as yourself, $N, coming out to lend your support in laying the groundwork for the upcoming Ahn\'Qiraj War. The effort here will ensure that we are victorious against the Silithid and their evil masters hidden away inside Ahn\'Qiraj.$B$BSo now that you are here, be sure to speak with the various collectors and offer your assistance in gathering those materials that you are suited to.' WHERE `entry`=8795;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardEmoteDelay3`=1000, `OfferRewardText`='Hail and well met $g lad : lass;! Good to see so many of the Alliance, such as yourself, $N, coming out to lend your support in laying the groundwork for the upcoming Ahn\'Qiraj War. The effort here will ensure that we are victorious against the Silithid and their evil masters hidden away inside Ahn\'Qiraj.$B$BSo now that you are here, be sure to speak with the various collectors and offer your assistance in gathering those materials that you are suited to.' WHERE `entry`=8796;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardEmoteDelay3`=1000, `OfferRewardText`='Hail and well met $g lad : lass;! Good to see so many of the Alliance, such as yourself, $N, coming out to lend your support in laying the groundwork for the upcoming Ahn\'Qiraj War. The effort here will ensure that we are victorious against the Silithid and their evil masters hidden away inside Ahn\'Qiraj.$B$BSo now that you are here, be sure to speak with the various collectors and offer your assistance in gathering those materials that you are suited to.' WHERE `entry`=8797;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Very well - your deeds have been entered into the records, and you are duly recognized for your efforts.  Keep up the good work, $c.$B$BIf you have any more signets to hand in, then I am able to assist you further in that regard.' WHERE `entry`=8811;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Very well - your deeds have been entered into the records, and you are duly recognized for your efforts.  Keep up the good work, $c.$B$BIf you have any more signets to hand in, then I am able to assist you further in that regard.' WHERE `entry`=8812;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Very well - your deeds have been entered into the records, and you are duly recognized for your efforts.  Keep up the good work, $c.$B$BIf you have any more signets to hand in, then I am able to assist you further in that regard.' WHERE `entry`=8813;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Very well - your deeds have been entered into the records, and you are duly recognized for your efforts.  Keep up the good work, $c.$B$BIf you have any more signets to hand in, then I am able to assist you further in that regard.' WHERE `entry`=8814;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Very well - your deeds have been entered into the records, and you are duly recognized for your efforts.  Keep up the good work, $c.$B$BIf you have any more signets to hand in, then I am able to assist you further in that regard.' WHERE `entry`=8815;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Very well - your deeds have been entered into the records, and you are duly recognized for your efforts.  Keep up the good work, $c.$B$BIf you have any more signets to hand in, then I am able to assist you further in that regard.' WHERE `entry`=8816;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Very well - your deeds have been entered into the records, and you are duly recognized for your efforts.  Keep up the good work, $c.$B$BIf you have any more signets to hand in, then I am able to assist you further in that regard.' WHERE `entry`=8817;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Very well - your deeds have been entered into the records, and you are duly recognized for your efforts.  Keep up the good work, $c.$B$BIf you have any more signets to hand in, then I am able to assist you further in that regard.' WHERE `entry`=8818;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Excellent!  It is no small sacrifice that you\'ve made to earn these signets, and you will be acknowledged for your service appropriately.  It\'s adventurers like you, $N, that truly make a difference.$B$BLet me know if you have additional signets to hand in; I\'ll gladly help you out with whatever ones you need exchanged.' WHERE `entry`=8819;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Excellent!  It is no small sacrifice that you\'ve made to earn these signets, and you will be acknowledged for your service appropriately.  It\'s adventurers like you, $N, that truly make a difference.$B$BLet me know if you have additional signets to hand in; I\'ll gladly help you out with whatever ones you need exchanged.' WHERE `entry`=8820;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Excellent!  It is no small sacrifice that you\'ve made to earn these signets, and you will be acknowledged for your service appropriately.  It\'s adventurers like you, $N, that truly make a difference.$B$BLet me know if you have additional signets to hand in; I\'ll gladly help you out with whatever ones you need exchanged.' WHERE `entry`=8821;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Excellent!  It is no small sacrifice that you\'ve made to earn these signets, and you will be acknowledged for your service appropriately.  It\'s adventurers like you, $N, that truly make a difference.$B$BLet me know if you have additional signets to hand in; I\'ll gladly help you out with whatever ones you need exchanged.' WHERE `entry`=8822;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Excellent!  It is no small sacrifice that you\'ve made to earn these signets, and you will be acknowledged for your service appropriately.  It\'s adventurers like you, $N, that truly make a difference.$B$BLet me know if you have additional signets to hand in; I\'ll gladly help you out with whatever ones you need exchanged.' WHERE `entry`=8823;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Excellent!  It is no small sacrifice that you\'ve made to earn these signets, and you will be acknowledged for your service appropriately.  It\'s adventurers like you, $N, that truly make a difference.$B$BLet me know if you have additional signets to hand in; I\'ll gladly help you out with whatever ones you need exchanged.' WHERE `entry`=8824;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Excellent!  It is no small sacrifice that you\'ve made to earn these signets, and you will be acknowledged for your service appropriately.  It\'s adventurers like you, $N, that truly make a difference.$B$BLet me know if you have additional signets to hand in; I\'ll gladly help you out with whatever ones you need exchanged.' WHERE `entry`=8825;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Excellent!  It is no small sacrifice that you\'ve made to earn these signets, and you will be acknowledged for your service appropriately.  It\'s adventurers like you, $N, that truly make a difference.$B$BLet me know if you have additional signets to hand in; I\'ll gladly help you out with whatever ones you need exchanged.' WHERE `entry`=8826;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Very well - your deeds have been entered into the records, and you are duly recognized for your efforts.  Keep up the good work, $c.$B$BIf you have any more signets to hand in, then I am able to assist you further in that regard.' WHERE `entry`=8830;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Excellent!  It is no small sacrifice that you\'ve made to earn these signets, and you will be acknowledged for your service appropriately.  It\'s adventurers like you, $N, that truly make a difference.$B$BLet me know if you have additional signets to hand in; I\'ll gladly help you out with whatever ones you need exchanged.' WHERE `entry`=8831;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Very well - your deeds have been entered into the records, and you are duly recognized for your efforts.  Keep up the good work, $c.$B$BIf you have any more signets to hand in, then I am able to assist you further in that regard.' WHERE `entry`=8834;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Excellent!  It is no small sacrifice that you\'ve made to earn these signets, and you will be acknowledged for your service appropriately.  It\'s adventurers like you, $N, that truly make a difference.$B$BLet me know if you have additional signets to hand in; I\'ll gladly help you out with whatever ones you need exchanged.' WHERE `entry`=8835;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Well then, it\'s settled; here are your supplies, $c.  If you wish to do an additional exchange, then I am prepared to authorize it.  Just give me the word and I\'ll make it happen.$B$BKeep up the good work, $N.  We need all the materiel we can muster if we\'re going to win this thing.  If we all do our part, then victory shall be ours for the taking!' WHERE `entry`=8850;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Well then, it\'s settled; here are your supplies, $c.  If you wish to do an additional exchange, then I am prepared to authorize it.  Just give me the word and I\'ll make it happen.$B$BKeep up the good work, $N.  We need all the materiel we can muster if we\'re going to win this thing.  If we all do our part, then victory shall be ours for the taking!' WHERE `entry`=8853;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Oh the chickens I will craft from this wondrous husk! Well done, my $g boy:girl;!' WHERE `entry`=8857;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=4 WHERE `entry`=8858;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Excellent and timely! Well done, $g lad:lass;.' WHERE `entry`=8859;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Hah - you caught him!  You\'ve done Elwynn a great service, and earned a nice bounty!' WHERE `entry`=6;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Well done, citizen.  Those kobolds are thieves and cowards, but in large numbers they pose a threat to us.  And the humans of Stormwind do not need another threat.$B$BFor defeating them, you have my gratitude.' WHERE `entry`=7;
UPDATE `quest_template` SET `OfferRewardText`='I see you\'ve been busy!  You have our thanks, $N.' WHERE `entry`=11;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='I don\'t like hearing of all these kobolds in our mine.  No good can come of this.  Here, take this as payment, and when you\'re ready, speak to me again.  I would like you to go back to the mines one more time...' WHERE `entry`=15;
UPDATE `quest_template` SET `OfferRewardText`='Thanks, $N!  And come back if you want to trade again.' WHERE `entry`=16;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Back with some bandanas, I see.  The Stormwind Army appreciates your help.' WHERE `entry`=18;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Once again, you have earned my respect, and the gratitude of the Stormwind Army.  There may yet be kobolds in the mine, but I will marshal others against them.  We have further tasks for you.' WHERE `entry`=21;
UPDATE `quest_template` SET `OfferRewardText`='This report... I\'ve dealt with these beasts before.  Fizzledowser was wise to send this, and you, to me.$B$BThese creatures will consume the Tanaris desert rapidly; they are nothing short of one of the greatest menaces we all will ever face.  Familiarize yourself with this name, $n: silithid.  The insects mentioned here are the silithid, and they are the tools of one of the greatest threats that both the Horde and Alliance face.$B$BIf only we were smart enough to see that before.' WHERE `entry`=32;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='You\'ve been busy!  I can\'t wait to cook up that wolf meat...$B$BI have some things here you might want - take your pick!' WHERE `entry`=33;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardText`='Yes, murlocs have settled in and around the streams of eastern Elwynn.  We don\'t know why they are here, but they are aggressive and at least semi-intelligent.' WHERE `entry`=35;
UPDATE `quest_template` SET `OfferRewardText`='That Verna was always such a sweet lass.  We\'ll miss her here in Westfall but between you and me, she\'s a city girl at heart and Stormwind will suit her just fine.  But enough gossip!  Now we can make Westfall Stew!' WHERE `entry`=36;
UPDATE `quest_template` SET `OfferRewardText`='Hmm, this news is troubling.  Already our defenses are stretched thin, and losing Rolf and Malakai to those murlocs put us in an even worse position.$B$BIf things don\'t improve, there will be fighting in Goldshire by the week\'s end!' WHERE `entry`=39;
UPDATE `quest_template` SET `OfferRewardText`='Yes, I spoke with Remy.  I respect him as a merchant, though all reports of Murlocs to the east have been sketchy at best.$B$BYour concerns are noted, but unless I receive a military report of a murloc threat, we can\'t afford to send more troops east.' WHERE `entry`=40;
UPDATE `quest_template` SET `OfferRewardText`='You have the fins?  Great!  Marshal Dughan is anxious about the Murloc situation in eastern Elwynn, and I\'d like to tell him that it\'s becoming under control.$B$BYour actions have helped realize that.' WHERE `entry`=46;
UPDATE `quest_template` SET `OfferRewardText`='Thanks for the dust, $N.  Here\'s your cash, and...here is a token from associates of mine.  You might find it useful...useful.' WHERE `entry`=47;
UPDATE `quest_template` SET `OfferRewardText`='Thanks a lot for the help, $N.  Something in the forest must be making these animals so bold.$B$BWhatever it is, I hope it stays there.' WHERE `entry`=52;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='Well, it says here that you\'ve been awarded Acting Deputy Status with the Stormwind Marshals.  Congratulations.$B$BAnd good luck - keeping Elwynn safe is no picnic... what with most the army busy doing who knows what for who knows which noble!$B$BIt\'s hard to keep track of politics in these dark days...' WHERE `entry`=54;
UPDATE `quest_template` SET `OfferRewardText`='Ah, thank you for the marker.  Please feel free to pick your choice of armor.$B$BLuck to you, brave $c.  And may this armor serve you well.' WHERE `entry`=59;
UPDATE `quest_template` SET `OfferRewardText`='You were busy hunting kobolds, were you?  Thanks for the candles, $N, and here\'s your reward...' WHERE `entry`=60;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardText`='Here is your payment ... and while you\'re here, take a look around!  I\'m sure we have a potion or other trinket you\'d find useful.' WHERE `entry`=61;
UPDATE `quest_template` SET `OfferRewardText`='This is bad news.  What\'s next, dragons?!?  We\'ll have to increase our patrols near that mine.  Thanks for your efforts, $N.  And hold a moment... I might have another task for you.' WHERE `entry`=62;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardText`='You have confirmed my fears, $N.  The murlocs are a threat we cannot ignore.' WHERE `entry`=71;
UPDATE `quest_template` SET `OfferRewardText`='Kobolds at the Jasperlode Mine, you say?  Curses!  The situation is worsening by the minute!$B$BThank you for the report, $N.  But I wish that the news you brought was good news.' WHERE `entry`=76;
UPDATE `quest_template` SET `OfferRewardText`='Ah, these are nice bandanas, if a little rough...$B$BHere you are!' WHERE `entry`=83;
UPDATE `quest_template` SET `OfferRewardText`='Mm, yum!  This pie is the best!$B$BI think my memory is coming back to me...' WHERE `entry`=84;
UPDATE `quest_template` SET `OfferRewardText`='You lost a what?  Well I didn\'t take no necklace, because I ain\'t no thief!$B$BI might know who did but...<grin>...I\'m too hungry to remember.' WHERE `entry`=85;
UPDATE `quest_template` SET `OfferRewardEmote1`=0 WHERE `entry`=86;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardText`='Oh, you found it!  Thank you, thank you dear!$B$BHere, take this.  It was my husband\'s and he always said it was lucky.  If only he didn\'t forget it on his last campaign! *sniff*' WHERE `entry`=87;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardText`='Thank goodness!  That pig was getting so big she\'d have eaten our whole crop!  Thank you, $N.$B$BNow, do either of these suit you?' WHERE `entry`=88;
UPDATE `quest_template` SET `OfferRewardText`='Ah, so my friend sent you here?  How kind.  $b$bWell the Stormwind Monarchy has abandoned our cause.  Now it is up to the People\'s Militia to keep the land free from corruption.  If our cause interests you, I can put your combat skills to use in the name of freedom.' WHERE `entry`=109;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='Zug zug!  My name is Grunth, and I guess you\'re looking after me?  You\'re an adventurer, like my mom and dad were.  My matron says that they died with honor in battle.  I\'m happy to meet you.$B$BI hope we\'ll do plenty of things together.  I have some things I\'d like to do, and the matron says you\'ll be like a big $G brother : sister; to me during this week.  I\'d like that a whole bunch.' WHERE `entry`=172;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardText`='Hah!  Well done!  I was starting to think no one would take down that monster!$B$BHere you are, $N.  And thanks - that Gnoll was giving me a headache the size of Blackrock Spire!' WHERE `entry`=176;
UPDATE `quest_template` SET `OfferRewardText`='Welcome to the new frontier, $N.  Ashenvale is a land of opportunity, one where a young $c like yourself is able to find boundless chances to prove their mettle.  Look around the outpost here, and be sure to travel out to the Zoram Strand, as the Horde has another outpost there as well.$B$BYour presence here tells me that you\'ve come to learn more about the hunt.  Listen close, and I will gladly share with you what you need to know.' WHERE `entry`=235;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardText`='Marshall Dughan sent you, eh?  Well you\'re not from the army, but if Dughan sent you then that\'s good enough for me!$B$BOur situation is, to say the least, a stressed one.  I hope you can give us a hand.' WHERE `entry`=239;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardEmote2`=0, `OfferRewardText`='It says here that Harlan\'s business is booming.  That\'s good news, but I wonder why people have need of all that armor.  I\'ve heard nothing of open war...is there something the nobles aren\'t telling us?$B$BWell, thank you for bringing the request.  Here\'s your payment, and I\'ll see to it that Harlan gets his supplies.' WHERE `entry`=333;
UPDATE `quest_template` SET `OfferRewardText`='Revenge has a sweet taste, don\'t you think?  When you destroyed the Agamands, did you catch any hint of free will within them?  I hope so.  I hope they knew fear before they were smashed into oblivion.$B$BIt is a foolish hope, I know.  But it is a hope I foster nonetheless.' WHERE `entry`=354;
UPDATE `quest_template` SET `OfferRewardText`='Coleman speaks well of you, $N, telling of your successful forays into the Agamand Mills.$B$BThe Forsaken have need of your talents once again...' WHERE `entry`=355;
UPDATE `quest_template` SET `OfferRewardText`='Very good, $N.  I will study this book and determine the identity of that lich.  You have served your Queen well.$B$B<Bethor opens the book and stares intently at its glowing pages...>$B$BAstonishing!  The book you retrieved belongs to no one other than Gunther Arcanus!$B$BGunther was a skilled Necromancer in life; he and I were friends and comrades-in-arms, before the Plague.  And judging from his book he has grown even more powerful in death.$B$BHis skills would be a great boon to us.' WHERE `entry`=357;
UPDATE `quest_template` SET `OfferRewardText`='Expertly done, $N.  The Scourge are mistaken if they think they can use those corpses against us, and the fluid you gathered from the Rot Hide slaves will be studied by our Apothecaries.  It may have secrets we can use against them.$B$BAs I said, well done.  But our struggle continues, and the conflict will surely offer you more chances to prove your worth to the Forsaken.' WHERE `entry`=358;
UPDATE `quest_template` SET `OfferRewardText`='Magistrate Sevren wants a report?  Very well: the defenders at The Bulwark are holding the majority of the Scourge at bay, but some do slip through on occasion.$B$BWe have seen sporadic Scourge activity east of this station, with a concentration around the Balnir Farmstead.' WHERE `entry`=359;
UPDATE `quest_template` SET `OfferRewardText`='It is troubling to hear of the Scourge slipping past the Bulwark.  The Lich King and his minions are ceaseless in their assaults.$B$BBut we will not give in.  He will not take us again!' WHERE `entry`=360;
UPDATE `quest_template` SET `OfferRewardText`='Thank you.  Devlin\'s bones will rest nicely on my mantle.$B$BIf my cold heart can find warmth, it is in knowing that the Agamands are destroyed.  They failed me and my family when the Plague came - now I swear I will smash their remains under my heel!' WHERE `entry`=362;
UPDATE `quest_template` SET `OfferRewardText`='You have performed your bidding well, young $c.  You are proving yourself to be quite an asset to The Dark Lady\'s army.' WHERE `entry`=365;
UPDATE `quest_template` SET `OfferRewardText`='My book?!?  So you were the thief who stole it!$B$BBut...what is this new enchantment upon it...Bethor?  He is in  Lordaeron?$B$BIf he still exists, then perhaps he too escaped from the Lich King\'s grasp...' WHERE `entry`=366;
UPDATE `quest_template` SET `OfferRewardText`='You have done extremely well, $c.  With ruthless fighters like you conquering in the name of The Forsaken our race is one step closer to defeating Arthas once and for all.  I have a good feeling about you, comrade.' WHERE `entry`=372;
UPDATE `quest_template` SET `OfferRewardText`='Hmm, well, it\'s a start. It\'ll take a few weeks or months to fully clean out the infestation. After that, we\'ll have to get down there with some torches to burn away the webbing.$b$bYou\'ve done your duty well, $n, I\'m sure I can find something else for you to do.' WHERE `entry`=380;
UPDATE `quest_template` SET `OfferRewardText`='If only they listened to reason, eh, $n? Perhaps we could sit them down for reasonable discourse... ha!$b$bLight-blinded fools.' WHERE `entry`=381;
UPDATE `quest_template` SET `OfferRewardText`='Yes, this is very good. You\'ve done well in obtaining this information, $n. Hmm... names of the officers in the Tirisfal Glades...$b$bImagine the blow we could deal to the morale of those bloody zealots if we were to kill their leaders in one swift strike.' WHERE `entry`=383;
UPDATE `quest_template` SET `OfferRewardText`='Maggot Eye\'s dastardly acts have finally been avenged.  Maybe your acts of valor will send a clear message to those who wish to bring harm to our people.  On behalf of the town of Brill I thank you, $N.' WHERE `entry`=398;
UPDATE `quest_template` SET `OfferRewardText`='Well done.  I regret not being there to see you smash those undead into rotting pulp!' WHERE `entry`=404;
UPDATE `quest_template` SET `OfferRewardText`='Ah, you are the agent sent by Magistrate Sevren.  Then yes, your business with me is crucial.$B$BI trust Sevren has mustered someone suitable for my task...but we shall see.' WHERE `entry`=405;
UPDATE `quest_template` SET `OfferRewardText`='Your actions struck a telling blow against the Scourge.  And your victory will not go unnoticed - not by the Forsaken, nor by our enemies.$B$BContinue the struggle as we all do, $N, and one day we will drive the Lich King himself from Azeroth!' WHERE `entry`=408;
UPDATE `quest_template` SET `OfferRewardText`='You have defeated Lillith Nefara, proving you are an enemy of the Scourge.  Incredible.$B$BI had believed I was the only Undead with free will, but you have shown me there are others who have broken the Lich King\'s domination.' WHERE `entry`=409;
UPDATE `quest_template` SET `OfferRewardText`='You convinced him to join us!  You have done a great deed for the Forsaken, $N.  The Dark Lady will be informed.' WHERE `entry`=411;
UPDATE `quest_template` SET `OfferRewardText`='You have served me well, $c.  It is obvious to me that you will be a worthy aide to me as I prepare to rid Silverpine Forest of Arugal\'s curse.' WHERE `entry`=421;
UPDATE `quest_template` SET `OfferRewardText`='This is precisely the spell I was in search of, $c.  If your dedication to The Dark Lady\'s cause remains infallible you will find you have quite a future amongst The Forsaken.' WHERE `entry`=422;
UPDATE `quest_template` SET `OfferRewardText`='Ah, thank you.  You have my gratitude, $N.$B$BAnd I will include you in the report I make to my superiors.' WHERE `entry`=425;
UPDATE `quest_template` SET `OfferRewardText`='Your efforts in the war are felt among us, $N.  I will not thank you for doing what is necessary, but the Deathguards of Tirisfal will remember your name.' WHERE `entry`=426;
UPDATE `quest_template` SET `OfferRewardText`='Most excellent, $c.  Your skill in the art of combat is undeniable.' WHERE `entry`=427;
UPDATE `quest_template` SET `OfferRewardText`='<Renferrel takes the hearts.>$B$BIt is troubling to hear our Deathstalkers have failed their mission.$B$BLet us hope that these failures are rare.$B$BI\'ll give you the potion in a moment, but here is its recipe - if those Deathstalkers find themselves in need of future aid, then perhaps you can give it yourself.' WHERE `entry`=429;
UPDATE `quest_template` SET `OfferRewardText`='<Quinn takes the potion and drinks it.>$B$BYes, I can feel it working.  I will soon be able to travel.$B$BYou have done me a great favor, $N.' WHERE `entry`=430;
UPDATE `quest_template` SET `OfferRewardText`='Thank you for the aid, $N.  I had feared Erland was overcome by the dangers of Silverpine.  With your help, I see that he has not.' WHERE `entry`=435;
UPDATE `quest_template` SET `OfferRewardText`='I heard of your successful raid against the rot hides, $N, and this essence is proof of Nightlash\'s death.$B$BThe Scourge have lost ground this day.  Your value to the Forsaken grows.' WHERE `entry`=437;
UPDATE `quest_template` SET `OfferRewardText`='Very good.  This ichor will help us understand the nature of the rot hides, and may show us their weakness...$B$B...if they have one.' WHERE `entry`=443;
UPDATE `quest_template` SET `OfferRewardText`='This substance is laced with powerful spells, some of which I have not seen for a long, long time...$B$BOne moment -- I must invoke a spell of divination...' WHERE `entry`=444;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardText`='Ah, how good of Apothecary Johaan to send his research.  With so many new developments here in Silverpine, I nearly forgot about the findings coming out of Lordaeron and Tirisfal Glades.  Which reminds me, I need to get those samples off to the Necropolis soon.$b$bBut you must excuse my rambling.  Extend your stay in Silverpine, $N.  We could use an able bodied $c like you around here.' WHERE `entry`=445;
UPDATE `quest_template` SET `OfferRewardText`='This scroll is laced with powerful magic.  I\'ve never used such forces in a potion ... it will be a powerful mixture, and should serve you well should you attack Thule in his stronghold on Fenris Isle.' WHERE `entry`=446;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='How good of Apothecary Renferrel to send you to me, $N.  These samples will indeed prove useful to the cause.  I will begin studying their toxic and contaminable properties at once.' WHERE `entry`=447;
UPDATE `quest_template` SET `OfferRewardText`='If what Bethor says is true then Thule Ravenclaw is a force that must be dealt with, and dealt with soon.$B$BTo aid in this task, you may take something from our arsenal here...' WHERE `entry`=448;
UPDATE `quest_template` SET `OfferRewardText`='I hadn\'t accounted for the level of Scourge presence we\'ve seen in Silverpine Forest, nor for the troubles our Deathstalkers have had in their scouting efforts.$B$BYour aid to our Deathstalkers was invaluable, $N.  And you will be commended.' WHERE `entry`=449;
UPDATE `quest_template` SET `OfferRewardText`='Thank you, $N.  I had feared the Gnolls destroyed my body.  It is good to know they did not.' WHERE `entry`=460;
UPDATE `quest_template` SET `OfferRewardText`='There we are, it\'s open.  Leave me here.  I spent the best days of my life in this keep, and the thought of resting within its walls gives me comfort.$B$BBe sure to close the alcove tight - I don\'t want those Rot Hides to find me.$B$BOh, and take this.  You\'ve earned it.' WHERE `entry`=461;
UPDATE `quest_template` SET `OfferRewardText`='...what is this?  Thule had our Woven Wand?  I thought it was lost when our friendship sundered and he sided with the Lich King!$B$BHe must not have invoked its power, for if he had I would have sensed it.  And it is good that he did not use it...$B$BThis is a marvelous find.  You have my gratitude, $N, and will be rewarded.' WHERE `entry`=491;
UPDATE `quest_template` SET `OfferRewardText`='Oh, YOU\'RE the great savior of OOX-17/TN!  I cannot even begin to express my thanks for your assistance!  My homing robot series needs more developing, but your recovery has saved me countless hours of rebuilding time, as well as many gold pieces in rebinding costs!$B$BPlease, take your choice of any of these items I have.  Hopefully, you will make good use of one of them.  Thank you again for your generous assistance, my robots and I are in your debt!' WHERE `entry`=648;
UPDATE `quest_template` SET `OfferRewardText`='Wow, the ocean is HUGE!  There were a lot of seagulls and stuff too - It\'s just as noisy and as bustling as I thought it would be.  There are pirates near by too - so cool!$B$BThank you for taking me to Ratchet, $N.  That was so awesome!' WHERE `entry`=910;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Wow, Ashenvale is where real adventure happens!  Have you ever fought in Ashenvale, $N?  When I become a hero when I grow up, I wanna come to Ashenvale and fight for the glory Horde!$B$BThank you for taking me to the frontier, $N.  You\'re the best!' WHERE `entry`=911;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardText`='Mmmmmmmmm!  I love their strawberry ice cream!  If there\'s one thing Tigule and Foror know to do, it\'s make ice cream!$B$BThank you very much $N - this is the best treat ever!' WHERE `entry`=915;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='WOW!  You got Cairne\'s hoofprint for me!  Thank you very much!  And wow... he wrote a personal message on here - to me!  I knew he\'d be totally cool, I just did!  Maybe someday I\'ll thank him myself... when I become a hero of the Horde!$B$BYou\'re the best, $N.  Thank you for being so nice to me.' WHERE `entry`=925;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=66, `OfferRewardText`='Greetings, $c.$B$BI am pleased to see the likes of you taking an interest in the well being of nature; tales of your mighty deeds precede you, and you are welcomed here.  Seeing you before me instills the feeling of confidence that the Cenarion Circle will get the proper aid it needs.$B$BOur connection with the Cenarion Circle in Moonglade transcends racial and political divides.  Remember this as you work on behalf of the Circle, and you will do well.' WHERE `entry`=1018;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardText`='You\'re here to help with my delivery?  Very good!' WHERE `entry`=1097;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='Ah, very good.  If initial reports are true, then the toxicity of these hearts could lead to further advances in our knowledge of poisons.$B$BThis is a welcome delivery, $N.  Your reward is well earned.' WHERE `entry`=1358;
UPDATE `quest_template` SET `OfferRewardText`='The keyhole of this strongbox is filled with black resin.  It is impossible to open.$B$BBut Galen told you of a hidden latch on the box\'s bottom... $B$B...After a quick search the latch is found.  The latch is flipped, and the strongbox opens...' WHERE `entry`=1393;
UPDATE `quest_template` SET `OfferRewardText`='Now that\'s what I call efficiency!  You\'ve helped thin out the nomad\'s numbers enough now that we can start to think about how we can win back those water wells.$B$BThe Gadgetzan Water Company thanks you for your help, but we\'re far from done in dealing with those foul nomads.  Listen close - here\'s what we need next...' WHERE `entry`=1690;
UPDATE `quest_template` SET `OfferRewardText`='Top notch work, $n... top notch!  You\'ve thinned down the nomad population to a point where we can actually take the fight to them!$B$BIf you haven\'t already, talk to Spigot Operator Luglunket here; he gives a bounty on any of the Wastewander water pouches you may have run across while bringing those nomads to justice!' WHERE `entry`=1691;
UPDATE `quest_template` SET `OfferRewardText`='Excellent - the more water pouches we are able to reclaim, the further away from disaster we\'ll all be!  Keep \'em coming, and I will be sure to reward you for every five water pouches you bring me.' WHERE `entry`=1707;
UPDATE `quest_template` SET `OfferRewardText`='That throne room was scary, $N!  Even though it was empty, it felt like a great evil had happened there.  I felt mad... but I also felt sad too.  I understand why the matrons tell us such stories; I will never betray my people like that!$B$BThank you for taking me to the throne room, $N.  I learned a lot.' WHERE `entry`=1800;
UPDATE `quest_template` SET `OfferRewardText`='Excellent - the more water pouches we are able to reclaim, the further away from disaster we\'ll all be!  Keep \'em coming, and I will be sure to reward you for every five water pouches you bring me.' WHERE `entry`=1878;
UPDATE `quest_template` SET `OfferRewardText`='Greetings, $N.  You were wise to answer my call, and wiser still if you heed what I next say...' WHERE `entry`=1881;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardText`='Ah, a fine specimen this is.  I will send it to be studied by our apothecaries to determine the extent of the Plagueland\'s taint.$B$BWell done, $N.  For your services, I present to you this choice: an orb or staff.  Whichever you choose, you will find it quite useful.' WHERE `entry`=1882;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1943;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=0 WHERE `entry`=1953;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1960;
UPDATE `quest_template` SET `OfferRewardText`='Finally - justice is served!  You have struck a mighty blow against those vile nomads!  With Scorpidsting\'s demise, this might be just the thing to finally push those squatters off of Gadgetzan\'s water wells!$B$BBy the authority of the Gadgetzan Water Company, I gladly award you with this bounty.  You\'ve done a great service for us all.' WHERE `entry`=2781;
UPDATE `quest_template` SET `OfferRewardEmote2`=5, `OfferRewardText`='That\'s right.  I do have a bone to pick with a troll.  A few bones.  All her bones!$B$BWant to help me?' WHERE `entry`=2861;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='In the meantime, you should know one or two other things. You are a symbol to many here in this land--act accordingly. The Holy Light shines within you, and it will be obvious to both your allies and your enemies.$B$BAlso, as you gain in wisdom and power, you will need to train to learn new abilities. That\'s where I come in. When you feel you\'ve gained some experience here in Northshire, come back to me and I will teach you what I feel you are ready to learn. Good luck... $c!' WHERE `entry`=3101;
UPDATE `quest_template` SET `OfferRewardText`='Ah, very good.  There is a matter regarding the wolf hearts you brought to me earlier that demands our attention.' WHERE `entry`=3221;
UPDATE `quest_template` SET `OfferRewardText`='You place the gem inside the essence font.$B$B\"Thank you mortal, you have - no... this, this cannot be! No!  The corruption of this accursed god even taints the sanctity of a Green Dragonflight essence font!  No please, I feel my essence ripping from me!  THE PAIN!  I feel the grip of an eternal nightmare taking hold on me...\"$B$B\"Mortal, I implore you!  Find one of the Green Dragonflight to stop this... help me... I am chained in darkness... forever in agony... please do not torture...\"' WHERE `entry`=3373;
UPDATE `quest_template` SET `OfferRewardText`='Great work $N, I knew you weren\'t useless.  Here - have one of the better items I\'ve found out of the lots that have been collected so far.' WHERE `entry`=3902;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Oh, Deputy Willem told you to speak with me?  He\'s a brave man and always willing to help, but his duties keep him stuck at Northshire Abbey and I\'m afraid the problem I have today is beyond him.$B$BPerhaps you can help me?' WHERE `entry`=3903;
UPDATE `quest_template` SET `OfferRewardText`='Oh thank you, $N!  You saved my harvest!  And I hope you showed a few of those Defias that they can\'t cause trouble around here.$B$BWe might be short on guards these days, but we\'re lucky to have heroes like you to protect us!' WHERE `entry`=3904;
UPDATE `quest_template` SET `OfferRewardText`='Let\'s see here...$B$BOh my!  Milly\'s grapes have been saved!  When she told me that brigands overran her vineyards I nearly despaired, but my faith in the Light did not waver!$B$BAnd through your bravery,  we now have grapes for more wine!  May the Light bless you, $n, and keep you safe!' WHERE `entry`=3905;
UPDATE `quest_template` SET `OfferRewardText`='I\'ll need one vial to make sure that this is truly the elixir... Yes... This is the stuff. ' WHERE `entry`=3909;
UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=3912;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardText`='My sword... It\'s finished!$B$BNow, if only I could remember why I needed this...$B$BHere, let me at least pay you for your work.' WHERE `entry`=3914;
UPDATE `quest_template` SET `OfferRewardEmote1`=69 WHERE `entry`=3941;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardText`='Hello, $c. Is there something I can help you with?' WHERE `entry`=3942;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardEmote2`=0, `OfferRewardEmote3`=0, `OfferRewardText`='Thank you, $N.$B$BThe Golden Flame will now be returned back to my homeland, where it may be protected, never again to be used for evil.$B$BWithout you, I\'d still have no idea who I am! Since you did so much for me, I\'d like you to have something special...$B$BTake any one you want!' WHERE `entry`=3962;
UPDATE `quest_template` SET `OfferRewardText`='Blazerunner, you say...$B$BYes, I am aware that a strong elemental resides in the charred center of the crater. We all just keep our distance; none have been able to penetrate the powerful aura that surrounds him. Many have been pushed from the rocky paths onto the ground below when trying to face him.' WHERE `entry`=4005;
UPDATE `quest_template` SET `OfferRewardEmote1`=11 WHERE `entry`=4041;
UPDATE `quest_template` SET `OfferRewardEmote1`=0 WHERE `entry`=4084;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardText`='What\'s this?  Ah!  It smells like Dark Iron Ale!  Drink has blurred my sight, but I can tell that you, $gsir:my lady;, are a real friend!' WHERE `entry`=4295;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=5, `OfferRewardEmote3`=1 WHERE `entry`=4724;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Aha!  I can already feel my powers returning to me.  And my mind is no longer wracked by Urok\'s curse.$B$BThank you, $N!  Humility is below me, but I must acknowledge your aid.$B$BAnd I bid you fortune in your journeys through Blackrock Spire.  You are a fool to think you could make your way to the top, but your bravery is without question.' WHERE `entry`=4867;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=5, `OfferRewardEmote3`=1, `OfferRewardEmote4`=15 WHERE `entry`=4974;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardEmote4`=11, `OfferRewardText`='I won\'t lie to you, $r. I needed the money! Kibler pays very, very well - much better than the K.E.F. ever could.$B$BBut don\'t doubt my loyalties! Why do you think I\'m down here? To get that crazy goblin some exotic animal eggs or something equally inane? No, only someone truly daft would come to Blackrock Spire to collect pets. Yep, I don\'t reckon too many people like that exist in this world.$B$B<Bijou laughs.>$B$BThe last thing we need are those kinds of people breeding.' WHERE `entry`=4981;
UPDATE `quest_template` SET `OfferRewardEmote1`=5, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardText`='You\'ve done it! Once Lexlort has these plans, he\'ll forget all about the nasty things he wanted to do to me.$B$B$N, you\'re my hero!\n' WHERE `entry`=4982;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardText`='I\'ve got to hand it to her; she\'s managed to weasel her way out of another sticky situation! These reports will prove to be invaluable in our dealings with the Blackrock orcs.$B$BOf course, you will be rewarded for your hard work.' WHERE `entry`=4983;
UPDATE `quest_template` SET `OfferRewardText`='Welcome to the Plaguelands, hero.  This is one of the most dangerous frontiers in Azeroth, with the looming threat of the Scourge to our east, and then even further still eastward from there.  I am glad to hear that the call of duty and service to the Horde did not fall on deaf ears with you!$B$BIf you are ready to get your hands dirty, then there is plenty for willing and able heroes to do here on the edge of the Plaguelands.' WHERE `entry`=5093;
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5261;
UPDATE `quest_template` SET `OfferRewardText`='All who fight evil on behalf of the Argent Dawn must don our commission.  Wearing such will earn your right to claim rewards our quartermasters have to offer.$B$BWhile under commission, you\'ll be able to acquire Scourgestones from slain Scourge; these are marks of insignia that they sometimes possess.  Procure these insignia and bring them to me.  For each set you turn in, you will receive our marker of heroism - the Argent Dawn Valor Token.$B$BAchieve your destiny, $c - join the fight today!' WHERE `entry`=5405;
UPDATE `quest_template` SET `OfferRewardText`='Congratulations, $N - I am pleased to award you with an Argent Dawn valor token!$B$BTo acquire a valor token in such a manner indicates that you are a true hero in the cause of good.  We value all effort brought to bear against the Scourge, but to take down one of their leaders is to truly deliver onto them a crushing defeat!$B$BFor the Dawn, my $g brother : sister;!' WHERE `entry`=5406;
UPDATE `quest_template` SET `OfferRewardText`='Congratulations, $N - I am pleased to award you with an Argent Dawn valor token!$B$BEach valor token handed out to worthy recipients is a sign of the tide turning against the Scourge.  With more and more heroes fighting the Scourge in their own lands, the Argent Dawn will assuredly be at the forefront when the time comes to wage war on the ultimate evil of the Scourge.  I hope that the valor you\'ve shown what it took to acquiring your token will carry the day then as well!' WHERE `entry`=5407;
UPDATE `quest_template` SET `OfferRewardText`='Congratulations, $N - I am pleased to award you with an Argent Dawn valor token!$B$BThe tokens serve two purposes.  One - they can be used to further your standing within the Argent Dawn; to do so may avail you options and rewards that are reserved for our honored and revered allies.  Two - they can be given to our quartermasters, along with coin, as payment for some of the Dawn\'s more prized items.$B$BWhatever you decide, know that you are earning your commission.  Well done!' WHERE `entry`=5408;
UPDATE `quest_template` SET `OfferRewardEmote2`=5, `OfferRewardEmote3`=1 WHERE `entry`=5481;
UPDATE `quest_template` SET `OfferRewardEmote2`=2, `OfferRewardText`='Ah, my doom weed. Excellent!$B$B<Junior Apothecary Holland rubs his hands together greedily.>$B$BThese will come in quite handy. You\'ve done me, uh, the Lady, a fine service today, $N. As promised here is the reward that you deserve.' WHERE `entry`=5482;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardText`='May the spirits bless you, $N.  You\'ve done more for Grunth than most would ever think of doing for him.  Thank you - you\'re the epitome of what it means to be a hero of the Horde.$B$BPlease - if you can spare the time, come back and visit us.  I know that Grunth would like that, as would I.$B$BGrunth had so much fun with you, $N.  He wanted to give you one of his favorite pets to remember him by.' WHERE `entry`=5502;
UPDATE `quest_template` SET `OfferRewardText`='Excellent! Thanks to you, I should be able to complete the order in time. To show my gratitude, I would like to offer some coin as compensation for your troubles.$B$BThank you and farewell.' WHERE `entry`=5545;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=5821;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=5943;
UPDATE `quest_template` SET `OfferRewardText`='You have to get this note to Stormwind?  That\'s not a problem, you can take one of my gryphons!' WHERE `entry`=6181;
UPDATE `quest_template` SET `OfferRewardText`='A crate for Westfall, eh?  Have you been to Westfall before?  If so, then it\'s no problem, my friend.  I have plenty of gryphons trained to fly that route!' WHERE `entry`=6261;
UPDATE `quest_template` SET `OfferRewardText`='Ah, a note from Quartermaster Lewis?  I\'m not surprised he needs more gear.  Sentinel Hill is far away, in a land Stormwind has all but forgotten.$B$BWell thank you, $N.  Here\'s some money to cover your travel costs.' WHERE `entry`=6281;
UPDATE `quest_template` SET `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='Great, you brought the armor!  We\'ll get this divvied to those who need it immediately.$B$BThank you, $N.  Your efforts have been a great help to us.  And now that you\'re no stranger to gryphons, I hope you\'ll come and lend your aid to Sentinel Hill often!' WHERE `entry`=6285;
UPDATE `quest_template` SET `OfferRewardEmote1`=0, `OfferRewardText`='This crate must reach the Sepulcher in Silverpine?  That is easily done; our bats fly there daily.' WHERE `entry`=6322;
UPDATE `quest_template` SET `OfferRewardText`='An order from the Sepulcher?  Very well.  It is an honor to serve those who serve our Dark Lady.' WHERE `entry`=6323;
UPDATE `quest_template` SET `OfferRewardEmote2`=66, `OfferRewardEmoteDelay2`=1000, `OfferRewardText`='Good work, $N.  These weapons will ensure our Deathguards don\'t get caught unprepared.$B$BYou have done a valuable service for our Dark Lady.' WHERE `entry`=6324;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='You have done a good deed today, $N.  Although our struggle against the Scourge continues, let us hope that Marla and Samuel will find peace together in their final resting place.' WHERE `entry`=6395;
UPDATE `quest_template` SET `OfferRewardEmote1`=6, `OfferRewardText`='Are you prepared to take on this task?\n' WHERE `entry`=6566;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardEmote4`=1, `OfferRewardText`='There is but one way into the dragon\'s lair, $r.$B$BYou see, only the strongest of the Black Dragonflight are allowed entry into the lair of the brood mother. Many trials must be passed and the key to enter ceremoniously enchanted by General Drakkisath himself!$B$BSince you are not of black dragonkin, you may have some difficulty in obtaining passage.$B$B<Rexxar grins.>' WHERE `entry`=6567;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardEmote4`=1, `OfferRewardText`='<Myranda holds the note, pauses, then smiles.>$B$BHow is he? Rexxar, I mean. Oh, come now, do not look so confused. The letter was left intentionally blank. It carried with it the intentions and thoughts of its creator. Judging from its contents, it is no wonder Rexxar left it as such. Imagine if you were captured or slain and this information discovered!$B$BOh, nevermind! Myranda will help you, $r. I owe the Warchief a favor or two.$B$B<Myranda smiles.>\n' WHERE `entry`=6568;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1, `OfferRewardText`='Let Myranda have a look, $r.$B$BOh yes, these will do nicely.$B$BWith these reagents, Myranda will create for you a medallion that will grant an illusion capable of fooling the black dragonflight\'s gatekeeper.' WHERE `entry`=6569;
UPDATE `quest_template` SET `OfferRewardEmote1`=6, `OfferRewardEmote2`=1, `OfferRewardEmote3`=25 WHERE `entry`=6570;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='It is merely dragon-talk, $N - more hot air than actual substantive information. Pompous, aggressive behavior is to be expected from their kind. \n' WHERE `entry`=6601;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Ah, $c. I see that there is hope yet. Are you here to assist me?' WHERE `entry`=6605;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=2 WHERE `entry`=6622;
UPDATE `quest_template` SET `OfferRewardEmote1`=113 WHERE `entry`=7142;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=6, `OfferRewardEmote4`=1, `OfferRewardText`='Wonderful! Who are you again? Oh it matters not. What was I supposed to give you? Hrm... well you are a mage, perhaps you will find this useful.' WHERE `entry`=7463;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=25, `OfferRewardText`='$G Priest:Priestess;, you are about to undergo a rigorous series of events which shall test all of your abilities.$B$BI suggest that you listen to the story that I have to tell.$B$BBe warned, you must complete this task alone. It is recommended that your allies remain at a distance. Interference by outside agents will result in a most severe punishment.$B$BDestiny has led you and you alone here. Battle with honor. Harness the Light.' WHERE `entry`=7621;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Accept this talisman as a token of our appreciation, $g priest:priestess;.$B$BThe Eye of Zuldazar will grow in power as your bond with the trolls of Zandalar strengthens. Return to me periodically and I shall imbue the jewel.' WHERE `entry`=8049;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Excellent - this set of coins will make a fine addition to our growing collection... one that we will use in the tribe\'s defense against the rise of the Blood God.  You\'ve earned this Honor Token, $N, as well as the thanks of the tribe!' WHERE `entry`=8195;
UPDATE `quest_template` SET `OfferRewardEmote1`=6, `OfferRewardEmote2`=1, `OfferRewardText`='How does it feel, $N? How does it feel to crush your enemies and watch their lines break apart? It feels good, doesn\'t it?$B$BYou should be rewarded for this heroic deed, soldier.' WHERE `entry`=8272;
UPDATE `quest_template` SET `OfferRewardEmote1`=66, `OfferRewardText`='You\'ve shown great bravery in protecting our lands in Alterac Valley!  I will tell my superiors of your deeds.' WHERE `entry`=8369;
UPDATE `quest_template` SET `OfferRewardEmote1`=66, `OfferRewardText`='Good work, $N!  You should be proud of yourself.  The Alliance invaders must be expelled from Alterac!' WHERE `entry`=8387;
UPDATE `quest_template` SET `OfferRewardText`='It is good to know the people of this land still pay homage to the olden races.  I bid you well, $N, and offer you this token...' WHERE `entry`=8648;
UPDATE `quest_template` SET `OfferRewardText`='It is good to know the people of this land still pay homage to the olden races.  I bid you well, $N, and offer you this token...' WHERE `entry`=8652;
UPDATE `quest_template` SET `OfferRewardText`='The heavens, in their countless stars, hold answers to earthly mysteries, $N.  Might, then, the wise, and the lucky, gaze up and find truth?' WHERE `entry`=8718;
UPDATE `quest_template` SET `OfferRewardText`='This present looks like it has been shaken a few times. The tag on it reads:$b$bTo a very special $r $c.' WHERE `entry`=8788;
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardEmote2`=1, `OfferRewardText`='Very well then - I accept these coins of ancestry.  Please take your dress with my blessing.  Also, please enjoy these complimentary fireworks.$B$BAs you have honored your elders, you honor me with your mere presence.  Thank you, and may your Lunar Festival be joyous.' WHERE `entry`=8864;
UPDATE `quest_template` SET `OfferRewardText`='It is good to know the people of this land still pay homage to the olden races.  I bid you well, $N, and offer you this token...' WHERE `entry`=8866;
UPDATE `quest_template` SET `OfferRewardText`='Welcome, $N.  Are you here to join in the festivities?' WHERE `entry`=8872;
UPDATE `quest_template` SET `OfferRewardText`='Welcome, $N.  Are you here to join in the festivities?' WHERE `entry`=8874;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='What kind words Temma writes for me. But, as much as his words move me, I cannot consider the love of a tauren. In thoughts, body and mind we are too different.$b$bIt is good I do not have to receive these thoughts of his in person. I could not bear to break his heart.' WHERE `entry`=8901;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardText`='Another one of Fenstad\'s obsessions, I see. Does he think that the Royal Apothecary Society has nothing better to do than to perform his little investigations?$b$bVery well, I will humor him once again.' WHERE `entry`=8979;
UPDATE `quest_template` SET `OfferRewardText`='So, I was right. We must waste no time. We must determine the source of these tainted fragrances.$b$bHere, to repay you for the purchase of the cologne and perfume.' WHERE `entry`=8980;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardText`='Ah yes, I just recently received stock of the perfume and cologne. I don\'t know how long I can keep it on the shelves - seems like no one can get enough of it.$b$bIf you ask me, I don\'t see what the big deal is.' WHERE `entry`=8982;
UPDATE `quest_template` SET `OfferRewardText`='I\'m afraid I sold my entire supply of perfume and cologne to Norman, the innkeeper. If you\'d like some, you should speak with him - assuming he has any left.$b$bYou shouldn\'t waste any time, though. I think you\'ll find the $g cologne:perfume;  irresistible.' WHERE `entry`=8983;
UPDATE `quest_template` SET `OfferRewardText`='Yes, I made those fragrances. Wonderful smell, isn\'t it? Irresistible.$b$bOnce the warriors of Alliance and Horde alike are smitten with these feelings of love, they will be powerless to stop the rise of the Shadow Council.$b$bThey will be weakened, unprepared. As they worry for their loved ones, they will lose their edge.$b$bThe solution was so simple. Why did it take me so long to come upon it? The weakness of all is through the heart. And there is nothing you can do to stop the inevitable.' WHERE `entry`=8984;
UPDATE `quest_template` SET `OfferRewardText`='These will do fine!  Thank you, $N!$B$BNow I\'ll try different cooking techniques on these tongues to find the best way to bring out their flavor.$B$BEventually I\'ll have a dish worthy of serving at the Blue Recluse in Stormwind!' WHERE `entry`=1204;
UPDATE `quest_template` SET `OfferRewardText`='Mr. Ignatz was just here with the bogbean leaves, and he told me you helped him out of some real trouble.$B$BThank you, $N.  I will ask my uncle to treat you to a feast the next time you visit the Blue Recluse in Stormwind.' WHERE `entry`=1222;
UPDATE `quest_template` SET `OfferRewardText`='These are wonderful specimens, $N!  The shells are in perfect condition, and the meat is pink and tender.  The blood of a chef is in your veins, I\'m sure of it!' WHERE `entry`=1258;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=2, `OfferRewardText`='My nephew said you aided him with his research in Dustwallow, and that you helped his associate out of a tight spot.  Well, we Sterns stick together and we don\'t ignore our friends!$B$BSo wash your hands, $N, because we\'re about to throw a party in your honor!' WHERE `entry`=1271;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1 WHERE `entry`=6502;
UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=8054;

-- Correct quest request items.
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='You have what??  Maybell is the light of my dull life.  Hurry, let me see her letter!' WHERE `entry`=106;
UPDATE `quest_template` SET `RequestItemsText`='You have a note from \"Gramma\" Stonefield, eh?  I haven\'t seen Mildred in years!  I wonder what she has to say...' WHERE `entry`=107;
UPDATE `quest_template` SET `RequestItemsText`='Do you have that crystal kelp?  I\'m sure Maybell is anxious to see her beau...' WHERE `entry`=112;
UPDATE `quest_template` SET `RequestItemsText`='Did you deliver my letter to Tommy Joe?  What did he say??' WHERE `entry`=114;
UPDATE `quest_template` SET `RequestItemsText`='What?!?  We haven\'t had our people working the Elwynn mines for months!$B$BLet me see that note you have...' WHERE `entry`=123;
UPDATE `quest_template` SET `RequestItemsText`='Did you find the Collector?  Did you discover whom he\'s working for?' WHERE `entry`=147;
UPDATE `quest_template` SET `IncompleteEmote`=0, `CompleteEmote`=0, `RequestItemsText`='Salutations, $N.  Do try to avoid stepping on my pant cuffs.  This outfit is newly tailored.' WHERE `entry`=543;
UPDATE `quest_template` SET `IncompleteEmote`=0, `CompleteEmote`=0 WHERE `entry`=579;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='I have traveled the world from the jungles of Azeroth to the snowy peaks of Khaz Modan.$b$bNever before have I asked for help in my adventures. But my old bones are tired.$b$bNothing would leave me feeling more satisfied than knowing that I completed my final quest for the Explorers\' League$b$bIf you\'d be so kind as to help me search for the Temple of Atal\'Hakkar, $c, I\'d greatly appreciate it.$b$bScour the Swamp of Sorrows and report back with your findings!' WHERE `entry`=1448;
UPDATE `quest_template` SET `RequestItemsText`='We are currently accepting donations for wool cloth.  A donation of sixty pieces of wool cloth will net you full recognition by Stormwind for your generous actions.  Our stores are such on wool that we would only need sixty pieces from you total; we should be able to acquire enough from others in the realm to support our drive.$B$BIf you have the sixty pieces of wool cloth on you and are ready to donate them, I\'m able to take them from you now.' WHERE `entry`=7791;
UPDATE `quest_template` SET `RequestItemsText`='As with most other fabrics, our stocks of silk are at an all-time low.  Our stores are such that we\'d only need sixty pieces of silk from you total; we should be able to reach our goal with the support of others.$B$BA benevolent gift such as silk, might I add, would certainly increase your local standing in the community!  If you have the sixty pieces of silk cloth on you and are ready to donate them, I\'m able to take them from you now.' WHERE `entry`=7793;
UPDATE `quest_template` SET `RequestItemsText`='Mageweave is running low, and we could use your help to replenish our stocks!  By counting on the community as a whole, we would only need a donation of 60 pieces of mageweave cloth from you to enable us to reach our goal.  Such generosity would not go unnoticed by Stormwind, I assure you!$B$BIf you have the sixty pieces of mageweave cloth on you and are ready to donate them, I\'m able to take them from you now.' WHERE `entry`=7794;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='The war against the Horde is quickly depleting our supplies, $N.  It is vital to maintain control of Arathi Basin to keep the stream of resources flowing!  Have you lent a hand in Arathi yet?' WHERE `entry`=8392;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='The war against the Horde is quickly depleting our supplies, $N.  It is vital to maintain control of Arathi Basin to keep the stream of resources flowing!  Have you lent a hand in Arathi yet?' WHERE `entry`=8397;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Don\'t forget the fight for Warsong Gulch is about more than just protecting trees.  It\'s about keeping a natural barrier between Ashenvale and the Barrens.  Do you bring any news from the battlefield, $N?' WHERE `entry`=8406;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Don\'t forget the fight for Warsong Gulch is about more than just protecting trees.  It\'s about keeping a natural barrier between Ashenvale and the Barrens.  Do you bring any news from the battlefield, $N?' WHERE `entry`=8407;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='For those adventurers who have but a single commendation signet, I\'ll exchange it for a small amount of recognition with Stormwind.$B$BPlease bear in mind that it is better to hand over a stack of ten signets at once; your efforts will receive greater recognition in doing so.  We offer a single signet exchange as a service for those who don\'t have enough for a full stack of ten.$B$BWith that being said, I stand ready to assist you if you still wish to hand in a single signet.' WHERE `entry`=8836;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='I accept commendation signets from adventurers who have received them in the line of duty.  For each set of ten that you hand to me, I\'ll make sure that you receive a significant acknowledgement of your deeds with Stormwind.  I also accept single tokens, but at a much reduced rate of recognition.  We are much more interested in greater feats of duty, though no feat will be ignored.$B$BWith that said, I\'ll gladly take your signets if you are ready to hand in a set.' WHERE `entry`=8837;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='For those adventurers who have but a single commendation signet, I\'ll exchange it for a small amount of recognition with Thunder Bluff.$B$BPlease bear in mind that it is better to hand over a stack of ten signets at once; your efforts will receive greater recognition in doing so.  We offer a single signet exchange as a service for those who don\'t have enough for a full stack of ten.$B$BWith that being said, I stand ready to assist you if you still wish to hand in a single signet.' WHERE `entry`=8842;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='I accept commendation signets from adventurers who have received them in the line of duty.  For each set of ten that you hand to me, I\'ll make sure that you receive a significant acknowledgement of your deeds with Thunder Bluff.  I also accept single tokens, but at a much reduced rate of recognition.  We are much more interested in greater feats of duty, though no feat will be ignored.$B$BWith that said, I\'ll gladly take your signets if you are ready to hand in a set.' WHERE `entry`=8843;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='$N!  Do you have the troll legends?  I must know their secrets!' WHERE `entry`=207;
UPDATE `quest_template` SET `IncompleteEmote`=0, `CompleteEmote`=0, `RequestItemsText`='Hello!  Don\'t mind all the commotion, it\'s just business as usual at Nethergarde Keep.$B$BYou have something for me?' WHERE `entry`=1395;
UPDATE `quest_template` SET `RequestItemsText`='We are currently accepting donations for wool cloth.  A donation of sixty pieces of wool cloth will net you full recognition by Ironforge for your generous actions.  Our stores are such on wool that we would only need sixty pieces from you total; we should be able to acquire enough from others in the realm to support our drive.$B$BIf you have the sixty pieces of wool cloth on you and are ready to donate them, I\'m able to take them from you now.' WHERE `entry`=7802;
UPDATE `quest_template` SET `RequestItemsText`='As with most other fabrics, our stocks of silk are at an all-time low.  Our stores are such that we\'d only need sixty pieces of silk from you total; we should be able to reach our goal with the support of others.$B$BA benevolent gift such as silk, might I add, would certainly increase your local standing in the community!  If you have the sixty pieces of silk cloth on you and are ready to donate them, I\'m able to take them from you now.' WHERE `entry`=7803;
UPDATE `quest_template` SET `RequestItemsText`='Mageweave is running low, and we could use your help to replenish our stocks!  By counting on the community as a whole, we would only need a donation of 60 pieces of mageweave cloth from you to enable us to reach our goal.  Such generosity would not go unnoticed by Ironforge, I assure you!$B$BIf you have the sixty pieces of mageweave cloth on you and are ready to donate them, I\'m able to take them from you now.' WHERE `entry`=7804;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Avast Lubber!   Bring me 12 trinkets of the Arena Master and then ye shall be a Grandmaster of the Gurubashi Arena!   Arrrr!' WHERE `entry`=7838;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=9319;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=9322;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Have you yet traveled the continent? Enlightenment awaits you.' WHERE `entry`=9323;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=743;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=745;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Providing meat and feathers for the tribe is the first step in proving yourself as a hunter before the Chief.' WHERE `entry`=747;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=748;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=750;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Hail, $n. Have you learned anything new about the Venture Co.\'s plans and operations in our homeland?$b$bIf they plan to exploit our lands as they have others, the Outrunners will be quick to put an end to it.' WHERE `entry`=751;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=753;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='$N, do you have the claws I sent you to gather?  The Thunderhorn Water Well grows more tainted with each passing hour!' WHERE `entry`=756;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Have you completed the Rite of Strength, $n? I require proof of your valor against the enemy of our tribe, the Bristlebacks.' WHERE `entry`=757;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='The Thunderhorn Water Well is still tainted, $N.  Please, you must perform the ritual!' WHERE `entry`=758;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='$N.  Do you have the teeth I asked for?' WHERE `entry`=759;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='The last water well remains fetid and poisonous, $N.  You must not delay!' WHERE `entry`=760;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='What brings you to my village, $c?' WHERE `entry`=763;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=764;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=765;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=766;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=771;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=776;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=780;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=819;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=821;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=822;
UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=833;
UPDATE `quest_template` SET `IncompleteEmote`=15 WHERE `entry`=840;
UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=843;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=844;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='I see you are back, $n.$b$bWhile Khazgorm\'s death might delay the digging in my ancestral lands some, it will by no means bring a total end to the destruction.$b$bThe Keep at Bael Modan is an increasing military threat. Built to defend the dig site, it is now poised for offensive force as well.$b$bIf you have the ingredients I requested, I can fashion a charge that will make the hasty dwarves reconsider their actions here in the Barrens.' WHERE `entry`=846;
UPDATE `quest_template` SET `RequestItemsText`='Do you have the spores, $N?  There is a concoction I must send to my associate in Thunder Bluff, which requires the spores...' WHERE `entry`=848;
UPDATE `quest_template` SET `RequestItemsText`='Hello, $N.  Do you have Barak\'s Head for me?' WHERE `entry`=850;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=852;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=858;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Greetings.  There is an air about you that tells me much.  Do we have business, you and I?' WHERE `entry`=861;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Did you get the horns, $N?  Those things are going to make me a fortune!' WHERE `entry`=865;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=868;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Have you been to the Forgotten Pools, $N?  Did you find anything?' WHERE `entry`=870;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=872;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Fear not the waters, $r.' WHERE `entry`=873;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Have you been to the Stagnant Oasis?  Was there a fissure beneath its waters?' WHERE `entry`=877;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='More information <snort> for the Horde when you\'ve killed the Bristleback\'s wise ones, $r. <snort> Not a moment earlier! Mangletooth is no fool.' WHERE `entry`=878;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='How goes your hunt, $r? <snort>$B$BThork thinks he knows the truth about who leads the raids against his people, <snort> but he shall learn how wrong he is if you are successful.$B$BMy death is inescapable, but you have caused great pain to my enemies, so Mangletooth regrets nothing. <snort>' WHERE `entry`=879;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='How goes your collection?  Did you get the shells?' WHERE `entry`=880;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='$N, when you approached I saw a new power in your stride.  Tell me -- has your spirit met with the great Lakota\'mani?' WHERE `entry`=883;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='$N, there is a new power behind your eyes!  You have met with the mighty Owatanka, have you not?' WHERE `entry`=884;
UPDATE `quest_template` SET `RequestItemsText`='There is new resolve within you, $N.  A resolve born from pain...$B$BAre you burdened with the death of Washte Pawne?' WHERE `entry`=885;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=887;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Did you find my things, $n?' WHERE `entry`=888;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=889;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Wares to send on the next ship, $n?' WHERE `entry`=890;
UPDATE `quest_template` SET `IncompleteEmote`=5, `CompleteEmote`=5 WHERE `entry`=891;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=892;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=893;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=895;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=896;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=900;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=901;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Oh, you\'re back, $n! Do you have the samophlange?' WHERE `entry`=902;
UPDATE `quest_template` SET `RequestItemsText`='How goes your hunt, $N?  Have you found the prowlers?' WHERE `entry`=903;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=905;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=906;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=913;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Memories of my nightmares haunt me, $N.  Have you defeated the leaders of the fang and acquired their gems?' WHERE `entry`=914;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='The dockmaster has been on my case ever since Mad Magglish made off with that 99-year-old port. I guess that bottle was intended as a gift for Gazlowe from none other than Baron Revilgaz himself.$b$bIf you\'re brave enough and patient enough to seek out Mad Magglish and get that port back, I\'ll see to it you get a nice reward.' WHERE `entry`=959;
UPDATE `quest_template` SET `IncompleteEmote`=11 WHERE `entry`=1058;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1060;
UPDATE `quest_template` SET `IncompleteEmote`=5, `CompleteEmote`=5, `RequestItemsText`='The Greatwood Vale lies to the northwest, $N.  Go.  Strike fear into those who would pillage this land!' WHERE `entry`=1062;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='The tree spirits wail at the loss of their brethren, $N.  You must destroy the shredders XT:4 and XT:9, or I fear Stonetalon will never be healed.' WHERE `entry`=1068;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Did you get the eggs, $N?  I already made a shipping deal with Wharfmaster Dizzywig!' WHERE `entry`=1069;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1093;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1094;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1195;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='I am very interested in examining the hides from the deviate creatures who have infested these caves. Have you had any luck in collecting some, $c?' WHERE `entry`=1486;
UPDATE `quest_template` SET `IncompleteEmote`=20, `CompleteEmote`=20, `RequestItemsText`='$n, we, the Disciples of Naralex, need your help. Our numbers are dwindling with our master trapped in his twisted nightmare. We have not the forces necessary to deal with the corrupt creatures which now haunt these caverns.$b$bI beg of you, enter the caves and wage war on the deviate creatures!' WHERE `entry`=1487;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1491;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1492;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Do you have the scales, $N?  Unless you can withstand the attacks of the thunder lizards, you will not benefit from my instruction.' WHERE `entry`=1498;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Yes, young one? What can Kauth do for you?$B$BThe journey here from the Mesa can be a tremendous burden for some, but a welcome sight for others. Which is it for you, I wonder?' WHERE `entry`=1656;
UPDATE `quest_template` SET `IncompleteEmote`=0, `CompleteEmote`=0 WHERE `entry`=2944;
UPDATE `quest_template` SET `IncompleteEmote`=2, `CompleteEmote`=2, `RequestItemsText`='Ah, at last, you\'ve arrived, $c. I did not lie in my note, $N. We are a special breed also, not unlike the druids or shamans of our tribe. You are just as important. We are the ones called upon to defend our borders, to hunt the centaur, and to go to war.' WHERE `entry`=3091;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=3281;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=3369;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=3376;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='I\'m very busy with my work, $c.  Unless you have something for me, it\'d be best if you moved along...' WHERE `entry`=3921;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Do you have the nugget slugs, $N?  I\'ve been eyeing this Samophlange and I can\'t wait to tinker with it.' WHERE `entry`=3922;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Mind your head!  I don\'t want it to get in the way of my work!' WHERE `entry`=3923;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=4921;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=5041;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5052;
UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5723;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=5724;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='There are a hundred other tasks awaiting my attention, $c. Do you have the books?' WHERE `entry`=5725;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='Do you have the insignia yet, $N?$B$BIt will be a vital tool in infiltrating what I believe is the greatest threat to the Horde, and finally finding peace in our new home.$B$BYou will learn how intricate a web men and orcs alike can weave when they are motivated by greed and power. The hidden agendas, the corruption, all of it will become clear. You will find yourself in the midst of a war you never knew existed.' WHERE `entry`=5726;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Well, $c? Does he believe our ploy, or are things worse than I had first estimated?$B$BProving valuable to Neeru will make our infiltration of the Shadow Council much easier. He will have plenty of information that we can use to route out those who would destroy all we have built in Durotar.' WHERE `entry`=5727;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Have you found them yet, $N? The leaders of the Searing Blade.$B$BI knew the Shadow Council sought to take Orgrimmar and all of the Horde from me, but I hadn\'t realized how quickly they were able to infiltrate the city. So many arms this beast has... we can cut them off until exhaustion sets in, but we will be no further than when we started. I will have to have my spies double their efforts.' WHERE `entry`=5728;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=5761;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=6421;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Hey mon, have you slain the hairy blood feeders? I fear none here in Stonetalon but I don\'t go walking around here at night... if you know what I mean mon!$B$BAs long as I stay off their dinner plate then all is well.$B$BGood luck to you, $c!' WHERE `entry`=6461;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=6548;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Have you killed Grundig Darkcloud and his personal band of Brutes?\n' WHERE `entry`=6629;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Hello, $r. What can I do for you?' WHERE `entry`=6981;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Do you bear news from Warsong Gulch, $N?' WHERE `entry`=8368;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='The battle in Warsong Gulch rages on, $N.  Do your part to drive the Silverwing Sentinels out of our lands!' WHERE `entry`=8389;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='For those adventurers who have but a single commendation signet, I\'ll exchange it for a small amount of recognition with the Gnomeregan Exiles.$B$BPlease bear in mind that it is better to hand over a stack of ten signets at once; your efforts will receive greater recognition in doing so.  We offer a single signet exchange as a service for those who don\'t have enough for a full stack of ten.$B$BWith that being said, I stand ready to assist you if you still wish to hand in a single signet.' WHERE `entry`=8838;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='I accept commendation signets from adventurers who have received them in the line of duty.  For each set of ten that you hand to me, I\'ll make sure that you receive a significant acknowledgement of your deeds with the Gnomeregan Exiles.  I also accept single tokens, but at a much reduced rate of recognition.  We are much more interested in greater feats of duty, though no feat will be ignored.$B$BWith that said, I\'ll gladly take your signets if you are ready to hand in a set.' WHERE `entry`=8839;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8840;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8841;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8844;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8845;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='Yes, mighty $c, I sensed your arrival.  I trust you have more news to report to me about your hunt?' WHERE `entry`=2;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=10;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='Ah - $N - I was just thinking about you!  How goes your hunting?' WHERE `entry`=23;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='Greetings once again, $N!  Have you come to show me proof of your hunt?' WHERE `entry`=24;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='You back already?  What\'s the situation out there - all cleared up now, thanks to you?' WHERE `entry`=25;
UPDATE `quest_template` SET `IncompleteEmote`=5, `RequestItemsText`='You\'re Junior Surveyor $n, yes?  Quickly now, there is a dire situation at hand!  Do you have the insect parts that Fizzledowser said you would?!' WHERE `entry`=82;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=113;
UPDATE `quest_template` SET `IncompleteEmote`=2, `RequestItemsText`='Peace and tranquility be on to you, stranger.  Why have you sought me out this day?' WHERE `entry`=162;
UPDATE `quest_template` SET `CompleteEmote`=25, `RequestItemsText`='If you strive for greater challenges you must first prove yourself with the task at hand.  Return to me after you\'ve killed 10 Stranglethorn Tigers.' WHERE `entry`=186;
UPDATE `quest_template` SET `IncompleteEmote`=25, `CompleteEmote`=25 WHERE `entry`=187;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=188;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=189;
UPDATE `quest_template` SET `CompleteEmote`=25 WHERE `entry`=190;
UPDATE `quest_template` SET `IncompleteEmote`=5, `CompleteEmote`=5, `RequestItemsText`='Go kill 10 panthers!  Show us what you\'ve got!' WHERE `entry`=191;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='What are you doing here, $N!  You should be crawling through the brush, trying to kill 10 Shadowmaw Panthers.  I thought you fancied yourself a big game hunter?' WHERE `entry`=192;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='I never met a hunter who got any kills by standing around the campfire.  Were you planning on killing those Stranglethorn Raptors or were you hoping they would die of old age?' WHERE `entry`=194;
UPDATE `quest_template` SET `IncompleteEmote`=25, `CompleteEmote`=25, `RequestItemsText`='A true hunter sets his focus on his prey.  You, my friend, seem more concerned with chit-chatting around the campfire.  Now get out there and kill 10 Lashtails before I go and rid the entire bloody jungle of them in one hunt.' WHERE `entry`=195;
UPDATE `quest_template` SET `IncompleteEmote`=5, `CompleteEmote`=5, `RequestItemsText`='Bah!  What are you doing standing around, $n!  A true big game hunter never gives up once his prey is in his sights.  Those Jungle Stalkers aren\'t going to come running up to this campfire and throw themselves in it.  Silly $g bloke : lass;.' WHERE `entry`=196;
UPDATE `quest_template` SET `CompleteEmote`=6, `RequestItemsText`='Well? Did you have any luck in locating the camp?' WHERE `entry`=201;
UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=216;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='You appear to have uncovered the wreckage of... a robotic chicken?  The voice from within the egg crackles to life again:$B$B\"Yes, excellent work!  This is indeed my homing robot, though my sensors indicate that it needs a jump start before it can fly back to Booty Bay for repairs.  Go ahead and place the beacon inside the rover.  The beacon will take care of the rest!\"' WHERE `entry`=351;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=493;
UPDATE `quest_template` SET `RequestItemsText`='I remember you, $N.  You were going to help me out in concocting my latest elixir.  I\'ll need that blood before I can bring my own special brand of misery to the inhabitants of Hillsbrad.' WHERE `entry`=501;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=502;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Can you not see I am busy, $c?  The Dark Lady insists on a new plague before the Scourge advance from Northrend overwhelms us.  And with the human threat pressing from the south, time becomes my most precious commodity.  This better be important!' WHERE `entry`=513;
UPDATE `quest_template` SET `IncompleteEmote`=5, `CompleteEmote`=5, `RequestItemsText`='As High Executor of Tarren Mill, under the direct command of Varimathras and the Dark Lady, you are subject to follow my command.$b$bPerhaps you take this war with the Alliance lightly?  If such is the case I should behead you right here and now.  Otherwise, travel west to the town of Hillsbrad and wage battle against the humans, as ordered.$b$bDismissed.' WHERE `entry`=527;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=545;
UPDATE `quest_template` SET `RequestItemsText`='Have you recovered Helcular\'s Rod yet?  There are so many Yeti in this region, it will be very difficult to locate.  But we must have it in order to proceed.' WHERE `entry`=552;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=553;
UPDATE `quest_template` SET `RequestItemsText`='Hello, $N.  Elementals are tough quarry, but I know you\'re up to the task.  Do you have those bracers of binding?' WHERE `entry`=557;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=567;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=568;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Have you made any progress with the ogres of the Mizjah Ruins yet, $c?' WHERE `entry`=569;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=570;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Drizzlik\'s Excelsior leather boots, finest workmanship, one-hundred percent high quality saltwater crocolisk skin boots. None finer!$b$bCan\'t beat a glowing description like that, can you?$b$bExcept, maybe, if you have those skins for me?' WHERE `entry`=577;
UPDATE `quest_template` SET `RequestItemsText`='$C.  Show me you have made prey of the Bloodscalp tribe.$B$BShow me your trophies.' WHERE `entry`=581;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='$N.  I fear for our chief\'s son.  Do you have the shrunken heads so I may inspect them?' WHERE `entry`=582;
UPDATE `quest_template` SET `RequestItemsText`='The Bloodscalps will one day be crushed by the Darkspears!  Do you have the necklaces of our doomed foe?' WHERE `entry`=596;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='This is the Stone of Inner Binding.  It is the strongest of the binding stones and must be unlocked for the others to open.' WHERE `entry`=651;
UPDATE `quest_template` SET `RequestItemsText`='Once-cursed blood still runs through my veins, $n. If someone... something is summoning demons, it must be stopped.' WHERE `entry`=671;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='I have not the time to sharpen my axe, let alone leave the outpost to slay those beasts that would try and slay my kin.$B$BYou do not seem to have the experience of a grunt let alone a full-fledged $c, what do you want, $N?' WHERE `entry`=676;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=677;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=678;
UPDATE `quest_template` SET `RequestItemsText`='Returned again have you? Indeed there is nothing more I could wish for now than more of Tor\'gan\'s pity.$b$bWhat have you for me this time? Perhaps a piece of brightly colored string? Or a length of rope to end this misery of mine...' WHERE `entry`=702;
UPDATE `quest_template` SET `IncompleteEmote`=11, `RequestItemsText`='Ah, hello there.  I spend a great deal of time studying the water - all the elements really - so much so that sometimes I don\'t even notice people around me.$B$BIs there something I can help you with?' WHERE `entry`=824;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=849;
UPDATE `quest_template` SET `RequestItemsText`='What is it, $c? You look concerned.' WHERE `entry`=939;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=992;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1013;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Perhaps I was not explicit in my orders, $c. I want High Inquisitor Whitemane killed once and for all. And while you\'re at it, take out her top brass as well.$b$bKill that zealot, Scarlet Commander Mograine. Lay waste to Herod, the Scarlet Champion. And slaughter Houndmaster Loksey and his filthy mutts too.$b$bNow begone!' WHERE `entry`=1048;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=1049;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=1051;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1087;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1096;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1102;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='Hi hi hi!  Did you get that venom??' WHERE `entry`=1104;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='My brother is making progress with his new fuel design, and that has me worried.  I need to start work on a tortoise shell fuel tank as soon as possible!$B$B$N, do you have those shells yet?' WHERE `entry`=1105;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=1109;
UPDATE `quest_template` SET `RequestItemsText`='$N, have you been out into the Flats?  Did you bring back that load of parts I wanted?' WHERE `entry`=1110;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Speak up!  Tell me, are you dropping off or picking up?' WHERE `entry`=1111;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=1113;
UPDATE `quest_template` SET `RequestItemsText`='You have something for me?  That\'s great!  let\'s see it!' WHERE `entry`=1114;
UPDATE `quest_template` SET `RequestItemsText`='Have you been to the Alterac Mountains, $N?  Did you face the elusive Frostmaw?' WHERE `entry`=1136;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='I envy you, $c. You have the look of someone who\'s been outside the walls of Orgrimmar for a while.$B$BI myself would travel in the name of the Warchief if Thrall didn\'t have need of my skills here in the city. But he leads us well, and I trust his judgement--I remain here for as long as he needs me.' WHERE `entry`=1145;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='War brings my group and I to the Shimmering Flats, $c. What brings you here?' WHERE `entry`=1146;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1147;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1148;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1149;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='You must be prepared spiritually, physically and mentally for the challenges that lie ahead of you.$B$BToo often do we rush forward before we are ready. I consider it my duty to the youth, no matter which tribe they belong to, to prepare them for the dangers they may face after they leave the sanctity of their home.' WHERE `entry`=1150;
UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=1164;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1 WHERE `entry`=1175;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1176;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1182;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='$n! Did you manage to track down the fuel regulator?' WHERE `entry`=1183;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1187;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1196;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1197;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=1221;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1251;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1269;
UPDATE `quest_template` SET `RequestItemsText`='How is your collection of ears, $N?  Large?' WHERE `entry`=1366;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1434;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Where is Tooga?' WHERE `entry`=1560;
UPDATE `quest_template` SET `RequestItemsText`='Do you have the items, $N?  Gathering them is the proof I need that you have the strength to face Cyclonian.' WHERE `entry`=1712;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=1719;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1918;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=2581;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=2583;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Where are the organs, $N!?\n' WHERE `entry`=2585;
UPDATE `quest_template` SET `IncompleteEmote`=25, `CompleteEmote`=25 WHERE `entry`=2603;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=2661;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=2741;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=2801;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=2943;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='This familiar looking pedestal sticks out of the hot sand.  Perhaps there is something to its presence here...' WHERE `entry`=2946;
UPDATE `quest_template` SET `IncompleteEmote`=3, `CompleteEmote`=3, `RequestItemsText`='Welcome back $n.  Were you able to use the discs to your advantage, or did it end up being a wild goose chase?' WHERE `entry`=2977;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=3362;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=3444;
UPDATE `quest_template` SET `IncompleteEmote`=4, `CompleteEmote`=4 WHERE `entry`=3449;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=3461;
UPDATE `quest_template` SET `IncompleteEmote`=14 WHERE `entry`=3601;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=3701;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=3702;
UPDATE `quest_template` SET `RequestItemsText`='Ah yes, the dirt.  The Arch Druid wants twenty loads per adventurer, and twenty loads he shall get.  Let those who conspire against us fall to the wayside!' WHERE `entry`=3764;
UPDATE `quest_template` SET `IncompleteEmote`=2, `RequestItemsText`='Peace and serenity be yours, friend.  You are here on business from the Arch Druid himself, yes?' WHERE `entry`=3781;
UPDATE `quest_template` SET `IncompleteEmote`=5, `CompleteEmote`=5, `RequestItemsText`='There is not nearly enough blood on your uniform, soldier!\n' WHERE `entry`=3823;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=3824;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=3825;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1 WHERE `entry`=3882;
UPDATE `quest_template` SET `IncompleteEmote`=3 WHERE `entry`=3884;
UPDATE `quest_template` SET `RequestItemsText`='Possessing a Cenarion beacon allows one to see a corrupted soul shard on those tainted beasts that are put down for the greater good.  I grind shards into a usable reagent that goes into making Cenarion plant salve.  We will use that salve to turn corrupted plants into healthy ones again.$B$BIn exchange for these shards, I will give you some Cenarion plant salves I have already prepared.' WHERE `entry`=4103;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=4182;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=4183;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=4184;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=4186;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='You have found a sickly, corrupted version of what appears to be a windblossom plant.  The berries that hang from the plant appear rotten and poisonous.  It desperately needs some sort of attention if it is to be turned back to normal.' WHERE `entry`=4221;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=4224;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=4264;
UPDATE `quest_template` SET `IncompleteEmote`=0, `CompleteEmote`=0 WHERE `entry`=4267;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4282;
UPDATE `quest_template` SET `IncompleteEmote`=22, `CompleteEmote`=22 WHERE `entry`=4283;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=4285;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4286;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=4287;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=4288;
UPDATE `quest_template` SET `RequestItemsText`='Do not let fear overpower you, $N. Fear is the great betrayer... you must remain strong!$B$BTake the meat, place it in the small valley, and then use the gland on it. Only then will death come for you.' WHERE `entry`=4292;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Do you have the writings of the Seven, $N?  Have you learned the secrets from their tablet?' WHERE `entry`=4296;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=4421;
UPDATE `quest_template` SET `IncompleteEmote`=0 WHERE `entry`=4441;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='You have found a sickly, corrupted version of what appears to be a night dragon plant.  The fruits that hang from the plant appear rotten and poisonous.  It desperately needs some sort of attention if it is to be turned back to normal.' WHERE `entry`=4462;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='You have found a sickly, corrupted version of what appears to be a windblossom plant.  The berries that hang from the plant appear rotten and poisonous.  It desperately needs some sort of attention if it is to be turned back to normal.' WHERE `entry`=4466;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='Finding a suitable scent gland might take a bit - the gland can\'t be damaged, but the process of getting one certainly doesn\'t lend itself to it.  As for the soil, I\'d assume it should be easy enough to find.$B$BAnyway, do you have the items I need to make the lure?' WHERE `entry`=4496;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=4501;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1 WHERE `entry`=4503;
UPDATE `quest_template` SET `IncompleteEmote`=4 WHERE `entry`=4504;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='What do you want, $c? An urgent message - for me?\n' WHERE `entry`=4542;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=4701;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='Do you have the broodling essence, $N?  I can\'t wait to study it.$B$BAnd besides that... my patron is not the type of person you want to disappoint.' WHERE `entry`=4726;
UPDATE `quest_template` SET `RequestItemsText`='Do you have the clasp, $N?  My patron will pay very handsomely for it.' WHERE `entry`=4764;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=4767;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='It\'s cold up here!  I hope you brought me a blanket!' WHERE `entry`=4808;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4821;
UPDATE `quest_template` SET `RequestItemsText`='Come now $N, I know you haven\'t killed your share yet. Hunt them down, and I shall give you a reward for my gratitude.\n' WHERE `entry`=4841;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=4842;
UPDATE `quest_template` SET `IncompleteEmote`=18, `CompleteEmote`=18 WHERE `entry`=4906;
UPDATE `quest_template` SET `RequestItemsText`='The time trinkets I seek are simple devices.  They are watches mainly, and their hands are trapped forever when the plague first ravaged Andorhal.$B$BTime is never ending, and the watches you bring to me will invariably find themselves counted out back to their homes... that is, so long as the disturbances continue here.' WHERE `entry`=4972;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=4984;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='I hear your footsteps, $N.  My vision has faded from me, but I still am able to sense things around me.  Have you ended the misery of the disease-ridden grizzlies?' WHERE `entry`=4985;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='On behalf of the Cenarion Circle, I bid you welcome to this enclave, $c.  What business do you have with us?' WHERE `entry`=4986;
UPDATE `quest_template` SET `IncompleteEmote`=2, `CompleteEmote`=2, `RequestItemsText`='Welcome to the office of the Stormwind census.  If you are in need of information on our populace, then I can assist you.' WHERE `entry`=5022;
UPDATE `quest_template` SET `IncompleteEmote`=25, `CompleteEmote`=25 WHERE `entry`=5048;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='John, sweetheart... is that you?  I\'m so cold all the sudden...' WHERE `entry`=5050;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='The door to the outhouse has begun to splinter at the edges of the frame as though it has been repeatedly and incessantly tried to be forced open.  It is currently locked up tight from the outside of the outhouse.$B$BAs you rattle the door, you hear a guttural moaning come from inside!  Whatever is inside there, it certainly does not sound friendly.' WHERE `entry`=5059;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='An extremely sturdy cabinet stands before you, securely fastened shut by a built-in lock.  The front of the cabinet is deeply scratched and marked.  This could be surmised as being from numerous and violent failed attempts to reveal whatever secrets the cabinet currently obfuscates from view.$B$BIf you are going to open this cabinet, you will need to find the key.' WHERE `entry`=5060;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='So, Motega Firemain sends word of Arikara...well now that is grave news.$B$B<Magatha looks around.>$B$BArikara is a deadly creature born only to seek vengeance against those who have committed heinous acts.$B$B<Magatha smiles.>' WHERE `entry`=5062;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5064;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5082;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5083;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=5085;
UPDATE `quest_template` SET `IncompleteEmote`=0 WHERE `entry`=5087;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5088;
UPDATE `quest_template` SET `CompleteEmote`=25 WHERE `entry`=5092;
UPDATE `quest_template` SET `RequestItemsText`='Once the towers are marked, they\'ll become top priority targets for our attack on Andorhal.  I suspect that once we neutralize the towers, the main threat of Andorhal will emerge.  From that point on, we\'ll have a straight-up fight for control of the city!$B$BYou\'re back to report success, yes?  Don\'t forget the beacon torch as well; we must maintain control of our materiel.' WHERE `entry`=5097;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5121;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='The power of this chapel gives me the strength to resist the corruption in my heart.  If I leave it, I will become a death knight.   But there is a medallion, the medallion of faith, that will give me the strength I need to leave.$B$BPlease, $N, retrieve the medallion.  It is guarded by Malor the Zealous, a crazed member of the Scarlet Brotherhood who resides deep in the Scarlet Bastion in western Stratholme.' WHERE `entry`=5122;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='There is something timely about your visit.  You\'re not from the future, are you?' WHERE `entry`=5153;
UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5155;
UPDATE `quest_template` SET `RequestItemsText`='Once we have the waters from the Moon Well, we will purify it and use it to extinguish the braziers of protection within Shadow Hold. That should allow me ample time to see into the chambers even deeper and discern who actually leads this... cult.$B$BI pray the Earthmother is with us.' WHERE `entry`=5157;
UPDATE `quest_template` SET `IncompleteEmote`=2 WHERE `entry`=5158;
UPDATE `quest_template` SET `IncompleteEmote`=2 WHERE `entry`=5159;
UPDATE `quest_template` SET `IncompleteEmote`=11, `CompleteEmote`=11 WHERE `entry`=5163;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='I begin to wonder if I\'ll ever escape this cage.$B$BIt\'s only a matter of time before they sacrifice me to whatever demons they worship. The monsters!' WHERE `entry`=5202;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='You\'ve come from the west?  How fare the rest of Lordaeron?  I know that Andorhal is lost, but has the Scourge yet reached fair Tirisfal?' WHERE `entry`=5210;
UPDATE `quest_template` SET `CompleteEmote`=5, `RequestItemsText`='The poor defenders of Darrowshire cry out to me in my dreams, $N.  You must free them!' WHERE `entry`=5211;
UPDATE `quest_template` SET `RequestItemsText`='I can\'t take it, $N! You gotta help me! I\'m dying!\n' WHERE `entry`=5214;
UPDATE `quest_template` SET `RequestItemsText`='An access panel to the cauldron remains securely fastened.  In order to open it, you will need to find the key.\n' WHERE `entry`=5216;
UPDATE `quest_template` SET `IncompleteEmote`=3 WHERE `entry`=5217;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='An access panel to the cauldron remains securely fastened.  In order to open it, you will need to find the key.' WHERE `entry`=5219;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='We know that each cauldron employs a different mix of reagents to generate its plague-inducing toxin; likewise, we know that we will need to develop a counter agent that is unique for each cauldron.  Your sample from Dalson\'s Tears will be the key to figure out that cauldron\'s distinct reagent requirement. ' WHERE `entry`=5220;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='An access panel to the cauldron remains securely fastened.  In order to open it, you will need to find the key.' WHERE `entry`=5222;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5223;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5225;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Gahrron\'s Withering houses the last cauldron here in the west that we need access to.  Once we have a sample of the plague it spews forth, we will be able to introduce our reagents into the environment through four separate vessels!  The Scourge will be hard pressed to keep us out of all four, even with the power of Kel\'Thuzad behind them.' WHERE `entry`=5226;
UPDATE `quest_template` SET `RequestItemsText`='Be wary, not all supply crates will have survived the destruction of the city. The Scourge dare not touch the water but surely the holy water will not prevent vermin infestations.\n' WHERE `entry`=5243;
UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=5251;
UPDATE `quest_template` SET `IncompleteEmote`=25, `CompleteEmote`=25 WHERE `entry`=5282;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='What news have you, $c!  Ah - a message from my brother you say?  Well then, hand over the report!' WHERE `entry`=5361;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5386;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5421;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5501;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='Well, $N? Where is the rune? You are a good employee, right? You\'re here to help?$B$BDon\'t make me think twice about paying you what we agreed upon. What? Oh, we didn\'t agree on anything? Oh, great... then take your time--just know that it\'ll be a lot less if you take a long time.' WHERE `entry`=5534;
UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=5542;
UPDATE `quest_template` SET `CompleteEmote`=1 WHERE `entry`=5544;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5561;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Do you have the Sceptre of Light?\n' WHERE `entry`=5741;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='Sit, $c.  Soon enough you\'ll strike back into the jungle.' WHERE `entry`=5763;
UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=5781;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5881;
UPDATE `quest_template` SET `RequestItemsText`='Possessing a Cenarion beacon allows one to see a corrupted soul shard on those tainted beasts that are put down for the greater good.  I grind shards into a usable reagent that goes into making Cenarion plant salve.  We will use that salve to turn corrupted plants into healthy ones again.$B$BIn exchange for these shards, I will give you some Cenarion plant salves I have already prepared.' WHERE `entry`=5882;
UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=6004;
UPDATE `quest_template` SET `IncompleteEmote`=5, `RequestItemsText`='Did you find the hideout, $N?  Did you take care of Zaeldarr?' WHERE `entry`=6021;
UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=6023;
UPDATE `quest_template` SET `RequestItemsText`='It\'s a dangerous task, $N. I envy your courage.' WHERE `entry`=6025;
UPDATE `quest_template` SET `RequestItemsText`='Trust ol\' Smokey, $r. The reward will be worth it. These Argent Dawn folk don\'t mess around when it comes to payment.\n' WHERE `entry`=6026;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Ah, $n!  It\'s good to see you again.  Do you have the Book of the Ancients?\n' WHERE `entry`=6027;
UPDATE `quest_template` SET `IncompleteEmote`=66, `RequestItemsText`='Greetings, $c.  On behalf of the Argent Dawn, I offer you safety and shelter while you are here at Chillwind Camp.  I might also have some work for you...' WHERE `entry`=6028;
UPDATE `quest_template` SET `IncompleteEmote`=2, `RequestItemsText`='May the Light guide you in these troubling times, $c.  What brings you here to this beacon of hope in the middle of darkness and despair?' WHERE `entry`=6030;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=6142;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=6143;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=6161;
UPDATE `quest_template` SET `RequestItemsText`='Do you have my receipt book?  I can\'t wait to get back to business!' WHERE `entry`=6164;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=6185;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Bloodfury Ripper is a nasty creature! You will have success finding her along the western hill line in the Charred Vale.$B$BThe bloodfuries will be helpless with out... surely we can vanquish them forever!' WHERE `entry`=6283;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='The continuous destruction caused by war and those that seek a profit from lumber pains me deeply. To aid the cycle of rebirth and replenish the lands, I need Gaea seeds. Do you have them, $c?' WHERE `entry`=6301;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='These seeds you plant are strong, resisting corruption, and making a foothold for other life. They will grow and grow, first preventing corruption and healing the scarred land, and then one day, restoring Stonetalon to a lush forest, once again.$B$BHave you planted all of the Gaea seeds?' WHERE `entry`=6381;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=6389;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=6393;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=6441;
UPDATE `quest_template` SET `IncompleteEmote`=14 WHERE `entry`=6462;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='I sense an aura of evil radiating from you, $r. What could you hold that emits such an aura?\n' WHERE `entry`=6501;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='The flow of time does not stop or slow, $r. While my life is eternal, yours is not. Waste not the time that you have...' WHERE `entry`=6502;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=6503;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=6522;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=6561;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=6563;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=6564;
UPDATE `quest_template` SET `IncompleteEmote`=5, `CompleteEmote`=5 WHERE `entry`=6565;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='I hope you can come through with the supplies! I\'m in big trouble if I don\'t deliver them soon!' WHERE `entry`=6571;
UPDATE `quest_template` SET `IncompleteEmote`=4, `CompleteEmote`=4 WHERE `entry`=6581;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=6641;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=6921;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7027;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Beware the harpies of the region, $c. They\'ll not think twice to rip out your throat!' WHERE `entry`=7162;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Most do not live long enough to rise above their own mediocrity. You have proven yourself to be an exemplary soldier, $c. The time has come.$B$BPresent your insignia.' WHERE `entry`=7168;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7169;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7282;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=7301;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=7848;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8053;
UPDATE `quest_template` SET `IncompleteEmote`=5, `CompleteEmote`=5 WHERE `entry`=8054;
UPDATE `quest_template` SET `RequestItemsText`='Today between 2pm and 4pm we have a contest to determine who the greatest angler of them all is!   Just be the FIRST PERSON to bring me 40 Tastyfish fished from the Tastyfish schools found along the coast of Stranglethorn before anyone else does and you will be declared the Master Angler! $B$B If you are not the first person to bring me 40 fish, my apprentice here will still reward you with money for each 5 Tastyfish you bring her.$B$B Oh, and don\'t delay, Tastyfish go bad quickly!\n' WHERE `entry`=8193;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Even though we already have a contest winner, I will still buy your Tastyfish from you at a reasonable price.   Whadda ya say!' WHERE `entry`=8194;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='I seek the Paragons of Power known as the Coins of the Tribes.  They are the currency used by the various denizens of Zul\'Gurub, and each is imbued with subtle but powerful mojo.$B$BThere are nine distinct kinds to be found.  Some are sought after by my compatriots for various armors they offer Zandalar heroes.  Should you have any extra, I will trade you one of our Honor Tokens for a set of three.  You may use the Tokens with Rin\'wosho the Trader; he offers our heroes special items for them.' WHERE `entry`=8195;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8201;
UPDATE `quest_template` SET `RequestItemsText`='*Whir* *Click*$B$B  I seek rare fish for Fishmaster Bluegill to catalogue.   If you bring me a Keefer\'s Angelfish, I will provide you with this fine reward. $B$B *Zzzap* *Whir*' WHERE `entry`=8221;
UPDATE `quest_template` SET `RequestItemsText`='*Whir* *Click*$B$B  I seek rare fish for Fishmaster Bluegill to catalogue.   If you bring me a Dezian Queenfish, I will provide you with this fine reward. $B$B *Zzzap* *Whir*' WHERE `entry`=8224;
UPDATE `quest_template` SET `RequestItemsText`='*Whir* *Click*$B$B  I seek rare fish for Fishmaster Bluegill to catalogue.   If you bring me a Brownell\'s Blue Striped Racer, I will provide you with this fine reward. $B$B *Zzzap* *Whir*' WHERE `entry`=8225;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='I seek the Paragons of Power known as the Coins of the Tribes.  They are the currency used by the various denizens of Zul\'Gurub, and each is imbued with subtle but powerful mojo.$B$BThere are nine distinct kinds to be found.  Some are sought after by my compatriots for various armors they offer Zandalar heroes.  Should you have any extra, I will trade you one of our Honor Tokens for a set of three.  You may use the Tokens with Rin\'wosho the Trader; he offers our heroes special items for them.' WHERE `entry`=8238;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='I seek the Paragons of Power known as the Coins of the Tribes.  They are the currency used by the various denizens of Zul\'Gurub, and each is imbued with subtle but powerful mojo.$B$BThere are nine distinct kinds to be found.  Some are sought after by my compatriots for various armors they offer Zandalar heroes.  Should you have any extra, I will trade you one of our Honor Tokens for a set of three.  You may use the Tokens with Rin\'wosho the Trader; he offers our heroes special items for them.' WHERE `entry`=8239;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Have you destroyed the bijou at the Altar of Zanza?  Do so, and then you will be doubly blessed by Zanza!' WHERE `entry`=8240;
UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=8286;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8288;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='You\'ve come back with news from Arathi, $c?' WHERE `entry`=8370;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='How are yer travels faring $g laddie:lass;?' WHERE `entry`=8371;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Ah, $N.  I hope you continue to lend your experience to the different battlefronts.  A lot of our lads and lasses in the field look up to seasoned veterans like you.' WHERE `entry`=8385;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='The war against the Alliance scum demands resources, $N! We cannot allow our stockpiles to run dry in the middle of a battle.  Continue to ensure Arathi Basin remains in our hands! ' WHERE `entry`=8390;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='The war against the Horde is quickly depleting our supplies, $N.  It is vital to maintain control of Arathi Basin to keep the stream of resources flowing!  Have you lent a hand in Arathi yet?' WHERE `entry`=8398;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Don\'t forget the fight for Warsong Gulch is about more than just protecting trees.  It\'s about keeping a natural barrier between Ashenvale and the Barrens.  Do you bring any news from the battlefield, $N?' WHERE `entry`=8408;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=8414;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=8416;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=8418;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='The battle in Warsong Gulch rages on, $N.  Do your part to drive the Silverwing Sentinels out of our lands!' WHERE `entry`=8431;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='The battle in Warsong Gulch rages on, $N.  Do your part to drive the Silverwing Sentinels out of our lands!' WHERE `entry`=8432;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='The war against the Alliance scum demands resources, $N! We cannot allow our stockpiles to run dry in the middle of a battle.  Continue to ensure Arathi Basin remains in our hands! ' WHERE `entry`=8440;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Keep at it, $N.  If you are to earn our trust, you will need to prove yourself to us.' WHERE `entry`=8460;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Once you gain the trust of the Timbermaw, I am confident there will be something we will be able to do for you.  The Timbermaw do not forget their allies, especially in dark times such as these.' WHERE `entry`=8461;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='We very much appreciate what you have done for the Timbermaw, $N.  Your continued efforts will surely earn my tribe\'s trust and respect.' WHERE `entry`=8464;
UPDATE `quest_template` SET `CompleteEmote`=1 WHERE `entry`=8466;
UPDATE `quest_template` SET `CompleteEmote`=1 WHERE `entry`=8467;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8469;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Yes $c, what can I assist you with?  You walk among us peacefully, though there is assuredly something amiss.  I sense something... something troubling...' WHERE `entry`=8470;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='$C - you approach us in a peaceful manner, but I sense that you are here on matters that are grave and severe... for both furbolg and $r alike.  What have you come to tell us?' WHERE `entry`=8471;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8492;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Back again, $c? Outstanding! The bars you\'ve provided thus far are really going to help out in making all sorts of things for the war. I know, for example, that the copper is going to be used for parts of the steam tanks that are being built, as well as in a small fleet of gyrocopters that we\'re planning to deploy if time allows.$B$BDon\'t let the stacks here fool you though, we still need more copper bars if you can procure them for the Ahn\'Qiraj war effort.  Will you help us out?' WHERE `entry`=8493;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8494;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Back so soon? Stop making me re-evaluate my low opinion of you, $c, you\'re making me feel all gooey inside. So, as you can tell we still don\'t have enough iron bars for all of the weapons, armor, steam tanks and whatnot that need building for the bug hunt. Think you have it in you to bring back another stack of twenty iron bars in between all of those trips to Zul\'Gurub, or wherever it is that you kids hang out these days?' WHERE `entry`=8495;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8503;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Well hello again there... what was it? Ah yes, $N! Come to see if I still need more stranglekelp have you? Well, it\'s your lucky day, because the answer to that very important question is a very affirmative YES! Think you could gather up twenty more?' WHERE `entry`=8504;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8505;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Welcome back, $c. Our collection grows, but even now we have a need for additional purple lotus. If it is still within your power to gather more of the herb, I entreat you to do so and return them to me here.' WHERE `entry`=8506;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='What\'s that? Speak up, $c! Have you got that shipment of Arthas\' Tears I asked for?' WHERE `entry`=8509;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8511;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8512;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Yes $g sir : ma\'am;, I remember you. Is that the medium leather you have with you there?' WHERE `entry`=8513;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Yes $g sir : ma\'am;, looks like we\'ve collected many pieces of medium leather, but we need more. I can assure you that it will all be put to good use; not one piece will get wasted. I know it\'s a lot to ask, but if you\'re still willing, I could use your help in attempting to put a dent in the rest of my quota.' WHERE `entry`=8514;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Is that the thick leather you have there in your pack, $c? Is it? I can\'t wait for you to hand it over! Everyone is going to be so pleased with us don\'t you think?' WHERE `entry`=8515;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8516;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Do you have the twenty linen bandages that I require, $c?' WHERE `entry`=8517;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8518;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Hello, $c, have you been able to get those twenty silk bandages yet?' WHERE `entry`=8520;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8521;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8522;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='So it is that we come to discuss pressing matters yet again, $c. Once more I thank you for your previous efforts; it is not everyone who would give so selflessly. But there is still more work to do.$B$B$N, will you once more collect runecloth bandages and return them to me here?' WHERE `entry`=8523;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='I\'m willing to lay odds that you\'ve returned with all of that rainbow fin albacore we were talking about before, right, $c?' WHERE `entry`=8524;
UPDATE `quest_template` SET `IncompleteEmote`=5, `CompleteEmote`=5, `RequestItemsText`='What! You again? Well I\'ll be a monkey\'s uncle... except that I\'m a gnome. Slicky Gastronome to be precise! So you\'re back to help out again, eh? Well, I can\'t say as I blame you. Don\'t you just love the smell of all of that food? <drool>$B$BEnough loitering! Get out there and bring me back more rainbow fin albacore!' WHERE `entry`=8525;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8526;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Hi again, $c. I can tell you\'re very excited about all of this. So I suppose you want to bring me another twenty roast raptor? Great. Well you do that. I guess I\'ll see you when you get back.' WHERE `entry`=8527;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=8528;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='I hope that\'s the twenty copper bars you have there with you, $c.' WHERE `entry`=8532;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='How many tin bars do you have there, $c? After the war I think I\'m going to need someone to teach me how to count.' WHERE `entry`=8542;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Back so soon with the peacebloom, $c?' WHERE `entry`=8549;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='We sense the presence of our enslaved brethren deeper inside Ahn\'Qiraj; yet not even an army of dragons would be enough to rescue them, $r.$B$BThe same spell that imprisoned them would place us firmly under C\'Thun\'s control should we come any closer to him.$B$BThe Old God has foreseen our arrival.  All hope is lost.  What difference could a mere mortal like you possibly make?' WHERE `entry`=8579;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='You not want to make Pele\'keiki mad. You make Pele\'keiki happy by bringing him lots of firebloom, real soon.' WHERE `entry`=8580;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Returned already with the purple lotus that I have requested, $c? It is critical that you do so in as timely as fashion as possible lest all that I am attempting here come to naught.' WHERE `entry`=8582;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='In fact it does appear that we are in need of even more purple lotus, $c. While my own studies have yet to determine a new useful application for the herb, there are tried and true methodologies yet to be employed.$B$BI need you to once again go out into the field and collect at least twenty purple lotus samples. Return them to me here.' WHERE `entry`=8583;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='I\'ve got no time for games if you\'re just here to jibber-jabber, $c. There are too many stacks of heavy leather that need curing. Come back when you have at least ten for me.' WHERE `entry`=8588;
UPDATE `quest_template` SET `IncompleteEmote`=5, `CompleteEmote`=5, `RequestItemsText`='It\'s true, $c, I still need more heavy leather. The requests from the generals and their quartermasters seem endless. And that\'s nothing compared to what the zeppelin masters are asking for!$B$BI need to get my quota collected on the double. $N, bring me more stacks of heavy leather as soon as you can!' WHERE `entry`=8589;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8590;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='$C, as you can see I still need to gather up more thick leather. Once again I ask your help with this task, and promise that if you complete it, you will be recognized for your efforts.$B$BTime is of the essence! Return to me with the thick leather so that we can finish our preparations and go to war, $g hero : heroine;!' WHERE `entry`=8591;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Killing one Qiraji lord is a notable accomplishment for a mortal, $N.  They are however, numerous and powerful.  Continue to defeat them to prove your worth as our champion.' WHERE `entry`=8595;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8600;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Preparations for the impending war at Ahn\'Qiraj are proceeding, $c. However, to ensure that we do not fall behind, or at least that I am not the one that causes us to fall behind, I want for you to bring back another stack of rugged leather. Your prompt attention to this matter will be greatly appreciated, $N.' WHERE `entry`=8601;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Ah, $c, have you returned so quickly with the wool bandages?' WHERE `entry`=8604;
UPDATE `quest_template` SET `IncompleteEmote`=5, `CompleteEmote`=5, `RequestItemsText`='Do not fail and make me look bad, $c! Return here as quickly as possible with the mageweave bandages we discussed.' WHERE `entry`=8607;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='You returned? Interesting. As you can see I am still collecting for the Ahn\'Qiraj \'war effort\'. Which means that I need you to once again go out and collect a stack of mageweave bandages for me. I look forward to your return, $c.' WHERE `entry`=8608;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='The war comes soon, I think, $c. I thank you for your time and effort devoted to helping with our gathering tasks. Do you return because you have obtained the runecloth bandages that we spoke of before?' WHERE `entry`=8609;
UPDATE `quest_template` SET `IncompleteEmote`=5, `CompleteEmote`=5, `RequestItemsText`='Back with those lean wolf steaks so soon, $c? I don\'t care if they\'re overcooked or tartar, just make sure they\'re tasty and get them to me quick!' WHERE `entry`=8611;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='As you can see, $c, we still need to pack away more food for the soldiers. I don\'t know if you\'ve ever been in a war before, but once you get past the initial shock of the battlefield, you can get pretty hungry.  You did a good job last time, so I expect that you\'ll do as well, if not a little quicker, in getting me another stack of those lean wolf steaks.' WHERE `entry`=8612;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=8627;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Did you bring me the components I asked for, $N?' WHERE `entry`=8628;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=8629;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=8630;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=8655;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='For those adventurers who have but a single commendation signet, I\'ll exchange it for a small amount of recognition with Darnassus.$B$BPlease bear in mind that it is better to hand over a stack of ten signets at once; your efforts will receive greater recognition in doing so.  We offer a single signet exchange as a service for those who don\'t have enough for a full stack of ten.$B$BWith that being said, I stand ready to assist you if you still wish to hand in a single signet.' WHERE `entry`=8811;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='For those adventurers who have but a single commendation signet, I\'ll exchange it for a small amount of recognition with the Gnomeregan Exiles.$B$BPlease bear in mind that it is better to hand over a stack of ten signets at once; your efforts will receive greater recognition in doing so.  We offer a single signet exchange as a service for those who don\'t have enough for a full stack of ten.$B$BWith that being said, I stand ready to assist you if you still wish to hand in a single signet.' WHERE `entry`=8812;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='For those adventurers who have but a single commendation signet, I\'ll exchange it for a small amount of recognition with Ironforge.$B$BPlease bear in mind that it is better to hand over a stack of ten signets at once; your efforts will receive greater recognition in doing so.  We offer a single signet exchange as a service for those who don\'t have enough for a full stack of ten.$B$BWith that being said, I stand ready to assist you if you still wish to hand in a single signet.' WHERE `entry`=8813;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='For those adventurers who have but a single commendation signet, I\'ll exchange it for a small amount of recognition with Stormwind.$B$BPlease bear in mind that it is better to hand over a stack of ten signets at once; your efforts will receive greater recognition in doing so.  We offer a single signet exchange as a service for those who don\'t have enough for a full stack of ten.$B$BWith that being said, I stand ready to assist you if you still wish to hand in a single signet.' WHERE `entry`=8814;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='For those adventurers who have but a single commendation signet, I\'ll exchange it for a small amount of recognition with Orgrimmar.$B$BPlease bear in mind that it is better to hand over a stack of ten signets at once; your efforts will receive greater recognition in doing so.  We offer a single signet exchange as a service for those who don\'t have enough for a full stack of ten.$B$BWith that being said, I stand ready to assist you if you still wish to hand in a single signet.' WHERE `entry`=8815;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='For those adventurers who have but a single commendation signet, I\'ll exchange it for a small amount of recognition with the Darkspear tribe.$B$BPlease bear in mind that it is better to hand over a stack of ten signets at once; your efforts will receive greater recognition in doing so.  We offer a single signet exchange as a service for those who don\'t have enough for a full stack of ten.$B$BWith that being said, I stand ready to assist you if you still wish to hand in a single signet.' WHERE `entry`=8816;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='For those adventurers who have but a single commendation signet, I\'ll exchange it for a small amount of recognition with the Undercity.$B$BPlease bear in mind that it is better to hand over a stack of ten signets at once; your efforts will receive greater recognition in doing so.  We offer a single signet exchange as a service for those who don\'t have enough for a full stack of ten.$B$BWith that being said, I stand ready to assist you if you still wish to hand in a single signet.' WHERE `entry`=8817;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='For those adventurers who have but a single commendation signet, I\'ll exchange it for a small amount of recognition with Thunder Bluff.$B$BPlease bear in mind that it is better to hand over a stack of ten signets at once; your efforts will receive greater recognition in doing so.  We offer a single signet exchange as a service for those who don\'t have enough for a full stack of ten.$B$BWith that being said, I stand ready to assist you if you still wish to hand in a single signet.' WHERE `entry`=8818;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='I accept commendation signets from adventurers who have received them in the line of duty.  For each set of ten that you hand to me, I\'ll make sure that you receive a significant acknowledgement of your deeds with Darnassus.  I also accept single tokens, but at a much reduced rate of recognition.  We are much more interested in greater feats of duty, though no feat will be ignored.$B$BWith that said, I\'ll gladly take your signets if you are ready to hand in a set.' WHERE `entry`=8819;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='I accept commendation signets from adventurers who have received them in the line of duty.  For each set of ten that you hand to me, I\'ll make sure that you receive a significant acknowledgement of your deeds with the Gnomeregan Exiles.  I also accept single tokens, but at a much reduced rate of recognition.  We are much more interested in greater feats of duty, though no feat will be ignored.$B$BWith that said, I\'ll gladly take your signets if you are ready to hand in a set.' WHERE `entry`=8820;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='I accept commendation signets from adventurers who have received them in the line of duty.  For each set of ten that you hand to me, I\'ll make sure that you receive a significant acknowledgement of your deeds with Ironforge.  I also accept single tokens, but at a much reduced rate of recognition.  We are much more interested in greater feats of duty, though no feat will be ignored.$B$BWith that said, I\'ll gladly take your signets if you are ready to hand in a set.' WHERE `entry`=8821;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='I accept commendation signets from adventurers who have received them in the line of duty.  For each set of ten that you hand to me, I\'ll make sure that you receive a significant acknowledgement of your deeds with Stormwind.  I also accept single tokens, but at a much reduced rate of recognition.  We are much more interested in greater feats of duty, though no feat will be ignored.$B$BWith that said, I\'ll gladly take your signets if you are ready to hand in a set.' WHERE `entry`=8822;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='I accept commendation signets from adventurers who have received them in the line of duty.  For each set of ten that you hand to me, I\'ll make sure that you receive a significant acknowledgement of your deeds with Orgrimmar.  I also accept single tokens, but at a much reduced rate of recognition.  We are much more interested in greater feats of duty, though no feat will be ignored.$B$BWith that said, I\'ll gladly take your signets if you are ready to hand in a set.' WHERE `entry`=8823;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='I accept commendation signets from adventurers who have received them in the line of duty.  For each set of ten that you hand to me, I\'ll make sure that you receive a significant acknowledgement of your deeds with the Darkspear tribe.  I also accept single tokens, but at a much reduced rate of recognition.  We are much more interested in greater feats of duty, though no feat will be ignored.$B$BWith that said, I\'ll gladly take your signets if you are ready to hand in a set.' WHERE `entry`=8824;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='I accept commendation signets from adventurers who have received them in the line of duty.  For each set of ten that you hand to me, I\'ll make sure that you receive a significant acknowledgement of your deeds with Thunder Bluff.  I also accept single tokens, but at a much reduced rate of recognition.  We are much more interested in greater feats of duty, though no feat will be ignored.$B$BWith that said, I\'ll gladly take your signets if you are ready to hand in a set.' WHERE `entry`=8825;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='I accept commendation signets from adventurers who have received them in the line of duty.  For each set of ten that you hand to me, I\'ll make sure that you receive a significant acknowledgement of your deeds with Undercity.  I also accept single tokens, but at a much reduced rate of recognition.  We are much more interested in greater feats of duty, though no feat will be ignored.$B$BWith that said, I\'ll gladly take your signets if you are ready to hand in a set.' WHERE `entry`=8826;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='For those adventurers who have but a single commendation signet, I\'ll exchange it for a small amount of recognition with Darnassus.$B$BPlease bear in mind that it is better to hand over a stack of ten signets at once; your efforts will receive greater recognition in doing so.  We offer a single signet exchange as a service for those who don\'t have enough for a full stack of ten.$B$BWith that being said, I stand ready to assist you if you still wish to hand in a single signet.' WHERE `entry`=8830;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='I accept commendation signets from adventurers who have received them in the line of duty.  For each set of ten that you hand to me, I\'ll make sure that you receive a significant acknowledgement of your deeds with Darnassus.  I also accept single tokens, but at a much reduced rate of recognition.  We are much more interested in greater feats of duty, though no feat will be ignored.$B$BWith that said, I\'ll gladly take your signets if you are ready to hand in a set.' WHERE `entry`=8831;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8832;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8833;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='For those adventurers who have but a single commendation signet, I\'ll exchange it for a small amount of recognition with Ironforge.$B$BPlease bear in mind that it is better to hand over a stack of ten signets at once; your efforts will receive greater recognition in doing so.  We offer a single signet exchange as a service for those who don\'t have enough for a full stack of ten.$B$BWith that being said, I stand ready to assist you if you still wish to hand in a single signet.' WHERE `entry`=8834;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='I accept commendation signets from adventurers who have received them in the line of duty.  For each set of ten that you hand to me, I\'ll make sure that you receive a significant acknowledgement of your deeds with Ironforge.  I also accept single tokens, but at a much reduced rate of recognition.  We are much more interested in greater feats of duty, though no feat will be ignored.$B$BWith that said, I\'ll gladly take your signets if you are ready to hand in a set.' WHERE `entry`=8835;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8850;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8851;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8853;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8857;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8858;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8859;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='Did you find Garrick\'s shack?  Are we finally free of that villain?' WHERE `entry`=6;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=8;
UPDATE `quest_template` SET `RequestItemsText`='Hail, $N.  Have you been killing Gnolls...?' WHERE `entry`=11;
UPDATE `quest_template` SET `RequestItemsText`='Perhaps I did not make myself clear, pledge.  In order to prove your worth as a servant to The People\'s Militia and to the Light you need to slay 15 Defias Trappers and 15 Defias Smugglers then return to me when the deed is done.' WHERE `entry`=12;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=18;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='I\'m sorry, I don\'t know you... but from the look of things you have at least heard something of me.  Now, what can I help you with?  Do you have something for me?' WHERE `entry`=32;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Hey $N.  I\'m getting hungry...did you get that tough wolf meat?' WHERE `entry`=33;
UPDATE `quest_template` SET `RequestItemsText`='I\'m going to miss that Verna Furlbrow so much.  I don\'t suppose you happened to see her on your way here?' WHERE `entry`=36;
UPDATE `quest_template` SET `RequestItemsText`='Psst!  You have that Gold Dust for me...for me?' WHERE `entry`=47;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='You have word from McBride?  Northshire is a garden compared to Elwynn Forest, but I wonder what Marshal McBride has to report.$B$BHere, let me have his papers...' WHERE `entry`=54;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='I have been commissioned by the Stormwind Army to supply their people with cloth and leather armor.$B$BIf you have a marker for me, then I\'d be happy to make you something.' WHERE `entry`=59;
UPDATE `quest_template` SET `RequestItemsText`='Oh, a shipment from my brother?  Splendid!  Fortune truly shines on me today!' WHERE `entry`=61;
UPDATE `quest_template` SET `RequestItemsText`='Hello, $N.  Have you discovered the fates of Rolf and Malakai?' WHERE `entry`=71;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Hail, $N.  What do you have to report? Have you scouted the Jasperlode Mine?' WHERE `entry`=76;
UPDATE `quest_template` SET `IncompleteEmote`=0, `CompleteEmote`=0, `RequestItemsText`='I\'m running low on linen, $N.  Do you have any for me?' WHERE `entry`=83;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Ugh... I\'m starving!  Do you have that pie for me, $N?' WHERE `entry`=84;
UPDATE `quest_template` SET `IncompleteEmote`=0, `CompleteEmote`=0, `RequestItemsText`='I don\'t think it\'s right feeding the boy who stole my necklace in the first place, but if that\'s what it takes to get back what\'s mine, then so be it!$B$BDo you have that boar meat?' WHERE `entry`=86;
UPDATE `quest_template` SET `IncompleteEmote`=0, `CompleteEmote`=0, `RequestItemsText`='Hello, $N.  Have you found my necklace?' WHERE `entry`=87;
UPDATE `quest_template` SET `IncompleteEmote`=0, `CompleteEmote`=0, `RequestItemsText`='Did you see her yet?  Did you get her?' WHERE `entry`=88;
UPDATE `quest_template` SET `RequestItemsText`='Yes, Hogger has been a real pain for me and my men.  You have something to report about the beast?' WHERE `entry`=176;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=333;
UPDATE `quest_template` SET `RequestItemsText`='Do you have the remains of the Agamands?  Are those cursed beasts finally destroyed?' WHERE `entry`=354;
UPDATE `quest_template` SET `RequestItemsText`='Deathguard Simmer sent word that you were going to provide me with some much needed reagents.  Were you able to gather 10 pumpkins yet, $N?' WHERE `entry`=365;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=366;
UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=367;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=368;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='Do you have some venom from a Vicious Night Web Spider yet, $N?  It\'s the final component I need in order to test my experiment.' WHERE `entry`=369;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=381;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='How goes your mission, $n?' WHERE `entry`=382;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=398;
UPDATE `quest_template` SET `RequestItemsText`='Greetings.  Either you do not know who I am, or your business with me is urgent.$B$BBecause if neither of these were true, then you would not be foolish enough to disturb me...' WHERE `entry`=405;
UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=407;
UPDATE `quest_template` SET `RequestItemsText`='Time is not a luxury we have, $N.  With each passing hour, the Scourge\'s hold on Tirisfal Glades grows more firm.' WHERE `entry`=408;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=410;
UPDATE `quest_template` SET `RequestItemsText`='Have you returned Gunther\'s book?  Has he responded?' WHERE `entry`=411;
UPDATE `quest_template` SET `RequestItemsText`='Before I know what we are dealing with here, $c, I need to study the spell known as Remedy of Arugal.  Bring it to me now or I shall be forced to find myself a worthy servant.' WHERE `entry`=422;
UPDATE `quest_template` SET `RequestItemsText`='Have you killed Ivar the Foul?  If you won\'t do it for me and my brother, then do it for the Forsaken.' WHERE `entry`=425;
UPDATE `quest_template` SET `RequestItemsText`='Our battles with the Scourge wage on, $N.  Do your part and throw those cursed, mindless undead back into the Plaguelands!' WHERE `entry`=426;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='If you wish to prove your worth to The Dark Lady, slay 10 Scarlet Warriors, $c.' WHERE `entry`=427;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='My sister told me you were here to aid us.  Is that true?' WHERE `entry`=430;
UPDATE `quest_template` SET `RequestItemsText`='My studies require great concentration.  So I hope your visit is not a frivolous one.' WHERE `entry`=444;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='What business do you have with me, $c?' WHERE `entry`=445;
UPDATE `quest_template` SET `RequestItemsText`='Greetings, $N.  What did Bethor have to say?' WHERE `entry`=446;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Hail, $c.  What business do you have with the Royal Apothecary Society?' WHERE `entry`=447;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=460;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='This is the spot!  Bring me closer...' WHERE `entry`=461;
UPDATE `quest_template` SET `RequestItemsText`='$N.  Have you defeated Thule Ravenclaw?' WHERE `entry`=491;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Are we there yet?' WHERE `entry`=911;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=915;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='When the orcs were alone and without friends, the tauren welcomed them to a strange land and shared with them without asking anything in return.  That\'s honor, $N.' WHERE `entry`=925;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Spice.  We could all use some spice in our life.  You agree?' WHERE `entry`=1218;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1 WHERE `entry`=1358;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1446;
UPDATE `quest_template` SET `IncompleteEmote`=11, `CompleteEmote`=11 WHERE `entry`=1657;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='Got the five Wastewander water pouches we need?  If you do, then the Gadgetzan Water Company Care Package, Model 103-XB, will be yours!' WHERE `entry`=1707;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=1800;
UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=1878;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Do you have the snapdragons?  That breed of flower is highly receptive to magic energies, and studying the snapdragons so close to the Plaguelands can tell us if the plague has entered Tirisfal Glades.' WHERE `entry`=1882;
UPDATE `quest_template` SET `IncompleteEmote`=0, `CompleteEmote`=0, `RequestItemsText`='Hello, $N.  Do you have the items I require?' WHERE `entry`=1948;
UPDATE `quest_template` SET `IncompleteEmote`=0, `CompleteEmote`=0 WHERE `entry`=1954;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1960;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2768;
UPDATE `quest_template` SET `RequestItemsText`='Yes $c, I am an official of the Gadgetzan Water Company.  What can I assist you with?' WHERE `entry`=2781;
UPDATE `quest_template` SET `IncompleteEmote`=4, `CompleteEmote`=4, `RequestItemsText`='Finally! We meet face to face, brother to $gbrother:sister;. I welcome you to Northshire. This will be your home for a short time while you learn the ins and outs of how things are done, but know that Stormwind is not far off, and sooner or later, your path will take you there. But until then, be patient... Knight of the Silver Hand.' WHERE `entry`=3101;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=3161;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='As you near the essence font that Eranikus told you of, his voice once again touches your mind.$B$B\"Yes mortal, this essence font will redeem what untainted element of my psyche remains imbued in this gem.  Place the gem inside the font, and let the magic of the Green Dragonflight cleanse the corruption and taint from my being.  Only then will I find true release, and only then will the Dragonflight be able to reassert their stewardship over the Atal\'ai.\"' WHERE `entry`=3373;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=3802;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Have you managed to scavenge up some useful items for us?  There is no shame in reusing that which has been tossed aside.  No one is going to give us any handouts - we Forsaken will fend for ourselves!' WHERE `entry`=3902;
UPDATE `quest_template` SET `RequestItemsText`='Do you have my harvest, $N?  ' WHERE `entry`=3904;
UPDATE `quest_template` SET `RequestItemsText`='You look to be in fine spirits!  Come!  Have a seat, and have a drink!' WHERE `entry`=3905;
UPDATE `quest_template` SET `IncompleteEmote`=0, `CompleteEmote`=0 WHERE `entry`=3909;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=3913;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=3914;
UPDATE `quest_template` SET `IncompleteEmote`=4, `CompleteEmote`=4 WHERE `entry`=3961;
UPDATE `quest_template` SET `IncompleteEmote`=0, `CompleteEmote`=0 WHERE `entry`=3962;
UPDATE `quest_template` SET `IncompleteEmote`=0, `CompleteEmote`=0 WHERE `entry`=4005;
UPDATE `quest_template` SET `IncompleteEmote`=0, `CompleteEmote`=0 WHERE `entry`=4041;
UPDATE `quest_template` SET `IncompleteEmote`=0, `CompleteEmote`=0, `RequestItemsText`='I can tell you more of the power required to defeat Blazerunner, but first, you need to gather the things I require.' WHERE `entry`=4084;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='You have found a sickly, corrupted version of what appears to be a windblossom plant.  The berries that hang from the plant appear rotten and poisonous.  It desperately needs some sort of attention if it is to be turned back to normal.' WHERE `entry`=4115;
UPDATE `quest_template` SET `IncompleteEmote`=5, `CompleteEmote`=5, `RequestItemsText`='Oh, ale!  I would kill for some Dark Iron ale!!  Quick, I\'m getting sober!  I know this because sobriety blurs my vision... and it\'s making you look like the $r I slew last week!' WHERE `entry`=4295;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='<Kibler is busy arguing with Opus.>\n' WHERE `entry`=4729;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Ah!  Do you have my mojo?' WHERE `entry`=4867;
UPDATE `quest_template` SET `IncompleteEmote`=66, `CompleteEmote`=66 WHERE `entry`=4903;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=4974;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=4982;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=4983;
UPDATE `quest_template` SET `IncompleteEmote`=5, `CompleteEmote`=5 WHERE `entry`=5481;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=5482;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='It is a pleasure to see you again, $N.  Have you attended to the duties you\'ve volunteered for during Children\'s Week?' WHERE `entry`=5502;
UPDATE `quest_template` SET `RequestItemsText`='That deadline isn\'t getting any further away, $c. Please hurry and collect those bundles of wood.' WHERE `entry`=5545;
UPDATE `quest_template` SET `IncompleteEmote`=66, `RequestItemsText`='Greetings, $c.  On behalf of the Argent Dawn, I offer you safety and shelter while you are here at Bulwark.  I might also offer you the chance to fight for a cause that\'s worth fighting for!' WHERE `entry`=6029;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='You look like you\'re in a hurry.  Well, then you came to the right place!' WHERE `entry`=6181;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Is that sweat on your brow, $glad:ma\'am;?  You\'ve been running too much.  Next time, take a gryphon!' WHERE `entry`=6261;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='You\'ve been traveling, eh?  Have you been anywhere interesting?' WHERE `entry`=6281;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='You\'re back from Stormwind?  Did Osric send the armor?' WHERE `entry`=6285;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=6321;
UPDATE `quest_template` SET `IncompleteEmote`=4, `CompleteEmote`=4 WHERE `entry`=6322;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='I keep my weapons in top condition.  They are cleaned and ready for use.' WHERE `entry`=6323;
UPDATE `quest_template` SET `IncompleteEmote`=6, `RequestItemsText`='$N, you return.  Do you have our supplies from the Undercity?' WHERE `entry`=6324;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=6568;
UPDATE `quest_template` SET `IncompleteEmote`=11 WHERE `entry`=6569;
UPDATE `quest_template` SET `IncompleteEmote`=33, `CompleteEmote`=33 WHERE `entry`=6582;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=6583;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=6584;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=6585;
UPDATE `quest_template` SET `IncompleteEmote`=5, `CompleteEmote`=5 WHERE `entry`=6601;
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=7341;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=7463;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='We at the Darkmoon Faire do much walking.  We walk from one faire site to another... in fact, you\'ll never see us sitting down on the job!  So it is no surprise that we wear out quite a lot of boots!  We need boots that are both durable and stylish, and embossed leather boots fit that bill rather well.$B$BYou!  You\'re a leatherworker; make me embossed leather boots and I\'ll give you a Darkmoon Faire ticket for the work.' WHERE `entry`=7881;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Yebb Nebblegear is looking to add more talent to his show, and he\'s searching far and wide for the world\'s largest gnome.  Do you know any gnomes of considerable size?$B$BWell before he finds the gnome, he wants to have its costume ready.  I think a barbaric harness would be a good foundation for the costume; can you make some harnesses and bring them to me?  Do that, and I\'ll have a stack of Darkmoon Faire tickets for you...' WHERE `entry`=7883;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='It takes a lot of work to be the strongest woman alive!  My weight set is getting too light and if I\'m too stay fit then I\'ll need more weights!$B$BDo you think you could bring me some weight stones?  If you do, then I\'ll give you a Darkmoon Faire ticket.' WHERE `entry`=7889;
UPDATE `quest_template` SET `IncompleteEmote`=5, `CompleteEmote`=5, `RequestItemsText`='Step right up, step right up!  If you have tickets from the Darkmoon Faire you\'d like redeemed, then just say so!  You can redeem tickets in various denominations for wondrous and fantastic prizes.  Don\'t be shy, give it a try!' WHERE `entry`=7940;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=8061;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8070;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8071;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='Zanza can create the ancient troll enchantments with the right components.$B$BThe first is a primal Hakkari idol that must be taken from the most powerful of the Hakkari lieutenants: Jin\'do and the Bloodlord.$B$BThe second is a punctured voodoo doll. These can be found in the piles of refuse that litter this foul place. Look inside the jinxed hoodoo piles.$B$BBring me these things and I will create a powerful enchantment for you!\n' WHERE `entry`=8191;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='What news do you bring from the lands of the Frostwolves?  How does the battle for Alterac Valley fare?' WHERE `entry`=8369;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='The battle for Alterac rages on!  You must return to Alterac Valley and once more drive the invaders out of Frostwolf territory, $N!' WHERE `entry`=8387;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='Do you bear news from Warsong Gulch, $N?' WHERE `entry`=8430;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='You\'ve come back with news from Arathi, $c?' WHERE `entry`=8439;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1 WHERE `entry`=8864;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='I am please to inform you that I have a fine selection of festive pant suits available for you to own... but only in trade for coins of ancestry.  If fashion is important to you, then these are what you\'re looking for!  I assure you that you will not find pant suits like these anywhere else.$B$BIn exchange for some Coins of Ancestry, I will let you choose one of the three styles I have to keep as your own.  Is this acceptable to you?' WHERE `entry`=8865;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1 WHERE `entry`=8876;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='The dresses and pant suits you see are traditional clothes from many years past.  They are worn in honor of old ways and loved ones gone.$B$BIf you bring me coins of ancestry, $N, then I will give you the pattern to create traditional red dresses or suits.' WHERE `entry`=8878;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1 WHERE `entry`=8901;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8979;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8981;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8993;
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1204;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='My research with the Mudrock tongues is progressing nicely.  I trust your crab hunt goes well?' WHERE `entry`=1258;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='I may have been too hasty in my judgement, $c. It seems as if your blind faith in this Light has some value after all.$B$BGive me your brand and I shall amplify its power.' WHERE `entry`=8046;
UPDATE `quest_template` SET `IncompleteEmote`=5, `CompleteEmote`=5, `RequestItemsText`='Zanza can create the ancient troll enchantments with the right components.$B$BThe first is a primal Hakkari idol that must be taken from the most powerful of the Hakkari lieutenants: Jin\'do and the Bloodlord.$B$BThe second is a punctured voodoo doll. These can be found in the piles of refuse that litter this foul place. Look inside the jinxed hoodoo piles.$B$BBring me these things and I will create a powerful enchantment for you!\n' WHERE `entry`=8185;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='The extremely potent essence mango grows across many of the islands in the South Seas.  A single mango will refresh those who eat it, both physically and mentally.  If you\'ve never had one, you do yourself a disservice!$B$BWe have enough of a supply here on the isle to offer you a handful in exchange for a Zandalar Honor Token.  Speak with Vinchaxa if you need to learn how to get tokens; otherwise, let\'s get to the business at hand!' WHERE `entry`=8196;


-- Add missing quest greetings.
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `emote_id`, `emote_delay`) VALUES (1938, 0, 'The Kirin Tor did not heed my warnings!  The Alliance is a sham.  Arugal is a wreckless fool.', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `emote_id`, `emote_delay`) VALUES (2055, 0, 'The Royal Apothecary Society shall heed The Dark Lady\'s call to uncover the New Plague and drive Arthas and his heathen Scourge Army from the world once and for all.', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `emote_id`, `emote_delay`) VALUES (2229, 0, 'To think, the place the Warchief was born and raised lies so close.', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `emote_id`, `emote_delay`) VALUES (4454, 0, 'Aha!  Did you see that!  I think this new auto-spanner is going to do just the trick for my new influx manifold design.', 1, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `emote_id`, `emote_delay`) VALUES (11259, 0, 'Desolace is not such a bad place, if you don\'t mind the constant harassments from the centaurs.', 1, 0);

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1820;
UPDATE `quest_template` SET `DetailsEmote3`=1, `DetailsEmoteDelay1`=0 WHERE `entry`=5344;

UPDATE `quest_template` SET `OfferRewardText`='You have served the Kingdom well, $C.  Thank you for assisting Corporal Keeshan with his escape from those dreaded Blackrock Orcs.  You shall be rewarded for your brave acts this day.' WHERE `entry`=219;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=25, `OfferRewardText`='There is but one more task that I must ask of you, $N.' WHERE `entry`=5343;
UPDATE `quest_template` SET `OfferRewardEmote1`=0 WHERE `entry`=5344;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardEmote3`=1 WHERE `entry`=5382;
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=2 WHERE `entry`=8201;

UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1, `RequestItemsText`='Ensure my future and I shall ensure yours.\n' WHERE `entry`=5343;
UPDATE `quest_template` SET `IncompleteEmote`=0, `CompleteEmote`=0 WHERE `entry`=5344;
UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=5382;



-- update progress text for Freedom for All Creatures (2969)
UPDATE `quest_template` SET `RequestItemsText` = 'We cannot allow the Grimtotem clan to destroy these beautiful creatures. They must be released from captivity!' WHERE `entry` = 2969;

-- update progress text for Agent of Hydraxis (6823)
UPDATE `quest_template` SET `RequestItemsText` = 'Your campaign is not yet done, $n.  Go out and defeat our enemies, the servants of air and earth and fire, and one day perhaps you will earn a place in the hall of the Waterlords.' WHERE `entry` = 6823;

-- update progress text for The Battle for Alterac (7142)
UPDATE `quest_template` SET `RequestItemsText` = 'We will not suffer the dwarves in our home!  Fall upon our foes and defeat their leader, general Stormpike!' WHERE `entry` = 7142;



-- update script id's in pathing
UPDATE `creature_movement_template` SET `script_id` = 504201 WHERE `entry` = 5042 AND `point` IN (1,6,10,13);

-- slight update to timing, emotes and script id for nurse lilian
DELETE FROM `creature_movement_scripts` WHERE `id`=5042;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (504201, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1680, 1681, 1685, 1682, 0, 0, 0, 0, 0, 'Nurse Lilian Pathing - Speech');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (504201, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nurse Lilian Pathing - Speech Emote');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (504201, 1, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nurse Lilian Pathing - Crouch');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (504201, 10, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nurse Lilian Pathing - Stand');


-- add cleaver to cook ghilm
UPDATE `creature_equip_template` SET `equipentry1` = 2827 WHERE `entry` = 1355;

INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1355, 1, -5666.22, -1565.62, 383.257, 2.32129, 10000, 0, 0),
(1355, 2, -5666.22, -1565.62, 383.257, 2.32129, 500, 0, 135502),
(1355, 3, -5664.75, -1566.57, 383.329, 100, 7000, 0, 135501);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (135501, 3, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'cook ghilm - point');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (135501, 4, 19, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'cook ghilm - set default equip');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (135502, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 2196, 0, 0, 0, 0, 0, 0, 0, 0, 'cook ghilm - equip meat leg');

INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1237, 1, -5671.19, -1577.15, 383.329, 3.4383, 40000, 0, 123702),
(1237, 2, -5671.19, -1577.15, 383.329, 3.4383, 0, 0, 123702),
(1237, 3, -5668.92, -1574.36, 383.204, 100, 0, 0, 0),
(1237, 4, -5668.75, -1572.12, 383.329, 100, 0, 0, 0),
(1237, 5, -5665.08, -1567.92, 383.204, 0.753848, 50000, 0, 123701),
(1237, 6, -5665.08, -1567.92, 383.204, 0.753848, 0, 0, 123701);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (123701, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'kazan mogosh - run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (123702, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'kazan mogosh - walk');

-- pathing and scripts for miner grumnal

INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1360, 1, -5685.68, -1596.67, 383.204, 4.08407, 420000, 0, 0),
(1360, 2, -5683.20, -1593.97, 383.204, 100, 0, 0, 0),
(1360, 3, -5676.94, -1580.58, 383.204, 100, 0, 0, 0),
(1360, 4, -5674.35, -1576.85, 383.204, 0.64881, 6000, 0, 136001),
(1360, 5, -5676.28, -1574.44, 383.204, 1.47946, 30000, 0, 0),
(1360, 6, -5674.35, -1576.85, 383.204, 100, 0, 0, 0),
(1360, 7, -5685.48, -1592.99, 383.204, 100, 0, 0, 0);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (136001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 124, 0, 0, 0, 0, 0, 0, 0, 0, 'miner grumnal - speak');

UPDATE `creature` SET `movementtype`= 2 WHERE `id`= 1360;
UPDATE `creature` SET `movementtype`= 2 WHERE `id`= 1237;
UPDATE `creature` SET `movementtype`= 2 WHERE `id`= 1698;
UPDATE `creature` SET `movementtype`= 2 WHERE `id`= 1355;



-- fix donation quests used by mistina steelshield
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7805, `ExclusiveGroup` = -7802 WHERE `entry` IN (7802, 7803, 7804) AND `patch` = 7;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 7805;

-- fix donation quests used by bubulo acerbus
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7811, `ExclusiveGroup` = -7807 WHERE `entry` IN (7807, 7808, 7809) AND `patch` = 7;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 7811;

-- fix donation quests used by clavicus knavingham 
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7795, `ExclusiveGroup` = -7791 WHERE `entry` IN (7791, 7793, 7794) AND `patch` = 7;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 7795;

-- fix donation quests used by raedon duskstriker
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7800, `ExclusiveGroup` = -7797 WHERE `entry` IN (7797, 7798, 7799) AND `patch` = 7;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 7800;

-- fix donation quests used by rashona straglash
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7824, `ExclusiveGroup` = -7826 WHERE `entry` IN (7826, 7827, 7831) AND `patch` = 7;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7832 WHERE `entry` = 7824;
UPDATE `quest_template` SET `PrevQuestId` = 7824 WHERE `entry` = 7832;

-- fix donation quests used by vehena
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7836, `ExclusiveGroup` = -7833 WHERE `entry` IN (7833, 7834, 7835) AND `patch` = 7;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7837 WHERE `entry` = 7836;
UPDATE `quest_template` SET `PrevQuestId` = 7836 WHERE `entry` = 7837;

-- fix donation quests used by rumstag proudstrider
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7823, `ExclusiveGroup` = -7820 WHERE `entry` IN (7820, 7821, 7822) AND `patch` = 7;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 7823;

-- fix donation quests used by ralston farnsley
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7818, `ExclusiveGroup` = -7813 WHERE `entry` IN (7813, 7814, 7817) AND `patch` = 7;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 7818;



-- Lara Moore
UPDATE `creature_template` SET `gossip_menu_id`=685 WHERE `entry` = 1295;

-- Frederick Stover
UPDATE `creature_template` SET `gossip_menu_id`=686 WHERE `entry` = 1298;

-- Lisbeth Schneider
UPDATE `creature_template` SET `gossip_menu_id`=685 WHERE `entry` = 1299;

-- Felicia Gump
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (703, 0, 1, 'I want to browse your goods.', 0, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=703 WHERE `entry` = 1303;

-- Darian Singh
INSERT INTO `gossip_menu` VALUES (682, 1232, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (682, 0, 1, 'I want to browse your goods.', 0, 3, 4, 0, 0, 0, 0, 0, NULL, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=682 WHERE `entry` = 1304;

-- Owen Vaughn
UPDATE `creature_template` SET `gossip_menu_id`=682 WHERE `entry` = 1308;

-- Evan Larson
UPDATE `creature_template` SET `gossip_menu_id`=682 WHERE `entry` = 1310;

-- Duncan Cullen
UPDATE `creature_template` SET `gossip_menu_id`=682 WHERE `entry` = 1314;

-- Jessara Cordell
UPDATE `creature_template` SET `gossip_menu_id`=681 WHERE `entry` = 1318;

-- Bryan Cross
INSERT INTO `gossip_menu` VALUES (689, 1239, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (689, 0, 1, 'I want to browse your goods.', 0, 3, 4, 0, 0, 0, 0, 0, NULL, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=689 WHERE `entry` = 1319;

-- Heinrich Stone
UPDATE `creature_template` SET `gossip_menu_id`=689 WHERE `entry` = 1324;

-- Wilhelm Strang
UPDATE `creature_template` SET `gossip_menu_id`=689 WHERE `entry` = 1341;

-- Gregory Ardus
INSERT INTO `gossip_menu` VALUES (692, 1242, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (692, 0, 1, 'I want to browse your goods.', 0, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=692 WHERE `entry` = 1348;

-- Agustus Moulaine
UPDATE `creature_template` SET `gossip_menu_id`=692 WHERE `entry` = 1349;

-- Theresa Moulaine
INSERT INTO `gossip_menu` VALUES (691, 1241, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (691, 0, 1, 'I want to browse your goods.', 0, 3, 4, 0, 0, 0, 0, 0, NULL, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=691 WHERE `entry` = 1350;

-- Brother Cassius
UPDATE `creature_template` SET `gossip_menu_id`=692 WHERE `entry` = 1351;

-- Ian Strom
INSERT INTO `gossip_menu` VALUES (4658, 6165, 100);
INSERT INTO `gossip_menu` VALUES (4658, 6164, 101);
INSERT INTO `gossip_menu` VALUES (4658, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4658, 0, 3, 'Can you train me how to use rogue skills?', 7491, 5, 16, 0, 0, 0, 0, 0, '', 0, 100);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1081, -1, 107, 100, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4658, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 1081);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4658, 4, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16, 0, 0, '', 0, 198);
UPDATE `creature_template` SET `gossip_menu_id`=4658 WHERE `entry` = 1411;

-- David Trias
INSERT INTO `gossip_menu` VALUES (85, 4796, 101);
INSERT INTO `gossip_menu` VALUES (85, 581, 100);
INSERT INTO `gossip_menu` VALUES (85, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (85, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 1081);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (85, 4, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16, 0, 0, '', 0, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (85, 0, 3, 'I would like to train.', 2548, 5, 16, 0, 0, 0, 0, 0, '', 0, 100);
UPDATE `creature_template` SET `gossip_menu_id`=85 WHERE `entry` = 2122;

-- Marion Call
UPDATE `creature_template` SET `gossip_menu_id`=85 WHERE `entry` = 2130;

-- Felicia Maline
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 2409;

-- Darla Harris
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 2432;

-- Xizk Goodstitch
INSERT INTO `gossip_menu` VALUES (2685, 3358, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2685, 1, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2685 WHERE `entry` = 2670;

-- Urda
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 2851;

-- Gorrik
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 2861;

-- Kaplak
INSERT INTO `gossip_menu` VALUES (141, 4793, 101);
INSERT INTO `gossip_menu` VALUES (141, 638, 100);
INSERT INTO `gossip_menu` VALUES (141, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (141, 0, 3, 'Can you train me how to use rogue skills?', 7491, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (141, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 136);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (141, 4, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16, 0, 0, '', 0, 198);
UPDATE `creature_template` SET `gossip_menu_id`=141 WHERE `entry` = 3170;

-- Gest
INSERT INTO `gossip_menu` VALUES (4513, 4793, 101);
INSERT INTO `gossip_menu` VALUES (4513, 638, 100);
INSERT INTO `gossip_menu` VALUES (4513, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4513, 2, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16, 0, 0, '', 0, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4513, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 1081);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4513, 0, 3, 'I would like training.', 2603, 5, 16, 0, 0, 0, 0, 0, '', 0, 100);
UPDATE `creature_template` SET `gossip_menu_id`=4513 WHERE `entry` = 3327;

-- Urtrun Clanbringer
INSERT INTO `gossip_menu` VALUES (1626, 2280, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1626, 0, 8, 'I want to create a guild crest.', 3415, 11, 1024, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1626, 1, 7, 'How do I form a guild?', 3413, 10, 512, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1626 WHERE `entry` = 3370;

-- Shenthul
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1024, 8, 2458, 0, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (50199, 1124, 1024);
INSERT INTO `gossip_menu` VALUES (50199, 1038, 100);
INSERT INTO `gossip_menu` VALUES (50199, 4793, 101);
INSERT INTO `gossip_menu` VALUES (50199, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (50199, 0, 3, 'Can you train me how to use rogue skills?', 7491, 5, 16, 0, 0, 0, 0, 0, '', 0, 100);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (50199, 2, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16, 0, 0, '', 0, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (50199, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 136);
UPDATE `creature_template` SET `gossip_menu_id`=50199 WHERE `entry` = 3401;

-- Daelyshia
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 4267;

-- Thyssiana
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 4319;

-- Teloren
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 4407;

-- Carolyn Ward
INSERT INTO `gossip_menu` VALUES (4542, 4796, 0);
INSERT INTO `gossip_menu` VALUES (4542, 581, 100);
INSERT INTO `gossip_menu` VALUES (4542, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4542, 0, 3, 'Can you train me how to use rogue skills?', 7491, 5, 16, 0, 0, 0, 0, 0, '', 0, 100);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4542, 2, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16, 0, 0, '', 0, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4542, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 136);
UPDATE `creature_template` SET `gossip_menu_id`=4542 WHERE `entry` = 4582;

-- Gregory Charles
INSERT INTO `gossip_menu` VALUES (4541, 4796, 0);
INSERT INTO `gossip_menu` VALUES (4541, 581, 100);
INSERT INTO `gossip_menu` VALUES (4541, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4541, 0, 3, 'Can you train me how to use rogue skills?', 7491, 5, 16, 0, 0, 0, 0, 0, '', 0, 100);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4541, 2, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16, 0, 0, '', 0, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4541, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 136);
UPDATE `creature_template` SET `gossip_menu_id`=4541 WHERE `entry` = 4584;

-- Christopher Drakul
INSERT INTO `gossip_menu` VALUES (5108, 6159, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5108, 0, 8, 'I want to create a guild crest.', 3415, 11, 1024, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5108, 1, 7, 'How do I form a guild?', 3413, 10, 512, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5108 WHERE `entry` = 4613;

-- Aldwin Laughlin
INSERT INTO `gossip_menu` VALUES (708, 1260, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (708, 0, 7, 'How do I form a guild?', 3413, 10, 512, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (708, 1, 8, 'I want to create a guild crest.', 3415, 11, 1024, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=708 WHERE `entry` = 4974;

-- Ben Trias
UPDATE `creature_template` SET `gossip_menu_id`=686 WHERE `entry` = 4981;

-- Rutgar Glyphshaper
UPDATE `gossip_menu` SET `entry`=6533 WHERE `entry`=5460;
UPDATE `gossip_menu_option` SET `menu_id`=6534 WHERE `menu_id`=5460;
UPDATE `gossip_menu_option` SET `action_menu_id`=6534 WHERE `action_menu_id`=5460;
UPDATE `gossip_menu` SET `entry`=6551 WHERE `entry`=5461;
UPDATE `gossip_menu_option` SET `menu_id`=6551 WHERE `menu_id`=5461;
UPDATE `gossip_menu_option` SET `action_menu_id`=6551 WHERE `action_menu_id`=5461;
UPDATE `gossip_menu` SET `entry`=6550 WHERE `entry`=5462;
UPDATE `gossip_menu_option` SET `menu_id`=6550 WHERE `menu_id`=5462;
UPDATE `gossip_menu_option` SET `action_menu_id`=6550 WHERE `action_menu_id`=5462;
UPDATE `gossip_menu` SET `entry`=6549 WHERE `entry`=5463;
UPDATE `gossip_menu_option` SET `menu_id`=6549 WHERE `menu_id`=5463;
UPDATE `gossip_menu_option` SET `action_menu_id`=6549 WHERE `action_menu_id`=5463;
UPDATE `gossip_menu` SET `entry`=6548 WHERE `entry`=5464;
UPDATE `gossip_menu_option` SET `menu_id`=6548 WHERE `menu_id`=5464;
UPDATE `gossip_menu_option` SET `action_menu_id`=6548 WHERE `action_menu_id`=5464;
UPDATE `gossip_menu` SET `entry`=6547 WHERE `entry`=5465;
UPDATE `gossip_menu_option` SET `menu_id`=6547 WHERE `menu_id`=5465;
UPDATE `gossip_menu_option` SET `action_menu_id`=6547 WHERE `action_menu_id`=5465;
UPDATE `gossip_menu` SET `entry`=6546 WHERE `entry`=5466;
UPDATE `gossip_menu_option` SET `menu_id`=6546 WHERE `menu_id`=5466;
UPDATE `gossip_menu_option` SET `action_menu_id`=6546 WHERE `action_menu_id`=5466;
UPDATE `gossip_menu` SET `entry`=6545 WHERE `entry`=5467;
UPDATE `gossip_menu_option` SET `menu_id`=6545 WHERE `menu_id`=5467;
UPDATE `gossip_menu_option` SET `action_menu_id`=6545 WHERE `action_menu_id`=5467;
UPDATE `creature_template` SET `gossip_menu_id`=6534 WHERE `entry`=15170;

-- Frankal Stonebridge
UPDATE `gossip_menu` SET `entry`=6534 WHERE `entry`=5450;
UPDATE `gossip_menu_option` SET `menu_id`=6533 WHERE `menu_id`=5450;
UPDATE `gossip_menu_option` SET `action_menu_id`=6533 WHERE `action_menu_id`=5450;
UPDATE `gossip_menu` SET `entry`=6558 WHERE `entry`=5451;
UPDATE `gossip_menu_option` SET `menu_id`=6558 WHERE `menu_id`=5451;
UPDATE `gossip_menu_option` SET `action_menu_id`=6558 WHERE `action_menu_id`=5451;
UPDATE `gossip_menu` SET `entry`=6557 WHERE `entry`=5452;
UPDATE `gossip_menu_option` SET `menu_id`=6557 WHERE `menu_id`=5452;
UPDATE `gossip_menu_option` SET `action_menu_id`=6557 WHERE `action_menu_id`=5452;
UPDATE `gossip_menu` SET `entry`=6556 WHERE `entry`=5453;
UPDATE `gossip_menu_option` SET `menu_id`=6556 WHERE `menu_id`=5453;
UPDATE `gossip_menu_option` SET `action_menu_id`=6556 WHERE `action_menu_id`=5453;
UPDATE `gossip_menu` SET `entry`=6555 WHERE `entry`=5454;
UPDATE `gossip_menu_option` SET `menu_id`=6555 WHERE `menu_id`=5454;
UPDATE `gossip_menu_option` SET `action_menu_id`=6555 WHERE `action_menu_id`=5454;
UPDATE `gossip_menu` SET `entry`=6554 WHERE `entry`=5455;
UPDATE `gossip_menu_option` SET `menu_id`=6554 WHERE `menu_id`=5455;
UPDATE `gossip_menu_option` SET `action_menu_id`=6554 WHERE `action_menu_id`=5455;
UPDATE `gossip_menu` SET `entry`=6553 WHERE `entry`=5456;
UPDATE `gossip_menu_option` SET `menu_id`=6553 WHERE `menu_id`=5456;
UPDATE `gossip_menu_option` SET `action_menu_id`=6553 WHERE `action_menu_id`=5456;
UPDATE `gossip_menu` SET `entry`=6552 WHERE `entry`=5457;
UPDATE `gossip_menu_option` SET `menu_id`=6552 WHERE `menu_id`=5457;
UPDATE `gossip_menu_option` SET `action_menu_id`=6552 WHERE `action_menu_id`=5457;
UPDATE `creature_template` SET `gossip_menu_id`=6533 WHERE `entry`=15171;

-- Krumn
INSERT INTO `gossip_menu` VALUES (5461, 6513, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5461, 0, 8, 'I want to create a guild crest.', 3415, 11, 1024, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5461, 1, 7, 'How do I form a guild?', 3413, 10, 512, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5461 WHERE `entry` = 5054;

-- Jondor Steelbrow
INSERT INTO `gossip_menu` VALUES (5462, 6514, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5462, 0, 8, 'I want to create a guild crest.', 3415, 11, 1024, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5462, 1, 7, 'How do I form a guild?', 3413, 10, 512, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5462 WHERE `entry` = 5130;

-- Kathrum Axehand
UPDATE `creature_template` SET `gossip_menu_id`=693 WHERE `entry` = 5509;

-- Thulman Flintcrag
INSERT INTO `gossip_menu` VALUES (693, 1243, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (693, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=693 WHERE `entry` = 5510;

-- Kaita Deepforge
UPDATE `creature_template` SET `gossip_menu_id`=693 WHERE `entry` = 5512;

-- Baritanas Skyriver
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 6706;

-- Thalon
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 6726;

-- Bera Stonehammer
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 7823;

-- Bulkrek Ragefist
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 7824;

-- Kroum
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 8610;

-- Nessa Shadowsong
UPDATE `creature_template` SET `gossip_menu_id`=4303 WHERE `entry` = 10118;

-- Gryfe
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 10583;

-- Aurius
INSERT INTO `gossip_menu` VALUES (3043, 3755, 0);
INSERT INTO `gossip_menu` VALUES (3043, 3756, 0);
INSERT INTO `gossip_menu` VALUES (3043, 3757, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3043 WHERE `entry` = 10917;

-- Maethrya
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 11138;

-- Yugrek
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 11139;

-- Gorn One Eye
INSERT INTO `gossip_menu` VALUES (3625, 4399, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3625 WHERE `entry` = 11555;

-- Shardi
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 11899;

-- Jarrodenus
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 12577;

-- Bibilfaz Featherwhistle
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 12596;

-- Vhulgra
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 12616;

-- Khaelyn Steelwing
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 12617;

-- Georgia
INSERT INTO `gossip_menu` VALUES (12237, 7778, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (12237, 0, 2, 'I need a ride.', 3409, 4, 8, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=12237 WHERE `entry` = 12636;

-- Faustron
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 12740;

-- Nipsy
INSERT INTO `gossip_menu` VALUES (4845, 5920, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4845, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4845 WHERE `entry` = 13018;

-- Lorekeeper Lydros
INSERT INTO `gossip_menu` VALUES (5747, 6925, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (189, 8, 7482, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (188, 8, 7481, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (190, -2, 189, 188, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (5747, 6926, 190);
/*
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (235, 19, 7508, 0, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (5747, 50218, 235);
INSERT INTO `gossip_menu` VALUES (50004, 50219, 0);
INSERT INTO `gossip_menu` VALUES (50005, 50220, 0);
INSERT INTO `gossip_menu` VALUES (50007, 50222, 0);
INSERT INTO `gossip_menu` VALUES (50008, 50223, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (50008, 0, 0, 'Maybe... What do I do now?', 9527, 1, 1, -1, 0, 5000801, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (50007, 0, 0, 'Eh?', 9525, 1, 1, 50008, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (50006, 0, 0, '(Continue.)', 9519, 1, 1, 50007, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (50005, 0, 0, '(Continue.)', 9519, 1, 1, 50006, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (50004, 0, 0, '(Continue.)', 9519, 1, 1, 50005, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5747, 0, 0, 'Fascinating, Lorekeeper. Continue please.', 9517, 1, 1, 50004, 0, 0, 0, 0, '', 0, 235);
*/
UPDATE `creature_template` SET `gossip_menu_id`=5747 WHERE `entry` = 14368;

-- Shen'dralar Zealot
INSERT INTO `gossip_menu` VALUES (5737, 6911, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5737 WHERE `entry` = 14369;

-- Lorekeeper Javon
INSERT INTO `gossip_menu` VALUES (5755, 6939, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5755 WHERE `entry` = 14381;

-- Orphan Matron Nightingale
INSERT INTO `gossip_menu` VALUES (5849, 7011, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5849 WHERE `entry` = 14450;

-- Bragok
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 16227;

-- Love is in the Air gossip options.
UPDATE `gossip_menu` SET `entry`=682 WHERE `entry`=9029 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=686 WHERE `entry`=9024 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=689 WHERE `entry`=9043 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=691 WHERE `entry`=9055 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=692 WHERE `entry`=9053 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=693 WHERE `entry`=9383 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=708 WHERE `entry`=9313 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=1626 WHERE `entry`=9183 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=4513 WHERE `entry`=9154 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=4541 WHERE `entry`=9281 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=4542 WHERE `entry`=9280 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=5108 WHERE `entry`=9302 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=5461 WHERE `entry`=9318 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=5462 WHERE `entry`=9341 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=5849 WHERE `entry`=9583 && `condition_id`!=0;
UPDATE `gossip_menu_option` SET `menu_id`=682 WHERE `option_id`=1 && `menu_id`=9029;
UPDATE `gossip_menu_option` SET `menu_id`=686 WHERE `option_id`=1 && `menu_id`=9024;
UPDATE `gossip_menu_option` SET `menu_id`=689 WHERE `option_id`=1 && `menu_id`=9043;
UPDATE `gossip_menu_option` SET `menu_id`=691 WHERE `option_id`=1 && `menu_id`=9055;
UPDATE `gossip_menu_option` SET `menu_id`=692 WHERE `option_id`=1 && `menu_id`=9053;
UPDATE `gossip_menu_option` SET `menu_id`=693 WHERE `option_id`=1 && `menu_id`=9383;
UPDATE `gossip_menu_option` SET `menu_id`=708 WHERE `option_id`=1 && `menu_id`=9313;
UPDATE `gossip_menu_option` SET `menu_id`=1626 WHERE `option_id`=1 && `menu_id`=9183;
UPDATE `gossip_menu_option` SET `menu_id`=4513 WHERE `option_id`=1 && `menu_id`=9154;
UPDATE `gossip_menu_option` SET `menu_id`=4541 WHERE `option_id`=1 && `menu_id`=9281;
UPDATE `gossip_menu_option` SET `menu_id`=4542 WHERE `option_id`=1 && `menu_id`=9280;
UPDATE `gossip_menu_option` SET `menu_id`=5108 WHERE `option_id`=1 && `menu_id`=9302;
UPDATE `gossip_menu_option` SET `menu_id`=5461 WHERE `option_id`=1 && `menu_id`=9318;
UPDATE `gossip_menu_option` SET `menu_id`=5462 WHERE `option_id`=1 && `menu_id`=9341;
UPDATE `gossip_menu_option` SET `menu_id`=5849 WHERE `option_id`=1 && `menu_id`=9583;
DELETE FROM `gossip_menu` WHERE `entry` IN (9022, 9024, 9025, 9028, 9029, 9032, 9034, 9038, 9042, 9043, 9046, 9050, 9053, 9054, 9055, 9056, 9154, 9183, 9280, 9281, 9302, 9313, 9314, 9318, 9341, 9382, 9383, 9385, 9583);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9022, 9024, 9025, 9028, 9029, 9032, 9034, 9038, 9042, 9043, 9046, 9050, 9053, 9054, 9055, 9056, 9154, 9183, 9280, 9281, 9302, 9313, 9314, 9318, 9341, 9382, 9383, 9385, 9583);
UPDATE `creature_template` SET `npc_flags`=`npc_flags` | 1 WHERE `entry` IN (1295, 1298, 1299, 1303, 1304, 1308, 1310, 1314, 1318, 1319, 1324, 1341, 1348, 1349, 1350, 1351, 1411, 2122, 2130, 2409, 2432, 2670, 2851, 2861, 3170, 3327, 3370, 3401, 4267, 4319, 4407, 4582, 4584, 4613, 4974, 4981, 5054, 5130, 5509, 5510, 5512, 6301, 6706, 6726, 7823, 7824, 8610, 10118, 10583, 10917, 11138, 11139, 11555, 11899, 12577, 12596, 12616, 12617, 12636, 12740, 13018, 14368, 14369, 14381, 14450, 16227);



-- Marshal McBride
UPDATE `creature_template` SET `gossip_menu_id`=4048 WHERE `entry` = 197;

-- Master Mathias Shaw
INSERT INTO `gossip_menu` VALUES (4941, 5994, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4941 WHERE `entry` = 332;

-- Dungar Longdrink
UPDATE `creature_template` SET `gossip_menu_id`=704 WHERE `entry` = 352;

-- Smith Argus
UPDATE `creature_template` SET `gossip_menu_id`=2744 WHERE `entry` = 514;

-- Thor
UPDATE `creature_template` SET `gossip_menu_id`=4106 WHERE `entry` = 523;

-- Barnil Stonepot
UPDATE `creature_template` SET `gossip_menu_id`=5483 WHERE `entry` = 716;

-- Private Thorsen
INSERT INTO `gossip_menu` VALUES (4086, 4982, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4086 WHERE `entry` = 738;

-- Durnan Furcutter
INSERT INTO `gossip_menu` VALUES (1262, 1914, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1262, 0, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1262 WHERE `entry` = 836;

-- Deputy Rainer
UPDATE `creature_template` SET `gossip_menu_id`=1631 WHERE `entry` = 963;

-- Vyrin Swiftwind
INSERT INTO `gossip_menu` VALUES (2831, 3523, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2831 WHERE `entry` = 1156;

-- Herbalist Pomeroy
-- INSERT INTO `gossip_menu` VALUES (7691, 9385, 0);
-- INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7691, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `npc_flags`=16 WHERE `entry` = 1218;

-- Tognus Flintfire
INSERT INTO `gossip_menu` VALUES (2741, 3396, 4);
INSERT INTO `gossip_menu` VALUES (2741, 3395, 0);
INSERT INTO `gossip_menu` VALUES (2741, 3397, 366);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2741, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2741 WHERE `entry` = 1241;

-- Hegnar Rumbleshot
INSERT INTO `gossip_menu` VALUES (4090, 4990, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4090, 0, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4090 WHERE `entry` = 1243;

-- Mountaineer Kadrell
INSERT INTO `gossip_menu` VALUES (1632, 2288, 0);
INSERT INTO `gossip_menu` VALUES (1632, 2289, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1632 WHERE `entry` = 1340;

-- Cook Ghilm
UPDATE `creature_template` SET `gossip_menu_id`=5853 WHERE `entry` = 1355;

-- Mudduk
INSERT INTO `gossip_menu` VALUES (4747, 7021, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (86, 7, 185, 1, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4747, 7015, 86);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (87, 7, 185, 125, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4747, 7019, 87);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (127, 7, 185, 200, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4747, 7017, 127);
UPDATE `creature_template` SET `gossip_menu_id`=4747 WHERE `entry` = 1382;

-- Brawn
INSERT INTO `gossip_menu` VALUES (4208, 5348, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (377, 7, 165, 50, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4208, 5345, 377);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (378, 7, 165, 125, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4208, 5346, 378);
UPDATE `creature_template` SET `gossip_menu_id`=4208 WHERE `entry` = 1385;

-- Rogvar
INSERT INTO `gossip_menu` VALUES (4134, 5108, 0);
INSERT INTO `gossip_menu` VALUES (4134, 5111, 25);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (363, 7, 171, 200, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4134, 5110, 363);
UPDATE `creature_template` SET `gossip_menu_id`=4134 WHERE `entry` = 1386;

-- Tomas
UPDATE `creature_template` SET `gossip_menu_id`=5853 WHERE `entry` = 1430;

-- Telurinon Moonshadow
UPDATE `creature_template` SET `npc_flags`=16 WHERE `entry` = 1458;

-- Ghak Healtouch
INSERT INTO `gossip_menu` VALUES (4115, 5028, 0);
INSERT INTO `gossip_menu` VALUES (4115, 5029, 25);
INSERT INTO `gossip_menu` VALUES (4115, 5030, 361);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4115, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4115 WHERE `entry` = 1470;

-- Shadow Priest Sarvis
UPDATE `creature_template` SET `gossip_menu_id`=4044 WHERE `entry` = 1569;

-- Thorgrum Borrelson
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4358, 0, 2, 'I need a ride.', 3409, 4, 8, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4358 WHERE `entry` = 1572;

-- Gryth Thurden
UPDATE `creature_template` SET `gossip_menu_id`=4360 WHERE `entry` = 1573;

-- Adele Fielder
INSERT INTO `gossip_menu` VALUES (4172, 5258, 377);
INSERT INTO `gossip_menu` VALUES (4172, 5259, 18);
INSERT INTO `gossip_menu` VALUES (4172, 5257, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4172 WHERE `entry` = 1632;

-- Lee Brown
INSERT INTO `gossip_menu` VALUES (4744, 6961, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (128, 7, 356, 125, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4744, 6793, 128);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (129, 7, 356, 200, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4744, 6960, 129);
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 1651;

-- Finbus Geargrind
INSERT INTO `gossip_menu` VALUES (4145, 5142, 0);
INSERT INTO `gossip_menu` VALUES (4145, 5145, 44);
INSERT INTO `gossip_menu` VALUES (4145, 5146, 391);
INSERT INTO `gossip_menu` VALUES (4145, 5143, 392);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4145, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4145 WHERE `entry` = 1676;

-- Matthew Hooper
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 1680;

-- Brock Stoneseeker
INSERT INTO `gossip_menu` VALUES (4361, 5583, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4361, 0, 3, 'I would like to train.', 2548, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4361 WHERE `entry` = 1681;

-- Warg Deepwater
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 1683;

-- Loslor Rudge
INSERT INTO `gossip_menu` VALUES (3501, 4253, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3501, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3501 WHERE `entry` = 1694;

-- Gremlock Pilsnor
UPDATE `creature_template` SET `gossip_menu_id`=5853 WHERE `entry` = 1699;

-- Paxton Ganter
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 1700;

-- Bronk Guzzlegear
UPDATE `creature_template` SET `gossip_menu_id`=4135 WHERE `entry` = 1702;

-- Conservator Ilthalaine
INSERT INTO `gossip_menu` VALUES (4046, 4936, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4046 WHERE `entry` = 2079;

-- Carolai Anise
INSERT INTO `gossip_menu` VALUES (4127, 5043, 0);
INSERT INTO `gossip_menu` VALUES (4127, 5044, 25);
INSERT INTO `gossip_menu` VALUES (4127, 5045, 361);
UPDATE `creature_template` SET `gossip_menu_id`=4127 WHERE `entry` = 2132;

-- Karos Razok
UPDATE `creature_template` SET `gossip_menu_id`=4281 WHERE `entry` = 2226;

-- Tog'thar
INSERT INTO `gossip_menu` VALUES (264, 761, 0);
UPDATE `creature_template` SET `gossip_menu_id`=264 WHERE `entry` = 2238;

-- Donald Rabonne
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 2367;

-- Serge Hinott
INSERT INTO `gossip_menu` VALUES (4130, 5084, 0);
INSERT INTO `gossip_menu` VALUES (4130, 5087, 25);
INSERT INTO `gossip_menu` VALUES (4130, 5088, 361);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (362, 7, 171, 125, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4130, 5085, 362);
UPDATE `creature_template` SET `gossip_menu_id`=4130 WHERE `entry` = 2391;

-- Christoph Jeffcoat
INSERT INTO `gossip_menu` VALUES (5542, 6595, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5542, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5542 WHERE `entry` = 2393;

-- Daryl Stack
INSERT INTO `gossip_menu` VALUES (4356, 5575, 0);
INSERT INTO `gossip_menu` VALUES (4356, 5578, 14);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (374, 7, 197, 200, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4356, 5577, 374);
UPDATE `creature_template` SET `gossip_menu_id`=4356 WHERE `entry` = 2399;

-- Olivia Burnside
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (699, 0, 6, 'I would like to check my deposit box.', 3398, 9, 256, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=699 WHERE `entry` = 2455;

-- Newton Burnside
UPDATE `creature_template` SET `gossip_menu_id`=699 WHERE `entry` = 2456;

-- John Burnside
UPDATE `creature_template` SET `gossip_menu_id`=699 WHERE `entry` = 2457;

-- Baron Revilgaz
UPDATE `creature_template` SET `gossip_menu_id`=6685 WHERE `entry` = 2496;

-- Grarnik Goodstitch
INSERT INTO `gossip_menu` VALUES (4347, 5530, 0);
INSERT INTO `gossip_menu` VALUES (4347, 5533, 14);
INSERT INTO `gossip_menu` VALUES (4347, 5534, 372);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (373, 7, 197, 125, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4347, 5531, 373);
UPDATE `creature_template` SET `gossip_menu_id`=4347 WHERE `entry` = 2627;

-- Myizz Luckycatch
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 2834;

-- Brikk Keencraft
INSERT INTO `gossip_menu` VALUES (2784, 3488, 0);
INSERT INTO `gossip_menu` VALUES (2784, 3489, 4);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (368, 7, 164, 200, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (2784, 3490, 368);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2784, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2784 WHERE `entry` = 2836;

-- Jaxin Chong
UPDATE `creature_template` SET `gossip_menu_id`=4122 WHERE `entry` = 2837;

-- Grull Hawkwind
INSERT INTO `gossip_menu` VALUES (4045, 4935, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4045 WHERE `entry` = 2980;

-- Tal
UPDATE `creature_template` SET `gossip_menu_id`=4326 WHERE `entry` = 2995;

-- Pyall Silentstride
UPDATE `creature_template` SET `gossip_menu_id`=4747 WHERE `entry` = 3067;

-- Chaw Stronghide
INSERT INTO `gossip_menu` VALUES (4185, 5285, 0);
INSERT INTO `gossip_menu` VALUES (4185, 5287, 18);
INSERT INTO `gossip_menu` VALUES (4185, 5286, 377);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4185, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4185 WHERE `entry` = 3069;

-- Crystal Boughman
UPDATE `creature_template` SET `gossip_menu_id`=5853 WHERE `entry` = 3087;

-- Clarise Gnarltree
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2781, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2781 WHERE `entry` = 3136;

-- Gornek
UPDATE `creature_template` SET `gossip_menu_id`=2910 WHERE `entry` = 3143;

-- Dwukk
UPDATE `creature_template` SET `gossip_menu_id`=2746 WHERE `entry` = 3174;

-- Harold Riggs
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 3179;

-- Miao'zan
INSERT INTO `gossip_menu` VALUES (4129, 5034, 0);
INSERT INTO `gossip_menu` VALUES (4129, 5035, 25);
INSERT INTO `gossip_menu` VALUES (4129, 5036, 361);
UPDATE `creature_template` SET `gossip_menu_id`=4129 WHERE `entry` = 3184;

-- Deek Fizzlebizz
INSERT INTO `gossip_menu` VALUES (4136, 5116, 391);
INSERT INTO `gossip_menu` VALUES (4136, 5117, 44);
INSERT INTO `gossip_menu` VALUES (4136, 5115, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4136 WHERE `entry` = 3290;

-- Doras
UPDATE `creature_template` SET `gossip_menu_id`=4342 WHERE `entry` = 3310;

-- Jorn Skyseer
INSERT INTO `gossip_menu` VALUES (1242, 1875, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1242 WHERE `entry` = 3387;

-- Thork
UPDATE `creature_template` SET `gossip_menu_id`=2883 WHERE `entry` = 3429;

-- Tatternack Steelforge
INSERT INTO `gossip_menu` VALUES (2942, 3654, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2942 WHERE `entry` = 3433;

-- Tonga Runetotem
UPDATE `creature_template` SET `gossip_menu_id`=4043 WHERE `entry` = 3448;

-- Traugh
UPDATE `creature_template` SET `gossip_menu_id`=2783 WHERE `entry` = 3478;

-- Jahan Hawkwing
UPDATE `creature_template` SET `gossip_menu_id`=4324 WHERE `entry` = 3483;

-- Zargh
UPDATE `creature_template` SET `gossip_menu_id`=4341 WHERE `entry` = 3489;

-- Tinkerwiz
INSERT INTO `gossip_menu` VALUES (4140, 5127, 0);
INSERT INTO `gossip_menu` VALUES (4140, 5129, 44);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (394, -1, 391, 2, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4140, 5131, 394);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (395, -1, 391, 3, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4140, 5128, 395);
UPDATE `creature_template` SET `gossip_menu_id`=4140 WHERE `entry` = 3494;

-- Thomas Miller
UPDATE `creature_template` SET `gossip_menu_id`=686 WHERE `entry` = 3518;

-- Bowen Brisboise
INSERT INTO `gossip_menu` VALUES (4267, 5431, 0);
INSERT INTO `gossip_menu` VALUES (4267, 5433, 14);
INSERT INTO `gossip_menu` VALUES (4267, 5432, 372);
UPDATE `creature_template` SET `gossip_menu_id`=4267 WHERE `entry` = 3523;

-- Shelene Rhobart
INSERT INTO `gossip_menu` VALUES (4184, 5282, 0);
INSERT INTO `gossip_menu` VALUES (4184, 5284, 18);
INSERT INTO `gossip_menu` VALUES (4184, 5283, 377);
UPDATE `creature_template` SET `gossip_menu_id`=4184 WHERE `entry` = 3549;

-- Guillaume Sorouy
INSERT INTO `gossip_menu` VALUES (2749, 3418, 0);
INSERT INTO `gossip_menu` VALUES (2749, 3419, 4);
INSERT INTO `gossip_menu` VALUES (2749, 3420, 366);
UPDATE `creature_template` SET `gossip_menu_id`=2749 WHERE `entry` = 3557;

-- Cyndra Kindwhisper
INSERT INTO `gossip_menu` VALUES (4112, 5019, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4112 WHERE `entry` = 3603;

-- Nadyia Maneweaver
UPDATE `creature_template` SET `gossip_menu_id`=4174 WHERE `entry` = 3605;

-- Alanna Raveneye
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (380, 7, 333, 50, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4156, 5191, 380);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (203, 7, 333, 1, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4156, 5192, 203);
INSERT INTO `gossip_menu` VALUES (4156, 5190, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4156 WHERE `entry` = 3606;

-- Devrak
UPDATE `creature_template` SET `gossip_menu_id`=4323 WHERE `entry` = 3615;

-- Krulmoo Fullmoon
INSERT INTO `gossip_menu` VALUES (4206, 5335, 0);
INSERT INTO `gossip_menu` VALUES (4206, 5338, 18);
INSERT INTO `gossip_menu` VALUES (4206, 5339, 377);
INSERT INTO `gossip_menu` VALUES (4206, 5336, 378);
UPDATE `creature_template` SET `gossip_menu_id`=4206 WHERE `entry` = 3703;

-- Mahani
INSERT INTO `gossip_menu` VALUES (4350, 5545, 0);
INSERT INTO `gossip_menu` VALUES (4350, 5549, 372);
INSERT INTO `gossip_menu` VALUES (4350, 5546, 373);
UPDATE `creature_template` SET `gossip_menu_id`=4350 WHERE `entry` = 3704;

-- Vesprystus
UPDATE `creature_template` SET `gossip_menu_id`=4302 WHERE `entry` = 3838;

-- Sentinel Velene Starstrike
INSERT INTO `gossip_menu` VALUES (2561, 3233, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2561 WHERE `entry` = 3885;

-- Kylanna
INSERT INTO `gossip_menu` VALUES (4117, 5059, 0);
INSERT INTO `gossip_menu` VALUES (4117, 5051, 25);
INSERT INTO `gossip_menu` VALUES (4117, 5060, 361);
INSERT INTO `gossip_menu` VALUES (4117, 5063, 362);
UPDATE `creature_template` SET `gossip_menu_id`=4117 WHERE `entry` = 3964;

-- Aayndia Floralwind
INSERT INTO `gossip_menu` VALUES (4213, 5360, 0);
INSERT INTO `gossip_menu` VALUES (4213, 5363, 18);
INSERT INTO `gossip_menu` VALUES (4213, 5364, 377);
INSERT INTO `gossip_menu` VALUES (4213, 5361, 378);
UPDATE `creature_template` SET `gossip_menu_id`=4213 WHERE `entry` = 3967;

-- Idriana
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2404, 0, 6, 'I would like to check my deposit box.', 3398, 9, 256, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2404 WHERE `entry` = 4155;

-- Bengus Deepforge
INSERT INTO `gossip_menu` VALUES (2762, 1261, 0);
INSERT INTO `gossip_menu` VALUES (2762, 3482, 4);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (367, 7, 164, 125, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (2762, 1262, 367);
INSERT INTO `gossip_menu` VALUES (2762, 3484, 368);
UPDATE `creature_template` SET `gossip_menu_id`=2762 WHERE `entry` = 4258;

-- Goblin Pit Crewman
INSERT INTO `gossip_menu` VALUES (50142, 778, 0);
UPDATE `creature_template` SET `gossip_menu_id`=50142 WHERE `entry` = 4429;

-- Gnome Pit Crewman
INSERT INTO `gossip_menu` VALUES (50143, 780, 0);
UPDATE `creature_template` SET `gossip_menu_id`=50143 WHERE `entry` = 4430;

-- Michael Garrett
UPDATE `creature_template` SET `gossip_menu_id`=4307 WHERE `entry` = 4551;

-- Wharfmaster Lozgil
INSERT INTO `gossip_menu` VALUES (4701, 5753, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4701 WHERE `entry` = 4631;

-- Sentry Point Captain
-- INSERT INTO `gossip_menu` VALUES (8793, 11264, 0);
UPDATE `creature_template` SET `npc_flags`=0 WHERE `entry` = 5086;

-- Krinkle Goodsteel
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2242, 0, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2242 WHERE `entry` = 5411;

-- Alchemist Pestlezugg
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (900, 0, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=900 WHERE `entry` = 5594;

-- Clyde Kellen
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 5690;

-- Vance Undergloom
INSERT INTO `gossip_menu` VALUES (4167, 5233, 0);
INSERT INTO `gossip_menu` VALUES (4167, 5319, 203);
INSERT INTO `gossip_menu` VALUES (4167, 5318, 380);
UPDATE `creature_template` SET `gossip_menu_id`=4167 WHERE `entry` = 5695;

-- Waldor
INSERT INTO `gossip_menu` VALUES (4186, 5288, 0);
INSERT INTO `gossip_menu` VALUES (4186, 5289, 377);
UPDATE `creature_template` SET `gossip_menu_id`=4186 WHERE `entry` = 5784;

-- Islen Waterseer
INSERT INTO `gossip_menu` VALUES (1281, 1916, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1281 WHERE `entry` = 5901;

-- Uthan Stillwater
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 5938;

-- Lau'Tiki
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 5941;

-- Strahad Farsan
INSERT INTO `gossip_menu` VALUES (2385, 2193, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2385 WHERE `entry` = 6251;

-- Acolyte Magaz
INSERT INTO `gossip_menu` VALUES (2912, 3591, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2912 WHERE `entry` = 6252;

-- Acolyte Wytula
INSERT INTO `gossip_menu` VALUES (2913, 3592, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2913 WHERE `entry` = 6254;

-- Menara Voidrender
INSERT INTO `gossip_menu` VALUES (2603, 3298, 0);
INSERT INTO `gossip_menu` VALUES (2603, 3299, 0);
INSERT INTO `gossip_menu` VALUES (2603, 3594, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2603 WHERE `entry` = 6266;

-- Zarrin
UPDATE `creature_template` SET `gossip_menu_id`=5853 WHERE `entry` = 6286;

-- Spirit Healer
UPDATE `creature_template` SET `gossip_menu_id`=83 WHERE `entry` = 6491;

-- Vizzklick
INSERT INTO `gossip_menu` VALUES (1301, 1933, 0);
INSERT INTO `gossip_menu` VALUES (1301, 1934, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1301, 0, 1, 'I wish to browse your wares.', 4424, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1301 WHERE `entry` = 6568;

-- Rokar Bladeshadow
INSERT INTO `gossip_menu` VALUES (181, 678, 0);
UPDATE `creature_template` SET `gossip_menu_id`=181 WHERE `entry` = 6586;

-- Ravenholdt Guard
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1008, 5, 349, 5, 0, 0, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`, `BroadCastTextID2`, `Probability2`, `BroadCastTextID3`, `Probability3`, `BroadCastTextID4`, `Probability4`) VALUES (5935, 8484, 1, 8485, 1, 8486, 1, 0, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4861, 5935, 1008);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1005, 30, 349, 4, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1006, 5, 349, 4, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1007, -1, 1005, 1006, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4861, 5934, 1007);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1002, 30, 349, 3, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1003, 5, 349, 3, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1004, -1, 1002, 1003, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4861, 5933, 1004);
UPDATE `creature_template` SET `gossip_menu_id`=4861 WHERE `entry` = 6766;

-- Ravenholdt Assassin
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`, `BroadCastTextID2`, `Probability2`, `BroadCastTextID3`, `Probability3`, `BroadCastTextID4`, `Probability4`) VALUES (5940, 8497, 1, 8498, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4862, 5940, 1008);
INSERT INTO `gossip_menu` VALUES (4862, 5939, 1007);
INSERT INTO `gossip_menu` VALUES (4862, 5938, 1004);
UPDATE `creature_template` SET `gossip_menu_id`=4862 WHERE `entry` = 6771;

-- Talvash del Kissel
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (507, -1, 440, 449, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (12855, 8254, 507);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (505, 1, 26898, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (508, -1, 440, 505, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (12855, 8283, 508);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (520, -1, 440, 445, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (12855, 8289, 520);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (518, -1, 440, 450, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (12855, 8296, 518);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (514, 23, 21815, 1, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (524, -1, 440, 514, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (12855, 8291, 524);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (12855, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 440);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (515, -1, 449, 441, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (513, 23, 21815, 1, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (521, -1, 440, 467, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (522, -1, 513, 521, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (523, -1, 515, 522, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (12855, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, 0, 0, 1285501, 0, 0, '', 0, 523);
DELETE FROM `gossip_scripts` WHERE `id`=1285501;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1285501, 0, 15, 27550, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Talvash del Kissel - Cast Spell Valentine');
UPDATE `creature_template` SET `gossip_menu_id`=12855 WHERE `entry` = 6826;

-- Doc Mixilpixil
INSERT INTO `gossip_menu` VALUES (5763, 6948, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5763 WHERE `entry` = 7207;

-- Kum'isha the Collector
INSERT INTO `gossip_menu` VALUES (752, 1302, 0);
UPDATE `creature_template` SET `gossip_menu_id`=752 WHERE `entry` = 7363;

-- Bloodmage Drazial
INSERT INTO `gossip_menu` VALUES (800, 1351, 0);
UPDATE `creature_template` SET `gossip_menu_id`=800 WHERE `entry` = 7505;

-- Bloodmage Lynnore
INSERT INTO `gossip_menu` VALUES (820, 1371, 0);
UPDATE `creature_template` SET `gossip_menu_id`=820 WHERE `entry` = 7506;

-- Curgle Cranklehop
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (942, 0, 0, 'Please tell me more about the hippogryphs.', 3814, 1, 1, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (942, 1, 0, 'Please tell me more about the Gordunni ogres.', 3923, 1, 1, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=942 WHERE `entry` = 7763;

-- Marvon Rivetseeker
UPDATE `creature_template` SET `gossip_menu_id`=1404 WHERE `entry` = 7771;

-- Talo Thornhoof
INSERT INTO `gossip_menu` VALUES (2851, 3545, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2851 WHERE `entry` = 7776;

-- Trenton Lighthammer
INSERT INTO `gossip_menu` VALUES (1143, 1759, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1142, 0, 0, 'Tell me more, Trenton.', 4183, 1, 1, 1143, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1142 WHERE `entry` = 7804;

-- Pratt McGrubben
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1965, 0, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1965 WHERE `entry` = 7852;

-- Jangdor Swiftstrider
INSERT INTO `npc_text` (`ID`, `BroadCastTextID0`, `Probability0`) VALUES (2368, 4957, 1);
INSERT INTO `gossip_menu` VALUES (1964, 2368, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1964, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1964 WHERE `entry` = 7854;

-- Hadoken Swiftstrider
INSERT INTO `gossip_menu` VALUES (6228, 7402, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6228 WHERE `entry` = 7875;

-- Erelas Ambersky
UPDATE `creature_template` SET `gossip_menu_id`=1482 WHERE `entry` = 7916;

-- Brannock
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 7946;

-- Kylanna Windwhisper
INSERT INTO `gossip_menu` VALUES (4125, 5104, 0);
INSERT INTO `gossip_menu` VALUES (4125, 5105, 25);
INSERT INTO `gossip_menu` VALUES (4125, 5106, 363);
UPDATE `creature_template` SET `gossip_menu_id`=4125 WHERE `entry` = 7948;

-- Xylinnia Starshine
INSERT INTO `gossip_menu` VALUES (4164, 5218, 0);
INSERT INTO `gossip_menu` VALUES (4164, 5220, 380);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (381, 7, 333, 125, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4164, 5219, 381);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4164, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4164 WHERE `entry` = 7949;

-- Dirge Quikcleave
UPDATE `creature_template` SET `gossip_menu_id`=4746 WHERE `entry` = 8125;

-- Nixx Sprocketspring
INSERT INTO `gossip_menu` VALUES (1469, 2138, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1469, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1469 WHERE `entry` = 8126;

-- Narv Hidecrafter
INSERT INTO `gossip_menu` VALUES (4842, 5335, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4842, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4842 WHERE `entry` = 8153;

-- Duhng
UPDATE `creature_template` SET `gossip_menu_id`=4747 WHERE `entry` = 8306;

-- Nyrill
INSERT INTO `gossip_menu` VALUES (1362, 1994, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1362 WHERE `entry` = 8399;

-- Raze
INSERT INTO `gossip_menu` VALUES (2306, 3001, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2306 WHERE `entry` = 8441;

-- Squire Maltrake
INSERT INTO `gossip_menu` VALUES (1625, 2279, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1625 WHERE `entry` = 8509;

-- Ag'tor Bloodfist
INSERT INTO `gossip_menu` VALUES (1401, 2033, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1401 WHERE `entry` = 8576;

-- Buzzek Bracketswing
INSERT INTO `gossip_menu` VALUES (4152, 5177, 0);
INSERT INTO `gossip_menu` VALUES (4152, 5180, 44);
INSERT INTO `gossip_menu` VALUES (4152, 5179, 393);
UPDATE `creature_template` SET `gossip_menu_id`=4152 WHERE `entry` = 8736;

-- Vazario Linkgrease
INSERT INTO `gossip_menu` VALUES (1465, 2133, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1465, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1465 WHERE `entry` = 8738;

-- Franclorn Forgewright
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (205, 9, 3801, 0, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (1664, 2316, 0);
INSERT INTO `gossip_menu` VALUES (1665, 2317, 0);
INSERT INTO `gossip_menu` VALUES (1666, 2318, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1665, 0, 0, 'Fascinating. Please, tell me more.', 4652, 1, 1, 1666, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1664, 0, 0, 'Continue please.', 4432, 1, 1, 1665, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1663, 0, 0, 'Amazing! I\'ve never spoken to a ghost. I wish to learn!', 4648, 1, 1, 1664, 0, 0, 0, 0, '', 0, 205);
UPDATE `creature_template` SET `gossip_menu_id`=1663 WHERE `entry` = 8888;

-- Hate'rel
INSERT INTO `gossip_menu` VALUES (1941, 2595, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1941 WHERE `entry` = 9034;

-- Anger'rel
INSERT INTO `gossip_menu` VALUES (1943, 2596, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1943 WHERE `entry` = 9035;

-- Vile'rel
INSERT INTO `gossip_menu` VALUES (1944, 2597, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1944 WHERE `entry` = 9036;

-- Seeth'rel
INSERT INTO `gossip_menu` VALUES (1946, 2600, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1946 WHERE `entry` = 9038;

-- Dope'rel
INSERT INTO `gossip_menu` VALUES (1948, 2602, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1948 WHERE `entry` = 9040;

-- Jenal
INSERT INTO `gossip_menu` VALUES (1661, 2314, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1662, 0, 0, 'What are you doing out here?', 4644, 1, 1, 1661, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1662 WHERE `entry` = 9047;

-- Eridan Bluewind
INSERT INTO `gossip_menu` VALUES (3142, 3874, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (130, 9, 4261, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (146, 23, 11445, 1, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (148, -1, 130, 146, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3142, 0, 0, 'I lost the Flute of the Ancients and require a replacement, Eridan.', 0, 1, 1, -1, 0, 0, 0, 0, '', 0, 148);
UPDATE `creature_template` SET `gossip_menu_id`=3142 WHERE `entry` = 9116;

-- Larion
INSERT INTO `gossip_menu` VALUES (5630, 6741, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5630 WHERE `entry` = 9118;

-- Williden Marshal
UPDATE `creature_template` SET `gossip_menu_id`=2424 WHERE `entry` = 9270;

-- Hol'anyee Marshal
UPDATE `creature_template` SET `gossip_menu_id`=2423 WHERE `entry` = 9271;

-- Petra Grossen
INSERT INTO `gossip_menu` VALUES (56003, 3093, 0);
INSERT INTO `gossip_menu` VALUES (56004, 3793, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (56003, 0, 0, 'What does Dadanga like to eat?', 0, 1, 1, 56004, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=56003 WHERE `entry` = 9273;

-- Donova Snowden
UPDATE `creature_template` SET `gossip_menu_id`=3802 WHERE `entry` = 9298;

-- Miblon Snarltooth
UPDATE `creature_template` SET `gossip_menu_id`=1844 WHERE `entry` = 9467;

-- Yuka Screwspigot
INSERT INTO `gossip_menu` VALUES (5541, 6594, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5541, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5541 WHERE `entry` = 9544;

-- Grim Patron
INSERT INTO `gossip_menu` VALUES (1962, 2636, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1962 WHERE `entry` = 9545;

-- Guzzling Patron
UPDATE `creature_template` SET `gossip_menu_id`=1963 WHERE `entry` = 9547;

-- Hammered Patron
INSERT INTO `gossip_menu` VALUES (1966, 2758, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1966 WHERE `entry` = 9554;

-- Grimble
INSERT INTO `gossip_menu` VALUES (1967, 2640, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1967 WHERE `entry` = 9558;

-- Grizzlowe
INSERT INTO `gossip_menu` VALUES (1968, 2641, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1968 WHERE `entry` = 9559;

-- Karna Remtravel
UPDATE `creature_template` SET `gossip_menu_id`=2081 WHERE `entry` = 9618;

-- Tink Sprocketwhistle
INSERT INTO `gossip_menu` VALUES (2464, 3156, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2464, 0, 1, 'Let me browse your goods.', 2823, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2464 WHERE `entry` = 9676;

-- Lanti'gah
INSERT INTO `gossip_menu` VALUES (2362, 3048, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2362 WHERE `entry` = 9990;

-- Spraggle Frock
UPDATE `creature_template` SET `gossip_menu_id`=2852 WHERE `entry` = 9997;

-- Ribbly's Crony
UPDATE `creature_template` SET `gossip_menu_id`=1966 WHERE `entry` = 10043;

-- Gwennyth Bly'Leggonde
INSERT INTO `gossip_menu` VALUES (4863, 5943, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4863 WHERE `entry` = 10219;

-- Tinkee Steamboil
INSERT INTO `gossip_menu` VALUES (2602, 3296, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2602 WHERE `entry` = 10267;

-- Jaron Stoneshaper
UPDATE `creature_template` SET `gossip_menu_id`=3761 WHERE `entry` = 10301;

-- Umi Rumplesnicker
UPDATE `creature_template` SET `gossip_menu_id`=6837 WHERE `entry` = 10305;

-- Gregor Greystone
UPDATE `creature_template` SET `gossip_menu_id`=3985 WHERE `entry` = 10431;

-- Malyfous Darkhammer
UPDATE `creature_template` SET `gossip_menu_id`=2984 WHERE `entry` = 10637;

-- High Executor Derrington
INSERT INTO `gossip_menu` VALUES (3041, 3753, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3041 WHERE `entry` = 10837;

-- Commander Ashlam Valorfist
UPDATE `creature_template` SET `gossip_menu_id`=3042 WHERE `entry` = 10838;

-- Argent Quartermaster Hasana
UPDATE `creature_template` SET `gossip_menu_id`=3421 WHERE `entry` = 10856;

-- Herald Moonstalker
UPDATE `creature_template` SET `gossip_menu_id`=5782 WHERE `entry` = 10878;

-- Warcaller Gorlach
UPDATE `creature_template` SET `gossip_menu_id`=5782 WHERE `entry` = 10880;

-- Bluff Runner Windstrider
UPDATE `creature_template` SET `gossip_menu_id`=5782 WHERE `entry` = 10881;

-- Greta Mosshoof
INSERT INTO `gossip_menu` VALUES (3074, 3807, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3074 WHERE `entry` = 10922;

-- Twizwick Sprocketgrind
INSERT INTO `gossip_menu` VALUES (4141, 5130, 0);
INSERT INTO `gossip_menu` VALUES (4141, 5129, 44);
INSERT INTO `gossip_menu` VALUES (4141, 5131, 394);
INSERT INTO `gossip_menu` VALUES (4141, 5128, 395);
UPDATE `creature_template` SET `gossip_menu_id`=4141 WHERE `entry` = 10993;

-- Jessir Moonbow
INSERT INTO `gossip_menu` VALUES (3128, 3864, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3128 WHERE `entry` = 11019;

-- Mukdrak
UPDATE `creature_template` SET `gossip_menu_id`=4142 WHERE `entry` = 11025;

-- Smokey LaRue
UPDATE `creature_template` SET `gossip_menu_id`=7109 WHERE `entry` = 11033;

-- Caretaker Alen
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3181, 0, 1, 'I wish to make a purchase.', 6465, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3181 WHERE `entry` = 11038;

-- Watcher Brownell
INSERT INTO `gossip_menu` VALUES (3133, 3868, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3133 WHERE `entry` = 11040;

-- Carlin Redpath
UPDATE `creature_template` SET `gossip_menu_id`=3864 WHERE `entry` = 11063;

-- Kitta Firewind
INSERT INTO `gossip_menu` VALUES (4169, 5243, 0);
INSERT INTO `gossip_menu` VALUES (4169, 5246, 203);
INSERT INTO `gossip_menu` VALUES (4169, 5247, 381);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (382, 7, 333, 200, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4169, 5244, 382);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4169, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4169 WHERE `entry` = 11072;

-- Hgarth
INSERT INTO `gossip_menu` VALUES (4170, 5248, 0);
INSERT INTO `gossip_menu` VALUES (4170, 5251, 203);
INSERT INTO `gossip_menu` VALUES (4170, 5252, 381);
INSERT INTO `gossip_menu` VALUES (4170, 5249, 382);
UPDATE `creature_template` SET `gossip_menu_id`=4170 WHERE `entry` = 11074;

-- Drakk Stonehand
INSERT INTO `gossip_menu` VALUES (4243, 5403, 0);
INSERT INTO `gossip_menu` VALUES (4243, 5406, 18);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (379, 7, 165, 200, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4243, 5405, 379);
UPDATE `creature_template` SET `gossip_menu_id`=4243 WHERE `entry` = 11097;

-- Hahrana Ironhide
INSERT INTO `gossip_menu` VALUES (4244, 5407, 0);
INSERT INTO `gossip_menu` VALUES (4244, 5410, 18);
INSERT INTO `gossip_menu` VALUES (4244, 5408, 379);
UPDATE `creature_template` SET `gossip_menu_id`=4244 WHERE `entry` = 11098;

-- Jinar'Zillen
INSERT INTO `gossip_menu` VALUES (4025, 4891, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4025 WHERE `entry` = 11317;

-- Var'jun
INSERT INTO `gossip_menu` VALUES (3646, 4443, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3646 WHERE `entry` = 11407;

-- Quartermaster Miranda Breechlock
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3461, 0, 0, 'I need another Argent Dawn Commission.', 6878, 1, 1, -1, 0, 3421, 0, 0, '', 0, 478);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3461, 1, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu` VALUES (7208, 8498, 0);
INSERT INTO `gossip_menu` VALUES (7213, 8503, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7208, 0, 0, 'Friendly', 12237, 1, 1, 7213, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu` VALUES (7209, 8499, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7208, 1, 0, 'Honored', 12238, 1, 1, 7209, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu` VALUES (7210, 8500, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7208, 2, 0, 'Revered', 12239, 1, 1, 7210, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu` VALUES (7212, 8502, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7208, 3, 0, 'Exalted', 12240, 1, 1, 7212, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3461, 2, 0, 'Miranda, could you please tell me the insignia cost of items that you are offering for adventurers with other reputations?', 12226, 1, 1, 7208, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3461 WHERE `entry` = 11536;

-- Loh'atu
INSERT INTO `gossip_menu` VALUES (3481, 4233, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (674, 8, 5535, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (675, 8, 5536, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (676, -1, 674, 675, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (3481, 4953, 676);
INSERT INTO `gossip_menu` VALUES (4061, 4954, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3481, 0, 0, 'The land of Azshara.', 7591, 1, 1, 4061, 0, 0, 0, 0, '', 0, 676);
INSERT INTO `gossip_menu` VALUES (4062, 4955, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3481, 1, 0, 'The Ruins of Eldarath.', 7593, 1, 1, 4062, 0, 0, 0, 0, '', 0, 676);
INSERT INTO `gossip_menu` VALUES (4063, 4956, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3481, 2, 0, 'The mage tower to the north.', 7594, 1, 1, 4063, 0, 0, 0, 0, '', 0, 676);
INSERT INTO `gossip_menu` VALUES (4064, 4957, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3481, 3, 0, 'The Timbermaw furbolgs.', 7600, 1, 1, 4064, 0, 0, 0, 0, '', 0, 676);
INSERT INTO `gossip_menu` VALUES (4065, 4958, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3481, 4, 0, 'The presence of blue dragons.', 7601, 1, 1, 4065, 0, 0, 0, 0, '', 0, 676);
UPDATE `creature_template` SET `gossip_menu_id`=3481 WHERE `entry` = 11548;

-- Meilosh
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3626, 0, 3, 'I\'d like to train.', 7149, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3626, 1, 1, 'Let me browse your goods.', 2823, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3626 WHERE `entry` = 11557;

-- Kernda
UPDATE `creature_template` SET `gossip_menu_id`=6801 WHERE `entry` = 11558;

-- Bardu Sharpeye
INSERT INTO `gossip_menu` VALUES (3601, 4353, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3601 WHERE `entry` = 11608;

-- Alexia Ironknife
INSERT INTO `gossip_menu` VALUES (3602, 4354, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3602 WHERE `entry` = 11609;

-- Kirsta Deepshadow
UPDATE `creature_template` SET `gossip_menu_id`=3603 WHERE `entry` = 11610;

-- Mickey Levine
INSERT INTO `gossip_menu` VALUES (3604, 4356, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3604 WHERE `entry` = 11615;

-- Nathaniel Dumah
UPDATE `creature_template` SET `gossip_menu_id`=3821 WHERE `entry` = 11616;

-- Ganoosh
INSERT INTO `gossip_menu` VALUES (12859, 8270, 507);
INSERT INTO `gossip_menu` VALUES (12859, 8283, 508);
INSERT INTO `gossip_menu` VALUES (12859, 8289, 520);
INSERT INTO `gossip_menu` VALUES (12859, 8296, 518);
INSERT INTO `gossip_menu` VALUES (12859, 8291, 524);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (12859, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 440);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (12859, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, 0, 0, 1285901, 0, 0, '', 0, 523);
DELETE FROM `gossip_scripts` WHERE `id`=1285901;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1285901, 0, 15, 27549, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ganoosh - Cast Spell Valentine');
UPDATE `creature_template` SET `gossip_menu_id`=12859 WHERE `entry` = 11750;

-- Tajarri
INSERT INTO `gossip_menu` VALUES (4084, 4977, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4084 WHERE `entry` = 11799;

-- Rabine Saturna
UPDATE `creature_template` SET `gossip_menu_id`=5102 WHERE `entry` = 11801;

-- Dendrite Starblaze
INSERT INTO `gossip_menu` VALUES (3901, 4753, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3901 WHERE `entry` = 11802;

-- Nathanos Blightcaller
INSERT INTO `gossip_menu` VALUES (3962, 4814, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3962 WHERE `entry` = 11878;

-- Umber
INSERT INTO `gossip_menu` VALUES (5101, 6153, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5101 WHERE `entry` = 11939;

-- Mai'Lahii
INSERT INTO `gossip_menu` VALUES (4066, 4959, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4066, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4066 WHERE `entry` = 12031;

-- Lui'Mala
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 12032;

-- Drulzegar Skraghook
INSERT INTO `gossip_menu` VALUES (4162, 5212, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4162 WHERE `entry` = 12340;

-- Adam Lind
UPDATE `creature_template` SET `gossip_menu_id`=4343 WHERE `entry` = 12658;

-- Pixel
INSERT INTO `gossip_menu` VALUES (5161, 6193, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5161 WHERE `entry` = 12724;

-- Je'neu Sancrea
INSERT INTO `gossip_menu` VALUES (4442, 5654, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4442 WHERE `entry` = 12736;

-- Mastok Wrilehiss
INSERT INTO `gossip_menu` VALUES (4441, 5653, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4441 WHERE `entry` = 12737;

-- Karang Amakkar
INSERT INTO `gossip_menu` VALUES (4401, 5613, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4401 WHERE `entry` = 12757;

-- Warsong Runner
INSERT INTO `gossip_menu` VALUES (4981, 6033, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4981 WHERE `entry` = 12863;

-- Myriam Moonsinger
INSERT INTO `gossip_menu` VALUES (4601, 5713, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4601 WHERE `entry` = 12866;

-- Kil'Hiwana
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 12961;

-- Monty
INSERT INTO `gossip_menu` VALUES (4841, 5894, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4841 WHERE `entry` = 12997;

-- Myrokos Silentform
INSERT INTO `gossip_menu` VALUES (4922, 5981, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4922 WHERE `entry` = 13085;

-- Layo Starstrike
UPDATE `creature_template` SET `gossip_menu_id`=5103 WHERE `entry` = 13220;

-- Hydraxian Honor Guard
INSERT INTO `gossip_menu` VALUES (5109, 6161, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5109 WHERE `entry` = 13322;

-- Great-father Winter
INSERT INTO `gossip_menu` VALUES (5232, 6250, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5232 WHERE `entry` = 13445;

-- Cavindra
INSERT INTO `gossip_menu` VALUES (5521, 6574, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5521 WHERE `entry` = 13697;

-- Keeper Marandis
INSERT INTO `gossip_menu` VALUES (5302, 6334, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5302 WHERE `entry` = 13698;

-- Selendra
INSERT INTO `gossip_menu` VALUES (5303, 6335, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5303 WHERE `entry` = 13699;

-- Centaur Pariah
INSERT INTO `gossip_menu` VALUES (5321, 6353, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5321 WHERE `entry` = 13717;

-- Corporal Teeka Bloodsnarl
INSERT INTO `gossip_menu` VALUES (6261, 7434, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6261 WHERE `entry` = 13776;

-- Scholar Runethorn
UPDATE `creature_template` SET `gossip_menu_id`=5741 WHERE `entry` = 14374;

-- Overlord Runthak
INSERT INTO `gossip_menu` VALUES (5752, 6935, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5752 WHERE `entry` = 14392;

-- Daio the Decrepit
INSERT INTO `gossip_menu` VALUES (5824, 6995, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5824 WHERE `entry` = 14463;

-- Short John Mithril
INSERT INTO `gossip_menu` VALUES (5921, 7074, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5921 WHERE `entry` = 14508;

-- Master Smith Burninate
INSERT INTO `gossip_menu` VALUES (5962, 7115, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (228, 5, 59, 5, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (5962, 7121, 228);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5962, 0, 1, 'I wish to browse your wares.', 4424, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5962 WHERE `entry` = 14624;

-- Taskmaster Scrange
INSERT INTO `gossip_menu` VALUES (5966, 7120, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5966 WHERE `entry` = 14626;

-- Hansel Heavyhands
INSERT INTO `gossip_menu` VALUES (5963, 7117, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5963 WHERE `entry` = 14627;

-- Evonice Sootsmoker
INSERT INTO `gossip_menu` VALUES (5942, 7095, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5942 WHERE `entry` = 14628;

-- Lookout Captain Lolo Longstriker
INSERT INTO `gossip_menu` VALUES (5941, 7094, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5941 WHERE `entry` = 14634;

-- Smith Slagtree
INSERT INTO `gossip_menu` VALUES (6085, 7239, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6085, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6085 WHERE `entry` = 14737;

-- Otho Moji'ko
INSERT INTO `gossip_menu` VALUES (6083, 7237, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6083, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6083 WHERE `entry` = 14738;

-- Mystic Yayo'jin
INSERT INTO `gossip_menu` VALUES (6086, 7240, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6086, 0, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6086 WHERE `entry` = 14739;

-- Huntsman Markhor
INSERT INTO `gossip_menu` VALUES (6088, 7242, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6088, 1, 0, 'I\'d like to stable my pet here', 0, 14, 8192, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6088 WHERE `entry` = 14741;

-- Captain Shatterskull
INSERT INTO `gossip_menu` VALUES (6524, 7726, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6524 WHERE `entry` = 14781;

-- Burth
INSERT INTO `gossip_menu` VALUES (6184, 7338, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6184 WHERE `entry` = 14827;

-- Gelvas Grimegate
INSERT INTO `gossip_menu` VALUES (6183, 7337, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6183 WHERE `entry` = 14828;

-- Yebb Neblegear
INSERT INTO `gossip_menu` VALUES (6161, 7314, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6161 WHERE `entry` = 14829;

-- Kerri Hicks
INSERT INTO `gossip_menu` VALUES (6223, 7394, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6223 WHERE `entry` = 14832;

-- Chronos
INSERT INTO `gossip_menu` VALUES (6224, 7395, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6224 WHERE `entry` = 14833;

-- Rinling
INSERT INTO `gossip_menu` VALUES (6225, 7397, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6225 WHERE `entry` = 14841;

-- Kruban Darkblade
INSERT INTO `gossip_menu` VALUES (6214, 7366, 0);
INSERT INTO `gossip_menu` VALUES (6221, 7376, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6214, 0, 0, 'When the Darkmoon Faire arrives, where will it be located?', 10109, 1, 1, 6221, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6214 WHERE `entry` = 14843;

-- Flik's Frog
INSERT INTO `gossip_menu` VALUES (6232, 7406, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6232 WHERE `entry` = 14866;

-- Exzhal
UPDATE `creature_template` SET `gossip_menu_id`=6422 WHERE `entry` = 14910;

-- Rin'wosho the Trader
UPDATE `creature_template` SET `gossip_menu_id`=6381 WHERE `entry` = 14921;

-- Wagner Hammerstrike
INSERT INTO `gossip_menu` VALUES (6343, 7536, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6343, 0, 1, 'Let me browse your selection of fireworks.', 10429, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6343 WHERE `entry` = 15011;

-- Javnir Nashak
INSERT INTO `gossip_menu` VALUES (6342, 7535, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6342, 0, 1, 'Let me browse your selection of fireworks.', 10429, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6342 WHERE `entry` = 15012;

-- Deathmaster Dwire
INSERT INTO `gossip_menu` VALUES (6361, 7554, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6361 WHERE `entry` = 15021;

-- Zandalarian Emissary
UPDATE `creature_template` SET `gossip_menu_id`=6519 WHERE `entry` = 15076;

-- Jang
INSERT INTO `gossip_menu` VALUES (6514, 7696, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6514 WHERE `entry` = 15078;

-- Fishbot 5000
INSERT INTO `gossip_menu` VALUES (6447, 7641, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6447 WHERE `entry` = 15079;

-- Ralo'shan the Eternal Watcher
UPDATE `creature_template` SET `gossip_menu_id`=6588 WHERE `entry` = 15169;

-- Vargus
INSERT INTO `gossip_menu` VALUES (6527, 7729, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6527, 0, 1, 'Let me browse your goods.', 2823, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6527 WHERE `entry` = 15176;

-- Mishta
INSERT INTO `gossip_menu` VALUES (6528, 7730, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6528, 0, 1, 'Let me browse your goods.', 2823, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6528 WHERE `entry` = 15179;

-- Baristolth of the Shifting Sands
INSERT INTO `gossip_menu` VALUES (6529, 7731, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6529 WHERE `entry` = 15180;

-- Commander Mar'alith
INSERT INTO `gossip_menu` VALUES (6530, 7732, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6530 WHERE `entry` = 15181;

-- Vish Kozus
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1020, 9, 8283, 0, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (6531, 7751, 1020);
INSERT INTO `gossip_menu` VALUES (6531, 7733, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6531 WHERE `entry` = 15182;

-- Huum Wildmane
INSERT INTO `gossip_menu` VALUES (6564, 7779, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6564 WHERE `entry` = 15270;

-- Aurel Goldleaf
INSERT INTO `gossip_menu` VALUES (6567, 7782, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6567 WHERE `entry` = 15282;

-- Bor Wildmane
INSERT INTO `gossip_menu` VALUES (6583, 7797, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6583 WHERE `entry` = 15306;

-- Nafien
UPDATE `creature_template` SET `gossip_menu_id`=6800 WHERE `entry` = 15395;

-- Janela Stouthammer
INSERT INTO `gossip_menu` VALUES (6623, 7874, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6623 WHERE `entry` = 15443;

-- Windcaller Kaldon
INSERT INTO `gossip_menu` VALUES (6796, 8114, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6796 WHERE `entry` = 15540;

-- Merok Longstride
INSERT INTO `gossip_menu` VALUES (6926, 8215, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6926 WHERE `entry` = 15613;

-- Squire Leoren Mal'derath
INSERT INTO `gossip_menu` VALUES (6791, 8108, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6791, 0, 0, 'I\'d like to stable my pet here', 0, 14, 8192, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6791 WHERE `entry` = 15722;

-- Officer Lunalight
UPDATE `creature_template` SET `gossip_menu_id`=6803 WHERE `entry` = 15762;

-- Officer Porterhouse
UPDATE `creature_template` SET `gossip_menu_id`=6804 WHERE `entry` = 15763;

-- Officer Ironbeard
UPDATE `creature_template` SET `gossip_menu_id`=6805 WHERE `entry` = 15764;

-- Officer Maloof
UPDATE `creature_template` SET `gossip_menu_id`=6806 WHERE `entry` = 15766;

-- Valadar Starsong
INSERT INTO `gossip_menu` VALUES (6917, 8202, 0);
INSERT INTO `gossip_menu` VALUES (6936, 8225, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6917, 0, 0, 'How can I summon Omen?', 11689, 1, 1, 6936, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6917, 2, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6917, 3, 0, 'Farewell.', 0, 1, 1, -1, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6917 WHERE `entry` = 15864;

-- Lunar Festival Harbinger
INSERT INTO `gossip_menu` VALUES (6918, 8205, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (229, 8, 8867, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (230, 23, 21711, 1, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (231, -1, 229, 230, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6918, 0, 0, 'I\'d like a new invitation to the Lunar Festival.', 11617, 1, 1, -1, 0, 6918, 0, 0, '', 0, 231);
DELETE FROM `gossip_scripts` WHERE `id`=6918;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6918, 0, 15, 26375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunar Festival Harbinger - Cast Spell Create Lunar Festival Invitation');
UPDATE `creature_template` SET `gossip_menu_id`=6918 WHERE `entry` = 15895;

-- Sergeant Carnes
INSERT INTO `gossip_menu` VALUES (6923, 8212, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6923 WHERE `entry` = 15903;

-- Vi'el
INSERT INTO `gossip_menu` VALUES (7046, 8292, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7046, 0, 1, 'Hey Vi\'el, show me your wares!', 11913, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7046 WHERE `entry` = 16015;

-- Dirk Thunderwood
INSERT INTO `gossip_menu` VALUES (7045, 8280, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7045 WHERE `entry` = 16091;

-- Korfax, Champion of the Light
INSERT INTO `gossip_menu` VALUES (7099, 8353, 0);
INSERT INTO `gossip_menu` VALUES (7151, 8415, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7099, 1, 0, 'Korfax, where can I find Dark Iron scraps?', 12088, 1, 1, 7151, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu` VALUES (7106, 8363, 0);
INSERT INTO `gossip_menu` VALUES (7107, 8364, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8365, 11965, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7108, 8365, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7107, 0, 0, 'Anything else?', 11964, 1, 1, 7108, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7106, 0, 0, 'Continue please.', 11962, 1, 1, 7107, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7099, 0, 0, 'What is Dreadnaught armor?', 11960, 1, 1, 7106, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7099 WHERE `entry` = 16112;

-- Father Inigo Montoy
INSERT INTO `gossip_menu` VALUES (7098, 8352, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7098 WHERE `entry` = 16113;

-- Scarlet Commander Marjhan
INSERT INTO `gossip_menu` VALUES (7100, 8354, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7100 WHERE `entry` = 16114;

-- Commander Eligor Dawnbringer
INSERT INTO `gossip_menu` VALUES (7097, 8351, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7097 WHERE `entry` = 16115;

-- Archmage Angela Dosantos
INSERT INTO `gossip_menu` VALUES (7096, 8350, 0);
INSERT INTO `gossip_menu` VALUES (7135, 8388, 0);
INSERT INTO `gossip_menu` VALUES (7134, 8389, 0);
INSERT INTO `gossip_menu` VALUES (7133, 8390, 0);
INSERT INTO `gossip_menu` VALUES (7132, 8391, 0);
INSERT INTO `gossip_menu` VALUES (7131, 8392, 0);
INSERT INTO `gossip_menu` VALUES (7130, 8393, 0);
INSERT INTO `gossip_menu` VALUES (7129, 8394, 0);
INSERT INTO `gossip_menu` VALUES (7128, 8395, 0);
INSERT INTO `gossip_menu` VALUES (7127, 8396, 0);
INSERT INTO `gossip_menu` VALUES (7126, 8397, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7127, 0, 0, 'Is there anything else?', 12039, 1, 1, 7126, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7128, 0, 0, 'Please, tell me more.', 12037, 1, 1, 7127, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7129, 0, 0, 'This is disturbing. Please continue.', 12035, 1, 1, 7128, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7130, 0, 0, 'What?', 7652, 1, 1, 7129, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7131, 0, 0, 'Please continue.', 4247, 1, 1, 7130, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7132, 0, 0, 'Please continue.', 4247, 1, 1, 7131, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7133, 0, 0, 'What corruption?', 12027, 1, 1, 7132, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7134, 0, 0, 'Please continue.', 4247, 1, 1, 7133, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7135, 0, 0, 'What Guardian? I don\'t understand any of this.', 12023, 1, 1, 7134, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7096, 0, 0, 'What is Atiesh?', 12021, 1, 1, 7135, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu` VALUES (7150, 8414, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7096, 1, 0, 'Where can I find core of elements?', 12086, 1, 1, 7150, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7096 WHERE `entry` = 16116;

-- Rohan the Assassin
INSERT INTO `gossip_menu` VALUES (7101, 8355, 0);
INSERT INTO `gossip_menu` VALUES (7145, 8409, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7101, 1, 0, 'Where can I find bone fragments?', 12077, 1, 1, 7145, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8380, 12004, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7118, 8380, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8381, 12006, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7119, 8381, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8382, 12008, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7120, 8382, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8383, 12010, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7121, 8383, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8384, 12012, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7122, 8384, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7121, 0, 0, 'Hey wait, Gadgetzan has a disco?', 12011, 1, 1, 7122, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7120, 0, 0, 'Wow, you\'re insane, aren\'t you?', 12009, 1, 1, 7121, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7119, 0, 0, 'What? Bonescythe?', 12007, 1, 1, 7120, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7118, 0, 0, 'So what brings you to Light\'s Hope?', 12005, 1, 1, 7119, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7101, 0, 0, 'What is it that you do exactly, Rohan?', 12003, 1, 1, 7118, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7101 WHERE `entry` = 16131;

-- Huntsman Leopold
replace INTO`gossip_menu` VALUES (7102, 8356, 0);
replace INTO `gossip_menu` VALUES (7144, 8408, 0);
replace INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7102, 1, 0, 'Where can I find crypt fiend parts, Leopold?', 12075, 1, 1, 7144, 0, 0, 0, 0, '', 0, 0);
replace INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8369, 11979, 1, 0, 0);
replace INTO `gossip_menu` VALUES (7111, 8369, 0);
replace INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8370, 11981, 1, 0, 0);
replace INTO `gossip_menu` VALUES (7112, 8370, 0);
replace INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7111, 0, 0, 'Continue please.', 11980, 1, 1, 7112, 0, 0, 0, 0, '', 0, 0);
replace INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7102, 0, 0, 'What is Cryptstalker armor?', 11978, 1, 1, 7111, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7102 WHERE `entry` = 16132;

-- Mataus the Wrathcaster
INSERT INTO `gossip_menu` VALUES (7105, 8359, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7105 WHERE `entry` = 16133;

-- Rimblat Earthshatter
INSERT INTO `gossip_menu` VALUES (7103, 8357, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7103 WHERE `entry` = 16134;

-- Rayne
INSERT INTO `gossip_menu` VALUES (7152, 8416, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7104, 1, 0, 'Rayne, where should I look for savage fronds?', 12090, 1, 1, 7152, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8385, 12016, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7123, 8385, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8386, 12018, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7124, 8386, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8387, 12020, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7125, 8387, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7124, 0, 0, 'What kind of services?', 12019, 1, 1, 7125, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7123, 0, 0, 'Are these lands not beyond healing? They look pretty beat up.', 12017, 1, 1, 7124, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7104, 0, 0, 'Hello, Rayne. What brings the Cenarion Circle to the Plaguelands?', 12015, 1, 1, 7123, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7104 WHERE `entry` = 16135;

-- Bloodsail Traitor
INSERT INTO `gossip_menu` VALUES (7236, 8536, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7236 WHERE `entry` = 16399;

-- Mupsi Shacklefridd
INSERT INTO `gossip_menu` VALUES (7237, 8537, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7237 WHERE `entry` = 16418;

-- Midsummer Celebrant
UPDATE `creature_template` SET `gossip_menu_id`=9148 WHERE `entry` = 16781;

-- Festival Loremaster
INSERT INTO `gossip_menu` VALUES (7326, 8703, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7326 WHERE `entry` = 16817;

-- Festival Talespinner
UPDATE `creature_template` SET `gossip_menu_id`=9298 WHERE `entry` = 16818;



-- Add missing emote when Kul Tiras Sailor charges.
DELETE FROM `creature_ai_events` WHERE `creature_id`=3128;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (312801, 3128, 0, 9, 0, 100, 0, 5, 30, 0, 0, 312801, 0, 0, 'Kul Tiras Sailor - Cast Rushing Charge');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (312802, 3128, 0, 2, 0, 100, 0, 15, 0, 0, 0, 312802, 0, 0, 'Kul Tiras Sailor - Flee at 15% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=312801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (312801, 0, 15, 6268, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kul Tiras Sailor - Cast Spell Rushing Charge');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (312801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1254, 0, 0, 0, 0, 0, 0, 0, 0, 'Kul Tiras Sailor - Say Emoted Text');


