update quest_template set requiredraces = 434 where entry = 70052;

UPDATE item_template SET description='' WHERE entry=51220;
UPDATE item_template SET duration='0' WHERE entry=51220;

update item_template set name = 'Slayer\'s Slippers' where entry = 14756;

delete from quest_template where entry = 2770 and patch = 0;

update creature_loot_template set chanceorquestchance = -100 where item = 70035;
update item_template set max_count = 1 where entry = 70035;

replace into npc_vendor values (50053, 80653, 0, 0, 0, 0);

delete from creature_loot_template where item = 51868;
replace into creature_loot_template (entry, item, chanceorquestchance, groupid, mincountorref, maxcount) values (524, 51868, -100, 6, 1, 1);

update quest_template set questlevel = 8, minlevel = 5 where entry = 811;
update quest_template set questlevel = 10, minlevel = 5 where entry = 820;

update item_template set display_id = 7987 where entry = 20373;


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


-- Fix wrong quest id for A Donation of Wool.
UPDATE `creature_questrelation` SET `quest`=7792 WHERE `quest`=7797;
UPDATE `creature_involvedrelation` SET `quest`=7792 WHERE `quest`=7797;
UPDATE `quest_template` SET `PrevQuestId`=7792 WHERE `PrevQuestId`=7797;
UPDATE `quest_template` SET `NextQuestId`=7792 WHERE `NextQuestId`=7797;
UPDATE `quest_template` SET `NextQuestInChain`=7792 WHERE `NextQuestInChain`=7797;
UPDATE `quest_template` SET `ExclusiveGroup`=-7792 WHERE `ExclusiveGroup`=-7797;
UPDATE `quest_template` SET `entry`=7792 WHERE `entry`=7797;
UPDATE `quest_template` SET `RewXP`=660, `RewMoneyMaxLevel`=3900 WHERE `entry`=7792 && `patch`=7;

update quest_template set prevquestid = 7807  where entry = 7808;
update quest_template set prevquestid = 7808  where entry = 7809;

update creature set spawntimesecsmin = 300, spawntimesecsmax = 300 where id = 3821;

replace into  npc_trainer  values (4160, 3178, 50, 171, 175, 25, 0, 5875);
replace into  npc_trainer  values (4611, 3178, 50, 171, 175, 25, 0, 5875);
replace into  npc_trainer  values (7948, 3178, 50, 171, 175, 25, 0, 5875);
replace into  npc_trainer  values (1386, 3178, 50, 171, 175, 25, 0, 5875);

UPDATE gameobject SET id = 12666 WHERE guid = 48530;
update gameobject_template set displayid = 338 where entry = 12666;

delete from creature_loot_template where item = 9471;
replace into creature_loot_template (entry, item, chanceorquestchance, groupid, mincountorref, maxcount) values (7796, 9471, -100, 6, 1, 1);

REPLACE INTO `skinning_loot_template` VALUES (4400, 4234, 43.2093, 1, 1, 1, 0, 0, 10);
REPLACE INTO `skinning_loot_template` VALUES (4400, 4235, 3.1439, 1, 1, 1, 0, 0, 10);
REPLACE INTO `skinning_loot_template` VALUES (4400, 4304, 40.000, 1, 1, 1, 0, 0, 10);
REPLACE INTO `skinning_loot_template` VALUES (4400, 8169, 4.2254, 1, 1, 1, 0, 0, 10);
REPLACE INTO `skinning_loot_template` VALUES (4400, 8167, 9.4215, 1, 1, 1, 0, 0, 10);

UPDATE `creature_template` SET `skinning_loot_id`='4400' WHERE `entry`=4400;

update item_loot_template set chanceorquestchance = 0, groupid = 1 where entry = 9541;

update quest_template set objectives = 'For the belt plans, I\'ll be needin\' 20 thorium bars.' where entry = 7653;
update quest_template set objectives = 'For the boot plans, I\'ll be needin\' 40 thorium bars. Yep, 40. Are you gonna cry? Would you like a hanky?' where entry = 7654;
update quest_template set objectives = 'For the bracer plans, I\'ll be needin\' 20 thorium bars.' where entry = 7655;
update quest_template set objectives = 'For the chest piece plans, I\'ll be needin\' 60 thorium bars.\n\nOh boy, there you go again. Are you gonna be runnin\' to yer blue Gods, askin\' why they have forsaken you?!?\n\nToughen up, Nancy! Nobody ever said life\'s fair.' where entry = 7656;
update quest_template set objectives = 'Just hand over 50 thorium bars and the helm plans are yers.' where entry = 7657;
update quest_template set objectives = 'Just hand over 60 thorium bars and the leg plans are yers.\n\nI know, I\'m driving you into bankruptcy! I\'ve heard it all before so you can save your sob story, weakling.' where entry = 7658;
update quest_template set objectives = 'For the shoulder plans, I\'ll be needin\' 20 thorium bars.' where entry = 7659;

update gameobject set position_x = -5135.0, position_y = -3402.10, position_z = 302.07, orientation = 3.77 where guid = 4007543;
update gameobject set position_x = -10198.44, position_y = 1256.97, position_z = 36.85, orientation = 5.54 where guid = 4007544;
update gameobject set position_x = -9965.76, position_y = -3692.54, position_z = 21.7, orientation =3.58 where guid = 30992;

update gameobject set spawntimesecsmin = 7200, spawntimesecsmax = 7200 where id = 153451;

