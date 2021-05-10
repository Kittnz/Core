update creature_template set name = 'Eliana Firestorm', display_id1 = 10214 where entry = 81057;

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, objectivetext1, objectivetext2, objectivetext3, objectivetext4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (0,70020,331,20,18,0,0,'A Brother’s Worried Mind','My little brother, Taupo, is a gifted druid and more accomplished than I would ever hope to be but he is still my little brother.\n\nHe was on his way to the Warsong Lumber Camp to help with the demonic corruption among other things. I fear he might find trouble as he has to pass through Felfire Hill.\n\nPlease, find my little brother, I would do it myself but I do not wish him to think I find him incapable, yet I still worry. He left not so long ago, following the main road east, that is the path to the Lumber Camp.','Find Taupo Foreststrider, Loruk’s brother at the beginning of Felfire Hill.','Yes?','Loruk sent you to check on me? Is he still thinking I’m a small calf with no horns?',0,0,0,0,0,0,0,0,'','','','',0,0,0,216,81,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest, patch_min, patch_max) values (11720, 70020,'0','10'); 
replace into creature_involvedrelation (id, quest, patch_min, patch_max) values (70020, 70020,'0','10');

REPLACE INTO `creature_template` VALUES (70020, 0, 2738, 0, 0, 0, 'Taupo Foreststrider', NULL, 0, 24, 29, 2868, 2868, 0, 0, 2463, 104, 2, 1, 1.14286, 1.35, 20, 5, 0, 0, 1, 68, 88, 0, 194, 1, 2000, 2000, 1, 4608, 0, 0, 0, 0, 0, 0, 60.7904, 83.5868, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 70020, 0, 0, 0, 0, 524298, '');

replace into creature_equip_template (entry, equipentry1) values (70020, 80836);

REPLACE INTO `item_template` VALUES (70021, 0, 12, 0, 'Bog Creature Core', '', 19497, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);

replace into creature_loot_template values (3782, 70021, -100, 6, 1, 1, 0, 0, 10); 
replace into creature_loot_template values (3784, 70021, -100, 6, 1, 1, 0, 0, 10); 

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, objectivetext1, objectivetext2, objectivetext3, objectivetext4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (70020,70021,331,20,18,0,0,'Taupo\’s Duty','It was Earthmother’s blessing to be born with such a worried elder brother, and as fate has it there you are, just the help that I needed.\n\nWhile I was making my way to the Lumber Camp I saw this Tauren bravely fight those demons and I have stopped to tend to his wounds. My skills helped stop his bleeding, but we need a salve to fully mend him.\n\nIn the river you will find Boglings, slay them and bring me the cores, they will help bring our newest friend back on his feet, and do not worry $N, this is all in the name of balance.','Bring Kaga 10 Bog Creatures Core.','Yes?','Thank you $N, this will mend our friend.',70021,10,0,0,0,0,0,0,'','','','',0,0,0,1050,81,75,0,0,0,0,0,0,0,0,0,1970,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest, patch_min, patch_max) values (70020, 70021,'0','10'); 
replace into creature_involvedrelation (id, quest, patch_min, patch_max) values (70020, 70021,'0','10');

REPLACE INTO `creature_template` VALUES (70022, 0, 2951, 0, 0, 0, 'Norvok Hawkspear', NULL, 0, 25, 34, 2868, 2868, 0, 0, 2463, 104, 2, 1, 1.14286, 1.35, 20, 5, 0, 0, 1, 68, 88, 0, 194, 1, 2000, 2000, 1, 4608, 0, 0, 0, 0, 0, 0, 60.7904, 83.5868, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 524298, '');

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, objectivetext1, objectivetext2, objectivetext3, objectivetext4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (70021,70022,331,21,19,0,0,'Norvok of the Spear','I was on my way to the Warsong Lumber Camp when I had my encounter with the demons, were it not for this druid I wouldn’t have made it.\n\nI have a very important report addressed to the stationary Commander in charge, Commander Grushak, I would hurry right away but the wounds have yet to release me of my pain and my spear was lost in the battle.\n\nI ask you to find while it Taupo heals me, and $n, while you do this, spare no demon.','Kill 10 Searing Infernals and 10 Felguards, return to Norvok. ','Yes?','My horns are ready and sharpened, alas my spear was stolen by those demons, the vermin felt the blessings of the Earthmother on it!\n\nIt’s not your fault $N, you’ve bravely fought them and for that I am in your debt, here, have this necklace as a token of my gratitude.',0,0,0,0,0,0,0,0,'','','','',0,0,0,1050,81,75,0,0,0,0,0,0,0,0,0,70003,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest, patch_min, patch_max) values (70022, 70022,'0','10'); 
replace into creature_involvedrelation (id, quest, patch_min, patch_max) values (70022, 70022,'0','10');

