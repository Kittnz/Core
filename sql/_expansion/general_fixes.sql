-- Factions:

replace into faction (id, build, reputation_list_id, base_rep_race_mask1, base_rep_race_mask2, base_rep_race_mask3, base_rep_race_mask4, base_rep_class_mask1, base_rep_class_mask2, base_rep_class_mask3, base_rep_class_mask4, base_rep_value1, base_rep_value2, base_rep_value3, base_rep_value4, reputation_flags1, reputation_flags2, reputation_flags3, reputation_flags4, team, name1, name2, name3, name4, name5, name6, name7, name8, description1, description2, description3, description4, description5, description6, description7, description8) values 

(20, 5875, 58, 255, 0, 0, 0, 0, 0, 0, 0, -42000, 0, 0, 0, 0, 0, 0, 0, 0, 'Undead Scourge', '', '', '', '', '', '', '',  'The Undead Scourge is a massive army of the dead which has laid waste to the Northern Kingdoms, the Scourge seeks to consume all life on Azeroth, enslaving everyone as Undead.', '', '', '', '', '', '', ''),
(56, 5875, 63, 255, 0, 0, 0, 0, 0, 0, 0, -42000, 0, 0, 0, 2, 0, 0, 0, 0, 'Scarlet Crusade', '', '', '', '', '', '', '',  'The Scarlet Crusade is a religious organization dedicated to the eradication of the undead. They seldom trust outsiders, believing them to carry the Plague of Undeath.', '', '', '', '', '', '', ''),
(61, 5875, 60, 77, 178, 0, 0, 0, 0, 0, 0, 3300, -42000, 0, 0, 16, 2, 0, 0, 0, 'Dalaran', '', '', '', '', '', '', '',  '', '', '', '', '', '', '', ''),
(73, 5875, 59, 255, 0, 0, 0, 0, 0, 0, 0, -42000, 0, 0, 0, 0, 0, 0, 0, 0, 'Burning Legion', '', '', '', '', '', '', '',  'An army of Demons bent on conquering, corrupting, defiling and destroying every world in the universe. The Burning Legion is the enemy of most mortal races.', '', '', '', '', '', '', ''),
(108, 5875, 56, 77, 178, 0, 0, 0, 0, 0, 0, 3300, -8500, 0, 0, 17, 2, 0, 0, 0, 'Theramore', '', '', '', '', '', '', '',  'Theramore Isle was settled by Jaina Proudmoore and the refugees who fled from Lordaeron and it\\\'s neighboring kingdoms. Following the Battle at Mount Hyjal, Theramore has maintained cordial ties with the Horde and sought peace. ', '', '', '', '', '', '', ''),
(269, 5875, 57, 77, 178, 0, 0, 0, 0, 0, 0, 3300, -8500, 0, 0, 17, 2, 0, 0, 0, 'Silvermoon Remnant', '', '', '', '', '', '', '',  'The remaining High elves are reeling from the loss of their homeland and the Sunwell. They have rallied behind the Alliance as their people struggle to survive.', '', '', '', '', '', '', ''),
(893, 5875, 55, 178, 77, 0, 0, 0, 0, 0, 0, 0, -42000, 0, 0, 16, 2, 0, 0, 0, 'Revantusk Trolls', '', '', '', '', '', '', '',  'The Revantusk Trolls are a tribe of Forest Trolls in the Hinterlands seeking closer ties to the Horde.', '', '', '', '', '', '', ''),
(999, 5875, 61, 255, 0, 0, 0, 0, 0, 0, 0, -3500, 0, 0, 0, 2, 0, 0, 0, 0, 'Illidari', '', '', '', '', '', '', '',  'The Illidari are the followers of Illidan Stormrage, consisting of Naga, Blood Elves, Rogue demons, and Draenei who struggle to claim Outland from the Legion.', '', '', '', '', '', '', ''),
(1000, 5875, 62, 255, 0, 0, 0, 0, 0, 0, 0, -3500, 0, 0, 0, 2, 0, 0, 0, 0, 'Wardens', '', '', '', '', '', '', '',  'The Wardens led by Maiev Shadowsong have sworn to capture or execute Illidan Stormrage at any cost.', '', '', '', '', '', '', '');

-- New Hunter pets:

