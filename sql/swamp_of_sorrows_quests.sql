-- Reserved.
-- quest_template			40000-40200
-- creature_template		60300-60500
-- gameobject_template		2010700-2010900
-- item_template			60000-60200

-- Biggs Report to Sorrowguard --
delete from quest_template where entry = 40071;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40071,2,8,35,30,0,0,'Biggs Report to Sorrowguard','Traveler, please!\n\nI need this letter delivered and delivered quickly, it details everything that happened to the caravan. If you could be quick, it would be greatly appreciated, my commander is within the old Sorrowguard keep to the northwest, tucked within the mountains near Deadwind Pass. Take this to him, and at haste!','Deliver Biggs Report to Watch Paladin Janathos.','Yes, may I assist?','Thanks for delivering this report, I trust Biggs can manage on getting here. The Draenei of the region have become a problem that may need to be dealt with in the future.',60166,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60166,1,0,600,72,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (5476, 40071);
replace into creature_involvedrelation (id, quest) values (92017, 40071);

delete from item_template where entry = 60166;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values (60166,7629,'Biggs Report',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',50507);

delete from page_text where entry = 50507;
replace into page_text (entry, text, next_page) value (50507,'To Watch Paladin Janathos\n\nMe and my company were attacked heading to the east by Lost One\'s of the Fallow Sanctuary. Many of the others were killed and our supplies were taken, I was able to escape and have been barely surviving in a camp I created. I will return soon, when I have gained some rest.',0);

-- Arenytall Family Value --
delete from quest_template where entry = 40072;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40071,40072,2,8,37,30,0,0,'Arenytall Family Value','The Areyntall family has been a noble house within Stormwind for quite some time, and Lordaeron before that. We made our fortunes from naval trade and procuring rare materials from far away lands to sell within the Kingdom.\n\nI cannot take full credit of course, it was my fathers doing, but I hoped to live up the same legacy as he. I did well for a while anyway, and ran my families ship, the Crownguard for a few months. It is a tragedy that it was scuttled, and sank, along with part of my families goods with it.\n\nYou can find the wreck, off the eastern coast, sunken deep in the ground, if you could go there, and search the wreckage for my families Strongbox, I would make it worth your while.','Collect the Areyntall Strongbox for Sir Areyntall.','I don\'t want to lose my father legacy, have you had any luck?','I cannot describe how eased I am, I had generations looking down upon me with anger, and I feel that things have come to ease. Maybe soon I can return to Stormwind now that this has been returned, thanks again.',60167,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2750,72,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (92017, 40072);
replace into creature_involvedrelation (id, quest) values (92017, 40072);

delete from item_template where entry = 60167;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values (60167,12331,'Areyntall Strongbox',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0);

delete from gameobject_template where entry = 2010819;
replace into gameobject_template values
(2010819, 0, 3, 23430, 'Small Chest', 0, 4, 1, 43, 2010819, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

delete from gameobject_loot_template where entry = 2010819;
replace into gameobject_loot_template (entry, item, chanceorquestchance, mincountorref, maxcount, condition_id, patch_max) values (2010819,60167,-100,1,1,0,10);

-- Iron for Sorrowguard --
delete from quest_template where entry = 40073;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40073,2,8,37,30,0,0,'Iron for Sorrowguard','We were promised to be well supplied when we departed from Stormwind, only to be left out here with hardly anything to work with. What supplies we recieved Watch Paladin Janathos paid for mostly out of his own pocket from shipments on the eastern coast. Ever since those shipments have stopped we have gotten nothing.\n\nYou can\'t imagine how hard it is to maintain equipment with such a small supply of Iron that I have. If things keep up like this I will run out, which means Sorrowguard will fall.\n\nI suppose that is where you come in, if you can procure me 20 Iron bars, it will go a long way in keeping us in working order.','Gather 20 Iron Bars for Janet Hollowworth in Sorrowguard Keep.','Has it been done? The Iron supplies I have will not last forever.','I cannot thank you enough, this will mean a lot in the long term, it will be put to good use, I can assure you.',3575,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2500,72,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (92019, 40073);
replace into creature_involvedrelation (id, quest) values (92019, 40073);

-- A Delivery of Swords --
delete from quest_template where entry = 40074;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40073,40074,2,8,37,30,0,0,'A Delivery of Swords','Watch Paladin Janathos requisitioned some swords a while ago, and whilst he paid me for the swords to be made, I have been having trouble finding a way to deliver them. The nearest Blacksmith with the proper materials was Darkshire.\n\nClarise Gnarltree was paid to craft swords for Sorrowguard, you shall find her there. Could you head to Darkshire and gather the swords for me? They will surely help ease the load on my crafting and make the bars you gave us go even farther.','Collect the Delivery of Swords from Clarise Gnarltree.','Welcome to our Blacksmith, can I help you?','Oh, you come from Sorrowguard? I swear, its been about a month since I heard from them, I assumed the worst.',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,450,72,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (92019, 40074);
replace into creature_involvedrelation (id, quest) values (3136, 40074);

-- Swords to Sorrowguard --
delete from quest_template where entry = 40075;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40074,40075,2,8,37,30,0,0,'Swords to Sorrowguard','It has been so long since I last heard from Sorrowguard, I honestly had assumed the orcs had taken or destroyed the keep. That or something equally as bad, I am not a downer, just a realist in a way, its a dangerous place that swamp!\n\nStill, I held onto the swords, just incase something as bad happened here, its better to have them, then have some coin I figure. Take them to Janet, she should be relieved I didn\'t happen to sell them off.','Take the Delivery of Swords to Janet Hollowworth in Sorrowguard Keep.','You return, good news I hope?','Thank the heavens, I have been worried about this order since the trouble with shipping weeks ago. At the least we have a stock of swords available should anything bad happen, and it has freed up my Iron for other things.\n\nHere, take one, as a way for me to pay you for the services.',60168,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60168,1,0,1850,72,100,0,0,0,0,0,0,0,0,0,60169,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (3136, 40075);
replace into creature_involvedrelation (id, quest) values (92019, 40075);

delete from item_template where entry = 60168;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values (60168,7914,'Delivery of Swords',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0);

delete from item_template where entry = 60169;
replace into item_template values
 ('60169', '0', '2', '7', 'Sorrowguard Shortsword', '', '28567', '2', '0', '1', '57064', '14266', '21', '-1', '-1', '43',
 '36', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '6', '5', '4', '4',
 '7', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2400', '0',
 '0', '45', '78', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '1', '3', '0', '0', '75', '0', '0', '0', '0', '26', '0', '0', '0',
 '0', '1', NULL);
 
-- Food Improvision --
