update quest_template set requiredraces = 0 where requiredraces = 434 and requiredclasses = 128;

-- Goblin Riding Trainer

REPLACE INTO `creature_template` VALUES (80136,0,7179,0,0,0,'Gaxx Speedcrank','Driving Instructor',4020,50,50,3517,3517,100,100,2999,29,17,1,1.38571,0,20,5,0,0,1,85,109,0,226,1,2000,2000,1,4608,0,0,1,0,0,2,66.44,91.355,100,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'EventAI',0,3,0,0,3,4752,3,0,0,0,524298,'');

update creature_template set faction = 927, equipment_id = 0 where entry = 80136;

-- Goblin Car Salesman

replace into `creature_template` values (80137, 0, 7177, 0, 0, 0, 'Dizzle Fuelbopper', 'Car Salesman', 0, 11, 11, 456, 456, 0, 0, 20, 371, 16388, 1.1, 1.14286, 0, 20, 5, 0, 0, 1, 12, 14, 0, 64, 1, 2000, 2090, 1, 4864, 0, 0, 0, 0, 0, 0, 18.392, 25.289, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 524298, '');

update creature_template set faction = 927, equipment_id = 0 where entry = 80137;

REPLACE INTO `npc_vendor` VALUES (80137, 80460, 0, 0, 0, 0);
REPLACE INTO `npc_vendor` VALUES (80137, 80461, 0, 0, 0, 0);
REPLACE INTO `npc_vendor` VALUES (80137, 80462, 0, 0, 0, 0);

-- Misc. fixes:

replace into creature_model_info values (19023, 5875, 2, 2, 0, 0, 0);
update creature_template set display_id1 = 18208 where entry = 10824;

-- Missing trainers

REPLACE INTO `creature_template` VALUES (80830, 0, 18187, 0, 0, 0, 'Ewe\'luas ', 'Mage Trainer', 64, 60, 60, 3139, 3139, 2620, 2620, 8401, 29, 19, 1, 1.14286, 0, 20, 5, 0, 0, 1, 110, 142, 0, 272, 1, 2000, 2000, 1, 4608, 0, 0, 0, 0, 8, 0, 74.448, 102.366, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 5882, 0, 0, 0, 0, 524298, '');

REPLACE INTO `creature_template` VALUES (80831, 0, 18070, 0, 0, 0, 'Tor\'gram', 'Mage Trainer', 64, 10, 10, 413, 413, 370, 370, 20, 126, 19, 1, 1.14286, 0, 20, 5, 0, 0, 1, 7, 7, 0, 62, 1, 2000, 2000, 1, 4864, 0, 0, 0, 0, 8, 0, 16.808, 23.111, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 5884, 0, 0, 0, 0, 524298, '');