REPLACE INTO `creature_template` VALUES (80250, 0, 18027, 0, 0, 0, 'Crimson Lynx', NULL, 0, 10, 10, 197, 197, 618, 618, 20, 16, 0, 1, 1.42857, 0, 20, 5, 0, 4, 1, 11, 19, 0, 62, 1, 1200, 2000, 1, 0, 0, 2, 0, 0, 0, 0, 15.1624, 20.8483, 100, 1, 1, 5807, 0, 5807, 0, 0, 0, 0, 0, 0, 12166, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 1, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');

update creature_template set faction = 7 where entry = 80250;
update creature_template set rank = 0 where entry = 80250;

REPLACE INTO `creature_template` VALUES (80252, 0, 18244, 0, 0, 0, 'Spirit Fox', NULL, 0, 53, 53, 3418, 3662, 0, 0, 3163, 14, 0, 1, 1.42857, 0, 20, 5, 0, 4, 1, 452, 584, 0, 238, 1, 1200, 1329, 1, 0, 0, 1, 0, 0, 0, 0, 57.4128, 78.9426, 100, 1, 1, 10077, 0, 0, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 100770, 0, 0, 0, '', 1, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');

update creature_template set movement_type = 1 where entry = 80251;
update creature_template set scale = 1.2 where entry = 80251;

REPLACE INTO `creature_template` VALUES (80252, 0, 18005, 0, 0, 0, 'Young Arctic Fox', NULL, 0, 7, 8, 141, 161, 0, 0, 316, 38, 0, 1, 0.857143, 0, 20, 5, 0, 0, 1, 9, 13, 0, 58, 1, 2000, 2000, 1, 0, 0, 1, 0, 0, 0, 0, 13.4464, 18.4888, 100, 1, 1, 1131, 0, 1131, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5940, 0, 0, '', 1, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');

update creature_template set faction = 7 where entry = 80252;

REPLACE INTO `creature_template` VALUES (80253, 3, 18005, 0, 0, 0, 'Arctic Fox', NULL, 0, 50, 51, 2196, 2324, 0, 0, 2200, 1275, 0, 1, 2.57143, 0, 20, 5, 0, 0, 1, 161, 193, 0, 230, 1, 2000, 2000, 1, 0, 0, 1, 0, 0, 0, 0, 71.9664, 98.9538, 100, 1, 1, 10981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 109810, 0, 0, 0, '', 1, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, 'npc_ram_wolf_tamed');

update creature_template set faction = 7 where entry = 80253;

REPLACE INTO `creature_template` VALUES (80254, 0, 18007, 0, 0, 0, 'Young Brown Fox', NULL, 0, 10, 11, 198, 221, 0, 0, 538, 38, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 15, 21, 0, 64, 1, 2000, 2000, 1, 0, 0, 1, 0, 0, 0, 0, 16.632, 22.869, 100, 1, 1, 1765, 0, 1765, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17650, 5945, 0, 0, '', 1, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');

update creature_template set faction = 7 where entry = 80254;

REPLACE INTO `creature_template` VALUES (80255, 0, 18007, 0, 0, 0, 'Brown Fox', NULL, 0, 41, 42, 1857, 2123, 0, 0, 2246, 38, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 61, 78, 0, 172, 1, 2000, 2000, 1, 0, 0, 1, 0, 0, 0, 0, 57.0064, 78.3838, 100, 1, 1, 2923, 0, 2923, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');

update creature_template set faction = 7 where entry = 80255;

REPLACE INTO `creature_template` VALUES (80256, 0, 18006, 0, 0, 0, 'Silver Fox', NULL, 0, 27, 28, 843, 915, 0, 0, 1130, 38, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 31, 38, 0, 116, 1, 1300, 2000, 1, 0, 0, 1, 0, 0, 0, 0, 42.6272, 58.6124, 100, 1, 1, 3825, 0, 3825, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5951, 0, 0, 'EventAI', 1, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');

update creature_template set faction = 7 where entry = 80256;

REPLACE INTO `creature_template` VALUES (80257, 0, 18008, 0, 0, 0, 'Red Fox', NULL, 0, 10, 11, 198, 221, 0, 0, 538, 38, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 15, 21, 0, 64, 1, 2000, 2000, 1, 0, 0, 1, 0, 0, 0, 0, 16.632, 22.869, 100, 1, 1, 1765, 0, 1765, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17650, 5945, 0, 0, '', 1, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');

update creature_template set faction = 7 where entry = 80257;

REPLACE INTO `creature_template` VALUES (80258, 0, 18004, 0, 0, 0, 'Young Mist Fox', NULL, 0, 10, 11, 198, 221, 0, 0, 538, 38, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 15, 21, 0, 64, 1, 2000, 2000, 1, 0, 0, 1, 0, 0, 0, 0, 16.632, 22.869, 100, 1, 1, 1765, 0, 1765, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17650, 5945, 0, 0, '', 1, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');

update creature_template set faction = 7 where entry = 80258;

REPLACE INTO `creature_template` VALUES (80259, 3, 18004, 0, 0, 0, 'Mist Fox', NULL, 0, 50, 51, 2196, 2324, 0, 0, 2200, 1275, 0, 1, 2.57143, 0, 20, 5, 0, 0, 1, 161, 193, 0, 230, 1, 2000, 2000, 1, 0, 0, 1, 0, 0, 0, 0, 71.9664, 98.9538, 100, 1, 1, 10981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 109810, 0, 0, 0, '', 1, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, 'npc_ram_wolf_tamed');

update creature_template set faction = 7 where entry = 80259;

-- Missing Game Objects:

REPLACE INTO `gameobject_template` VALUES 

(2010650, 0, 5, 32823, 'BarberShop_Mirror_01', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010651, 0, 5, 32824, 'G_Water_Buckets', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010652, 0, 14, 32825, 'Arugals_Tower01', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010653, 0, 14, 32826, 'Lighthousered', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010654, 0, 5, 32827, 'HE_Wagon_01', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010655, 0, 5, 32828, 'HE_Banner_02', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010656, 0, 5, 32829, 'HE_Banner_01', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010657, 0, 5, 32830, 'G_ArcanePrison', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010658, 0, 5, 32831, 'G_BookTrapLightGoo', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010659, 0, 14, 32832, 'ND_BearCave', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010660, 0, 5, 32833, 'Goblin_Fuelcell', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010661, 0, 5, 32834, 'Dalaran_Crate_01', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010662, 0, 5, 32835, 'Nifty_StopWatch', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010663, 0, 5, 32836, 'Tradeskill_FirstAid_01', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010664, 0, 5, 32837, 'Tradeskill_FirstAid_02', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010665, 0, 14, 32838, 'ND_VentureBay_CraneBoat', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010666, 0, 5, 32839, 'G_BookTrapLightEvil', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010667, 0, 14, 32840, 'ED_Juggernaught', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010668, 0, 14, 32841, 'Sunstrider_ship_blue', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(3000208, 0, 19, 25180, 'Mailbox', 35, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');


-- WMO fix:

update gameobject_template set TYPE = 14 WHERE NAME LIKE '%.wmo%';

-- Creature Model Info:


REPLACE INTO creature_model_info VALUES 

(15475, 5875, 2, 2, 0, 0, 0),(15476, 5875, 2, 2, 0, 0, 0),(15504, 5875, 2, 2, 0, 0, 0),(15505, 5875, 2, 2, 0, 0, 0),
(15510, 5875, 2, 2, 0, 0, 0),(15514, 5875, 2, 2, 0, 0, 0),(15515, 5875, 2, 2, 0, 0, 0),(15516, 5875, 2, 2, 0, 0, 0),
(15517, 5875, 2, 2, 0, 0, 0),(15518, 5875, 2, 2, 0, 0, 0),(15519, 5875, 2, 2, 0, 0, 0),(15520, 5875, 2, 2, 0, 0, 0),
(15521, 5875, 2, 2, 0, 0, 0),(15522, 5875, 2, 2, 0, 0, 0),(15523, 5875, 2, 2, 0, 0, 0),(15524, 5875, 2, 2, 0, 0, 0),
(15525, 5875, 2, 2, 0, 0, 0),(15526, 5875, 2, 2, 0, 0, 0),(15527, 5875, 2, 2, 0, 0, 0),(15528, 5875, 2, 2, 0, 0, 0),
(15529, 5875, 2, 2, 0, 0, 0),(15530, 5875, 2, 2, 0, 0, 0),(15531, 5875, 2, 2, 0, 0, 0),(15532, 5875, 2, 2, 0, 0, 0),
(15906, 5875, 2, 2, 0, 0, 0),(15907, 5875, 2, 2, 0, 0, 0),(15908, 5875, 2, 2, 0, 0, 0),(15909, 5875, 2, 2, 0, 0, 0),
(15910, 5875, 2, 2, 0, 0, 0),(15911, 5875, 2, 2, 0, 0, 0),(15912, 5875, 2, 2, 0, 0, 0),(15913, 5875, 2, 2, 0, 0, 0),
(15914, 5875, 2, 2, 0, 0, 0),(15915, 5875, 2, 2, 0, 0, 0),(15916, 5875, 2, 2, 0, 0, 0),(15919, 5875, 2, 2, 0, 0, 0),
(15924, 5875, 2, 2, 0, 0, 0),(15930, 5875, 2, 2, 0, 0, 0),(15933, 5875, 2, 2, 0, 0, 0),(15936, 5875, 2, 2, 0, 0, 0),
(16036, 5875, 2, 2, 0, 0, 0),(16037, 5875, 2, 2, 0, 0, 0),(16038, 5875, 2, 2, 0, 0, 0),(16046, 5875, 2, 2, 0, 0, 0),
(16047, 5875, 2, 2, 0, 0, 0),(16055, 5875, 2, 2, 0, 0, 0),(16057, 5875, 2, 2, 0, 0, 0),(16058, 5875, 2, 2, 0, 0, 0),
(16059, 5875, 2, 2, 0, 0, 0),(16065, 5875, 2, 2, 0, 0, 0),(16067, 5875, 2, 2, 0, 0, 0),(16068, 5875, 2, 2, 0, 0, 0),
(16069, 5875, 2, 2, 0, 0, 0),(16070, 5875, 2, 2, 0, 0, 0),(16079, 5875, 2, 2, 0, 0, 0),(16080, 5875, 2, 2, 0, 0, 0),
(16083, 5875, 2, 2, 0, 0, 0),(16088, 5875, 2, 2, 0, 0, 0),(16090, 5875, 2, 2, 0, 0, 0),(16103, 5875, 2, 2, 0, 0, 0),
(16112, 5875, 2, 2, 0, 0, 0),(16115, 5875, 2, 2, 0, 0, 0),(16116, 5875, 2, 2, 0, 0, 0),(16117, 5875, 2, 2, 0, 0, 0),
(16118, 5875, 2, 2, 0, 0, 0),(16119, 5875, 2, 2, 0, 0, 0),(16120, 5875, 2, 2, 0, 0, 0),(16121, 5875, 2, 2, 0, 0, 0),
(16122, 5875, 2, 2, 0, 0, 0),(16123, 5875, 2, 2, 0, 0, 0),(16133, 5875, 2, 2, 0, 0, 0),(16134, 5875, 2, 2, 0, 0, 0),
(16182, 5875, 2, 2, 0, 0, 0),(16183, 5875, 2, 2, 0, 0, 0),(16184, 5875, 2, 2, 0, 0, 0),(16192, 5875, 2, 2, 0, 0, 0),
(16193, 5875, 2, 2, 0, 0, 0),(16207, 5875, 2, 2, 0, 0, 0),(16247, 5875, 2, 2, 0, 0, 0),(16248, 5875, 2, 2, 0, 0, 0),
(16249, 5875, 2, 2, 0, 0, 0),(16250, 5875, 2, 2, 0, 0, 0),(16265, 5875, 2, 2, 0, 0, 0),(16285, 5875, 2, 2, 0, 0, 0),
(16286, 5875, 2, 2, 0, 0, 0),(16287, 5875, 2, 2, 0, 0, 0),(16288, 5875, 2, 2, 0, 0, 0),(16289, 5875, 2, 2, 0, 0, 0),
(16290, 5875, 2, 2, 0, 0, 0),(16291, 5875, 2, 2, 0, 0, 0),(16319, 5875, 2, 2, 0, 0, 0),(16321, 5875, 2, 2, 0, 0, 0),
(16469, 5875, 2, 2, 0, 0, 0),(16470, 5875, 2, 2, 0, 0, 0),(16471, 5875, 2, 2, 0, 0, 0),(16472, 5875, 2, 2, 0, 0, 0),
(16543, 5875, 2, 2, 0, 0, 0),(16544, 5875, 2, 2, 0, 0, 0),(16545, 5875, 2, 2, 0, 0, 0),(16546, 5875, 2, 2, 0, 0, 0),
(16592, 5875, 2, 2, 0, 0, 0),(16624, 5875, 2, 2, 0, 0, 0),(16625, 5875, 2, 2, 0, 0, 0),(16626, 5875, 2, 2, 0, 0, 0),
(16648, 5875, 2, 2, 0, 0, 0),(16655, 5875, 2, 2, 0, 0, 0),(16658, 5875, 2, 2, 0, 0, 0),(16675, 5875, 2, 2, 0, 0, 0),
(16676, 5875, 2, 2, 0, 0, 0),(16677, 5875, 2, 2, 0, 0, 0),(16678, 5875, 2, 2, 0, 0, 0),(16679, 5875, 2, 2, 0, 0, 0),
(16680, 5875, 2, 2, 0, 0, 0),(16681, 5875, 2, 2, 0, 0, 0),(16682, 5875, 2, 2, 0, 0, 0),(16683, 5875, 2, 2, 0, 0, 0),
(16684, 5875, 2, 2, 0, 0, 0),(16685, 5875, 2, 2, 0, 0, 0),(16686, 5875, 2, 2, 0, 0, 0),(16687, 5875, 2, 2, 0, 0, 0),
(16688, 5875, 2, 2, 0, 0, 0),(16689, 5875, 2, 2, 0, 0, 0),(16690, 5875, 2, 2, 0, 0, 0),(16691, 5875, 2, 2, 0, 0, 0),
(16692, 5875, 2, 2, 0, 0, 0),(16693, 5875, 2, 2, 0, 0, 0),(16694, 5875, 2, 2, 0, 0, 0),(16695, 5875, 2, 2, 0, 0, 0),
(16696, 5875, 2, 2, 0, 0, 0),(16697, 5875, 2, 2, 0, 0, 0),(16698, 5875, 2, 2, 0, 0, 0),(16699, 5875, 2, 2, 0, 0, 0),
(16700, 5875, 2, 2, 0, 0, 0),(16701, 5875, 2, 2, 0, 0, 0),(16702, 5875, 2, 2, 0, 0, 0),(16703, 5875, 2, 2, 0, 0, 0),
(16704, 5875, 2, 2, 0, 0, 0),(16705, 5875, 2, 2, 0, 0, 0),(16706, 5875, 2, 2, 0, 0, 0),(16707, 5875, 2, 2, 0, 0, 0),
(16708, 5875, 2, 2, 0, 0, 0),(16709, 5875, 2, 2, 0, 0, 0),(16710, 5875, 2, 2, 0, 0, 0),(16712, 5875, 2, 2, 0, 0, 0),
(16713, 5875, 2, 2, 0, 0, 0),(16714, 5875, 2, 2, 0, 0, 0),(16715, 5875, 2, 2, 0, 0, 0),(16716, 5875, 2, 2, 0, 0, 0),
(16717, 5875, 2, 2, 0, 0, 0),(16718, 5875, 2, 2, 0, 0, 0),(16719, 5875, 2, 2, 0, 0, 0),(16720, 5875, 2, 2, 0, 0, 0),
(16722, 5875, 2, 2, 0, 0, 0),(16725, 5875, 2, 2, 0, 0, 0),(16732, 5875, 2, 2, 0, 0, 0),(16733, 5875, 2, 2, 0, 0, 0),
(16734, 5875, 2, 2, 0, 0, 0),(16735, 5875, 2, 2, 0, 0, 0),(16745, 5875, 2, 2, 0, 0, 0),(16746, 5875, 2, 2, 0, 0, 0),
(16747, 5875, 2, 2, 0, 0, 0),(16748, 5875, 2, 2, 0, 0, 0),(16749, 5875, 2, 2, 0, 0, 0),(16750, 5875, 2, 2, 0, 0, 0),
(16751, 5875, 2, 2, 0, 0, 0),(16752, 5875, 2, 2, 0, 0, 0),(16753, 5875, 2, 2, 0, 0, 0),(16754, 5875, 2, 2, 0, 0, 0),
(16755, 5875, 2, 2, 0, 0, 0),(16756, 5875, 2, 2, 0, 0, 0),(16757, 5875, 2, 2, 0, 0, 0),(16758, 5875, 2, 2, 0, 0, 0),
(16759, 5875, 2, 2, 0, 0, 0),(16760, 5875, 2, 2, 0, 0, 0),(16761, 5875, 2, 2, 0, 0, 0),(16762, 5875, 2, 2, 0, 0, 0),
(16763, 5875, 2, 2, 0, 0, 0),(16764, 5875, 2, 2, 0, 0, 0),(16765, 5875, 2, 2, 0, 0, 0),(16766, 5875, 2, 2, 0, 0, 0),
(16767, 5875, 2, 2, 0, 0, 0),(16768, 5875, 2, 2, 0, 0, 0),(16769, 5875, 2, 2, 0, 0, 0),(16770, 5875, 2, 2, 0, 0, 0),
(16771, 5875, 2, 2, 0, 0, 0),(16772, 5875, 2, 2, 0, 0, 0),(16773, 5875, 2, 2, 0, 0, 0),(16774, 5875, 2, 2, 0, 0, 0),
(16775, 5875, 2, 2, 0, 0, 0),(16776, 5875, 2, 2, 0, 0, 0),(16777, 5875, 2, 2, 0, 0, 0),(16778, 5875, 2, 2, 0, 0, 0),
(16779, 5875, 2, 2, 0, 0, 0),(16780, 5875, 2, 2, 0, 0, 0),(16781, 5875, 2, 2, 0, 0, 0),(16787, 5875, 2, 2, 0, 0, 0),
(16788, 5875, 2, 2, 0, 0, 0),(16795, 5875, 2, 2, 0, 0, 0),(16796, 5875, 2, 2, 0, 0, 0),(16797, 5875, 2, 2, 0, 0, 0),
(16798, 5875, 2, 2, 0, 0, 0),(16799, 5875, 2, 2, 0, 0, 0),(16800, 5875, 2, 2, 0, 0, 0),(16801, 5875, 2, 2, 0, 0, 0),
(16802, 5875, 2, 2, 0, 0, 0),(16803, 5875, 2, 2, 0, 0, 0),(16804, 5875, 2, 2, 0, 0, 0),(16808, 5875, 2, 2, 0, 0, 0),
(16809, 5875, 2, 2, 0, 0, 0),(16810, 5875, 2, 2, 0, 0, 0),(16811, 5875, 2, 2, 0, 0, 0),(16812, 5875, 2, 2, 0, 0, 0),
(16813, 5875, 2, 2, 0, 0, 0),(16814, 5875, 2, 2, 0, 0, 0),(16815, 5875, 2, 2, 0, 0, 0),(16816, 5875, 2, 2, 0, 0, 0),
(16817, 5875, 2, 2, 0, 0, 0),(16818, 5875, 2, 2, 0, 0, 0),(16819, 5875, 2, 2, 0, 0, 0),(16820, 5875, 2, 2, 0, 0, 0),
(16821, 5875, 2, 2, 0, 0, 0),(16822, 5875, 2, 2, 0, 0, 0),(16823, 5875, 2, 2, 0, 0, 0),(16824, 5875, 2, 2, 0, 0, 0),
(16825, 5875, 2, 2, 0, 0, 0),(16826, 5875, 2, 2, 0, 0, 0),(16827, 5875, 2, 2, 0, 0, 0),(16828, 5875, 2, 2, 0, 0, 0),
(16829, 5875, 2, 2, 0, 0, 0),(16830, 5875, 2, 2, 0, 0, 0),(16831, 5875, 2, 2, 0, 0, 0),(16832, 5875, 2, 2, 0, 0, 0),
(16833, 5875, 2, 2, 0, 0, 0),(16845, 5875, 2, 2, 0, 0, 0),(16846, 5875, 2, 2, 0, 0, 0),(16847, 5875, 2, 2, 0, 0, 0),
(16848, 5875, 2, 2, 0, 0, 0),(16849, 5875, 2, 2, 0, 0, 0),(16850, 5875, 2, 2, 0, 0, 0),(16851, 5875, 2, 2, 0, 0, 0),
(16852, 5875, 2, 2, 0, 0, 0),(16859, 5875, 2, 2, 0, 0, 0),(16865, 5875, 2, 2, 0, 0, 0),(16918, 5875, 2, 2, 0, 0, 0),
(16926, 5875, 2, 2, 0, 0, 0),(16948, 5875, 2, 2, 0, 0, 0),(16954, 5875, 2, 2, 0, 0, 0),(16955, 5875, 2, 2, 0, 0, 0),
(16956, 5875, 2, 2, 0, 0, 0),(16957, 5875, 2, 2, 0, 0, 0),(16983, 5875, 2, 2, 0, 0, 0),(17115, 5875, 2, 2, 0, 0, 0),
(17116, 5875, 2, 2, 0, 0, 0),(17122, 5875, 2, 2, 0, 0, 0),(17159, 5875, 2, 2, 0, 0, 0),(17168, 5875, 2, 2, 0, 0, 0),
(17198, 5875, 2, 2, 0, 0, 0),(17199, 5875, 2, 2, 0, 0, 0),(17201, 5875, 2, 2, 0, 0, 0),(17211, 5875, 2, 2, 0, 0, 0),
(17224, 5875, 2, 2, 0, 0, 0),(17257, 5875, 2, 2, 0, 0, 0),(17258, 5875, 2, 2, 0, 0, 0),(17259, 5875, 2, 2, 0, 0, 0),
(17260, 5875, 2, 2, 0, 0, 0),(17261, 5875, 2, 2, 0, 0, 0),(17264, 5875, 2, 2, 0, 0, 0),(17265, 5875, 2, 2, 0, 0, 0),
(17266, 5875, 2, 2, 0, 0, 0),(17267, 5875, 2, 2, 0, 0, 0),(17268, 5875, 2, 2, 0, 0, 0),(17278, 5875, 2, 2, 0, 0, 0),
(17279, 5875, 2, 2, 0, 0, 0),(17284, 5875, 2, 2, 0, 0, 0),(17289, 5875, 2, 2, 0, 0, 0),(17290, 5875, 2, 2, 0, 0, 0),
(17296, 5875, 2, 2, 0, 0, 0),(17297, 5875, 2, 2, 0, 0, 0),(17325, 5875, 2, 2, 0, 0, 0),(17329, 5875, 2, 2, 0, 0, 0),
(17348, 5875, 2, 2, 0, 0, 0),(17349, 5875, 2, 2, 0, 0, 0),(17350, 5875, 2, 2, 0, 0, 0),(17351, 5875, 2, 2, 0, 0, 0),
(17352, 5875, 2, 2, 0, 0, 0),(17353, 5875, 2, 2, 0, 0, 0),(17354, 5875, 2, 2, 0, 0, 0),(17355, 5875, 2, 2, 0, 0, 0),
(17356, 5875, 2, 2, 0, 0, 0),(17357, 5875, 2, 2, 0, 0, 0),(17358, 5875, 2, 2, 0, 0, 0),(17359, 5875, 2, 2, 0, 0, 0),
(17360, 5875, 2, 2, 0, 0, 0),(17361, 5875, 2, 2, 0, 0, 0),(17362, 5875, 2, 2, 0, 0, 0),(17363, 5875, 2, 2, 0, 0, 0),
(17364, 5875, 2, 2, 0, 0, 0),(17365, 5875, 2, 2, 0, 0, 0),(17366, 5875, 2, 2, 0, 0, 0),(17367, 5875, 2, 2, 0, 0, 0),
(17368, 5875, 2, 2, 0, 0, 0),(17376, 5875, 2, 2, 0, 0, 0),(17377, 5875, 2, 2, 0, 0, 0),(17473, 5875, 2, 2, 0, 0, 0),
(17474, 5875, 2, 2, 0, 0, 0),(17475, 5875, 2, 2, 0, 0, 0),(17476, 5875, 2, 2, 0, 0, 0),(17477, 5875, 2, 2, 0, 0, 0),
(17536, 5875, 2, 2, 0, 0, 0),(17538, 5875, 2, 2, 0, 0, 0),(17539, 5875, 2, 2, 0, 0, 0),(17540, 5875, 2, 2, 0, 0, 0),
(17541, 5875, 2, 2, 0, 0, 0),(17551, 5875, 2, 2, 0, 0, 0),(17552, 5875, 2, 2, 0, 0, 0),(17553, 5875, 2, 2, 0, 0, 0),
(17568, 5875, 2, 2, 0, 0, 0),(17614, 5875, 2, 2, 0, 0, 0),(17615, 5875, 2, 2, 0, 0, 0),(17641, 5875, 2, 2, 0, 0, 0),
(17651, 5875, 2, 2, 0, 0, 0),(17658, 5875, 2, 2, 0, 0, 0),(17671, 5875, 2, 2, 0, 0, 0),(17672, 5875, 2, 2, 0, 0, 0),
(17673, 5875, 2, 2, 0, 0, 0),(17676, 5875, 2, 2, 0, 0, 0),(17681, 5875, 2, 2, 0, 0, 0),(17773, 5875, 2, 2, 0, 0, 0),
(17774, 5875, 2, 2, 0, 0, 0),(17775, 5875, 2, 2, 0, 0, 0),(17776, 5875, 2, 2, 0, 0, 0),(17777, 5875, 2, 2, 0, 0, 0),
(17778, 5875, 2, 2, 0, 0, 0),(17779, 5875, 2, 2, 0, 0, 0),(17780, 5875, 2, 2, 0, 0, 0),(17785, 5875, 2, 2, 0, 0, 0),
(17813, 5875, 2, 2, 0, 0, 0),(17815, 5875, 2, 2, 0, 0, 0),(17816, 5875, 2, 2, 0, 0, 0),(17817, 5875, 2, 2, 0, 0, 0),
(17819, 5875, 2, 2, 0, 0, 0),(17820, 5875, 2, 2, 0, 0, 0),(17827, 5875, 2, 2, 0, 0, 0),(17828, 5875, 2, 2, 0, 0, 0),
(17842, 5875, 2, 2, 0, 0, 0),(17843, 5875, 2, 2, 0, 0, 0),(17844, 5875, 2, 2, 0, 0, 0),(17845, 5875, 2, 2, 0, 0, 0),
(17874, 5875, 2, 2, 0, 0, 0),(17875, 5875, 2, 2, 0, 0, 0),(17878, 5875, 2, 2, 0, 0, 0),(17883, 5875, 2, 2, 0, 0, 0),
(17884, 5875, 2, 2, 0, 0, 0),(18236, 5875, 2, 2, 0, 0, 0),(18237, 5875, 2, 2, 0, 0, 0),(18238, 5875, 2, 2, 0, 0, 0),
(18239, 5875, 2, 2, 0, 0, 0),(18240, 5875, 2, 2, 0, 0, 0),(18241, 5875, 2, 2, 0, 0, 0),(18242, 5875, 2, 2, 0, 0, 0),
(18243, 5875, 2, 2, 0, 0, 0),(18244, 5875, 2, 2, 0, 0, 0),(18245, 5875, 2, 2, 0, 0, 0),(18246, 5875, 2, 2, 0, 0, 0),
(18247, 5875, 2, 2, 0, 0, 0),(18248, 5875, 2, 2, 0, 0, 0),(18249, 5875, 2, 2, 0, 0, 0),(18250, 5875, 2, 2, 0, 0, 0),
(18251, 5875, 2, 2, 0, 0, 0),(18252, 5875, 2, 2, 0, 0, 0),(18253, 5875, 2, 2, 0, 0, 0),(18254, 5875, 2, 2, 0, 0, 0),
(18255, 5875, 2, 2, 0, 0, 0),(18256, 5875, 2, 2, 0, 0, 0),(18257, 5875, 2, 2, 0, 0, 0),(18258, 5875, 2, 2, 0, 0, 0),
(18259, 5875, 2, 2, 0, 0, 0),(18260, 5875, 2, 2, 0, 0, 0),(18261, 5875, 2, 2, 0, 0, 0),(18262, 5875, 2, 2, 0, 0, 0),
(18263, 5875, 2, 2, 0, 0, 0),(18264, 5875, 2, 2, 0, 0, 0),(18265, 5875, 2, 2, 0, 0, 0),(18266, 5875, 2, 2, 0, 0, 0),
(18267, 5875, 2, 2, 0, 0, 0),(18268, 5875, 2, 2, 0, 0, 0),(18269, 5875, 2, 2, 0, 0, 0),(18270, 5875, 2, 2, 0, 0, 0),
(18271, 5875, 2, 2, 0, 0, 0),(18272, 5875, 2, 2, 0, 0, 0),(18273, 5875, 2, 2, 0, 0, 0),(18274, 5875, 2, 2, 0, 0, 0),
(18275, 5875, 2, 2, 0, 0, 0),(18276, 5875, 2, 2, 0, 0, 0),(18277, 5875, 2, 2, 0, 0, 0),(18278, 5875, 2, 2, 0, 0, 0),
(18279, 5875, 2, 2, 0, 0, 0),(18280, 5875, 2, 2, 0, 0, 0),(18281, 5875, 2, 2, 0, 0, 0),(18282, 5875, 2, 2, 0, 0, 0),
(18283, 5875, 2, 2, 0, 0, 0),(18284, 5875, 2, 2, 0, 0, 0),(18285, 5875, 2, 2, 0, 0, 0),(18286, 5875, 2, 2, 0, 0, 0),
(18287, 5875, 2, 2, 0, 0, 0),(18288, 5875, 2, 2, 0, 0, 0),(18289, 5875, 2, 2, 0, 0, 0),(18290, 5875, 2, 2, 0, 0, 0),
(18291, 5875, 2, 2, 0, 0, 0),(18292, 5875, 2, 2, 0, 0, 0),(18293, 5875, 2, 2, 0, 0, 0),(18294, 5875, 2, 2, 0, 0, 0),
(18295, 5875, 2, 2, 0, 0, 0),(18297, 5875, 2, 2, 0, 0, 0),(18298, 5875, 2, 2, 0, 0, 0),(18299, 5875, 2, 2, 0, 0, 0),
(18300, 5875, 2, 2, 0, 0, 0),(18301, 5875, 2, 2, 0, 0, 0),(18302, 5875, 2, 2, 0, 0, 0),(18303, 5875, 2, 2, 0, 0, 0),
(18304, 5875, 2, 2, 0, 0, 0),(18305, 5875, 2, 2, 0, 0, 0),(18306, 5875, 2, 2, 0, 0, 0),(18307, 5875, 2, 2, 0, 0, 0),
(18308, 5875, 2, 2, 0, 0, 0),(18309, 5875, 2, 2, 0, 0, 0),(18319, 5875, 2, 2, 0, 0, 0),(18320, 5875, 2, 2, 0, 0, 0),
(18321, 5875, 2, 2, 0, 0, 0),(18322, 5875, 2, 2, 0, 0, 0),(18323, 5875, 2, 2, 0, 0, 0),
(18310, 5875, 2, 2, 0, 0, 0),
(18311, 5875, 2, 2, 0, 0, 0),
(18312, 5875, 2, 2, 0, 0, 0),
(18313, 5875, 2, 2, 0, 0, 0),
(18314, 5875, 2, 2, 0, 0, 0),
(18315, 5875, 2, 2, 0, 0, 0),
(18316, 5875, 2, 2, 0, 0, 0),
(18317, 5875, 2, 2, 0, 0, 0),
(18318, 5875, 2, 2, 0, 0, 0);

-- Mount NPCs:

replace into `creature_template` values 
(80300, 0, 18319, 0, 0, 0, 'Blue Rocket Car', '', 0, 1, 2, 64, 55, 53, 53, 30, 35, 0, 1, 1.38571, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(80301, 0, 18320, 0, 0, 0, 'Red Rocket Car', '', 0, 1, 2, 64, 55, 53, 53, 30, 35, 0, 1, 1.38571, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(80302, 0, 18321, 0, 0, 0, 'Green Rocket Car', '', 0, 1, 2, 64, 55, 53, 53, 30, 35, 0, 1, 1.38571, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(80303, 0, 18323, 0, 0, 0, 'Red Goblin Shredder', '', 0, 1, 2, 64, 55, 53, 53, 30, 35, 0, 1, 1.38571, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(80304, 0, 18322, 0, 0, 0, 'Green Goblin Shredder', '', 0, 1, 2, 64, 55, 53, 53, 30, 35, 0, 1, 1.38571, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),

(80305, 0, 18314, 0, 0, 0, 'Red Spidertank', '', 0, 1, 2, 64, 55, 53, 53, 30, 35, 0, 1, 1.38571, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(80306, 0, 18311, 0, 0, 0, 'Black Spidertank', '', 0, 1, 2, 64, 55, 53, 53, 30, 35, 0, 1, 1.38571, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(80307, 0, 18312, 0, 0, 0, 'Blue Spidertank', '', 0, 1, 2, 64, 55, 53, 53, 30, 35, 0, 1, 1.38571, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(80308, 0, 18313, 0, 0, 0, 'Green Spidertank', '', 0, 1, 2, 64, 55, 53, 53, 30, 35, 0, 1, 1.38571, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(80309, 0, 18315, 0, 0, 0, 'Black Pounder Vehicle', '', 0, 1, 2, 64, 55, 53, 53, 30, 35, 0, 1, 1.38571, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(80310, 0, 18316, 0, 0, 0, 'Blue Pounder Vehicle', '', 0, 1, 2, 64, 55, 53, 53, 30, 35, 0, 1, 1.38571, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(80311, 0, 18317, 0, 0, 0, 'Green Pounder Vehicle', '', 0, 1, 2, 64, 55, 53, 53, 30, 35, 0, 1, 1.38571, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(80312, 0, 18318, 0, 0, 0, 'Red Pounder Vehicle', '', 0, 1, 2, 64, 55, 53, 53, 30, 35, 0, 1, 1.38571, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');

-- Re-scaling some NPCs:

update creature_template set scale = 0.6 where display_id1 = 18004;
update creature_template set scale = 0.6 where display_id1 = 18005;
update creature_template set scale = 0.6 where display_id1 = 18006;
update creature_template set scale = 0.6 where display_id1 = 18007;
update creature_template set scale = 1.5 where display_id1 = 18315;
update creature_template set scale = 1.5 where display_id1 = 18316;
update creature_template set scale = 1.5 where display_id1 = 18317;
update creature_template set scale = 1.5 where display_id1 = 18318;
update creature_template set scale = 1.3 where display_id1 = 18101;
update creature_template set scale = 1.3 where display_id1 = 18102;
update creature_template set scale = 1.3 where display_id1 = 18046;
update creature_template set scale = 1.3 where display_id1 = 18103;
update creature_template set scale = 0.8 where display_id1 = 19000;
update creature_template set scale = 1.5 where display_id1 = 18096;
update creature_template set scale = 0.7 where display_id1 = 18037;
update creature_template set scale = 0.5 where display_id1 = 18097;
update creature_template set scale = 0.5 where display_id1 = 18098;
update creature_template set scale = 0.5 where display_id1 = 18099;
update creature_template set scale = 0.5 where display_id1 = 18100;
update creature_template set scale = 0.8 where display_id1 = 41000;

-- Changing some of Display IDs:

update creature_template set display_id1 = 18208 where entry = 10824;
update creature_template set display_id1 = 18209 where entry = 1752;

-- Mug object fixes:

update gameobject set id = 2003390 where id = 165738 and guid > 4004321;

-- Mostlikely fix for faction only quests (include new races):

UPDATE quest_template SET requiredraces = requiredraces + 512 WHERE requiredraces = 77;	
UPDATE quest_template SET requiredraces = requiredraces + 256 WHERE requiredraces = 178;	
