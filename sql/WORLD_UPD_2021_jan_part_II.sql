update item_template set allowable_race = -1 where entry in (5102, 4898, 4897);

update quest_template set method = 1 where entry in (50300, 50301, 50302, 50303);

replace into item_template (entry, name, inventory_type, display_id, quality, bonding, description, spellid_1, spelltrigger_1, allowable_race) values
(50440, 'Scarlet Crusade Insignia', 11, 9834, 2, 1, "This ring marks the bearer as a fully fledged member of the Scarlet Crusade.", 0, 0, 0);

replace into broadcast_text (ID, MaleText) values ('90501', 'I’m a free knight! I don’t have a lord. You got a problem with that?\n\n<She glares at you for a moment before lighting up.>\n\nAh whatever... Welcome to our chapel! I can give you a sleeping bag or offer you some rations.');
 
UPDATE `quest_template` SET `ReqItemCount1`='5', `ReqItemCount2`='3' WHERE (`entry`='80304') AND (`patch`='0');
UPDATE `quest_template` SET `ReqItemCount1`='5' WHERE (`entry`='80360') AND (`patch`='0');

update skill_line_ability set race_mask = 2047 where id = 251;
update skill_line_ability set race_mask = 2047 where id = 4413;
update skill_line_ability set race_mask = 2047 where id = 2929;
update skill_line_ability set race_mask = 2047 where id = 4412;
update skill_line_ability set race_mask = 0 where id = 11026;

update skill_line_ability set race_mask = 1613 where id = 3269;
update skill_line_ability set race_mask = 1613 where id = 3270;
update skill_line_ability set race_mask = 1613 where id = 3272;
update skill_line_ability set race_mask = 1613 where id = 5989;
update skill_line_ability set race_mask = 1613 where id = 5990;
update skill_line_ability set race_mask = 1613 where id = 5992;

update skill_line_ability set race_mask = 434 where id = 3271;
update skill_line_ability set race_mask = 434 where id = 3273;
update skill_line_ability set race_mask = 434 where id = 3274;
update skill_line_ability set race_mask = 434 where id = 5991;
update skill_line_ability set race_mask = 434 where id = 5993;
update skill_line_ability set race_mask = 434 where id = 5994;

update creature_template set faction = 7, equipment_id = 0, gold_min = 0, gold_max = 0, type = 10 where entry = 80965;

update quest_template set requiredraces = 434 where requiredraces = 255;
update quest_template set requiredraces = 589 where requiredraces = 256;

update item_template set required_level = 23, item_level = 23, disenchant_id = 41 where entry = 80712;
update item_template set required_level = 23 where entry = 80730;

update item_template set class = 4,  subclass = 1 where entry = 80759;

-- Childern's Week monthly:
UPDATE game_event SET occurence = 42480 WHERE entry = 10;

update quest_template set title = 'Defending the Supply Lines' where entry = 80255;

update gameobject_template set size = 1.1, name = 'Tent (Human)' where entry = 1000001; -- Human tent
update gameobject_template set size = 1.1, displayid = 32215, name = 'Tent (Orc)' where entry = 1000236; -- Orc tent

