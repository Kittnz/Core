
replace into quest_template (entry, minlevel, questlevel, requiredraces, title, details, objectives, offerrewardtext, requestitemstext, prevquestid, nextquestid, rewitemid1) values

(50300, 1, 3, 1, 'In Service of the Light', 
'Greetings, $n!\n\nI\'ve been asked to direct all those heroes who will listen to plea of a Holy Light crusaders to go and talk to the Brother Crowley.\n\nHe\'s here in the Cathedral. He told me to direct all believers to the Cathedral\'s lower level.\n\nThis is where he should be right now.', 
'Talk to the Brother Crowley at the Stormwind City Cathedral.',
'Light guide you, $c. How can I be of service?',
'',
 0,     -- PrevQuestId
 50301, -- NextQuestId
 0
),

(50301, 1, 3, 1, 'In Service of the Light', 
'There are not many of those revent believers in the Light with desire to not only uphold the Law and Order but also to save humanity itself!\n\nHumanity is on a verge of survival as it had never been before! Alas, you don\'t have to trust a mere messenger of the Light on a word, yes!\n\nI dare you to check on it yourself without hesitation if you truly believe in the Holy Light! How? It is simple.\n\nYou might think that now isn\'t the time of war and strive while you traverse these stone walls and confines of the great Cathedral of Light here in Stormwind. In reality, however there are humans, out kin, who suffer the consequences of the Scourge invasion and strive for survival back at our homeland - Lordaeron.\n\nIf you are ready to help, then rack up and talk to me again to see the precipice of humanity\'s possible end where it\'s all started. Tirisfal Glades.\n\nOnce there talk to the emissary named Godrick Bell. He\'ll get you on track. Go with the Light.', 
'Speak to Godrick Bell at Solliden Farmstead in Tirisfal Glades.',
'Hail! You are here to help, aren\'t you?',
'',
 50300, -- PrevQuestId
 50302, -- NextQuestId
 0
),

(50302, 1, 3, 1, 'Light\'s Chosen Champion.', 
'Finally, you have arrived! We\'re on a desperate line of survival here, $c! We need men, we need arms, we need … Champions! Like you, yes!\n\nWhat to do? Oh, let\'s start it with essentials then. There are farmers around who still protect and foster the lands which are Light hadn\'t forsaken yet, but their numbers are few and enemies are abundant.\n\nHumanity is in need of your prowess with weapons and Light. Go and bring peace to the land! We need farmers saved and these undead monsters finally dead. You start with the nearest farm from here.', 
'Slay 15 undead minions and save 10 farmers on the Solliden\'s Farm in Tirisfal Glades.',
'Be carefull and may the Light protect you!',
'Thank the Light you\'re safe and judging by your looks did what was needed! Very well done, champion!',
 50301, -- PrevQuestId
 50303, -- NextQuestId
 50440  -- Scarlet Crusade Insignia
),

(50303, 1, 3, 1, 'Scarlet Outpost', 
'Visit Scarlet Outpost (long description)', 
'Speak to Benjamin Bradley at Scarlet Outpost near the Scarlet Monastery.',
'Be carefull and may the Light protect you!',
'Visit Scarlet Outpost (completed)',
 50302, -- PrevQuestId
 0,     -- NextQuestId
 0
);

replace into creature_questrelation (id, quest)    values (4982, 50300); 
replace into creature_involvedrelation (id, quest) values (12336, 50300);
replace into creature_questrelation (id, quest)    values (12336, 50301); 
replace into creature_involvedrelation (id, quest) values (50506, 50301);
replace into creature_questrelation (id, quest)    values (50506, 50302); 
replace into creature_involvedrelation (id, quest) values (50506, 50302);
replace into creature_questrelation (id, quest)    values (50506, 50303); 
replace into creature_involvedrelation (id, quest) values (50507, 50302);

replace into item_template (entry, name, inventory_type, display_id, quality, bonding, description, spellid_1, spelltrigger_1, allowable_race) values
(50440, 'Scarlet Crusade Insignia', 11, 9834, 2, 1, "This ring marks the bearer as a fully fledged member of the Scarlet Crusade.", 28282, 1, 1);

delete from creature_template where entry = 50440; -- Old Godrick Bell

replace into creature_template (entry, name, subname, scale, level_min, level_max, health_min, health_max, display_id1, faction, type, inhabit_type, npc_flags) values
(50506, 'Godrick Bell', 'Scarlet Crusade Emissary', 1, 4, 7, 978, 987, 10343, 35, 7, 3, 2);

replace into creature_template (entry, name, subname, scale, level_min, level_max, health_min, health_max, display_id1, faction, type, inhabit_type, npc_flags) values
(50507, 'Benjamin Bradley', 'Scarlet Crusade Officer', 1, 4, 7, 978, 987, 10343, 67, 7, 3, 2);

delete from creature where id = 50506;
replace into creature (id, map, position_x, position_y, position_z, orientation, spawntimesecsmin) values (50506, 0, 2268, 1314.54, 33.8874, 6.24014, 25);

replace into creature_template (entry, display_id1, name, subname, gossip_menu_id, level_min, level_max, health_min, health_max, mana_min, mana_max, faction, npc_flags, attack_power, base_attack_time, unit_class, unit_flags, type, equipment_id, flags_extra, trainer_class) values

(50500, 2467, 'Carsten Burton', 'Mage Trainer', 4660, 5, 5, 166, 166, 190, 190, 67, 19, 52, 1500, 1, 4864, 7, 198, 10, 8),
(50501, 2492, 'Ian Williams', 'Priest Trainer', 4665, 5, 5, 166, 166, 190, 190, 67, 19, 52, 1500, 1, 4864, 7, 375, 10, 5),
(50502, 10323, 'Arianne Hampton', 'Warlock Trainer', 1503, 5, 5, 166, 166, 190, 190, 67, 19, 52, 1500, 1, 4864, 7, 459, 10, 9),
(50503, 2515, 'Marigold Graham', 'Warrior Trainer', 4650, 5, 5, 166, 166, 190, 190, 67, 19, 52, 1500, 1, 4864, 7, 911, 10, 1),
(50504, 10344, 'Morgan Gartside', 'Rogue Trainer', 4659, 5, 5, 166, 166, 190, 190, 67, 19, 52, 1500, 1, 4864, 7, 915, 10, 4),	
(50505, 10342, 'Baldric Foy', 'Paladin Trainer', 4663, 5, 5, 166, 166, 190, 190, 67, 19, 52, 1500, 1, 4864, 7, 925, 10, 2);

replace npc_trainer (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel, build_min, build_max) values

