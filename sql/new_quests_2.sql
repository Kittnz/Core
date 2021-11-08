-- Reserved.
-- quest_template			40000-40200
-- creature_template		60300-60500
-- gameobject_template		2010700-2010900
-- item_template			60000-60200
-- gossip_menu				41000-43000
-- creature_equip_template	20000-21000
-- broadcast_text			30000-31000
-- creature_ai_events		2200000-2201000
-- creature_ai_scripts		2200000-2201000

-- Captain Barlgruf --
delete from quest_template where entry = 40228;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40228,2,3,40,34,0,0,'Captain Barlgruf','The Dark Iron Dwarves have been a long standing rival of ours, their attacks agianst our people have been ruthless. I have come to attempt to bolster our strength in the region, and if we want that to be possible, then we must set our sights on Angor Fortress.\n\nThe place is run by Captain Barlgruf, he has been sent from Shadowforge City to oversee actions here within the Badlands, cut him down, and the rest of them will be aimless. He should be inside Angor Fortress, no doubt nestled with the rest of his lackeys.\n\nKill him, and return to me.','Slay Captain Barlgruf within Angor Fortress for Senator Broadbelt in Badlands.','If there is to ever be peace, then we must act with swiftness.','Excellent work! The Dark Iron Dwarves need to be checked, and halted at each corner of the world, lest they gain the power to attack more openly.',0,0,0,0,0,0,0,0,91766,1,0,0,0,0,0,0,0,0,0,2750,47,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91767, 40228);
replace into creature_involvedrelation (id, quest) values (91767, 40228);

-- Angor Fortress --
delete from quest_template where entry = 40229;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40229,2,3,39,33,0,0,'Angor Fortress','Angor Fortress looms like a dark cloud in the Badlands, from their the Dark Iron can muster immense amounts of power. They are one of the key players in the region for that very reason.\n\nI have been sent from Ironforge to attempt to dissolve some of their grip here, and to do so, we will need to strike hard. I desire you to travel to Angor Fortress just to the north west, and slay those that guard it. Take from them their Shadowforge Shackles they wear, 10 of them in total, and bring them to me.','Slay Dark Iron Dwarves around Angor Fortress, and collect 10 Shadowforge Shackles for Senator Broadbelt in Badlands.','They are incredibly stubborn, and will not give up without a fight.','Great work, Ironforge would be proud of the actions you have done this day, please, take these coins, as a token of our gratitude.\n\nPerhaps one day we may ressume our work here on a more larger scale!',60311,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2000,2750,47,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91767, 40229);
replace into creature_involvedrelation (id, quest) values (91767, 40229);

delete from item_template where entry = 60311;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60311,3620,'Shadowforge Shackle',12,1,2048,1,-1,-1,1,10,-1,-1,-1,-1,4,'',0);

delete from creature_loot_template where item = 60311 and entry = 2742 and 2743;
replace into creature_loot_template (entry, item, chanceorquestchance, mincountorref, maxcount, condition_id, patch_max) values
(2742,60311,-34,1,1,0,10),
(2743,60311,-38,1,1,0,10);

-- Saltspittle Raiders --
delete from quest_template where entry = 40230;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40230,2,331,21,10,0,0,'Saltspittle Raiders','Lake Falathim was a place I spent much of my youth, it was a place of relaxation and good times. Only now it is taken over by the Saltspittle, who attacked with ferocity and no remorse. Some died during the attack, but I was lucky to escape.\n\nWhen I was about to leave I left behind an item that is most valueable to me. My Uncle who died during the Battle of Hyjal left me a book in my possession. It is one he wrote about both his technique in battle and his experiences regarding war. I\'ve found much knowledge and wisdom from that book, and I desire to know everything that he had jotted down before his passing.\n\nTravel to Lake Falathim to the south west, and find my belongings. While you are there, make sure to get revenge, and slay the Saltspittle, their fins should do fine.','Gather 5 Saltspittle Fins and recover the Greenblade Book.','That place is crawling with murloc, I would advise you steel yourself for what must be done.','',60312,1,60313,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1300,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (60472, 40230);
replace into creature_involvedrelation (id, quest) values (60472, 40230);

delete from item_template where entry = 60312;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60312,1317,'Greenblade Book',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0);

delete from gameobject_template where entry = 2010845;
replace into gameobject_template values
(2010845, 0, 3, 24015, 'Mucky Book', 0, 4, 1, 43, 2010845, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

delete from gameobject_loot_template where entry = 2010845;
replace into gameobject_loot_template (entry, item, chanceorquestchance, mincountorref, maxcount, condition_id, patch_max) values (2010845,60312,-100,1,1,0,10);

delete from item_template where entry = 60313;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60313,555,'Saltspittle Fin',12,1,2048,1,-1,-1,1,5,-1,-1,-1,-1,4,'',0);

delete from creature_loot_template where item = 60313 and entry between 3737 and 3742;
replace into creature_loot_template (entry, item, chanceorquestchance, mincountorref, maxcount, condition_id, patch_max) values
(3737,60313,-40,1,1,0,10),
(3739,60313,-40,1,1,0,10),
(3742,60313,-45,1,1,0,10);

-- The Forgotten Tome --
delete from quest_template where entry = 40231;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40095,40231,2,8,38,30,0,0,'The Forgotten Tome','This tome holds a great history to the nation of Stormwind, and should be stored as such. A holy warrior fell on this battlefield many years ago, and this tome remains intact. The tomes words are holy scripture, and I would ask it be placed amongst the Cathedral\'s great books.\n\nI ask of you to travel to Stormwind, and speak with Archbishop Benedictus, to see if he would take this book within the Cathedral to be preserved. My mentor would ask this of me, I am certain, let us do our duty.','Take the Forgotten Tome to Archbishop Benedictus in Stormwind.','How may I assist you?','Watch Paladin Janathos sent you, well I know the man well. He spoke with me before his departure out to Sorrowguard. It is good to hear that he is alive. If he desires me to keep this book within the Cathedral I will do as such, perhaps the words written inside will benefit those of the faith.',60188,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60188,1,0,450,72,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (92017, 40231);
replace into creature_involvedrelation (id, quest) values (1284, 40231);