replace into `gameobject_template` values 
-- Unused:
(1000456, 0, 5, 9149, 'Tent (Night Elf)', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_survival_tent'),
(1000457, 0, 5, 6738, 'Tent (Dwarf)', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_survival_tent'),
(1000458, 0, 5, 28901, 'Tent (Gnome)', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_survival_tent'),
(1000459, 0, 5, 29663, 'Tent (High Elf)', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_survival_tent'),
(1000460, 0, 5, 28901, 'Tent (Troll)', 0, 0, 0.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_survival_tent'),
(1000461, 0, 5, 32215, 'Tent (Tauren)', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_survival_tent'),
(1000462, 0, 5, 22554, 'Tent (Undead)', 0, 0, 1.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_survival_tent'),
(1000463, 0, 5, 23899, 'Tent (Goblin)', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_survival_tent');
-- Unused.

replace into quest_template values
 ('60154', '0', '2', '12', '6', '0', '8', '0', '0', '0', '0',
'0', '0', '0', '0', '0','0',
'0', '0', '0', '0', '0', '76', '0', '0', '0',
'0', '0', '0', 'Jasperlode Infestation', 'After your scouting mission at the Jasperlode Mine, I\'ve gotten reports that a stray brood of spiders from Duskwood has made the depths of the mine their home while using the kobolds to feed and increase their population.\n\nKobolds, the Defias, and now spiders? We cannot afford to spread out our men thinner than they already are.\n\nGo back to the mine and clear out the infestation before they spread all over the forest!', 'Go to the Jasperlode Mine northeast of Goldshire and clear out the spider infestation.', 'It\'s relieving to know those spiders will not be a future threat to us. Have a few coins for your trouble.', 'Their numbers are increasing every second you waste. We can\'t afford to wait any longer.', '', '', '',
'', '', '0', '0', '0', '0', '0', '0', '0',
'0', '0', '0', '0', '0', '0', '0', '0',
'0', '43', '0', '0', '0', '8',
'0', '0', '0', '0', '0', '0',
'0', '0', '0', '0', '0', '0', '0',
'0', '0', '0', '0', '0', '0',
'0', '0', '0', '0', '0', '0', '0', '0', '72',
'0', '0', '0', '0', '150', '0', '0', '0',
'0', '300', '378', '0', '0', '0', '0', '0',
'0', '0', '0', '0', '25', '0', '0', '0', '1',
'0', '0', '0', '0', '0', '0', '0',
'0', '0', '0', '0', '0','0',
0, 0);
replace into creature_questrelation values ('240','60154','10','10');
replace into creature_involvedrelation values ('240','60154','10','10');

replace into quest_template values
('60155', '0', '2', '33', '39', '0', '39', '0', '0', '0', '0',
'0', '0', '0', '0', '0','0',
'0', '0', '0', '0', '0', '0', '0', '0', '0',
'0', '0', '0', 'South Seas Delicacy', 'Crab legs - they are such a delicious thing. They go well with everything! Undermine Claw Chowder, Goldthorn Tea, and even other crab legs! Maybe you\'re strong enough to catch them and get the crab legs I need?\n\nYou can find them at the Wild Shore which is directly south of Booty Bay. Be careful, though. I heard the shore got invaded by Bloodsail Buccaneers. That would explain why my supplier stopped coming.', 'Bring 10 Southern Sand Crawler Legs to Innkeeper Skindle in Booty Bay.', 'Oh, wonderful legs! Grill \'em, boil \'em, put ‘em in a pot.\n\nYou... want a reward? I think this should be enough.', 'Get a move on. My customers are waiting!', '', '', '',
'', '', '81013', '0', '0', '0', '10', '0', '0',
'0', '0', '0', '0', '0', '0', '0', '0',
'0', '0', '0', '0', '0', '0',
'0', '0', '0', '0', '0', '0',
'0', '81014', '81015', '0', '0', '0', '0',
'1', '1', '0', '0', '0', '0',
'0', '0', '0', '0', '0', '0', '0', '0', '21',
'0', '0', '0', '0', '200', '0', '0', '0',
'0', '4000', '1800', '0', '0', '0', '0', '0',
'0', '0', '0', '0', '0', '0', '0', '0', '0',
'0', '0', '0', '14', '0', '0', '0',
'0', '0', '0', '0', '0','0',
0, 0);
replace into creature_questrelation values ('6807','60155','10','10');
replace into creature_involvedrelation values ('6807','60155','10','10');
 
-- Cloth donation quests (HE):

REPLACE INTO `quest_template` VALUES (80370, 3, 0, 1657, 12, 0, 60, 0, 0, 1613, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80371, 0, 0, 0, 0, 0, 'A Donation of Wool', NULL, NULL, 'Wonderful! We thank you for your generous donation, $N!', 'We are currently accepting donations for wool cloth. A donation of sixty pieces of wool cloth will net you full recognition by Alah\'thalas for your generous actions. Our stores are such on wool that we would only need sixty pieces from you total; we should be able to acquire enough from others in the realm to support our drive.$B$BIf you have the sixty pieces of wool cloth on you and are ready to donate them, I\'m able to take them from you now.', NULL, NULL, NULL, NULL, NULL, 2592, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 269, 0, 0, 0, 0, 150, 0, 0, 0, 0, 0, 390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

REPLACE INTO `quest_template` VALUES (80371, 3, 0, 1537, 26, 0, 60, 0, 0, 1613, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80370, 80372, 0, 0, 0, 0, 0, 'A Donation of Silk', '', '', 'Wonderful! We thank you for your generous donation, $N!', 'As with most other fabrics, our stocks of silk are at an all-time low. Our stores are such that we\'d only need sixty pieces of silk from you total; we should be able to reach our goal with the support of others.$B$BA benevolent gift such as silk, might I add, would certainly increase your local standing in the community! If you have the sixty pieces of silk cloth on you and are ready to donate them, I\'m able to take them from you now.', '', '', '', '', '', 4306, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 269, 0, 0, 0, 0, 150, 0, 0, 0, 0, 0, 990, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0);

REPLACE INTO `quest_template` VALUES (80372, 3, 0, 1537, 40, 0, 60, 0, 0, 1613, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80371, 80373, 0, 0, 0, 0, 0, 'A Donation of Mageweave', '', '', 'Wonderful! We thank you for your generous donation, $N!', 'Mageweave is running low, and we could use your help to replenish our stocks!  By counting on the community as a whole, we would only need a donation of 60 pieces of mageweave cloth from you to enable us to reach our goal.  Such generosity would not go unnoticed by the Alah\'thalas, I assure you!$B$BIf you have the sixty pieces of mageweave cloth on you and are ready to donate them, I\'m able to take them from you now.', '', '', '', '', '', 4338, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 269, 0, 0, 0, 0, 150, 0, 0, 0, 0, 0, 1980, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0);

REPLACE INTO `quest_template` VALUES (80373, 3, 0, 1537, 50, 0, 60, 0, 0, 1613, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80372, 80374, 0, 0, 0, 0, 0, 'A Donation of Runecloth', '', '', 'Fantastic - these will go right to use, I assure you. Thank you again for your assistance! We\'d certainly be lost without you.$b$bWith all the donations you\'ve made, I would certainly process any additional runecloth donations you care to make in the future. Just be sure to check in with me, and I\'ll personally make sure that your good deeds won\'t go unrecognized!', '$n, you\'ve been a tremendous contributor to our cloth drive. As we work hard to replenish our reserves, one form of cloth remains critically low - runecloth. We are in absolutely dire need of it, and we hope that you will be able to help us as you have in the past!$b$bIf you are willing, please bring me what runecloth you can spare. We\'ll initially accept a single donation of sixty, and then we\'ll go from there.', '', '', '', '', '', 14047, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 269, 0, 0, 0, 0, 150, 0, 0, 0, 0, 0, 3960, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0);

REPLACE INTO `quest_template` VALUES (80374, 3, 0, 1537, 50, 0, 60, 0, 0, 1613, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 80373, 0, 0, 0, 0, 0, 0, 'Additional Runecloth', '', '', 'Greetings once again, $N! Our need for runecloth is constant, and we can always use additional resources if you are willing to part with them. For an additional stack of twenty runecloth, I will make sure that you are recognized for your continuing efforts on behalf of Alah’thalas.', 'Whenever you are ready to hand in the stack of runecloth, I\'ll accept it.', '', '', '', '', '', 14047, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 269, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0);

replace into creature_questrelation values ('80459','80370','10','10');
replace into creature_questrelation values ('80459','80371','10','10');
replace into creature_questrelation values ('80459','80372','10','10');
replace into creature_questrelation values ('80459','80373','10','10');
replace into creature_questrelation values ('80459','80374','10','10');

replace into creature_involvedrelation values ('80459','80370','10','10');
replace into creature_involvedrelation values ('80459','80371','10','10');
replace into creature_involvedrelation values ('80459','80372','10','10');
replace into creature_involvedrelation values ('80459','80373','10','10');
replace into creature_involvedrelation values ('80459','80374','10','10');

-- Cloth donation quests (RT):

REPLACE INTO `quest_template` VALUES (80375, 3, 0, 1657, 12, 0, 60, 0, 0, 434, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80376, 0, 0, 0, 0, 0, 'A Donation of Wool', NULL, NULL, 'Wonderful! We thank you for your generous donation, $N!', 'We are currently accepting donations for wool cloth. A donation of sixty pieces of wool cloth will net you full recognition by Amani\'alor for your generous actions. Our stores are such on wool that we would only need sixty pieces from you total; we should be able to acquire enough from others in the realm to support our drive.$B$BIf you have the sixty pieces of wool cloth on you and are ready to donate them, I\'m able to take them from you now.', NULL, NULL, NULL, NULL, NULL, 2592, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 893, 0, 0, 0, 0, 150, 0, 0, 0, 0, 0, 390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

REPLACE INTO `quest_template` VALUES (80376, 3, 0, 1537, 26, 0, 60, 0, 0, 434, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80375, 80377, 0, 0, 0, 0, 0, 'A Donation of Silk', '', '', 'Wonderful! We thank you for your generous donation, $N!', 'As with most other fabrics, our stocks of silk are at an all-time low. Our stores are such that we\'d only need sixty pieces of silk from you total; we should be able to reach our goal with the support of others.$B$BA benevolent gift such as silk, might I add, would certainly increase your local standing in the community! If you have the sixty pieces of silk cloth on you and are ready to donate them, I\'m able to take them from you now.', '', '', '', '', '', 4306, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 893, 0, 0, 0, 0, 150, 0, 0, 0, 0, 0, 990, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0);

REPLACE INTO `quest_template` VALUES (80377, 3, 0, 1537, 40, 0, 60, 0, 0, 434, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80376, 80378, 0, 0, 0, 0, 0, 'A Donation of Mageweave', '', '', 'Wonderful! We thank you for your generous donation, $N!', 'Mageweave is running low, and we could use your help to replenish our stocks!  By counting on the community as a whole, we would only need a donation of 60 pieces of mageweave cloth from you to enable us to reach our goal.  Such generosity would not go unnoticed by the Amani\'Alor, I assure you!$B$BIf you have the sixty pieces of mageweave cloth on you and are ready to donate them, I\'m able to take them from you now.', '', '', '', '', '', 4338, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 893, 0, 0, 0, 0, 150, 0, 0, 0, 0, 0, 1980, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0);

REPLACE INTO `quest_template` VALUES (80378, 3, 0, 1537, 50, 0, 60, 0, 0, 434, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80377, 80379, 0, 0, 0, 0, 0, 'A Donation of Runecloth', '', '', 'Fantastic - these will go right to use, I assure you. Thank you again for your assistance! We\'d certainly be lost without you.$b$bWith all the donations you\'ve made, I would certainly process any additional runecloth donations you care to make in the future. Just be sure to check in with me, and I\'ll personally make sure that your good deeds won\'t go unrecognized!', '$n, you\'ve been a tremendous contributor to our cloth drive. As we work hard to replenish our reserves, one form of cloth remains critically low - runecloth. We are in absolutely dire need of it, and we hope that you will be able to help us as you have in the past!$b$bIf you are willing, please bring me what runecloth you can spare. We\'ll initially accept a single donation of sixty, and then we\'ll go from there.', '', '', '', '', '', 14047, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 893, 0, 0, 0, 0, 150, 0, 0, 0, 0, 0, 3960, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0);

REPLACE INTO `quest_template` VALUES (80379, 3, 0, 1537, 50, 0, 60, 0, 0, 434, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 80378, 0, 0, 0, 0, 0, 0, 'Additional Runecloth', '', '', 'Greetings once again, $N! Our need for runecloth is constant, and we can always use additional resources if you are willing to part with them. For an additional stack of twenty runecloth, I will make sure that you are recognized for your continuing efforts on behalf of Amani’alor.', 'Whenever you are ready to hand in the stack of runecloth, I\'ll accept it.', '', '', '', '', '', 14047, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 893, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0);

replace into creature_questrelation values ('80807','80375','10','10');
replace into creature_questrelation values ('80807','80376','10','10');
replace into creature_questrelation values ('80807','80377','10','10');
replace into creature_questrelation values ('80807','80378','10','10');
replace into creature_questrelation values ('80807','80379','10','10');

replace into creature_involvedrelation values ('80807','80375','10','10');
replace into creature_involvedrelation values ('80807','80376','10','10');
replace into creature_involvedrelation values ('80807','80377','10','10');
replace into creature_involvedrelation values ('80807','80378','10','10');
replace into creature_involvedrelation values ('80807','80379','10','10');

update creature_template set npc_flags = 7 where entry in (80807, 80370);

-- Temporary update orphan orc display id:
update creature_template set display_id1 = 14616 where entry = 14444;

UPDATE `item_template` SET `max_durability`='100' WHERE (`entry`='51736') AND (`patch`='0');
UPDATE `quest_template` SET `Objectives`='Obtain 5 Jujus of Kimbul and bring them to Mystic Guay’jin.' WHERE (`entry`='80360') AND (`patch`='0');

delete from creature_questrelation where quest = 80360;
delete from creature_involvedrelation where quest = 80360;
replace into creature_questrelation values ('80801','80360','10','10');
replace into creature_involvedrelation values ('80801','80360','10','10');

-- Odo gossip.

SET @gossip_menu_id = 59150;
SET @magic_number =  80605; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); 
replace into broadcast_text (ID, MaleText) values (@magic_number, 'My gut feelin\' be tellin\' me there\'s something more going on \'round this bar.');
replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number);
update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

replace into creature_loot_template values (6229, 80740, 35, 6, 1, 1, 0, 0, 10); 

REPLACE INTO `creature_template` VALUES (80977, 0, 18512, 0, 0, 0, 'Riding Sea Turtle', '', 0, 1, 1, 64, 64, 0, 0, 0, 35, 0, 1, 1.14286, 1, 20, 5, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');

UPDATE `item_template` SET `required_reputation_faction`='269' WHERE (`entry`='80502') AND (`patch`='0');
UPDATE `item_template` SET `required_reputation_faction`='269' WHERE (`entry`='80501') AND (`patch`='0');
UPDATE `item_template` SET `required_reputation_rank`='4' WHERE (`entry`='80503') AND (`patch`='0');
UPDATE `item_template` SET `required_reputation_rank`='4' WHERE (`entry`='80502') AND (`patch`='0');
UPDATE `item_template` SET `required_reputation_rank`='4' WHERE (`entry`='80502') AND (`patch`='0');

REPLACE INTO `npc_trainer` VALUES (4212, 2154, 500, 165, 50, 10, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 2155, 10, 0, 0, 5, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 2177, 100, 165, 55, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 2178, 100, 165, 60, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 2179, 1000, 165, 110, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 2180, 1400, 165, 120, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 2181, 650, 165, 100, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 2338, 50, 165, 15, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 2883, 100, 165, 40, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 2884, 650, 165, 100, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 2886, 550, 165, 85, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 3781, 2000, 165, 150, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 3782, 75, 165, 25, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 3784, 150, 165, 55, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 3786, 500, 165, 75, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 3787, 2000, 165, 150, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 3788, 550, 165, 85, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 3789, 500, 165, 80, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 3790, 1800, 165, 145, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 3792, 1500, 165, 125, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 3793, 1200, 165, 130, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 3794, 1500, 165, 135, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 3795, 2500, 165, 160, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 3797, 2800, 165, 180, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 3812, 5000, 165, 125, 20, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 3819, 650, 165, 100, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 3820, 1800, 165, 150, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 3821, 50, 165, 35, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 6662, 2800, 165, 190, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 7146, 1000, 165, 115, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 7148, 2500, 165, 160, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 7152, 2500, 165, 175, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 7157, 2800, 165, 190, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 9061, 100, 165, 30, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 9063, 100, 165, 30, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 9066, 450, 165, 70, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 9069, 600, 165, 95, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 9075, 1400, 165, 120, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 9150, 1500, 165, 125, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 9209, 2000, 165, 150, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 9210, 2000, 165, 150, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 9211, 2500, 165, 175, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 9212, 2800, 165, 180, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 9213, 2800, 165, 180, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 9214, 2800, 165, 195, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 10485, 2800, 165, 180, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 10500, 3500, 165, 205, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 10508, 3500, 165, 205, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 10513, 4000, 165, 210, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 10519, 4000, 165, 210, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 10655, 3500, 165, 200, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 14931, 4000, 165, 225, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 14933, 4000, 165, 225, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 20651, 500, 165, 100, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 20652, 1800, 165, 150, 0, 0, 5875);
REPLACE INTO `npc_trainer` VALUES (4212, 20653, 2800, 165, 180, 0, 0, 5875);


-- misc
-- smudge thunderwood should only sell recipe: thistle tea to rogues who have completed quests 2359 or 2478
UPDATE `npc_vendor` SET `condition_id` = 482 WHERE  `entry` = 6779 AND `item` = 18160;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (479, 8, 2359, 0, 0, 0, 0);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (480, 8, 2478, 0, 0, 0, 0);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (481, -2, 479, 480, 0, 0, 0);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (482, -1, 100, 481, 0, 0, 0);


-- thousand needles
-- mageroyal - montarr
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 4878 AND `item` = 785;

-- scroll of stamina 2 - montarr
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 4878 AND `item` = 1711;

-- scroll of int 2 - montarr
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 4878 AND `item` = 2290;

-- missing items - montarr
REPLACE INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(4878, 1478, 2, 7200),
(4878, 3355, 1, 7200),
(4878, 954, 2, 7200),
(4878, 2449, 3, 7200),
(4878, 2453, 2, 7200);

-- fine longbow - starn
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 9551 AND `item` = 11304;

-- balanced throwing dagger - jawn highmesa
DELETE FROM `npc_vendor` WHERE `entry` = 4876 AND `item` = 2946;

-- weighted throwing axe - jawn highmesa
DELETE FROM `npc_vendor` WHERE `entry` = 4876 AND `item` = 3131;

-- missing items - jinky twizzlefixxit
REPLACE INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(6730, 4389, 1, 10800),
(6730, 4382, 1, 10800),
(6730, 4371, 2, 10800),
(6730, 4361, 2, 10800);


-- tanaris
-- balanced throwing dagger - jabbey 
DELETE FROM `npc_vendor` WHERE `entry` = 8139 AND `item` = 2946;

-- weighted throwing axe - jabbey 
DELETE FROM `npc_vendor` WHERE `entry` = 8139 AND `item` = 3131;


-- ungoro
-- balanced throwing dagger - nergal
DELETE FROM `npc_vendor` WHERE `entry` = 12959 AND `item` = 2946;

-- weighted throwing axe - nergal
DELETE FROM `npc_vendor` WHERE `entry` = 12959 AND `item` = 3131;


-- feralas
-- pattern: azure silk cloak - brienna starglow
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 43200 WHERE `entry` = 6576 AND `item` = 7089;

-- missing items - zorbin fandazzle
REPLACE INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(14637, 4389, 1, 10800),
(14637, 4382, 1, 10800),
(14637, 4404, 3, 10800),
(14637, 4371, 2, 10800),
(14637, 4363, 2, 10800);

-- correct items - harklane
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 7943 AND `item` IN (159, 1179, 1205, 1645, 1708, 21552);

-- strong fishing pole - savanne
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 7945 AND `item` = 6365;

-- correct items - mardrack greenwell
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 7941 AND `item` IN (21030, 21031, 21033);
DELETE FROM `npc_vendor` WHERE `entry` = 7941 AND `item` IN (117, 2287, 3770, 3771, 4599, 8952, 16171);

-- imbued vial - vivianna
DELETE FROM `npc_vendor` WHERE `entry` = 7947 AND `item` = 18256;

-- rune thread - vivianna
DELETE FROM `npc_vendor` WHERE `entry` = 7947 AND `item` = 14341;

-- lesser healing potion - logannas
DELETE FROM `npc_vendor` WHERE `entry` = 8157 AND `item` = 858;

-- lesser mana potion - logannas
DELETE FROM `npc_vendor` WHERE `entry` = 8157 AND `item` = 3385;

-- small throwing knofe and crude throwing axe - faralorn
DELETE FROM `npc_vendor` WHERE `entry` = 7942 AND `item` IN (2947, 3111);

-- pattern: green whelp bracers - patt mcgrubben
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 7852 AND `item` = 7451;

-- pattern: turtle scale gloves - patt mcgrubben
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 7852 AND `item` = 8385;

-- pattern: living shoulders - patt mcgrubben
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 7852 AND `item` = 15734;

-- imbued vial - sheendra tallgrass
DELETE FROM `npc_vendor` WHERE `entry` = 8145 AND `item` = 18256;

-- rune thread - sheendra tallgrass
DELETE FROM `npc_vendor` WHERE `entry` = 8145 AND `item` = 14341;

-- missing items calandrath
REPLACE INTO `npc_vendor` (`entry`, `item`) VALUES
(15174, 15326),
(15174, 15327),
(15174, 3108),
(15174, 3137),
(15174, 3107),
(15174, 3135);

-- blacksmith hammer - mishta
DELETE FROM `npc_vendor` WHERE `entry` = 15179 AND `item` = 5956;

-- imbued vial - mishta
DELETE FROM `npc_vendor` WHERE `entry` = 15179 AND `item` = 18256;

-- rune thread - mishta
DELETE FROM `npc_vendor` WHERE `entry` = 15179 AND `item` = 14341;

-- Gubber Blump should be selling fishing poles and baits permanently https://classic.wowhead.com/npc=10216/gubber-blump#sells
UPDATE `npc_vendor` SET `maxcount`='0', `incrtime`='0' WHERE (`entry`='10216') AND (`item`='6256');
UPDATE `npc_vendor` SET `maxcount`='0', `incrtime`='0' WHERE (`entry`='10216') AND (`item`='6529');

update item_template set flags = 2048 where entry in (51895, 80868, 80216, 80114);

update creature_loot_template set chanceorquestchance = 1.5 where item = 913;
UPDATE `item_template` SET `display_id`='25221' WHERE `entry`='14615';

REPLACE INTO `gameobject_template` VALUES (1000465, 0, 5, 381, 'Alah\'thals Rested Bonus', 0, 0, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_custom_rested');

update creature_template set equipment_id = 0 where entry in (80605, 80604, 80603, 80602, 80601);
update creature set equipment_id = 0 where id in (80605, 80604, 80603, 80602, 80601);

update quest_template set requiredraces = 434 where entry in (80331, 80332, 80333, 80334);

-- sly's AM change

update spell_template SET attributesEx3 = 131072 WHERE entry = 5143 OR entry = 5144 OR entry = 5145 OR entry = 8416 OR entry = 8417 OR entry = 10211 OR entry = 10212 OR entry = 25345;

delete from creature_loot_template where item = 80838;

UPDATE `item_template` SET `required_reputation_rank`='4', allowable_race = 256 WHERE `entry`='80460';
UPDATE `item_template` SET `required_reputation_rank`='4', allowable_race = 256 WHERE `entry`='80461';
UPDATE `item_template` SET `required_reputation_rank`='4', allowable_race = 256 WHERE `entry`='80462';

REPLACE INTO `item_template` VALUES (80648, 0, 12, 0, 'Illusion: Gnoll', 'You wimpy human now, but maybe Gnoll in past life!', 1645, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31726, 0, 0, 0, 10, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'item_morph_gnoll');

update item_template set required_level = 28 where entry = 80722;

replace into item_template values
 ('80649', '0', '2', '15', 'Vile Sting', '', '23791', '3', '0', '1', '10009', '10009', '21', '-1', '-1', '37',
 '32', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1600', '0',
 '0', '29', '51', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '3396', '2', '0', '5', '420', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '2', '0', '0', '0', '0', '0', '2', '1', '0', '0', '65', '0', '0', '0', '0', '44', '0', '0', '0',
 '0', '1', NULL);

replace into creature_loot_template values (5937, 80649, 35, 6, 1, 1, 0, 0, 10); 
update item_template set spellid_1 = 0 where entry = 80842;

UPDATE `item_template` SET `spellcooldown_1`='600000' WHERE (`entry`='81059') AND (`patch`='0');

UPDATE `item_template` SET `allowable_race` = 434 WHERE `allowable_race` = 690;
UPDATE `item_template` SET `allowable_race` = 434 WHERE `allowable_race` = 146;

UPDATE `item_template` SET `allowable_race` = 589 WHERE `allowable_race` = 333;

UPDATE `item_template` SET `allowable_race` = -1 WHERE `allowable_race` = 511;
UPDATE `item_template` SET `allowable_race` = -1 WHERE `allowable_race` = 2047;
UPDATE `item_template` SET `allowable_race` = -1 WHERE `allowable_race` = 223;
UPDATE `item_template` SET `allowable_race` = -1 WHERE `allowable_race` = 0;


-- Correct spells used by Theramore Preserver.
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (33860, 'Barrens - Theramore Preserver', 6074, 100, 15, 0, 20, 0, 0, 0, 15, 21, 0, 2052, 100, 15, 0, 80, 0, 0, 0, 12, 18, 0, 528, 100, 14, 0, 0, 0, 5, 5, 5, 10, 0, 9734, 100, 1, 0, 0, 8, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);



-- Flask of Petrification  should not stack with other flasks.
UPDATE `spell_elixir` SET `mask`=3 WHERE `entry`=17624;

-- Patch 1.12
UPDATE `spell_template` SET `effectmechanic1`=0.80 WHERE `entry` IN (1454, 1455, 1456, 11687, 11688, 11689);

update item_template set name = 'Daisy Hot Pants', description = '' where entry = 51051;

update quest_template set requiredraces = 256 where entry between 80100 and 80121;

update creature_template set faction = 875 where entry = 80940;

REPLACE INTO `item_template` VALUES 
(80650, 0, 0, 0, 'High Elf Hair Dye: Sunflower Blond', '', 33449, 2, 0, 1, 50000, 0, 0, -1, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46029, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'item_hairdye'),
(80651, 0, 0, 0, 'High Elf Hair Dye: Ash Blond', '', 33449, 2, 0, 1, 50000, 0, 0, -1, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46029, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'item_hairdye'),
(80652, 0, 0, 0, 'High Elf Hair Dye: Ruby Rush', '', 33449, 2, 0, 1, 50000, 0, 0, -1, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46029, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'item_hairdye'),
(80653, 0, 0, 0, 'High Elf Hair Dye: Cinnamon Brown', '', 33449, 2, 0, 1, 50000, 0, 0, -1, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46029, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'item_hairdye'),
(80654, 0, 0, 0, 'High Elf Hair Dye: Wheat Brown', '', 33449, 2, 0, 1, 50000, 0, 0, -1, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46029, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'item_hairdye'),
(80655, 0, 0, 0, 'High Elf Hair Dye: Sand Blond', '', 33449, 2, 0, 1, 50000, 0, 0, -1, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46029, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'item_hairdye'),
(80656, 0, 0, 0, 'High Elf Hair Dye: Coral Red', '', 33449, 2, 0, 1, 50000, 0, 0, -1, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46029, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'item_hairdye'),
(80657, 0, 0, 0, 'High Elf Hair Dye: Honey Blond', '', 33449, 2, 0, 1, 50000, 0, 0, -1, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46029, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'item_hairdye'),
(80658, 0, 0, 0, 'High Elf Hair Dye: Starry Night', '', 33449, 2, 0, 1, 50000, 0, 0, -1, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46029, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'item_hairdye'),
(80659, 0, 0, 0, 'High Elf Hair Dye: Crab Legs', '', 33449, 2, 0, 1, 50000, 0, 0, -1, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46029, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'item_hairdye');

replace into npc_vendor (entry, item) values 
(50053, 80650),
(50053, 80651),
(50053, 80652),
(50053, 80654),
(50053, 80655),
(50053, 80656),
(50053, 80657),
(50053, 80658),
(50053, 80659);


-- https://www.youtube.com/watch?v=dn3sVUahDAQ
DELETE FROM `event_scripts` WHERE `id`=175944;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (175944, 5, 10, 10882, 30000, 1, 30, 0, 0, 0, 0, 8, 0, 6, 1, -5002.889, -2103.455, 83.81, 1.365, 0, 'Sacred Fire of Life - Summon Arikara');
UPDATE `gameobject_template` SET `data2`=175944, `script_name`='' WHERE `entry`=175944;
UPDATE `creature_template` SET `faction`=14 WHERE `entry`=10882;

update creature_template set faction = 1194 where entry in (14527, 14528);
update item_template set item_level = 22 , disenchant_id = 2 where entry = 80802;

-- Fix Lexlort (npc 9080) to provide shackles for players
DELETE FROM `gossip_scripts` WHERE `id`=50406;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (50406, 0, 15, 22941, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grark Lorkrub\'s Thorium Shackles');

update item_template set item_level = 23, required_level = 18 where entry = 80712;

update quest_template set rewrepfaction1 = 893, rewrepvalue1 = 150 where entry in (7830, 7842, 7844, 2935, 7850, 7816, 7829, 7862, 7845, 7840, 7841, 7846, 2782, 2742, 7849, 7815, 7828, 7843, 7839, 7861);

-- Silvermoon Remnants quests:
update quest_template set rewrepfaction1 = 269, rewrepvalue1 = 150 where entry in (5247, 5246, 1135);
-- Silvermoon Remnants speak-to quests:
update quest_template set rewrepfaction1 = 269, rewrepvalue1 = 75 where entry in (1132, 1133);

UPDATE `item_template` SET `inventory_type`='15' WHERE (`entry`='80503') AND (`patch`='0');

-- HE Male / Female bonding radius: 
UPDATE `creature_model_info` SET `bounding_radius`='0.389', `combat_reach`='1.5' WHERE (`modelid`='15476') AND (`build`='5875');
UPDATE `creature_model_info` SET `bounding_radius`='0.306', `combat_reach`='1.5' WHERE (`modelid`='15475') AND (`build`='5875');