(50500, 1035, 2000, 0, 0, 20, 0, 5875),(50500, 1142, 100, 0, 0, 4, 0, 5875),(50500, 1168, 200, 0, 0, 8, 0, 5875),(50500, 1173, 100, 0, 0, 6, 0, 5875),(50500, 1174, 400, 0, 0, 10, 0, 5875),(50500, 1176, 1800, 0, 0, 18, 0, 5875),(50500, 1191, 200, 0, 0, 8, 0, 5875),(50500, 1194, 400, 0, 0, 10, 0, 5875),(50500, 1196, 2000, 0, 0, 20, 0, 5875),(50500, 1198, 600, 0, 0, 12, 0, 5875),(50500, 1200, 2000, 0, 0, 20, 0, 5875),(50500, 1210, 7000, 0, 0, 28, 0, 5875),(50500, 1211, 900, 0, 0, 14, 0, 5875),(50500, 1214, 8000, 0, 0, 30, 0, 5875),(50500, 1225, 5000, 0, 0, 26, 0, 5875),(50500, 1228, 15000, 0, 0, 40, 0, 5875),(50500, 1241, 5000, 0, 0, 26, 0, 5875),(50500, 1249, 100, 0, 0, 6, 0, 5875),(50500, 1250, 600, 0, 0, 12, 0, 5875),(50500, 1251, 3000, 0, 0, 22, 0, 5875),(50500, 1266, 600, 0, 0, 12, 0, 5875),(50500, 1267, 1800, 0, 0, 18, 0, 5875),(50500, 1467, 900, 0, 0, 14, 0, 5875),(50500, 1472, 10, 0, 0, 1, 0, 5875),(50500, 1473, 900, 0, 0, 14, 0, 5875),(50500, 1474, 7000, 0, 0, 28, 0, 5875),(50500, 1475, 18000, 0, 0, 42, 0, 5875),(50500, 1481, 2000, 0, 0, 20, 0, 5875),(50500, 1811, 3000, 0, 0, 22, 0, 5875),(50500, 1830, 200, 0, 0, 24, 0, 5875),(50500, 2124, 1500, 0, 0, 16, 0, 5875),(50500, 2125, 4000, 0, 0, 24, 0, 5875),(50500, 2141, 100, 0, 0, 6, 0, 5875),(50500, 2142, 900, 0, 0, 14, 0, 5875),(50500, 2143, 3000, 0, 0, 22, 0, 5875),(50500, 2858, 1500, 0, 0, 16, 0, 5875),(50500, 3142, 1800, 0, 0, 18, 0, 5875),(50500, 3553, 14000, 0, 0, 38, 0, 5875),(50500, 3576, 4000, 0, 0, 24, 0, 5875),(50500, 5146, 200, 0, 0, 8, 0, 5875),(50500, 5147, 1500, 0, 0, 16, 0, 5875),(50500, 5148, 4000, 0, 0, 24, 0, 5875),(50500, 5499, 2000, 0, 0, 20, 0, 5875),(50500, 5507, 100, 0, 0, 4, 0, 5875),(50500, 5565, 400, 0, 0, 10, 0, 5875),(50500, 5566, 2000, 0, 0, 20, 0, 5875),(50500, 6121, 13000, 0, 0, 34, 0, 5875),(50500, 6128, 8000, 0, 0, 30, 0, 5875),(50500, 6130, 10000, 0, 0, 32, 0, 5875),(50500, 6132, 15000, 0, 0, 40, 0, 5875),(50500, 6142, 7000, 0, 0, 28, 0, 5875),(50500, 6144, 3000, 0, 0, 22, 0, 5875),(50500, 6493, 600, 0, 0, 12, 0, 5875),(50500, 7323, 2000, 0, 0, 20, 0, 5875),(50500, 8403, 4000, 0, 0, 24, 0, 5875),(50500, 8404, 8000, 0, 0, 30, 0, 5875),(50500, 8405, 13000, 0, 0, 36, 0, 5875),(50500, 8409, 5000, 0, 0, 26, 0, 5875),(50500, 8410, 10000, 0, 0, 32, 0, 5875),(50500, 8411, 14000, 0, 0, 38, 0, 5875),(50500, 8414, 8000, 0, 0, 30, 0, 5875),(50500, 8415, 14000, 0, 0, 38, 0, 5875),(50500, 8420, 10000, 0, 0, 32, 0, 5875),(50500, 8421, 15000, 0, 0, 40, 0, 5875),(50500, 8425, 10000, 0, 0, 32, 0, 5875),(50500, 8426, 15000, 0, 0, 40, 0, 5875),(50500, 8428, 13000, 0, 0, 36, 0, 5875),(50500, 8440, 3000, 0, 0, 22, 0, 5875),(50500, 8441, 8000, 0, 0, 30, 0, 5875),(50500, 8442, 14000, 0, 0, 38, 0, 5875),(50500, 8447, 7000, 0, 0, 28, 0, 5875),(50500, 8448, 12000, 0, 0, 34, 0, 5875),(50500, 8449, 15000, 0, 0, 40, 0, 5875),(50500, 8452, 4000, 0, 0, 24, 0, 5875),(50500, 8453, 13000, 0, 0, 36, 0, 5875),(50500, 8456, 8000, 0, 0, 30, 0, 5875),(50500, 8459, 8000, 0, 0, 30, 0, 5875),(50500, 8460, 15000, 0, 0, 40, 0, 5875),(50500, 8463, 10000, 0, 0, 32, 0, 5875),(50500, 8464, 18000, 0, 0, 42, 0, 5875),(50500, 8493, 12000, 0, 0, 34, 0, 5875),(50500, 8496, 7000, 0, 0, 28, 0, 5875),(50500, 8497, 13000, 0, 0, 36, 0, 5875),(50500, 10055, 28000, 0, 0, 48, 0, 5875),(50500, 10056, 40000, 0, 0, 58, 0, 5875),(50500, 10141, 15000, 0, 0, 40, 0, 5875),(50500, 10142, 32000, 0, 0, 50, 0, 5875),(50500, 10146, 18000, 0, 0, 42, 0, 5875),(50500, 10147, 35000, 0, 0, 52, 0, 5875),(50500, 10152, 18000, 0, 0, 42, 0, 5875),(50500, 10153, 28000, 0, 0, 48, 0, 5875),(50500, 10154, 36000, 0, 0, 54, 0, 5875),(50500, 10155, 42000, 0, 0, 60, 0, 5875),(50500, 10158, 38000, 0, 0, 56, 0, 5875),(50500, 10162, 18000, 0, 0, 42, 0, 5875),(50500, 10163, 32000, 0, 0, 50, 0, 5875),(50500, 10164, 40000, 0, 0, 58, 0, 5875),(50500, 10171, 18000, 0, 0, 42, 0, 5875),(50500, 10172, 36000, 0, 0, 54, 0, 5875),(50500, 10175, 28000, 0, 0, 48, 0, 5875),(50500, 10176, 42000, 0, 0, 60, 0, 5875),(50500, 10178, 35000, 0, 0, 52, 0, 5875),(50500, 10182, 23000, 0, 0, 44, 0, 5875),(50500, 10183, 32000, 0, 0, 50, 0, 5875),(50500, 10184, 38000, 0, 0, 56, 0, 5875),(50500, 10188, 23000, 0, 0, 44, 0, 5875),(50500, 10189, 35000, 0, 0, 52, 0, 5875),(50500, 10190, 42000, 0, 0, 60, 0, 5875),(50500, 10194, 23000, 0, 0, 44, 0, 5875),(50500, 10195, 35000, 0, 0, 52, 0, 5875),(50500, 10196, 42000, 0, 0, 60, 0, 5875),(50500, 10198, 26000, 0, 0, 46, 0, 5875),(50500, 10200, 36000, 0, 0, 54, 0, 5875),(50500, 10203, 26000, 0, 0, 46, 0, 5875),(50500, 10204, 36000, 0, 0, 54, 0, 5875),(50500, 10208, 26000, 0, 0, 46, 0, 5875),(50500, 10209, 35000, 0, 0, 52, 0, 5875),(50500, 10210, 40000, 0, 0, 58, 0, 5875),(50500, 10213, 28000, 0, 0, 48, 0, 5875),(50500, 10214, 38000, 0, 0, 56, 0, 5875),(50500, 10217, 28000, 0, 0, 48, 0, 5875),(50500, 10218, 38000, 0, 0, 56, 0, 5875),(50500, 10221, 32000, 0, 0, 50, 0, 5875),(50500, 10222, 42000, 0, 0, 60, 0, 5875),(50500, 10224, 32000, 0, 0, 50, 0, 5875),(50500, 10226, 42000, 0, 0, 60, 0, 5875),(50500, 10231, 36000, 0, 0, 54, 0, 5875),(50500, 12827, 2000, 0, 0, 20, 0, 5875),(50500, 12828, 15000, 0, 0, 40, 0, 5875),(50500, 12829, 42000, 0, 0, 60, 0, 5875),(50500, 13011, 400, 0, 0, 30, 0, 5875),(50500, 13012, 650, 0, 0, 36, 0, 5875),(50500, 13014, 900, 0, 0, 42, 0, 5875),(50500, 13015, 14000, 0, 0, 48, 0, 5875),(50500, 13016, 1800, 0, 0, 54, 0, 5875),(50500, 13017, 1890, 0, 0, 60, 0, 5875),(50500, 13023, 650, 0, 0, 36, 0, 5875),(50500, 13024, 1150, 0, 0, 44, 0, 5875),(50500, 13025, 1750, 0, 0, 52, 0, 5875),(50500, 13026, 2100, 0, 0, 60, 0, 5875),(50500, 13037, 1170, 0, 0, 46, 0, 5875),(50500, 13038, 1750, 0, 0, 52, 0, 5875),(50500, 13039, 2000, 0, 0, 58, 0, 5875),(50500, 22784, 28000, 0, 0, 46, 0, 5875),(50500, 22785, 40000, 0, 0, 58, 0, 5875),(50500, 28403, 2000, 0, 0, 20, 5464, 5875),(50501, 1252, 800, 0, 0, 12, 0, 5875),(50501, 1253, 10000, 0, 0, 30, 0, 5875),(50501, 1254, 18000, 0, 0, 40, 0, 5875),(50501, 1255, 10, 0, 0, 1, 0, 5875),(50501, 1256, 800, 0, 0, 12, 0, 5875),(50501, 1257, 5000, 0, 0, 24, 0, 5875),(50501, 1258, 100, 0, 0, 4, 0, 5875),(50501, 1259, 300, 0, 0, 10, 0, 5875),(50501, 1260, 2000, 0, 0, 18, 0, 5875),(50501, 1261, 6000, 0, 0, 26, 0, 5875),(50501, 1265, 200, 0, 0, 8, 0, 5875),(50501, 1268, 1200, 0, 0, 14, 0, 5875),(50501, 1269, 11000, 0, 0, 32, 0, 5875),(50501, 1275, 100, 0, 0, 6, 0, 5875),(50501, 1276, 1200, 0, 0, 14, 0, 5875),(50501, 1277, 800, 0, 0, 12, 0, 5875),(50501, 1278, 2000, 0, 0, 18, 0, 5875),(50501, 1279, 10000, 0, 0, 30, 0, 5875),(50501, 1280, 22000, 0, 0, 42, 0, 5875),(50501, 1283, 2000, 0, 0, 18, 0, 5875),(50501, 1284, 14000, 0, 0, 36, 0, 5875),(50501, 1287, 10000, 0, 0, 30, 0, 5875),(50501, 1288, 18000, 0, 0, 40, 0, 5875),(50501, 1293, 10000, 0, 0, 30, 0, 5875),(50501, 1298, 5000, 0, 0, 24, 0, 5875),(50501, 1300, 4000, 0, 0, 22, 0, 5875),(50501, 1301, 10000, 0, 0, 30, 0, 5875),(50501, 1425, 3000, 0, 0, 20, 0, 5875),(50501, 2013, 300, 0, 0, 10, 0, 5875),(50501, 2016, 4000, 0, 0, 22, 0, 5875),(50501, 2049, 30000, 0, 0, 50, 0, 5875),(50501, 2056, 100, 0, 0, 4, 0, 5875),(50501, 2057, 300, 0, 0, 10, 0, 5875),(50501, 2058, 1600, 0, 0, 16, 0, 5875),(50501, 2059, 4000, 0, 0, 22, 0, 5875),(50501, 2065, 18000, 0, 0, 40, 0, 5875),(50501, 2066, 3000, 0, 0, 20, 0, 5875),(50501, 2067, 38000, 0, 0, 52, 0, 5875),(50501, 2068, 44000, 0, 0, 58, 0, 5875),(50501, 2069, 26000, 0, 0, 46, 0, 5875),(50501, 2097, 4000, 0, 0, 22, 0, 5875),(50501, 2793, 14000, 0, 0, 36, 0, 5875),(50501, 2799, 12000, 0, 0, 34, 0, 5875),(50501, 2851, 100, 0, 0, 6, 0, 5875),(50501, 3046, 400, 0, 0, 28, 0, 5875),(50501, 6062, 16000, 0, 0, 38, 0, 5875),(50501, 6067, 10000, 0, 0, 30, 0, 5875),(50501, 6068, 14000, 0, 0, 36, 0, 5875),(50501, 6071, 8000, 0, 0, 28, 0, 5875),(50501, 6072, 12000, 0, 0, 34, 0, 5875),(50501, 6073, 200, 0, 0, 8, 0, 5875),(50501, 6079, 1200, 0, 0, 14, 0, 5875),(50501, 6080, 3000, 0, 0, 20, 0, 5875),(50501, 6081, 6000, 0, 0, 26, 0, 5875),(50501, 6082, 11000, 0, 0, 32, 0, 5875),(50501, 6083, 16000, 0, 0, 38, 0, 5875),(50501, 6386, 900, 0, 0, 40, 0, 5875),(50501, 6492, 12000, 0, 0, 34, 0, 5875),(50501, 7130, 3000, 0, 0, 20, 0, 5875),(50501, 7378, 400, 0, 0, 28, 0, 5875),(50501, 8093, 300, 0, 0, 10, 0, 5875),(50501, 8107, 1600, 0, 0, 16, 0, 5875),(50501, 8108, 4000, 0, 0, 22, 0, 5875),(50501, 8109, 8000, 0, 0, 28, 0, 5875),(50501, 8110, 12000, 0, 0, 34, 0, 5875),(50501, 8111, 18000, 0, 0, 40, 0, 5875),(50501, 8123, 1200, 0, 0, 14, 0, 5875),(50501, 8125, 8000, 0, 0, 28, 0, 5875),(50501, 8126, 3000, 0, 0, 20, 0, 5875),(50501, 8130, 5000, 0, 0, 24, 0, 5875),(50501, 8132, 11000, 0, 0, 32, 0, 5875),(50501, 8193, 14000, 0, 0, 36, 0, 5875),(50501, 9475, 6000, 0, 0, 26, 0, 5875),(50501, 9476, 11000, 0, 0, 32, 0, 5875),(50501, 9477, 16000, 0, 0, 38, 0, 5875),(50501, 9486, 18000, 0, 0, 40, 0, 5875),(50501, 9580, 3000, 0, 0, 20, 0, 5875),(50501, 9581, 10000, 0, 0, 30, 0, 5875),(50501, 9593, 18000, 0, 0, 40, 0, 5875),(50501, 10877, 18000, 0, 0, 40, 0, 5875),(50501, 10878, 28000, 0, 0, 48, 0, 5875),(50501, 10879, 42000, 0, 0, 56, 0, 5875),(50501, 10882, 12000, 0, 0, 34, 0, 5875),(50501, 10883, 26000, 0, 0, 46, 0, 5875),(50501, 10889, 22000, 0, 0, 42, 0, 5875),(50501, 10891, 42000, 0, 0, 56, 0, 5875),(50501, 10895, 22000, 0, 0, 42, 0, 5875),(50501, 10896, 30000, 0, 0, 50, 0, 5875),(50501, 10897, 44000, 0, 0, 58, 0, 5875),(50501, 10902, 22000, 0, 0, 42, 0, 5875),(50501, 10903, 28000, 0, 0, 48, 0, 5875),(50501, 10904, 40000, 0, 0, 54, 0, 5875),(50501, 10905, 46000, 0, 0, 60, 0, 5875),(50501, 10910, 24000, 0, 0, 44, 0, 5875),(50501, 10913, 24000, 0, 0, 44, 0, 5875),(50501, 10914, 44000, 0, 0, 58, 0, 5875),(50501, 10918, 24000, 0, 0, 44, 0, 5875),(50501, 10919, 30000, 0, 0, 50, 0, 5875),(50501, 10920, 42000, 0, 0, 56, 0, 5875),(50501, 10930, 24000, 0, 0, 44, 0, 5875),(50501, 10931, 30000, 0, 0, 50, 0, 5875),(50501, 10932, 42000, 0, 0, 56, 0, 5875),(50501, 10935, 26000, 0, 0, 46, 0, 5875),(50501, 10936, 40000, 0, 0, 54, 0, 5875),(50501, 10939, 28000, 0, 0, 48, 0, 5875),(50501, 10940, 46000, 0, 0, 60, 0, 5875),(50501, 10943, 30000, 0, 0, 50, 0, 5875),(50501, 10944, 46000, 0, 0, 60, 0, 5875),(50501, 10948, 26000, 0, 0, 46, 0, 5875),(50501, 10949, 38000, 0, 0, 52, 0, 5875),(50501, 10950, 44000, 0, 0, 58, 0, 5875),(50501, 10954, 38000, 0, 0, 52, 0, 5875),(50501, 10959, 42000, 0, 0, 56, 0, 5875),(50501, 10962, 46000, 0, 0, 60, 0, 5875),(50501, 11025, 30000, 0, 0, 50, 0, 5875),(50501, 11026, 46000, 0, 0, 60, 0, 5875),(50501, 14820, 1500, 0, 0, 50, 0, 5875),(50501, 15434, 700, 0, 0, 36, 0, 5875),(50501, 15452, 5000, 0, 0, 24, 0, 5875),(50501, 15454, 10000, 0, 0, 30, 0, 5875),(50501, 15455, 14000, 0, 0, 36, 0, 5875),(50501, 15457, 22000, 0, 0, 42, 0, 5875),(50501, 15459, 28000, 0, 0, 48, 0, 5875),(50501, 15460, 40000, 0, 0, 54, 0, 5875),(50501, 17316, 700, 0, 0, 36, 0, 5875),(50501, 17317, 1200, 0, 0, 44, 0, 5875),(50501, 17318, 1900, 0, 0, 52, 0, 5875),(50501, 18806, 46000, 0, 0, 60, 0, 5875),(50501, 18808, 2300, 0, 0, 60, 0, 5875),(50501, 19339, 500, 0, 0, 18, 0, 5086),(50501, 19339, 100, 0, 0, 18, 5302, 5875),(50501, 19340, 1500, 0, 0, 26, 0, 5086),(50501, 19340, 300, 0, 0, 26, 5302, 5875),(50501, 19341, 2700, 0, 0, 34, 0, 5086),(50501, 19341, 600, 0, 0, 34, 5302, 5875),(50501, 19342, 4950, 0, 0, 42, 0, 5086),(50501, 19342, 1100, 0, 0, 42, 5302, 5875),(50501, 19343, 6750, 0, 0, 50, 0, 5086),(50501, 19343, 1500, 0, 0, 50, 5302, 5875),(50501, 19344, 9900, 0, 0, 58, 0, 5086),(50501, 19344, 2200, 0, 0, 58, 5302, 5875),(50501, 19346, 2250, 0, 0, 30, 0, 5086),(50501, 19346, 450, 0, 0, 30, 5302, 5875),(50501, 19347, 4500, 0, 0, 40, 0, 5086),(50501, 19347, 810, 0, 0, 40, 5302, 5875),(50501, 19348, 7500, 0, 0, 50, 0, 5086),(50501, 19348, 1500, 0, 0, 50, 5302, 5875),(50501, 19349, 11500, 0, 0, 60, 0, 5086),(50501, 19349, 2300, 0, 0, 60, 5302, 5875),(50501, 20771, 44000, 0, 0, 58, 0, 5875),(50501, 27796, 3000, 0, 0, 20, 5302, 5875),(50501, 27821, 1200, 0, 0, 44, 5302, 5875),(50501, 27822, 1900, 0, 0, 52, 5302, 5875),(50501, 27823, 2300, 0, 0, 60, 5302, 5875),(50501, 27843, 2300, 0, 0, 60, 5302, 5875),(50501, 27845, 2300, 0, 0, 60, 5302, 5875),(50501, 27875, 1200, 0, 0, 50, 5302, 5875),(50501, 27876, 1500, 0, 0, 60, 5302, 5875),(50502, 607, 9000, 0, 0, 36, 0, 5875),(50502, 1197, 5000, 0, 0, 28, 0, 5875),(50502, 1296, 200, 0, 0, 8, 0, 5875),(50502, 1297, 1500, 0, 0, 18, 0, 5875),(50502, 1367, 900, 0, 0, 14, 0, 5875),(50502, 1368, 2500, 0, 0, 22, 0, 5875),(50502, 1369, 6000, 0, 0, 30, 0, 5875),(50502, 1374, 10, 0, 0, 1, 0, 5875),(50502, 1375, 300, 0, 0, 10, 0, 5875),(50502, 1376, 2000, 0, 0, 20, 0, 5875),(50502, 1377, 1500, 0, 0, 18, 0, 5875),(50502, 1381, 100, 0, 0, 6, 0, 5875),(50502, 1382, 600, 0, 0, 12, 0, 5875),(50502, 1383, 300, 0, 0, 10, 0, 5875),(50502, 1384, 2000, 0, 0, 20, 0, 5875),(50502, 1393, 100, 0, 0, 4, 0, 5875),(50502, 1394, 600, 0, 0, 12, 0, 5875),(50502, 1404, 6000, 0, 0, 30, 0, 5875),(50502, 1406, 2000, 0, 0, 20, 0, 5875),(50502, 1407, 5000, 0, 0, 28, 0, 5875),(50502, 1476, 100, 0, 0, 6, 0, 5875),(50502, 1477, 1200, 0, 0, 16, 0, 5875),(50502, 1478, 4000, 0, 0, 26, 0, 5875),(50502, 1571, 14000, 0, 0, 48, 0, 5875),(50502, 1572, 11000, 0, 0, 42, 0, 5875),(50502, 2942, 6000, 0, 0, 30, 0, 5875),(50502, 2945, 1500, 0, 0, 18, 0, 5875),(50502, 2971, 4000, 0, 0, 26, 0, 5875),(50502, 2972, 10000, 0, 0, 38, 0, 5875),(50502, 3704, 600, 0, 0, 12, 0, 5875),(50502, 3705, 2000, 0, 0, 20, 0, 5875),(50502, 3706, 5000, 0, 0, 28, 0, 5875),(50502, 3707, 9000, 0, 0, 36, 0, 5875),(50502, 5139, 3000, 0, 0, 24, 0, 5875),(50502, 5486, 11000, 0, 0, 40, 0, 5875),(50502, 5501, 3000, 0, 0, 24, 0, 5875),(50502, 5698, 1200, 0, 0, 16, 0, 5875),(50502, 5700, 8000, 0, 0, 34, 0, 5875),(50502, 5702, 13000, 0, 0, 46, 0, 5875),(50502, 5709, 6000, 0, 0, 30, 0, 5875),(50502, 5736, 4000, 0, 0, 26, 0, 5875),(50502, 5741, 2000, 0, 0, 20, 0, 5875),(50502, 5783, 200, 0, 0, 8, 0, 5875),(50502, 6203, 300, 0, 0, 10, 0, 5875),(50502, 6204, 2500, 0, 0, 22, 0, 5875),(50502, 6206, 2500, 0, 0, 22, 0, 5875),(50502, 6214, 7000, 0, 0, 32, 0, 5875),(50502, 6216, 22000, 0, 0, 56, 0, 5875),(50502, 6218, 5000, 0, 0, 28, 0, 5875),(50502, 6220, 8000, 0, 0, 34, 0, 5875),(50502, 6221, 100, 0, 0, 4, 0, 5875),(50502, 6224, 900, 0, 0, 14, 0, 5875),(50502, 6225, 3000, 0, 0, 24, 0, 5875),(50502, 6227, 8000, 0, 0, 34, 0, 5875),(50502, 6228, 2500, 0, 0, 22, 0, 5875),(50502, 6232, 7000, 0, 0, 32, 0, 5875),(50502, 6485, 9000, 0, 0, 36, 0, 5875),(50502, 7642, 9000, 0, 0, 36, 0, 5875),(50502, 7647, 7000, 0, 0, 32, 0, 5875),(50502, 7649, 8000, 0, 0, 34, 0, 5875),(50502, 7650, 900, 0, 0, 14, 0, 5875),(50502, 7652, 10000, 0, 0, 38, 0, 5875),(50502, 7660, 5000, 0, 0, 28, 0, 5875),(50502, 7661, 11000, 0, 0, 42, 0, 5875),(50502, 7662, 300, 0, 0, 10, 0, 5875),(50502, 7663, 2000, 0, 0, 20, 0, 5875),(50502, 7664, 5000, 0, 0, 28, 0, 5875),(50502, 7665, 6000, 0, 0, 30, 0, 5875),(50502, 7666, 7000, 0, 0, 32, 0, 5875),(50502, 8290, 3000, 0, 0, 24, 0, 5875),(50502, 8291, 10000, 0, 0, 38, 0, 5875),(50502, 11662, 12000, 0, 0, 44, 0, 5875),(50502, 11663, 18000, 0, 0, 52, 0, 5875),(50502, 11664, 26000, 0, 0, 60, 0, 5875),(50502, 11666, 11000, 0, 0, 40, 0, 5875),(50502, 11669, 15000, 0, 0, 50, 0, 5875),(50502, 11670, 26000, 0, 0, 60, 0, 5875),(50502, 11673, 12000, 0, 0, 44, 0, 5875),(50502, 11674, 20000, 0, 0, 54, 0, 5875),(50502, 11676, 18000, 0, 0, 52, 0, 5875),(50502, 11679, 13000, 0, 0, 46, 0, 5875),(50502, 11680, 24000, 0, 0, 58, 0, 5875),(50502, 11685, 9900, 0, 0, 42, 0, 5875),(50502, 11686, 18000, 0, 0, 54, 0, 5875),(50502, 11690, 9000, 0, 0, 36, 0, 5875),(50502, 11691, 13000, 0, 0, 46, 0, 5875),(50502, 11692, 22000, 0, 0, 56, 0, 5875),(50502, 11696, 12000, 0, 0, 44, 0, 5875),(50502, 11697, 18000, 0, 0, 52, 0, 5875),(50502, 11698, 26000, 0, 0, 60, 0, 5875),(50502, 11701, 13000, 0, 0, 46, 0, 5875),(50502, 11702, 20000, 0, 0, 54, 0, 5875),(50502, 11705, 12000, 0, 0, 44, 0, 5875),(50502, 11706, 20000, 0, 0, 54, 0, 5875),(50502, 11709, 11000, 0, 0, 42, 0, 5875),(50502, 11710, 18000, 0, 0, 52, 0, 5875),(50502, 11714, 10000, 0, 0, 38, 0, 5875),(50502, 11715, 14000, 0, 0, 48, 0, 5875),(50502, 11716, 24000, 0, 0, 58, 0, 5875),(50502, 11718, 22000, 0, 0, 56, 0, 5875),(50502, 11720, 15000, 0, 0, 50, 0, 5875),(50502, 11723, 13000, 0, 0, 46, 0, 5875),(50502, 11724, 26000, 0, 0, 60, 0, 5875),(50502, 11727, 12000, 0, 0, 44, 0, 5875),(50502, 11728, 24000, 0, 0, 58, 0, 5875),(50502, 11731, 24000, 0, 0, 58, 0, 5875),(50502, 11736, 11000, 0, 0, 40, 0, 5875),(50502, 11737, 15000, 0, 0, 50, 0, 5875),(50502, 11738, 26000, 0, 0, 60, 0, 5875),(50502, 11741, 11000, 0, 0, 42, 0, 5875),(50502, 11742, 18000, 0, 0, 52, 0, 5875),(50502, 11788, 15000, 0, 0, 50, 0, 5875),(50502, 17732, 14000, 0, 0, 48, 0, 5875),(50502, 17733, 26000, 0, 0, 60, 0, 5875),(50502, 17865, 12000, 0, 0, 44, 0, 5875),(50502, 17938, 10000, 0, 0, 60, 0, 5875),(50502, 18154, 4000, 0, 0, 26, 0, 5875),(50502, 18155, 8000, 0, 0, 34, 0, 5875),(50502, 18156, 11000, 0, 0, 42, 0, 5875),(50502, 18157, 15000, 0, 0, 50, 0, 5875),(50502, 18158, 24000, 0, 0, 58, 0, 5875),(50502, 18160, 22000, 0, 0, 56, 0, 5875),(50502, 18161, 15000, 0, 0, 50, 0, 5875),(50502, 18162, 24000, 0, 0, 58, 0, 5875),(50502, 18169, 20000, 0, 0, 54, 0, 5875),(50502, 18170, 13000, 0, 0, 46, 0, 5875),(50502, 18171, 22000, 0, 0, 56, 0, 5875),(50502, 18648, 13000, 0, 0, 46, 0, 5875),(50502, 18753, 26000, 0, 0, 60, 0, 5875),(50502, 18872, 150, 0, 0, 24, 0, 5875),(50502, 18875, 350, 0, 0, 32, 0, 5875),(50502, 18876, 550, 0, 0, 40, 0, 5875),(50502, 18877, 700, 0, 0, 48, 0, 5875),(50502, 18878, 22000, 0, 0, 56, 0, 5875),(50502, 18927, 500, 0, 0, 38, 0, 5875),(50502, 18928, 700, 0, 0, 48, 0, 5875),(50502, 18929, 1200, 0, 0, 58, 0, 5875),(50502, 18933, 700, 0, 0, 48, 0, 5875),(50502, 18934, 1000, 0, 0, 54, 0, 5875),(50502, 18935, 1300, 0, 0, 60, 0, 5875),(50502, 18939, 750, 0, 0, 50, 0, 5875),(50502, 18940, 1300, 0, 0, 60, 0, 5875),(50502, 20766, 6000, 0, 0, 30, 0, 5875),(50502, 20767, 11000, 0, 0, 40, 0, 5875),(50502, 20768, 15000, 0, 0, 50, 0, 5875),(50502, 20769, 26000, 0, 0, 60, 0, 5875),(50503, 797, 4000, 0, 0, 20, 0, 5875),(50503, 798, 10000, 0, 0, 26, 0, 5875),(50503, 1055, 11000, 0, 0, 28, 0, 5875),(50503, 1065, 1500, 0, 0, 14, 0, 5875),(50503, 1229, 100, 0, 0, 6, 0, 5875),(50503, 1343, 100, 0, 0, 6, 0, 5875),(50503, 1344, 3000, 0, 0, 18, 0, 5875),(50503, 1423, 100, 0, 0, 4, 0, 5875),(50503, 1424, 4000, 0, 0, 20, 0, 5875),(50503, 1482, 12000, 0, 0, 30, 0, 5875),(50503, 1606, 200, 0, 0, 8, 0, 5875),(50503, 1607, 2000, 0, 0, 16, 0, 5875),(50503, 1610, 8000, 0, 0, 24, 0, 5875),(50503, 1611, 14000, 0, 0, 32, 0, 5875),(50503, 1646, 3000, 0, 0, 18, 0, 5875),(50503, 1675, 1000, 0, 0, 12, 0, 5875),(50503, 1676, 14000, 0, 0, 32, 0, 5875),(50503, 1677, 54000, 0, 0, 52, 0, 5875),(50503, 1685, 18000, 0, 0, 36, 0, 5875),(50503, 1716, 200, 0, 0, 8, 0, 5875),(50503, 1722, 42000, 0, 0, 50, 0, 5875),(50503, 1738, 100, 0, 0, 4, 0, 5875),(50503, 2570, 2000, 0, 0, 16, 0, 5875),(50503, 2688, 600, 0, 0, 10, 0, 5875),(50503, 3128, 100, 0, 0, 6, 0, 5875),(50503, 3433, 12000, 0, 0, 30, 0, 5875),(50503, 3434, 22000, 0, 0, 40, 0, 5875),(50503, 3435, 42000, 0, 0, 50, 0, 5875),(50503, 5243, 1000, 0, 0, 12, 0, 5875),(50503, 5247, 6000, 0, 0, 20, 0, 5875),(50503, 5283, 8000, 0, 0, 24, 0, 5875),(50503, 6158, 22000, 0, 0, 40, 0, 5875),(50503, 6176, 14000, 0, 0, 32, 0, 5875),(50503, 6177, 22000, 0, 0, 40, 0, 5875),(50503, 6180, 10000, 0, 0, 26, 0, 5875),(50503, 6191, 8000, 0, 0, 24, 0, 5875),(50503, 6193, 6000, 0, 0, 22, 0, 5875),(50503, 6543, 14000, 0, 0, 32, 0, 5875),(50503, 6549, 600, 0, 0, 10, 0, 5875),(50503, 6550, 4000, 0, 0, 20, 0, 5875),(50503, 6551, 12000, 0, 0, 30, 0, 5875),(50503, 6553, 20000, 0, 0, 38, 0, 5875),(50503, 6556, 60000, 0, 0, 58, 0, 5875),(50503, 6573, 1500, 0, 0, 14, 0, 5875),(50503, 6575, 8000, 0, 0, 24, 0, 5875),(50503, 6674, 10, 0, 0, 1, 0, 5875),(50503, 7109, 22000, 0, 0, 40, 0, 5875),(50503, 7374, 14000, 0, 0, 32, 0, 5875),(50503, 7375, 56000, 0, 0, 54, 0, 5875),(50503, 7380, 16000, 0, 0, 34, 0, 5875),(50503, 7382, 2000, 0, 0, 16, 0, 5875),(50503, 7385, 1000, 0, 0, 12, 0, 5875),(50503, 7401, 10000, 0, 0, 26, 0, 5875),(50503, 7403, 18000, 0, 0, 36, 0, 5875),(50503, 7406, 6000, 0, 0, 22, 0, 5875),(50503, 7889, 11000, 0, 0, 28, 0, 5875),(50503, 8206, 11000, 0, 0, 28, 0, 5875),(50503, 8207, 20000, 0, 0, 38, 0, 5875),(50503, 8381, 16000, 0, 0, 34, 0, 5875),(50503, 8821, 20000, 0, 0, 38, 0, 5875),(50503, 11552, 32000, 0, 0, 42, 0, 5875),(50503, 11553, 54000, 0, 0, 52, 0, 5875),(50503, 11557, 16000, 0, 0, 34, 0, 5875),(50503, 11558, 34000, 0, 0, 44, 0, 5875),(50503, 11559, 56000, 0, 0, 54, 0, 5875),(50503, 11570, 40000, 0, 0, 48, 0, 5875),(50503, 11571, 58000, 0, 0, 56, 0, 5875),(50503, 11575, 22000, 0, 0, 40, 0, 5875),(50503, 11576, 42000, 0, 0, 50, 0, 5875),(50503, 11577, 62000, 0, 0, 60, 0, 5875),(50503, 11579, 36000, 0, 0, 46, 0, 5875),(50503, 11582, 40000, 0, 0, 48, 0, 5875),(50503, 11583, 60000, 0, 0, 58, 0, 5875),(50503, 11586, 34000, 0, 0, 44, 0, 5875),(50503, 11587, 62000, 0, 0, 60, 0, 5875),(50503, 11598, 36000, 0, 0, 46, 0, 5875),(50503, 11599, 60000, 0, 0, 58, 0, 5875),(50503, 11602, 34000, 0, 0, 44, 0, 5875),(50503, 11603, 56000, 0, 0, 54, 0, 5875),(50503, 11606, 36000, 0, 0, 46, 0, 5875),(50503, 11607, 56000, 0, 0, 54, 0, 5875),(50503, 18556, 14000, 0, 0, 32, 0, 5875),(50503, 20561, 36000, 0, 0, 46, 0, 5875),(50503, 20562, 58000, 0, 0, 56, 0, 5875),(50503, 20571, 62000, 0, 0, 60, 0, 5875),(50503, 20621, 32000, 0, 0, 42, 0, 5875),(50503, 20622, 54000, 0, 0, 52, 0, 5875),(50503, 20703, 40000, 0, 0, 48, 0, 5875),(50503, 20704, 58000, 0, 0, 56, 0, 5875),(50503, 20724, 4000, 0, 0, 20, 0, 5875),(50503, 21555, 200, 0, 0, 48, 0, 5875),(50503, 21557, 2800, 0, 0, 54, 0, 5875),(50503, 21558, 3100, 0, 0, 60, 0, 5875),(50503, 23898, 2000, 0, 0, 48, 0, 5875),(50503, 23899, 2800, 0, 0, 54, 0, 5875),(50503, 23900, 3100, 0, 0, 60, 0, 5875),(50503, 23926, 200, 0, 0, 48, 0, 5875),(50503, 23927, 2800, 0, 0, 54, 0, 5875),(50503, 23928, 3100, 0, 0, 60, 0, 5875),(50504, 652, 300, 0, 0, 10, 0, 5875),(50504, 1424, 300, 0, 0, 10, 0, 5875),(50504, 1728, 4000, 0, 0, 22, 0, 5875),(50504, 1762, 100, 0, 0, 6, 0, 5875),(50504, 1763, 1200, 0, 0, 14, 0, 5875),(50504, 1764, 4000, 0, 0, 22, 0, 5875),(50504, 1765, 10000, 0, 0, 30, 0, 5875),(50504, 1771, 800, 0, 0, 12, 0, 5875),(50504, 1772, 6000, 0, 0, 26, 0, 5875),(50504, 1773, 27000, 0, 0, 42, 0, 5875),(50504, 1774, 52000, 0, 0, 58, 0, 5875),(50504, 1780, 100, 0, 0, 6, 0, 5875),(50504, 1781, 2900, 0, 0, 18, 0, 5875),(50504, 1789, 10, 0, 0, 1, 0, 5875),(50504, 1790, 3000, 0, 0, 20, 0, 5875),(50504, 1791, 20000, 0, 0, 40, 0, 5875),(50504, 1792, 54000, 0, 0, 60, 0, 5875),(50504, 1838, 6000, 0, 0, 26, 0, 5875),(50504, 1845, 10000, 0, 0, 30, 0, 5875),(50504, 1846, 5000, 0, 0, 24, 0, 5875),(50504, 1858, 4000, 0, 0, 22, 0, 5875),(50504, 1859, 27000, 0, 0, 42, 0, 5875),(50504, 1862, 20000, 0, 0, 40, 0, 5875),(50504, 2592, 100, 0, 0, 4, 0, 5875),(50504, 2593, 800, 0, 0, 12, 0, 5875),(50504, 2594, 3000, 0, 0, 20, 0, 5875),(50504, 2595, 8000, 0, 0, 28, 0, 5875),(50504, 2843, 10000, 40, 130, 30, 0, 5875),(50504, 2844, 18000, 40, 170, 38, 0, 5875),(50504, 2984, 300, 0, 0, 10, 0, 5875),(50504, 3128, 800, 0, 0, 12, 0, 5875),(50504, 3422, 3000, 40, 1, 20, 0, 5875),(50504, 3423, 35000, 40, 230, 50, 0, 5875),(50504, 5167, 100, 0, 0, 4, 0, 5875),(50504, 5175, 300, 0, 0, 10, 0, 5875),(50504, 5278, 200, 0, 0, 8, 0, 5875),(50504, 5768, 5000, 0, 0, 24, 0, 5875),(50504, 6185, 7750, 0, 0, 46, 0, 5875),(50504, 6480, 1800, 0, 0, 16, 0, 5875),(50504, 6505, 14000, 0, 0, 34, 0, 5875),(50504, 6511, 14000, 0, 0, 34, 0, 5875),(50504, 6734, 1800, 0, 0, 16, 0, 5875),(50504, 6735, 10000, 0, 0, 30, 0, 5875),(50504, 6736, 3000, 0, 0, 20, 0, 5875),(50504, 6737, 1200, 0, 0, 14, 0, 5875),(50504, 6763, 200, 0, 0, 8, 0, 5875),(50504, 6764, 1800, 0, 0, 16, 0, 5875),(50504, 6765, 5000, 0, 0, 24, 0, 5875),(50504, 6769, 8000, 0, 0, 28, 0, 5875),(50504, 6771, 8000, 0, 0, 28, 0, 5875),(50504, 6775, 27000, 0, 0, 42, 0, 5875),(50504, 8622, 18000, 0, 0, 38, 0, 5875),(50504, 8625, 12000, 0, 0, 32, 0, 5875),(50504, 8626, 20000, 0, 0, 40, 0, 5875),(50504, 8630, 12000, 0, 0, 32, 0, 5875),(50504, 8634, 4000, 0, 0, 22, 0, 5875),(50504, 8635, 10000, 0, 0, 30, 0, 5875),(50504, 8636, 18000, 0, 0, 38, 0, 5875),(50504, 8638, 20000, 0, 0, 40, 0, 5875),(50504, 8641, 8000, 0, 0, 28, 0, 5875),(50504, 8642, 16000, 0, 0, 36, 0, 5875),(50504, 8644, 35000, 0, 0, 50, 0, 5875),(50504, 8648, 1200, 0, 0, 14, 0, 5875),(50504, 8651, 6000, 0, 0, 26, 0, 5875),(50504, 8652, 16000, 0, 0, 36, 0, 5875),(50504, 8678, 2900, 0, 0, 18, 0, 5875),(50504, 8695, 18000, 0, 0, 38, 0, 5875),(50504, 8697, 14000, 0, 0, 34, 0, 5875),(50504, 8701, 8000, 40, 120, 28, 0, 5875),(50504, 8723, 16000, 0, 0, 36, 0, 5875),(50504, 8727, 6000, 0, 0, 26, 0, 5875),(50504, 8728, 14000, 0, 0, 34, 0, 5875),(50504, 8810, 16000, 40, 160, 36, 0, 5875),(50504, 11199, 31000, 0, 0, 46, 0, 5875),(50504, 11200, 50000, 0, 0, 56, 0, 5875),(50504, 11270, 27000, 0, 0, 42, 0, 5875),(50504, 11271, 35000, 0, 0, 50, 0, 5875),(50504, 11272, 52000, 0, 0, 58, 0, 5875),(50504, 11276, 29000, 0, 0, 44, 0, 5875),(50504, 11277, 46000, 0, 0, 52, 0, 5875),(50504, 11278, 54000, 0, 0, 60, 0, 5875),(50504, 11282, 29000, 0, 0, 44, 0, 5875),(50504, 11283, 46000, 0, 0, 52, 0, 5875),(50504, 11284, 54000, 0, 0, 60, 0, 5875),(50504, 11287, 31000, 0, 0, 46, 0, 5875),(50504, 11288, 54000, 0, 0, 60, 0, 5875),(50504, 11291, 31000, 0, 0, 46, 0, 5875),(50504, 11292, 48000, 0, 0, 54, 0, 5875),(50504, 11295, 31000, 0, 0, 46, 0, 5875),(50504, 11296, 48000, 0, 0, 54, 0, 5875),(50504, 11298, 33000, 0, 0, 48, 0, 5875),(50504, 11301, 33000, 0, 0, 48, 0, 5875),(50504, 11302, 50000, 0, 0, 56, 0, 5875),(50504, 11304, 46000, 0, 0, 52, 0, 5875),(50504, 11318, 52000, 0, 0, 58, 0, 5875),(50504, 11344, 29000, 40, 200, 44, 0, 5875),(50504, 11345, 46000, 40, 240, 52, 0, 5875),(50504, 11346, 54000, 40, 280, 60, 0, 5875),(50504, 11360, 31000, 40, 210, 46, 0, 5875),(50504, 11361, 48000, 40, 250, 54, 0, 5875),(50504, 11401, 46000, 0, 0, 52, 0, 5875),(50504, 13027, 13000, 0, 0, 58, 0, 5875),(50504, 13221, 12000, 0, 0, 32, 0, 5875),(50504, 13231, 20000, 0, 0, 40, 0, 5875),(50504, 13232, 33000, 0, 0, 48, 0, 5875),(50504, 13233, 50000, 0, 0, 56, 0, 5875), (50505, 685, 28000, 0, 0, 50, 0, 5875),(50505, 1873, 100, 0, 0, 6, 0, 5875),(50505, 1874, 2000, 0, 0, 14, 0, 5875),(50505, 1875, 10, 0, 0, 1, 0, 5875),(50505, 1876, 4000, 0, 0, 20, 0, 5875),(50505, 1877, 20000, 0, 0, 40, 0, 5875),(50505, 1878, 300, 0, 0, 10, 0, 5875),(50505, 1897, 13000, 0, 0, 34, 0, 5875),(50505, 1898, 28000, 0, 0, 50, 0, 5875),(50505, 1909, 3500, 0, 0, 18, 0, 5875),(50505, 1911, 300, 0, 0, 10, 0, 5875),(50505, 1912, 6000, 0, 0, 26, 0, 5875),(50505, 1913, 4000, 0, 0, 22, 0, 5875),(50505, 1914, 11000, 0, 0, 30, 0, 5875),(50505, 1937, 100, 0, 0, 8, 0, 5875),(50505, 2804, 11000, 0, 0, 30, 0, 5875),(50505, 3128, 100, 0, 0, 8, 0, 5875),(50505, 3473, 16000, 0, 0, 38, 0, 5875),(50505, 4990, 21000, 0, 0, 42, 0, 5875),(50505, 5253, 5000, 0, 0, 24, 0, 5875),(50505, 5572, 100, 0, 0, 6, 0, 5875),(50505, 5574, 3500, 0, 0, 18, 0, 5875),(50505, 5584, 100, 0, 0, 8, 0, 5875),(50505, 5590, 5000, 0, 0, 24, 0, 5875),(50505, 5591, 20000, 0, 0, 40, 0, 5875),(50505, 5600, 5000, 0, 0, 24, 0, 5875),(50505, 5613, 4000, 0, 0, 20, 0, 5875),(50505, 5616, 9000, 0, 0, 28, 0, 5875),(50505, 5617, 14000, 0, 0, 36, 0, 5875),(50505, 5629, 16000, 0, 0, 38, 0, 5875),(50505, 6941, 24000, 0, 0, 46, 0, 5875),(50505, 7109, 20000, 0, 0, 40, 0, 5875),(50505, 7296, 3000, 0, 0, 16, 0, 5875),(50505, 10279, 16000, 0, 0, 38, 0, 5875),(50505, 10294, 300, 0, 0, 10, 0, 5875),(50505, 10295, 11000, 0, 0, 30, 0, 5875),(50505, 10296, 28000, 0, 0, 50, 0, 5875),(50505, 10297, 46000, 0, 0, 60, 0, 5875),(50505, 10302, 6000, 0, 0, 26, 0, 5875),(50505, 10303, 14000, 0, 0, 36, 0, 5875),(50505, 10304, 24000, 0, 0, 46, 0, 5875),(50505, 10305, 42000, 0, 0, 56, 0, 5875),(50505, 10309, 40000, 0, 0, 54, 0, 5875),(50505, 10311, 28000, 0, 0, 50, 0, 5875),(50505, 10315, 22000, 0, 0, 44, 0, 5875),(50505, 10316, 34000, 0, 0, 52, 0, 5875),(50505, 10317, 46000, 0, 0, 60, 0, 5875),(50505, 10320, 46000, 0, 0, 60, 0, 5875),(50505, 10321, 100, 0, 0, 4, 0, 5875),(50505, 10323, 5000, 0, 0, 24, 0, 5875),(50505, 10325, 14000, 0, 0, 36, 0, 5875),(50505, 10327, 34000, 0, 0, 52, 0, 5875),(50505, 10330, 24000, 0, 0, 46, 0, 5875),(50505, 10331, 40000, 0, 0, 54, 0, 5875),(50505, 19741, 100, 0, 0, 4, 0, 5875),(50505, 19743, 2000, 0, 0, 14, 0, 5875),(50505, 19747, 4000, 0, 0, 22, 0, 5875),(50505, 19751, 4000, 0, 0, 20, 0, 5875),(50505, 19754, 11000, 0, 0, 30, 0, 5875),(50505, 19839, 1000, 0, 0, 12, 0, 5875),(50505, 19840, 4000, 0, 0, 22, 0, 5875),(50505, 19841, 12000, 0, 0, 32, 0, 5875),(50505, 19842, 21000, 0, 0, 42, 0, 5875),(50505, 19843, 34000, 0, 0, 52, 0, 5875),(50505, 19855, 5000, 0, 0, 24, 0, 5875),(50505, 19856, 13000, 0, 0, 34, 0, 5875),(50505, 19857, 22000, 0, 0, 44, 0, 5875),(50505, 19858, 40000, 0, 0, 54, 0, 5875),(50505, 19892, 9000, 0, 0, 28, 0, 5875),(50505, 19893, 12000, 0, 0, 32, 0, 5875),(50505, 19894, 14000, 0, 0, 36, 0, 5875),(50505, 19904, 20000, 0, 0, 40, 0, 5875),(50505, 19905, 34000, 0, 0, 52, 0, 5875),(50505, 19906, 22000, 0, 0, 44, 0, 5875),(50505, 19907, 42000, 0, 0, 56, 0, 5875),(50505, 19908, 26000, 0, 0, 48, 0, 5875),(50505, 19909, 46000, 0, 0, 60, 0, 5875),(50505, 19944, 6000, 0, 0, 26, 0, 5875),(50505, 19945, 13000, 0, 0, 34, 0, 5875),(50505, 19946, 21000, 0, 0, 42, 0, 5875),(50505, 19947, 28000, 0, 0, 50, 0, 5875),(50505, 19948, 44000, 0, 0, 58, 0, 5875),(50505, 19995, 20000, 0, 0, 40, 0, 5875),(50505, 19996, 28000, 0, 0, 50, 0, 5875),(50505, 19997, 46000, 0, 0, 60, 0, 5875),(50505, 20437, 300, 0, 0, 10, 0, 5875),(50505, 20438, 3500, 0, 0, 18, 0, 5875),(50505, 20439, 6000, 0, 0, 26, 0, 5875),(50505, 20440, 13000, 0, 0, 34, 0, 5875),(50505, 20441, 21000, 0, 0, 42, 0, 5875),(50505, 20442, 28000, 0, 0, 50, 0, 5875),(50505, 20443, 44000, 0, 0, 58, 0, 5875),(50505, 20444, 1000, 0, 0, 12, 0, 5875),(50505, 20445, 4000, 0, 0, 22, 0, 5875),(50505, 20446, 12000, 0, 0, 32, 0, 5875),(50505, 20447, 21000, 0, 0, 42, 0, 5875),(50505, 20448, 34000, 0, 0, 52, 0, 5875),(50505, 20450, 3000, 0, 0, 16, 0, 5875),(50505, 20451, 6000, 20163, 0, 26, 0, 4878),(50505, 20452, 14000, 20419, 0, 36, 0, 4878),(50505, 20453, 24000, 20421, 0, 46, 0, 4878),(50505, 20454, 42000, 20422, 0, 56, 0, 4878),(50505, 20455, 11000, 0, 0, 30, 0, 5875),(50505, 20456, 20000, 0, 0, 40, 0, 5875),(50505, 20457, 28000, 0, 0, 50, 0, 5875),(50505, 20458, 46000, 0, 0, 60, 0, 5875),(50505, 20459, 16000, 0, 0, 38, 0, 5875),(50505, 20460, 26000, 0, 0, 48, 0, 5875),(50505, 20461, 44000, 0, 0, 58, 0, 5875),(50505, 20462, 4000, 0, 0, 22, 0, 5875),(50505, 20730, 40000, 0, 0, 54, 0, 5875),(50505, 20774, 26000, 0, 0, 48, 0, 5875),(50505, 20775, 46000, 0, 0, 60, 0, 5875),(50505, 20944, 200, 0, 0, 30, 0, 5875),(50505, 20945, 1000, 0, 0, 40, 0, 5875),(50505, 20946, 1260, 0, 0, 50, 0, 5875),(50505, 20947, 2070, 0, 0, 60, 0, 5875),(50505, 20948, 500, 0, 0, 30, 0, 4878),(50505, 20949, 900, 0, 0, 40, 0, 5875),(50505, 20950, 1260, 0, 0, 50, 0, 5875),(50505, 20951, 2070, 0, 0, 60, 0, 5875),(50505, 20952, 1000, 0, 0, 40, 0, 5875),(50505, 20953, 1400, 0, 0, 50, 0, 5875),(50505, 20954, 2300, 0, 0, 60, 0, 5875),(50505, 20955, 900, 0, 0, 40, 0, 4878),(50505, 20956, 1260, 0, 0, 50, 0, 5875),(50505, 20957, 2070, 0, 0, 60, 0, 5875),(50505, 20958, 1170, 0, 0, 48, 0, 5875),(50505, 20960, 2100, 0, 0, 56, 0, 5875),(50505, 21083, 100, 0, 0, 6, 0, 5875),(50505, 24276, 22000, 0, 0, 44, 0, 5875),(50505, 24277, 34000, 0, 0, 52, 0, 5875),(50505, 24278, 46000, 0, 0, 60, 0, 5875),(50505, 25915, 46000, 0, 0, 52, 5086, 5875),(50505, 25917, 41400, 0, 0, 60, 5086, 5875),(50505, 25919, 40000, 0, 0, 54, 5086, 5875),(50505, 25920, 46000, 0, 0, 60, 5086, 5875),(50505, 25939, 46000, 0, 0, 60, 5086, 5875),(50505, 25946, 2070, 0, 0, 60, 5086, 5875),(50505, 25948, 46000, 0, 0, 60, 5086, 5875),(50505, 25951, 2070, 0, 0, 60, 5086, 5875),(50505, 26574, 200, 0, 0, 30, 5086, 5875);