update quest_template set reqcreatureorgoid1 = 6073, reqcreatureorgocount1 = 10 where entry = 70022;
update quest_template set reqcreatureorgoid2 = 6115, reqcreatureorgocount2 = 10 where entry = 70022;

REPLACE INTO `creature_template` VALUES (70023, 0, 3511, 0, 0, 0, 'Commander Grushak', '', 0, 27, 33, 1400, 3400, 0, 0, 3791, 29, 3, 1, 1.38571, 0, 20, 5, 0, 1, 1, 166, 241, 0, 272, 1, 2000, 2000, 1, 36864, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 70023, 0, 0, 0, 0, 524298, '');

replace into creature_equip_template (entry, equipentry1) values (70023, 7612);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, objectivetext1, objectivetext2, objectivetext3, objectivetext4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (70022,70023,331,21,19,0,0,'Report to Commander Grushak','I am aware I am not going anywhere anytime soon $N, there is no need for you to stare at me that way.\n\nYou will have to give my report to Commander Grushak, tell him I sent you, he will be glad to have you by his side, he’s a bit strict but that’s what will keep you alive out there. Seek him in the first tower as you reach the Lumber Camp.\n\nAs a personal request however, do keep an eye out for my spear, it carries years worth of history, been passed through my lineage from the first Hawkspear to the last and I do not wish it to be lost at the hands of demons.\n\nTravel safe my friend and may the Earthmother guide you.','Report to Commander Grushak at the Lumber Camp.','Yes?','I was expecting someone else to give me this report, $r, what happened to Norvok?',0,0,0,0,0,0,0,0,'','','','',0,0,0,520,81,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest, patch_min, patch_max) values (70022, 70023,'0','10'); 
replace into creature_involvedrelation (id, quest, patch_min, patch_max) values (70023, 70023,'0','10');

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, objectivetext1, objectivetext2, objectivetext3, objectivetext4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (70023,70024,331,27,24,0,0,'Wildthorn Menace','The camp is as productive as the day it was built from the ground, which frankly doesn’t mean much at all.\n\nThe Wildthorn Lurkers have ascended upon our camp and are giving the peons  and laborers a hard time, while my scouts are giving their all to slay them it is not enough.\n\nGo help the cause, $N, after all I take you bringing this report as volunteering your aid, clean the camp of the wildthorn menace and I will see you rewarded.','Kill 10 Wildthorn Lurkers in Warsong Lumber Camp.','Clean the camp of the wildthorn menace and I will see you rewarded.','Already done?',0,0,0,0,0,0,0,0,'','','','',0,0,0,1520,76,75,0,0,0,0,0,0,0,0,0,933,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

update quest_template set reqcreatureorgoid1 = 3821, reqcreatureorgocount1 = 10 where entry = 70024;

replace into creature_questrelation (id, quest, patch_min, patch_max) values (70023, 70024,'0','10'); 
replace into creature_involvedrelation (id, quest, patch_min, patch_max) values (70023, 70024,'0','10');

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, objectivetext1, objectivetext2, objectivetext3, objectivetext4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (70024,70025,331,27,24,0,0,'Knife Eared Stalkers','Those knife eared bastards are trying to force us out of the woods, they’ve sent a squadron of stalkers that hide around our fields and murder our peons, they must be stopped!\n\nGo get your hands dirty, leave none alive, and if anything make sure more of the peons don’t die.','Kill 20 Ashenvale Stalkers.','Go get your hands dirty, leave none alive, and if anything make sure more of the peons don’t die.','With the interference of the elves gone we can resume our duty in peace, thank you $N, you are more capable than I thought you will.',0,0,0,0,0,0,0,0,'','','','',0,0,0,1820,76,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,70004,1,70005,1,70006,1,0,0);

update quest_template set reqcreatureorgoid1 = 70025, reqcreatureorgocount1 = 20 where entry = 70025;

replace into creature_questrelation (id, quest, patch_min, patch_max) values (70023, 70025,'0','10'); 
replace into creature_involvedrelation (id, quest, patch_min, patch_max) values (70023, 70025,'0','10');

REPLACE INTO `creature_template` VALUES (70025, 0, 12912, 12913, 12914, 0, 'Ashenvale Stalker', NULL, 0, 27, 27, 569, 819, 981, 618, 829, 124, 0, 1, 0.571429, 0, 20, 5, 0, 0, 1, 31, 40, 0, 104, 1, 2000, 2000, 2, 32768, 0, 0, 0, 0, 0, 0, 35.6224, 48.9808, 100, 7, 0, 12856, 12856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128560, 0, 29, 43, 'EventAI', 1, 3, 0, 0, 3, 12856, 0, 0, 0, 0, 0, '');

REPLACE INTO `item_template` VALUES (70022, 0, 12, 0, 'Ashenvale Bear Pelt', '', 1495, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, objectivetext1, objectivetext2, objectivetext3, objectivetext4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (70025,70026,331,27,24,0,0,'Peon\'s Wardrobe Makeover','With most of the tasks done, I only have but a favor to ask of you, our poor peons have been wearing the same tattered clothing since we’ve come to this damned forest, they can’t take another day in those rags and I most certainly won’t be the one blamed for naked peons chopping wood!\n\nI need you to hunt and skin some bears for me, North of Splintertree Post and in its immediate vicinity to the left you will be able to find bears, grab enough for our leatherworker to craft new cloths for those poor miserable souls, but remember $N, only hunt the eldest of the bears.','Collect 10 Elder Ashenvale Bear Pelts.','Remember, only hunt the eldest of the bears.','You have my thanks $N, your work helped me and my men more that you’d imagine, as a sign of gratitude the leatherworker made this for you.',70022,10,0,0,0,0,0,0,'','','','',0,0,0,1960,76,150,0,0,0,0,0,0,0,0,0,70008,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest, patch_min, patch_max) values (70023, 70026,'0','10'); 
replace into creature_involvedrelation (id, quest, patch_min, patch_max) values (70023, 70026,'0','10');

replace into creature_loot_template values (3810, 70022, -100, 6, 1, 1, 0, 0, 10); 

update quest_template set questlevel = 29, minlevel = 28 where entry = 70020;
update quest_template set questlevel = 29, minlevel = 28 where entry = 70021;
update quest_template set questlevel = 29, minlevel = 28 where entry = 70022;
update quest_template set questlevel = 30, minlevel = 28 where entry = 70023;
update quest_template set questlevel = 30, minlevel = 28 where entry = 70024;
update quest_template set questlevel = 29, minlevel = 28 where entry = 70025;
update quest_template set questlevel = 30, minlevel = 28 where entry = 70026;

update item_template set flags = 2048 where entry in (59995, 59996); 

REPLACE INTO `item_template` VALUES (70023, 0, 12, 0, 'Commander Grushak\'s Report', '', 924, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, objectivetext1, objectivetext2, objectivetext3, objectivetext4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (70026,70027,331,28,25,0,0,'Farseer Grimeye','The fields are clear, the peons seem happy and the productivity is already going way better than they used to.\n\nThat\'s exactly why I am sending you to another mission. You seem eager to aid and frankly the Farseer needs all the help he can get.\n\nHe\'s a cranky old orc, don\'t even for a second consider his frustration as weakness. He will task you with a harsh job but I do not doubt you will do well. Go now and give him this parchment.','Deliver Commander Grushak\'s report to Farseer Grimeye.','So, Grushak finally reporting on his peons doing their job for once? ','Now, what do I do with you?',70023,1,0,0,0,0,0,0,'','','','',70023,1,0,360,76,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest, patch_min, patch_max) values (70023, 70027,'0','10'); 
replace into creature_involvedrelation (id, quest, patch_min, patch_max) values (70027, 70027,'0','10');

REPLACE INTO `creature_template` VALUES (70027, 0, 3869, 0, 0, 0, 'Farseer Grimeye', NULL, 0, 35, 38, 2210, 2210, 0, 0, 1200, 29, 3, 1, 1.14286, 0, 20, 5, 0, 1, 1, 129, 166, 0, 122, 1, 2000, 2000, 1, 4096, 0, 0, 0, 0, 0, 0, 37.608, 51.711, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127370, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 12737, 0, 0, 2, 0, 524288, '');

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, objectivetext1, objectivetext2, objectivetext3, objectivetext4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (70027,70028,331,28,25,0,0,'Demon Fall Canyon','What do you see here $N? I will tell you what I see; a roaming pack without its Alpha. Simple minded buffoons who lost their commander.\n\nSometimes I ask myself what would have happened if Hellscream… doesn\'t matter now.\n\nFalling down into the Demon Fall Canyon you will see numerous spawns of the Burning Legion. As you should know, a great demon fell there, hence the namesake, I suppose.\n\nYour mission is clear, yet, not so simple. Wreak havoc and cull their numbers. I expect you do whatever you see fit to leave none alive.','Slay 10 Mannoroc Lashers, 10 Searing Infernals and 10 Felguards. Report to Farseer Grimeye.','I take it you\'re not a coward, so why are you still here?','Good. While their numbers are Legions and our arms never rest, we will prevail thanks to the sheer desire to survive overcoming their plans to conquer.\n\nCome, I have few items saved as payment. Choose whichever fits you best.',0,0,0,0,0,0,0,0,'','','','',0,0,0,1960,76,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,70010,1,70011,1,0,0,0,0);

replace into creature_questrelation (id, quest, patch_min, patch_max) values (70027, 70028,'0','10'); 
replace into creature_involvedrelation (id, quest, patch_min, patch_max) values (70027, 70028,'0','10');

update quest_template set reqcreatureorgoid1 = 11697, reqcreatureorgocount1 = 10 where entry = 70028;
update quest_template set reqcreatureorgoid2 = 6073, reqcreatureorgocount2 = 10 where entry = 70028;
update quest_template set reqcreatureorgoid3 = 6115, reqcreatureorgocount3 = 10 where entry = 70028;

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, objectivetext1, objectivetext2, objectivetext3, objectivetext4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (70028,70029,331,28,25,0,0,'What We Know','Our grunts found one of these Night Elves stalking about, the deformed creature had a letter on its corpse. I will spare you the disgust I had while trying to decipher that abomination of a language.\n\nAbove the canyon you should be able to find a Barrow Den, one of the holes these knife eared mongrels like to dig. From what I could gather of this piece of paper, a greater menace can be found at its lowest level.\n\nFind out what\'s hiding there and come back as swift as the wind.','Discover the real menace.','Hopefully you will survive to tell the story, $c.','A Dreadlord of all things? This won\'t be easy, at your current state you\'re nothing more than a twig in a cyclone, but there are other ways.',0,0,0,0,0,0,0,0,'','','','',0,0,0,1380,76,75,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

update quest_template set objectivetext1 = 'Discover what\'s hiding in the Barrow Den' where entry = 70029;

replace into creature_questrelation (id, quest, patch_min, patch_max) values (70027, 70029,'0','10'); 
replace into creature_involvedrelation (id, quest, patch_min, patch_max) values (70027, 70029,'0','10');

REPLACE INTO `creature_template` VALUES (70028, 0, 3869, 0, 0, 0, 'Quest 70029 Custom Trigger', NULL, 0, 35, 38, 2210, 2210, 0, 0, 1200, 29, 3, 1, 1.14286, 0, 20, 5, 0, 1, 1, 129, 166, 0, 122, 1, 2000, 2000, 1, 4096, 0, 0, 0, 0, 0, 0, 37.608, 51.711, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127370, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 12737, 0, 0, 2, 0, 524288, '');

REPLACE INTO `gameobject_template` VALUES (3000101, 0, 5, 381, 'Quest 70029 Custom Trigger', 0, 0, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_exploration_trigger');

update quest_template set reqcreatureorgoid1 = 70028, reqcreatureorgocount1 = 1 where entry = 70029;

REPLACE INTO `item_template` VALUES (70024, 0, 12, 0, 'Farseer Grimeye\'s Letter', '', 3024, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);

replace into creature_questrelation (id, quest, patch_min, patch_max) values (70027, 70030,'0','10'); 
replace into creature_involvedrelation (id, quest, patch_min, patch_max) values (3995, 70030,'0','10');

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, objectivetext1, objectivetext2, objectivetext3, objectivetext4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (70029,70030,331,28,25,0,0,'A Very Unpleasant Troll','We need to...\n\n<the old orc sighs>\n\nWe will need the help of an old "friend" of mine. Nothing beats a Witch Doctor\'s mojo so I am sending you to Stonetalon.\n\nFind Jin\'Zil and give him this letter, his mojo is potent enough to shrink the Dreadlord and weaken it enough for you to slay it.\n\nHowever! He will have a task for you, probably something easy and meaningless so don\'t waste too much time over there, we have a dreadlord to slay.','Find Jin\'Zil and give him the letter from Grimeye.','Three little elves hugging the trees, ol\' Jin\'Zil will be cooking soon!','Ah, hello mon, I didn\'t notice you, what do you want?',70024,1,0,0,0,0,0,0,'','','','',70024,1,0,450,76,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, objectivetext1, objectivetext2, objectivetext3, objectivetext4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (70030,70031,331,28,25,0,0,'Jin\'Zil\'s Stew','Grimeye wants my mojo to kill a Dreadlord eh?\n\nSure mon, Jin\'Zil will help you if you help Jin\'Zil, this stew needs more stuff!\n\nYou bring the stuff and I give you the mojo.\n\nI will need some melon juice, dwarven mild, wild hog shank and some soothing spices!\n\nGo, Jin\'Zil will stir the cauldron and wait for you!','Collect all ingredients for Jin\'Zil\'s stew.','Hey, $n, I wonder what $r tastes like.\n\nBut don\'t worry I won\'t be eating you! Maybe.','My stew is almost done, let\'s have a taste.\n\nTerrible!\n\nI mean, it tastes better than my wife\'s cooking.',1205,5,422,5,3771,5,3713,10,' ',' ',' ',' ',0,0,0,1950,0,0,0,0,0,0,0,0,0,0,0,70009,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest, patch_min, patch_max) values (3995, 70031,'0','10'); 
replace into creature_involvedrelation (id, quest, patch_min, patch_max) values (3995, 70031,'0','10');

replace into creature_questrelation (id, quest, patch_min, patch_max) values (3995, 70032,'0','10'); 
replace into creature_involvedrelation (id, quest, patch_min, patch_max) values (70027, 70032,'0','10');

REPLACE INTO `item_template` VALUES (70025, 0, 12, 0, 'Jin\'Zil\'s Mojo', '', 1275, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, objectivetext1, objectivetext2, objectivetext3, objectivetext4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (70031,70032,331,29,26,0,0,'The Good Mojo','Here mon take this package and deliver it to Grimeye, Jin\'Zil took the liberty of adding more than the mojo you needed for the old cranky orc.\n\nJust give him my regards and tell me he still owes me coin from when we rolled in the bones!\n\nI am never gonna forget it!','Deliver the package to Farseer Grimeye.','What took you this long?','That daft fool just won\'t let go of it! I told him we were not playing on coin, gah.\n\n<Grimeye clears his throat.>\n\nIn any case $N, well done. Now let\'s go kill us a dreadlord.',70025,1,0,0,0,0,0,0,' ',' ',' ',' ',70025,1,0,360,76,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

REPLACE INTO `item_template` VALUES (70026, 0, 12, 0, 'Diathorus\'s Head', '', 20931, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);

replace into creature_loot_template values (6072, 70026, -100, 6, 1, 1, 0, 0, 10); 

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, objectivetext1, objectivetext2, objectivetext3, objectivetext4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (70032,70033,331,30,27,0,0,'The Seeker\'s Demise','This is it $N, your most dangerous task yet, but I am more than sure you will succeed.\n\nYou showed courage I have not seen in so long, may the ancestors guide your steps and may you return unharmed.\n\nYou have my blessings and the ancestors at your side.\n\nRemember that where you stand a great warrior once stood and you too shall walk in his steps, slay them with pride in your heart!','Kill Diathorus the Seeker and take his head back to Farseer Grimeye.','Bring me his severed head and I will set it on fire!','You have done something not many can do, $c, walk with pride from this day onward.\n\nThis old orc is reminded of the past but from now on he will dream of the future.\n\nI will set fire to the head and mention you the slayer to our clan, but the ancestors tell me your path only begins my dear friend.\n\nI truly hope you will one day find what you seek.',70026,1,0,0,0,0,0,0,'','','','',0,0,0,2640,76,150,0,0,0,0,0,0,0,0,0,70012,1,81290,1,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest, patch_min, patch_max) values (70027, 70033,'0','10'); 
replace into creature_involvedrelation (id, quest, patch_min, patch_max) values (70027, 70033,'0','10');

update quest_template set reqcreatureorgoid1 = 6072, reqcreatureorgocount1 = 1 where entry = 70033;
update quest_template set reqcreatureorgoid2 = 11697, reqcreatureorgocount2 = 10 where entry = 70033;
update quest_template set reqcreatureorgoid3 = 6073, reqcreatureorgocount3 = 10 where entry = 70033;
update quest_template set reqcreatureorgoid4 = 6115, reqcreatureorgocount4 = 10 where entry = 70033;

replace into item_template values
 ('70008', '0', '4', '1', 'Ashenvale Shawl', '', '23070', '2', '0', '1', '6592', '1648', '16', '-1', '-1', '29',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '10', '0', '6', '4', '7', '4',
 '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '22', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '7', '1', '0', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0',
 '0', '1', NULL);
 
update item_template set name = 'Hawkspear\'s Ceremonial Headdress' where entry = 70014;

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, objectivetext1, objectivetext2, objectivetext3, objectivetext4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (70022,70034,331,27,26,0,0,'Hawk\'s Beak','As you go sowing and reaping demons like a farmer in the harvest you come upon a broken spear.\n\nThe handle was destroyed and the blade was in poor shape.\n\nYou immediately realise this is the spear you\'ve been tasked to return if you were to find it.','Take what remains of the spear to Norvok Hawkspear.','Yes?','This spear served my family for many generations.\n\nI am saddened that I was the one to bring it to its end, and brought shame upon my tribe.\n\n<Norvok takes a deep breath through his huge nostrils and lets the air out with a smile.>\n\nDon\'t look sad my newest friend, you helped me more than you know, this is not the end but merely the beginning.\n\nI will reforge the blade and make it more sturdy, after all even when you cut a hawk\'s wings his beak is as dangerous as ever.',70027,1,0,0,0,0,0,0,'','','','',0,0,5000,1650,81,150,0,0,0,0,0,0,0,0,0,70014,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into item_template values
 ('70027', '0', '12', '0', 'Broken Spear', 'The handle is destroyed and the blade is in poor shape.', '26500', '1', '0', '1', '0', '0', '0', '-1', '-1', '0', '27', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '4', '0', '0', '0', '70034', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
replace into creature_involvedrelation (id, quest, patch_min, patch_max) values (70022, 70034,'0','10');
 
replace into creature_loot_template values (6072, 70027, 10, 7, 1, 1, 0, 0, 10); 
replace into creature_loot_template values (6073, 70027, 10, 7, 1, 1, 0, 0, 10); 
replace into creature_loot_template values (6115, 70027, 10, 7, 1, 1, 0, 0, 10); 
replace into creature_loot_template values (11697, 70027, 10, 7, 1, 1, 0, 0, 10); 

replace into creature_template_addon (entry, bytes1) values (70022, 3);
update creature_template set script_name = 'npc_norvok' where entry = 70022;

UPDATE `creature_spells` SET `spellId_1` = 15623 WHERE `entry` = 169840;
UPDATE `creature_template` SET `mechanic_immune_mask` = 1023391482 WHERE `entry` = 16573;

REPLACE INTO `gameobject_template` VALUES (3000105, 0, 1, 2091, 'Zeppelin\'s Shortwave Radio', 0, 0, 0.4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_expansion_radio');

update gameobject set spawntimesecsmin = 36000, spawntimesecsmax = 40000 where id = 153464 and spawntimesecsmin < 18000;

UPDATE `battleground_template` SET `min_players_per_team`='2', `max_players_per_team`='2' WHERE (`id`='4') AND (`patch`='0');

replace into item_template values
 ('81290', '0', '2', '19', 'Diathorus\' Claw', '', '33125', '3', '0', '1', '22768', '5692', '15', '-1', '-1', '33',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1900', '100',
 '0', '39', '71', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '2', '0', '0', '0', '65', '0', '0', '0', '0', '43', '0', '0', '0',
 '0', '1', NULL);
 
update item_template set item_level = 20 where entry in (80730, 80739);
update quest_template set requiredraces = 589 where entry = 5001;
update quest_template set requiredraces = 434 where entry = 4982;

delete from creature_loot_template where item = 20697;

update item_template set description = 'Appearances of this beloved and ultra-reclusive murloc are sure to draw a crowd.' where entry = 20371;

-- Theramore Deserters that were added in TBC.
DELETE FROM `creature` WHERE `guid` IN (30741, 30769, 30770, 30742, 30772, 30773, 30771, 30774, 30776);
DELETE FROM `creature_addon` WHERE `guid` = 30741;