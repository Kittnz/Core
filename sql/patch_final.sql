replace into mangos_string values('10051','The battle for Sunnyglade Valley begins in 1 minute.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
replace into mangos_string values('10052','The battle for Sunnyglade Valley begins in 30 seconds. Prepare yourselves!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
replace into mangos_string values('10053','Let the battle for Sunnyglade Valley begin!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
replace into mangos_string values('10054','The %s has taken the %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
replace into mangos_string values('10055','$n has defended the %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
replace into mangos_string values('10056','$n has assaulted the %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
replace into mangos_string values('10057','$n claims the %s! If left unchallenged, the %s will control it in 1 minute!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
replace into mangos_string values('10058','Past grudges led you to your failure, what a waste...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
replace into mangos_string values('10059','The timeway been changed and we were unable to find which events shifted it, and now it will take unpredictable effect.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
replace into mangos_string values('10060','Great work, heroes! For these bitter few moments, lay down your weapons away from each other. And strike together at your common foe!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
replace into mangos_string values('10061','Lion\'s Pride Tower',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
replace into mangos_string values('10062','Krokvel Tower',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
replace into mangos_string values('10063','Fort Wrynn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

replace into world_safe_locs_facing values ('700', '4.4');
replace into world_safe_locs_facing  values ('701', '0.5');

REPLACE INTO creature_template VALUES
(60614, 15718, 0, 0, 0, '\'Charming\' Rudair', 'Bard', 0, 60, 60, 5000, 5000, 0, 0, 3252, 119, 0, 1, 1.14286, 0, 18, 5, 0, 0, 1, 161, 207, 0, 272, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 71.2272, 97.9374, 100, 7, 0, 60614, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 111, 150, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, '');

update creature_template set npc_flags = 16391 where entry = 60480;
update creature_template set npc_flags = 7 where entry = 8139;

set @gossip_menu_id = 41057; set @magic_number = 8139;
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); 
replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Welcome, looking to get some premium wares?'); 
replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number);
update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 41058; set @magic_number = 65013;
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); 
replace into broadcast_text (entry, Male_Text) values (@magic_number, 'This place is quite puzzling, but it has great business!'); 
replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number);
update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

REPLACE INTO npc_vendor VALUES
(60480, 2880, 0, 0, 0, 0),
(60480, 2901, 0, 0, 0, 0),
(60480, 3466, 0, 0, 0, 0),
(60480, 4357, 4, 10800, 0, 0),
(60480, 4363, 2, 10800, 0, 0),
(60480, 4364, 4, 10800, 0, 0),
(60480, 4371, 2, 10800, 0, 0),
(60480, 4382, 1, 10800, 0, 0),
(60480, 4399, 0, 0, 0, 0),
(60480, 4400, 0, 0, 0, 0),
(60480, 5956, 0, 0, 0, 0),
(60480, 10647, 0, 0, 0, 0),
(60480, 10648, 0, 0, 0, 0);

delete from creature_loot_template where entry = 65125;

-- ANTNORMI LOOT
REPLACE INTO creature_loot_template VALUES
(65125, 51044, -100, 5, 1, 1, 0),
(65125, 50203, 100, 6, 10, 15, 0),
(65125, 61014, 1, 1, 1, 1, 0),
(65125, 61027, 33.3, 2, 1, 1, 0),
(65125, 61040, 33.3, 2, 1, 1, 0),
(65125, 61031, 33.4, 2, 1, 1, 0),
(65125, 61037, 33.3, 3, 1, 1, 0),
(65125, 50429, 33.3, 3, 1, 1, 0),
(65125, 61046, 33.4, 3, 1, 1, 0),
(65125, 61053, 50, 4, 1, 1, 0),
(65125, 50427, 50, 4, 1, 1, 0);

-- Abandoned Equipment --
delete from quest_template where entry = 40327;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40327,2,33,42,35,512,0,'Abandoned Equipment','I got word a few weeks back that the Venture Co. had to abandon the Crystalvein Mine because of a basilisk problem. No doubt they left behind all sorts of equipment and tools that are ripe for pilfering. We pirates are usually operating on second hand equipment, and such a score we -cannot- pass up.\n\nThe Crystalvein Mine is located to the east and is just off the road near the Gurubashi Arena. Get there, and get there quick pal, before those Venture goons go and try to get back there stuff. If we act fast, they won\'t even know we went and snatched it all up!','Collect Venture Co. Equipment for Falgig Wazzlewrench at the Bloodsail Compound in Stranglethorn Vale.','Make sure you keep yours eyes open out there!','Look at all this stuff! Spanners, Flaxpipes, Togwig Gears! This will last the Bloodsail quite a while, and give me a whole bunch of opportunity to tinker! Thanks again $N, this is a haul!',60473,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3100,87,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (60480, 40327);
replace into creature_involvedrelation (id, quest) values (60480, 40327);

delete from item_template where entry = 60473;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60473,7839,'Venture Co. Equipment',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0);

delete from gameobject_template where entry = 2010861;
replace into gameobject_template values
(2010861,3,24109,'Venture Co. Equipment',0,4,1,43,2010861,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

delete from gameobject_loot_template where entry = 2010861;
replace into gameobject_loot_template values
(2010861,60473,-100,0,1,1,0);

-- Naga Tridents --
delete from quest_template where entry = 40328;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40328,2,33,44,38,512,0,'Naga Tridents','A few weeks back Naga began to enter the territory just south of the Bloodsail Compound. We don\'t know why they are here, or why they came but they seem quite drawn to the heights. The slithering wretches have done nothing but wander about and bother our ships as they sail about. I\'d like you to do battle with them for all of our slain kin.\n\nGather from the Naga Explorers their tridents and bring me them as proof of your deeds. 14 Should do just nicely, maybe we can use them as harpoons against the beasts.','Gather 14 Naga Trident\'s for Raga Darkeye at the Bloodsail Compound in Stranglethorn Vale.','The Naga can be a fearsome foe, battle hard, and put them down.','Ahh, excellent, the less of them swimming about, the better for all of us. You\'ve done well, here, keep one, it might serve you well.',60474,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3250,87,250,0,0,0,0,0,0,0,0,0,60475,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (60481, 40328);
replace into creature_involvedrelation (id, quest) values (60481, 40328);

delete from item_template where entry = 60474;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60474,5635,'Naga Trident',12,1,2048,1,-1,-1,1,14,-1,-1,-1,-1,4,'',0);

delete from creature_loot_template where item = 60474;
replace into creature_loot_template values
(1907,60474,-88,1,1,1,0);

replace into item_template values
 ('60475', '2', '6', 'Bronze Naga Trident', '', '8745', '2', '0', '1', '59732', '14933', '17', '-1', '-1', '42',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '4', '12', '7', '6',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3200', '0',
 '0', '81', '113', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '1', '2', '0', '0', '85', '0', '0', '0', '0', '26', '0', '0', '0',
 '0', '1', NULL);

 -- Pristine Gorrila Pelt --
delete from quest_template where entry = 40329;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40329,2,33,40,35,512,0,'Pristine Gorrila Pelt','We got a contact who has been looking to buy a Pristine Gorilla Pelt for some time now. They\'re paying top dollar for one completely pristine with not a single imperfection. The Bloodsail could certainly use the coin to fund our operations.\n\nHead out into the jungles of Stranglethorn and hunt down some of the gorilla, and find me a pristine pelt. We may as well utilize the jungle while we are here afterall.','Slay Gorillas in Stranglethorn Vale and collect a Pristine Gorilla Pelt for \'Wincing\' Willy at the Bloodsail Compound.','Any luck yet? Remember, it needs to be immaculate.','<Willy would take his time inspecting the pelt for imperfections>. This might just be the one $N , nice job out there, this will certainly bring us some gold.\n\n\Here, take your cut for the good work.',60476,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5000,3450,87,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (60479, 40329);
replace into creature_involvedrelation (id, quest) values (60479, 40329);

delete from item_template where entry = 60476;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60476,4709,'Pristine Gorrila Pelt',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'In mint condition, and completely pristine.',0);

delete from creature_loot_template where item = 60476;
replace into creature_loot_template values
(1557,60476,-16,1,1,1,0),
(1558,60476,-18,1,1,1,0),
(1114,60476,-15,1,1,1,0),
(1108,60476,-11,1,1,1,0);

-- The Bloodsail Compound I --
delete from quest_template where entry = 40330;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40330,2,33,40,30,512,0,'The Bloodsail Compound I','It sure has been a while since we\'ve heard from old \'Wincing\' Willy. He has been appointed to manage the supplies out far to the north west at Bloodsail Compound, it is located just to the southwest of the Gurubashi Arena. Something must have gone wrong, or him and his men have gone rogue.\n\nI want you to travel there, and meet up with him and figure out why there has been supply shortages. If there\'s anything we Bloodsail need, its to keep our supply lines in check!','Travel to Bloodsail Compound and meet with \'Wincing\' Willy.','Yes?','Ahh, McCoy sent you did he? Well, I can understand why, we\'ve hit some problems, and haven\'t been able to send out the goods that have been requested, perhaps you can help.',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1350,87,250,21,-100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (60452, 40330);
replace into creature_involvedrelation (id, quest) values (60479, 40330);

-- The Bloodsail Compound II --
delete from quest_template where entry = 40331;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40330,40331,2,33,40,30,512,0,'The Bloodsail Compound II','Five nights ago we were harassed by a band of trolls with blue hair, they threw all sorts of javelins at us. They made off with crates and bundles of supplies, not to mention killing a few good folk before we fought them off.\n\nThose trolls are Skullsplitter, and came from the Ziata\'jai Ruins to the north east of here head there, and recover 5 Bloodsail Supply Crates. While you\'re there, you may as well kill some as well to get some payback, we need to keep our image after all.','\'Wincing\' Willy at the Bloodsail Compound wants you to collect 5 Bloodsail Supply Crates and kill 10 Skullsplitter Warriors.','Those trolls can be some mean sons of bitches, make sure you are cautious out there.','Heh, we\'ve butted heads with the Skullsplitter a few times, they should know not to mess around now. Nice job in getting back the booty.',60477,5,0,0,0,0,0,0,667,10,0,0,0,0,0,0,0,0,0,3350,87,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (60479, 40331);
replace into creature_involvedrelation (id, quest) values (60479, 40331);

delete from item_template where entry = 60477;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60477,7913,'Bloodsail Supply Crate',12,1,2048,1,-1,-1,1,5,-1,-1,-1,-1,4,'In mint condition, and completely pristine.',0);

delete from gameobject_template where entry = 2010862;
replace into gameobject_template values
(2010862,3,24107,'Bloodsail Supply Crate',0,4,1,43,2010862,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

delete from gameobject_loot_template where entry = 2010862;
replace into gameobject_loot_template values
(2010862,60477,-100,0,1,1,0);

-- The Bloodsail Compound III --
delete from quest_template where entry = 40332;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40331,40332,2,33,40,30,512,0,'The Bloodsail Compound III','Now that you\'ve recovered the supplies we can turn our attention to other matters entirely. On Kalimdor we have a network of clients and contacts that we keep in touch with for all sorts of purposes. One such contact is located within Steamwheedle Port and hasn\'t sent his delivery of goods yet. He goes by the name Jabbey and is a vendor there.\n\nI\'d like you to head there and find out what the hold up is so that we can get it all to McCoy. You can find Steamwheedle Port to the east of Gadgetzan in the deserts of Tanaris.\n\nNow, of course, make sure you keep it on the hush-hush that this is related to the Bloodsail. Oh, and make sure to bring water, I hear it\'s quite dry there.','Meet with the Bloodsail contact named Jabbey in Steamwheedle Port.','Yes?','Hey there, looking for anything specific?\n\n Oh, that\'s why you\'re here huh, heh.',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,450,87,75,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (60479, 40332);
replace into creature_involvedrelation (id, quest) values (8139, 40332);

-- The Bloodsail Compound IV --
delete from quest_template where entry = 40333;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40332,40333,2,33,41,30,512,0,'The Bloodsail Compound IV','Hey I aint lookin\' for no trouble, and keep your voice down!\n\nI\'ve been supplying the Bloodsail with a potent poison for some time now, and my main guy just up and left Tanaris. I know they paid me for the last batch but I just haven\'t had an opportunity to get it, do I look like some sort of scorpid killer to you?\n\n Maybe you can help me out, and deliver it for me, I\'ll throw in some coin to you as well for the trouble. To the west of here are a bunch of Scorpid Hunters, from them gather 8 Potent Scorpid Venom and deliver them to \'Wincing\' Willy back out at the Bloodsail Compound in Stranglethorn Vale.','Gather 8 Potent Scorpid Venom and deliver them to \'Wincing\' Willy at the Bloodsail Compound in Stranglethorn Vale.','Any news?','Welcome back, this is it huh?\n\nNot bad, nice work in getting it, now you know where we get some of our poisons, so keep it hush.',60478,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2500,3250,87,250,21,-100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (8139, 40333);
replace into creature_involvedrelation (id, quest) values (60479, 40333);

delete from item_template where entry = 60478;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60478,1507,'Potent Scorpid Venom',12,1,2048,1,-1,-1,1,8,-1,-1,-1,-1,4,'',0);

delete from creature_loot_template where item = 60478;
replace into creature_loot_template values
(5422,60478,-78,1,1,1,0);

-- The Bloodsail Compound V --
delete from quest_template where entry = 40334;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40333,40334,2,33,41,30,512,0,'The Bloodsail Compound V','Nice work on checking up on things for me, there might be more work around the camp, but I\'d like you to deliver a letter up to First Mate McCoy. No doubt he\'s getting a bit anxious wondering what me and you have been up to.\n\nI have prepared a note to be taken to him down at Bloodsail Retreat, so please do so with haste.','Bring Willy\'s Letter to First Mate McCoy at Bloodsail Retreat in Stranglethorn Vale.','Any news?','So, I take it everything is back in order huh? Well, from what I read you\'ve done a good job. You\'ve solved our supply issue, and for that you should be commended, take one of these items from the hoard, you\'ve earned it matey.',60479,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60479,1,0,850,87,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60480,1,60481,1,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (8139, 40334);
replace into creature_involvedrelation (id, quest) values (60452, 40334);

delete from item_template where entry = 60479;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60479,3901,'Willy\'s Letter',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',50524);

replace into page_text values
(50524,'Dear McCoy\n\nBeen having some troubles with supply issues, from troll attacks to not receiving deliveries. The one you sent has been plenty of help and helped get things back on track, you should receive every soon.\n\n\'Wincing\' Willy.',0);

replace into item_template values
 ('60480', '4', '2', 'Sea Brigand\'s Grips', '', '6735', '2', '0', '1', '10832', '2708', '10', '-1', '-1', '42',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '4', '9', '3', '6',
 '6', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '68', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '8', '0', '0', '0', '30', '0', '0', '0', '0', '7', '0', '0', '0',
 '0', '1', NULL);

replace into item_template values
 ('60481', '4', '3', 'Corsair\'s Leggings', '', '26039', '2', '0', '1', '25748', '6437', '7', '-1', '-1', '42',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '7', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '201', '0', '0', '0',
 '0', '0', '0', '13665', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '5', '0', '0', '0', '75', '0', '0', '0', '0', '26', '0', '0', '0',
 '0', '1', NULL);

-- Another Day of Labor --
delete from quest_template where entry = 40335;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40335,2,33,48,44,0,0,'Another Day of Labor','Ahoy Cap\'n! Saw ye have fun last night with the bard lassy in our vessel, fine piece ain\'t she?\n\nBy all means, I mean the boat, of course, non of my business of yer personal affairs. Speaking of which Cap\'n, have ye decided the name of the vessel yet? It\'s bad luck to have an unnamed ship at sea, so think about it!\n\nAnyway, onto more pressing matters. Admiral Garfield told me to supply our settlement with generals goods but we don\'t have the leisurely of just buying them so we\'ll just loot it.\n\nAye, loot it. The Southsea seadogs have settled on a sandbar close to that damned Giljim Isle.\n\nFortune of the waves be with ya.','Loot 10 General Good Crates from the Southsea Sandbar and return to Belgrush Daggerfist.','Hurry Cap\'n, there be much to do.','Monkeys, all of them, serve them right. Let me help you out with those!\n\nI hope you found some coins for your pockets because I\'m afraid I don\'t carry anything with me.',60482,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,13267,1250,87,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (60456, 40335);
replace into creature_involvedrelation (id, quest) values (60456, 40335);

delete from item_template where entry = 60482;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60482,7913,'General Good Crate',12,1,2048,1,-1,-1,1,10,-1,-1,-1,-1,4,'',0);

delete from gameobject_template where entry = 2010863;
replace into gameobject_template values
(2010863,3,24107,'General Good Crate',0,4,1,43,2010863,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

delete from gameobject_loot_template where entry = 2010863;
replace into gameobject_loot_template values
(2010863,60482,-100,0,1,1,0);

-- Charming a Charmer --
delete from quest_template where entry = 40336;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40336,2,33,48,44,0,0,'Charming a Charmer','Cap\'n, back for more songs?\n\nOr is it sugar only today.\n\n<Jeesie stares deep into your eyes>.\n\nOh what is this poor bard to do, no jewelry to match her beauty, surely the Cap\'n would love to change that, aye?\n\nI hear there\'s a group of nagas north of one of our compounds, Vil\'do says they carry elven jewelry that would best suit this gal, don\'t you think so?\n\nI will make sure to make it worth your while.','Bring a Highborne Necklace to Jeesie Silver-Tongue.','Oh Cap\'n you\'re a tease and a half, quite the charmer I may say.','<Jeesie\'s eyes sparkle at the treasure>.\n\nOh Cap\'n, it\'s beautiful, come put it on my neck, the sight will be the most treasured reward you\'d ever get!',60483,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12003,1250,87,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (60451, 40336);
replace into creature_involvedrelation (id, quest) values (60451, 40336);

delete from item_template where entry = 60483;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60483,9857,'Highborne Necklace',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0);

delete from creature_loot_template where item = 60483;
replace into creature_loot_template values
(1907,60483,-25,1,1,1,0);

-- We Must Have Rum --
delete from quest_template where entry = 40337;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40337,2,33,48,42,4096,0,'We Must Have Rum','We are running low on rum Cap\'n! I need to test something, while I can brew beer in many ways I have yet to try to make some fine heavy rum.\n\nLuckily for us, we\'re on Jaguero Island, and as you could notice there are several gorillas here, where there\'s a gorilla there\'s also bananas. With the sugar the fruit holds I might be able to brew us some rum.\n\nA bunch of them would be great.','Bring 15 bananas to \'Ale Saint\' Grida.','Can\'t wait to test it or taste it.','Aye! Now let\'s try it.\n\nThis be strong and fine rum, here ye go Cap\'n yer share.',60484,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5934,1250,87,500,0,0,0,0,0,0,0,0,0,21114,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (60460, 40337);
replace into creature_involvedrelation (id, quest) values (60460, 40337);

delete from item_template where entry = 60484;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60484,6420,'Banana',12,1,2048,1,-1,-1,1,10,-1,-1,-1,-1,4,'',0);

delete from gameobject_template where entry = 2010864;
replace into gameobject_template values
(2010864,3,25062,'Bananas',0,4,1,43,2010864,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

delete from gameobject_loot_template where entry = 2010864;
replace into gameobject_loot_template values
(2010864,60484,-100,0,1,1,0);

REPLACE INTO gameobject VALUES
(5001357, 180663, 1, 2826.15, 2497.69, 140.022, 4.96234, 0, 0, 0.613451, -0.789733, 300, 300, 100, 1, 0, 0);

update quest_template set requiredraces = 690 where entry = 2932;

delete from creature_questrelation where quest = 40334;
replace into creature_questrelation (id, quest) values (60479, 40334);

update item_template set buy_price = 250000 where entry = 83090;
REPLACE INTO npc_vendor VALUES
(80953, 83090, 0, 0, 0, 0);

replace into item_template values
 ('60485', '15', '0', 'Sealed Diablo II Lord of Destruction Collectors Edition', 'In mint condition.', '20931', '0', '0', '1', '1000000', '250000', '0', '-1', '-1', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);

replace into item_template values
 ('60486', '2', '4', 'Fishbringer', 'Glimmers with the pure energy of the light, is it alive?', '10815', '4', '0', '1', '100000', '25000', '21', '-1', '-1', '65',
 '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '5', '6', '5',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3000', '0',
 '0', '78', '112', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '3', '3', '0', '0', '120', '0', '0', '0', '0', '48', '0', '0', '0',
 '0', '1', NULL);

replace into item_template values
 ('60487', '4', '0', 'Cloak of the Moo Lord', 'His power can be felt upon the cloak.', '66155', '4', '0', '1', '84432', '21108', '16', '-1', '-1', '65',
 '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '10', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '50', '0', '10', '10',
 '10', '10', '10', '9140', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '65', '0', '0', '0',
 '0', '1', NULL);

replace into item_template values
 ('60488', '4', '0', 'Drape of the Herd', 'Laced with milky power.', '66155', '4', '0', '1', '84432', '21108', '16', '-1', '-1', '65',
 '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '4', '10', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '47', '0', '0', '0',
 '0', '0', '0', '9140', '1', '0', '0', '-1', '0', '-1', '7597', '1', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '65', '0', '0', '0',
 '0', '1', NULL);

replace into item_template values
 ('60489', '4', '1', 'Cap of the Cow Savant', 'Laced with the energy of the moo.', '66156', '4', '0', '1', '85948', '21487', '1', '-1', '-1', '65',
 '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '21', '7', '13',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '60', '0', '0', '0',
 '0', '0', '0', '18049', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '7', '0', '0', '0', '60', '0', '0', '0', '0', '65', '0', '0', '0',
 '0', '1', NULL);

replace into item_template values
 ('60490', '4', '1', 'Cowskin Chapeau', 'Pure elegance with a touch of moomoo', '66156', '4', '0', '1', '86132', '21533', '1', '-1', '-1', '65',
 '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '6', '18', '5', '11',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '74', '0', '0', '0',
 '0', '0', '0', '9406', '1', '0', '0', '-1', '0', '-1', '21618', '1', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '7', '0', '0', '0', '60', '0', '0', '0', '0', '65', '0', '0', '0',
 '0', '1', NULL);

replace into item_template values
 ('60491', '15', '0', 'The Moo Stone', 'The images of the reign of cows can be seen within. It burns deep within your mind, the power is almost overwhelming.', '23727', '0', '0', '1', '200', '50', '0', '-1', '-1', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);

update creature_template set loot_id = 91799 where entry = 91799;

replace into creature_loot_template values
(91799,60485,100,1,1,1,0),
(91799,60486,20,4,1,1,0),
(91799,60487,25,4,1,1,0),
(91799,60488,25,4,1,1,0),
(91799,60489,25,4,1,1,0),
(91799,60490,25,4,1,1,0),
(91799,60491,100,2,1,1,0),
(91799,51261,100,3,1,1,0);

update page_text set text = 'A beacon that connected the creation of this order, and still keeps us together now, even after so much hardship, and trial. Despite how many times we have come close to ruin, and despite the fall of the kingdom around us we stand firm. \n\nShould the time come when darkness encroaches,', next_page = 1000248 where entry = 1000247;
REPLACE INTO page_text VALUES
(1000248, 'remember that the Light always shines through you, and your sacrifice will be repaid fully in the Light\'s graces.\n\nThe Light does not forsake, the Light does not forget. Let us forever keep it at our hearts.\n\nNo matter how dark the world is, the Light will always shine again.\n\n~Scribe Dafoldt', 0);

update page_text set text = 'Dear McCoy/n/nBeen having some troubles with supply issues. From troll attacks to not receiving deliveries. The one you sent has been plenty of help, and got things back on track. You should receive everything soon.\n\n\'Wincing\' Willy.' where entry = 50524;

update gameobject_template set displayid = 22658 where entry = 1000245;
update creature_template set display_id1 = 18748 where entry = 49011;
update creature_template set display_id1 = 18749 where entry = 49008;
update creature_template set display_id1 = 18751 where entry = 60606;
update creature_template set display_id1 = 18752 where entry = 60607;
update creature_template set display_id1 = 18753 where entry = 91303;
update creature_template set display_id1 = 18750 where entry = 49004;

-- Citadel Wizard , display ID 18671, level 60 elite, has 7000 mana, casts fireball, faction 67, humanoid, weapon 18644
-- Citadel Preacher, display ID 18674, level 60 elite, has 7000 mana, casts heals, faction 67, humanoid, weapon 2075
-- Citadel Watchman, display ID 18688, level 60 elite, faction 67, humanoid, weapon 15211, weapon2 2081
-- Duke Oswald III, display ID 18684, level 60 elite, has 3000 mana, casts hammer of justice, weapon 83262
-- Butcher Pete, display ID 1731, level 45, faction 67, humanoid, weapon 10772
-- Groundskeeper Samual, display ID 1748, level 45, faction 67, humanoid, no weapon

REPLACE INTO creature_template VALUES
(60615, 18671, 0, 0, 0, 'Citadel Wizard', '', 0, 60, 60, 7326, 7326, 7000, 7000, 3075, 67, 0, 1, 1.14286, 0, 20, 5, 0, 1, 1, 789, 840, 0, 272, 1, 2000, 2000, 8, 0, 0, 0, 0, 0, 0, 0, 59.9488, 82.4296, 100, 7, 0, 60615, 0, 0, 0, 0, 0, 0, 0, 0, 10151, 0, 0, 0, 0, 0, 416, 548, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, ''),
(60616, 18674, 0, 0, 0, 'Citadel Preacher', '', 0, 60, 60, 7326, 7326, 7000, 7000, 3075, 67, 0, 1, 1.14286, 0, 20, 5, 0, 1, 1, 789, 840, 0, 272, 1, 2000, 2000, 8, 0, 0, 0, 0, 0, 0, 0, 59.9488, 82.4296, 100, 7, 0, 60616, 0, 0, 0, 0, 0, 0, 0, 0, 6064, 0, 0, 0, 0, 0, 416, 548, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, ''),
(60617, 18688, 0, 0, 0, 'Citadel Watchman', '', 0, 60, 60, 15260, 15260, 0, 0, 2086, 67, 0, 1, 1.14286, 0, 20, 5, 0, 1, 1, 469, 642, 0, 278, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 172.1, 240.07, 100, 7, 0, 60617, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 779, 1022, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, ''),
(60618, 18684, 0, 0, 0, 'Duke Oswald III', '', 0, 60, 60, 15260, 15260, 3000, 3000, 2086, 67, 0, 1, 1.14286, 0, 20, 5, 0, 1, 1, 469, 642, 0, 278, 1, 2000, 2000, 2, 0, 0, 0, 0, 0, 0, 0, 172.1, 240.07, 100, 7, 0, 60617, 0, 0, 0, 0, 0, 0, 0, 0, 10308, 0, 0, 0, 0, 0, 779, 1022, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, ''),
(60619, 1731, 0, 0, 0, 'Butcher Pete', '', 0, 45, 45, 13302, 13302, 0, 0, 1500, 67, 0, 1, 1.14286, 0, 20, 5, 0, 1, 1, 204, 295, 0, 204, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 120, 230, 100, 7, 0, 60619, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 626, 822, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, ''),
(60619, 1748, 0, 0, 0, 'Groundskeeper Samual', '', 0, 45, 45, 13302, 13302, 0, 0, 1500, 67, 0, 1, 1.14286, 0, 20, 5, 0, 1, 1, 204, 295, 0, 204, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 120, 230, 100, 7, 0, 60619, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 626, 822, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, '');

set @equip_template = 20057; set @weapon_1 = 18644; set @weapon_2 = 0; set @creature = 60615;
replace into creature_equip_template values (@equip_template, @weapon_1, @weapon_2, 0);
update creature_template set equipment_id = @equip_template where entry = @creature;

set @equip_template = 20058; set @weapon_1 = 2075; set @weapon_2 = 0; set @creature = 60616;
replace into creature_equip_template values (@equip_template, @weapon_1, @weapon_2, 0);
update creature_template set equipment_id = @equip_template where entry = @creature;

set @equip_template = 20059; set @weapon_1 = 15211; set @weapon_2 = 2081; set @creature = 60617;
replace into creature_equip_template values (@equip_template, @weapon_1, @weapon_2, 0);
update creature_template set equipment_id = @equip_template where entry = @creature;

set @equip_template = 20060; set @weapon_1 = 83262; set @weapon_2 = 0; set @creature = 60618;
replace into creature_equip_template values (@equip_template, @weapon_1, @weapon_2, 0);
update creature_template set equipment_id = @equip_template where entry = @creature;

set @equip_template = 20061; set @weapon_1 = 10772; set @weapon_2 = 0; set @creature = 60619;
replace into creature_equip_template values (@equip_template, @weapon_1, @weapon_2, 0);
update creature_template set equipment_id = @equip_template where entry = @creature;

-- Fix respawn timers for newly spawned creatures.
update creature set spawntimesecsmin = 180, spawntimesecsmax = 300 where spawntimesecsmin = 25 and id > 50000;

replace into creature_display_info_addon values(18740, 0, 0, 0, 0);
replace into creature_display_info_addon values(18741, 0, 0, 0, 0);
replace into creature_display_info_addon values(18742, 0, 0, 0, 0);
replace into creature_display_info_addon values(18743, 0, 0, 0, 0);
replace into creature_display_info_addon values(18744, 0, 0, 0, 0);
replace into creature_display_info_addon values(18745, 0, 0, 0, 0);
replace into creature_display_info_addon values(18746, 0, 0, 0, 0);
replace into creature_display_info_addon values(18747, 0, 0, 0, 0);
replace into creature_display_info_addon values(18748, 0, 0, 0, 0);
replace into creature_display_info_addon values(18749, 0, 0, 0, 0);
replace into creature_display_info_addon values(18750, 0, 0, 0, 0);
replace into creature_display_info_addon values(18751, 0, 0, 0, 0);
replace into creature_display_info_addon values(18752, 0, 0, 0, 0);
replace into creature_display_info_addon values(18753, 0, 0, 0, 0);
replace into creature_display_info_addon values(18754, 0, 0, 0, 0);
replace into creature_display_info_addon values(18755, 0, 0, 0, 0);
replace into creature_display_info_addon values(18756, 0, 0, 0, 0);
replace into creature_display_info_addon values(18757, 0, 0, 0, 0);
replace into creature_display_info_addon values(18758, 0, 0, 0, 0);
replace into creature_display_info_addon values(18759, 0, 0, 0, 0);
replace into creature_display_info_addon values(18760, 0, 0, 0, 0);
replace into creature_display_info_addon values(18761, 0, 0, 0, 0);
replace into creature_display_info_addon values(18762, 0, 0, 0, 0);
replace into creature_display_info_addon values(18763, 0, 0, 0, 0);
replace into creature_display_info_addon values(18764, 0, 0, 0, 0);
replace into creature_display_info_addon values(18765, 0, 0, 0, 0);
replace into creature_display_info_addon values(18766, 0, 0, 0, 0);
replace into creature_display_info_addon values(18767, 0, 0, 0, 0);
replace into creature_display_info_addon values(18768, 0, 0, 0, 0);
replace into creature_display_info_addon values(18769, 0, 0, 0, 0);
replace into creature_display_info_addon values(18770, 0, 0, 0, 0);
replace into creature_display_info_addon values(18670, 0, 0, 0, 0);
replace into creature_display_info_addon values(18671, 0, 0, 0, 0);
replace into creature_display_info_addon values(18672, 0, 0, 0, 0);
replace into creature_display_info_addon values(18673, 0, 0, 0, 0);
replace into creature_display_info_addon values(18674, 0, 0, 0, 0);
replace into creature_display_info_addon values(18750, 0, 0, 0, 0);
replace into creature_display_info_addon values(18684, 0, 0, 0, 0);
replace into creature_display_info_addon values(18688, 0, 0, 0, 0);

update creature_template SET loot_id = 2442 WHERE entry = 2442;

replace into item_template values
 ('65000', '4', '3', 'Red Dragonscale Leggings', '', '61070', '3', '0', '1', '107892', '26973', '7', '-1', '-1',
 '59', '54', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '10', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '306', '0', '14',
 '0', '0', '0', '0', '18035', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0',
 '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '1', '0', '0', '0', '0', '0', '5', '1', '0', '552', '90', '0', '0', '0', '0', '48', '0', '0',
 '0', '0', '1', null);

 replace into item_template values
 ('65001', '4', '3', 'Red Dragonscale Shoulders', '', '28665', '3', '0', '1', '92616', '23154', '3', '-1', '-1',
 '61', '56', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '10', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '270', '0', '12',
 '0', '0', '0', '0', '18030', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0',
 '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '1', '0', '0', '0', '0', '0', '5', '1', '0', '0', '70', '0', '0', '0', '0', '48', '0', '0',
 '0', '0', '1', null);

 replace into item_template values
 ('65002', '4', '3', 'Red Dragonscale Boots', '', '61069', '3', '0', '1', '90252', '22563', '8', '-1', '-1',
 '59', '54', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '8', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '247', '0', '10',
 '0', '0', '0', '0', '18030', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0',
 '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '1', '0', '0', '0', '0', '0', '5', '1', '0', '0', '60', '0', '0', '0', '0', '48', '0', '0',
 '0', '0', '1', null);

 replace into item_template values
 ('65003', '4', '1', 'Robe of Sacrifice', 'Everything has a price.', '61071', '4', '0', '1', '139736', '34934', '5', '-1', '-1',
 '66', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '32', '6',
 '-12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '102', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '14127', '1', '0', '0', '-1', '0', '-1', '21603',
 '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '2', '0', '0', '0', '0', '0', '7', '1', '0', '0', '100', '0', '0', '0', '0', '65', '0', '0',
 '0', '0', '1', null);

 replace into item_template values
 ('65004','2', '15', 'Ornate Bloodstone Dagger', 'It hungers...', '61068', '4', '0', '1', '398972', '99743', '21', '-1', '-1',
 '68', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1300',
 '0', '0', '35', '72', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0',
 '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '2', '0', '0', '0', '0', '0', '1', '3', '0', '0', '76', '0', '0', '0', '0', '65', '0', '0',
 '0', '0', '1', null);

 replace into item_template values
 ('65005', '2', '15', 'Bloodletter Razor', '', '61072', '3', '0', '1', '115264', '28816', '13', '-1', '-1',
 '50', '45', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1700',
 '0', '0', '39', '74', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0',
 '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '2', '0', '0', '0', '0', '0', '1', '3', '0', '0', '65', '0', '0', '0', '0', '46', '0', '0',
 '0', '0', '1', null);

 replace into item_template values
 ('65006', '4', '3', 'Stormscale Leggings', '', '61073', '4', '0', '1', '211892', '52973', '7', '-1', '-1',
 '66', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '25', '6',
 '16', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '369', '0', '0',
 '0', '0', '0', '15', '17990', '1', '0', '0', '-1', '0', '-1', '18384', '1', '0', '0', '-1', '0', '-1', '0',
 '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '1', '0', '0', '0', '0', '0', '5', '1', '0', '0', '105', '0', '0', '0', '0', '65', '0', '0',
 '0', '0', '1', null);

 replace into item_template values
 ('65007', '4', '4', 'Imperial Plate Gauntlets', '', '61090', '2', '0', '1', '21304', '5326', '10', '-1', '-1',
 '53', '48', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '4', '11', '7',
 '12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '311', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0',
 '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '2', '0', '0', '0', '0', '0', '6', '1', '0', '0', '40', '0', '0', '0', '0', '9', '0', '0',
 '0', '0', '1', null);

 replace into item_template values
 ('65008', '2', '7', 'Dream\'s Herald', 'Between waking and dreaming.', '61067', '4', '65536', '1', '351812', '87953', '13', '-1', '-1',
 '66', '60', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1900',
 '0', '0', '61', '114', '0', '3', '5', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0',
 '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '2', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '1', null);

 replace into item_template values
 ('65009', '4', '2', 'Shadowskin Boots', '', '61091', '3', '0', '1', '19168', '4792', '8', '-1', '-1',
 '41', '36', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '5', '7',
 '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '108', '0', '0',
 '0', '0', '0', '0', '13669', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0',
 '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '2', '0', '0', '0', '0', '0', '8', '1', '0', '0', '55', '0', '0', '0', '0', '45', '0', '0',
 '0', '0', '1', null);

 replace into item_template values
 ('65010', '2', '13', 'Copper Knuckles', '', '15720', '1', '0', '1', '780', '195', '13', '-1', '-1',
 '10', '5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1800',
 '0', '0', '6', '12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0',
 '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '2', '0', '0', '0', '0', '0', '1', '0', '0', '0', '30', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '1', null);

 replace into item_template values
 ('65011', '2', '13', 'Sharpened Claw', '', '61092', '2', '0', '1', '4456', '1114', '21', '-1', '-1',
 '18', '13', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '2', '7',
 '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1800',
 '0', '0', '11', '21', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0',
 '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '2', '0', '0', '0', '0', '0', '1', '0', '0', '0', '40', '0', '0', '0', '0', '1', '0', '0',
 '0', '0', '1', null);

 replace into item_template values
 ('65012', '2', '13', 'Bronze Bruiser', '', '6109', '2', '0', '1', '11008', '2752', '13', '-1', '-1',
 '25', '20', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '2', '4',
 '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1700',
 '0', '0', '15', '29', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0',
 '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '2', '0', '0', '0', '0', '0', '1', '0', '0', '0', '45', '0', '0', '0', '0', '23', '0', '0',
 '0', '0', '1', null);

 replace into item_template values
 ('65013', '2', '13', 'Frostbound Slasher', '', '61094', '3', '0', '1', '37224', '9306', '22', '-1', '-1',
 '36', '31', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1900',
 '0', '0', '32', '60', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '2', '0', '0.85', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0',
 '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '2', '0', '0', '0', '0', '0', '1', '0', '0', '0', '65', '0', '0', '0', '0', '44', '0', '0',
 '0', '0', '1', null);

 replace into item_template values
 ('65014', '4', '4', 'Pauldron of Deflection', '', '61095', '4', '0', '1', '128728', '32182', '3', '-1', '-1',
 '63', '58', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '4', '15', '7',
 '18', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '537', '0', '0',
 '0', '0', '0', '0', '13665', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0',
 '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '2', '0', '0', '0', '0', '0', '6', '1', '0', '0', '100', '0', '0', '0', '0', '65', '0', '0',
 '0', '0', '1', null);

 replace into item_template values
 ('65016', '0', '0', 'Scroll of Thorns', '', '32845', '2', '0', '1', '400', '100', '0', '-1', '-1',
 '20', '15', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '21335', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0',
 '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '0', '0', '0', '0', '0', '0', '7', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '1', null);

 replace into item_template values
 ('65017', '0', '0', 'Scroll of Empowered Protection', '', '1037', '2', '0', '1', '1000', '250', '0', '-1', '-1',
 '28', '18', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '21956', '0', '-1', '0', '120000', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0',
 '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '0', '0', '0', '0', '0', '0', '7', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '1', null);

 replace into item_template values
 ('65018', '0', '0', 'Scroll of Magic Warding', '', '1097', '2', '0', '1', '1200', '300', '0', '-1', '-1',
 '35', '25', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '10618', '0', '-1', '0', '120000', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0',
 '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '1', null);

 replace into item_template values
 ('65019', '4', '3', 'Dragonscale Leggings', '', '25768', '3', '0', '1', '69016', '17254', '7', '-1', '-1',
 '49', '44', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '12', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '258', '0', '11',
 '0', '11', '10', '0', '13669', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0',
 '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1',
 '0', '-1', '2', '0', '0', '0', '0', '0', '5', '1', '0', '0', '90', '0', '0', '0', '0', '46', '0', '0',
 '0', '0', '1', null);

 update creature_template set display_id1 = 12237 where entry = 49004;