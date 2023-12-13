-- All Around Alah'Thalas
delete from quest_template where entry = 41241;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,41241,2,5225,6,5,0,0,'All Around Alah\'Thalas','Are you here to perhaps lay eyes upon the undeniable future, or is it mere innocent curiosity? Maybe you\'re here to spit in our face as those who cast us aside in the muck and the rubble. Blessed be the sun, you wouldn\'t be here to take pity on our wretched souls, would you?$B$BYour pity we\'ll do without. However, you might prove useful. We require a task, one for such an eager ally as yourself. You wouldn\'t mind repurposing a few misplaced arcane crystals, would you? Our noble kin in the city, with their arrogance, leave them all around Alah\'Thalas. I doubt they\'d realize a handful went missing.','Retrieve 7 Arcane Crystals from around Alah\'Thalas and return them to Ka\'zmir Somberwind in the Wretched Ghetto.','I feel — edgy.','<Ka\'zmir\'s hands shake as you offer him the crystals.>$B$BQuite the haul. These will do us well. Thank you.',80240,7,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 0,3240,540, 0,0,0,0,0,0,0,0, 0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61852, 41241);
replace into creature_involvedrelation  (id, quest) values (61852, 41241);

REPLACE INTO gameobject_template VALUES
(2020082, 3, 24107, 'Arcane Crystal Crate', 0, 4, 1, 43, 2020082, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

replace into gameobject_loot_template values
(2020082,80240,-100,0,1,1,0);

-- They Came From the West
delete from quest_template where entry = 41242;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,41242,2,5225,6,5,0,0,'They Came From the West','Our people sought refuge in the South. While the Dwarves sheltered our caravans, the Humans welcomed us into their newly conceived Alliance. Along with it, we attained the allegiance of the so-called Kaldorei. Despite our differences, it seems that our people share some commonalities.$B$BThough not all welcomed our utilization of magic, the addiction it induces, and the casualties it begets — of which you already see in our afflicted — some were willing to assist. Among them is a Druid residing beyond our ghetto, a person named Ordenal Owlmane. He dwells underneath a tree resembling the outlines of two mighty beasts. He speaks of our redemption through the power of the Dream and the Moon. If you truly believe our race holds any chance of survival, pay him a visit.','Speak to Ordenal Owlmane just outside of the Wretched Ghetto.','What is it?','You return from the ghetto, do you not? Are you present here to assist with their course of action?',0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 0,660,110, 0,0,0,0,0,0,0,0, 0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61852, 41242);
replace into creature_involvedrelation  (id, quest) values (61796, 41242);

-- A Thirst of Hope
delete from quest_template where entry = 41243;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41242,41243,2,5225,6,5,0,0,'A Thirst of Hope','Greetings, child of the Sun. I am Ordenal, a druid sworn to the Dream. A terrible fate has befallen the Quel\'dorei, reminding me of the ancient kingdom of the Kaldorei and the Highborne who relied upon theWell of Eternity. When it was lost, my people retreated to the World Tree.$B$BThe Highborne yet survive, though in scant number, and most have fallen to other corruptions to sate their hunger. Such a fate I do not desire for the people here. I would be most grateful for your assistance in testing a theory of mine. I have a few vials of Moonwell water. Would you be so kind as to offer them to the Wretched, and see if, by any chance, it could alleviate their suffering, if only briefly?','Offer Moonwell Water to the residents of the Wretched Ghetto.','I hope my theory will be correct.','So it had no effect, whatsoever?',41197,1,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 41197,1, 0,1860,310, 269,150,0,0,0,0,0,0, 0,0,0, 0,0,0,0,0,0,0,0, 41182,1,41183,1,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61796, 41243);
replace into creature_involvedrelation  (id, quest) values (61796, 41243);

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41197,15794,'Moonwell Water',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'0',0,3);

-- **Additional notes:** Upon accepting the quest the Withered Refugee around the ghetto need to have a gossip bubble: “Offer the vial.” which can trigger one of the two reactions: “I was not thirsty, but thank you for your kindness.” ; “Stay away from me!”
-- Players need to talk to 5 Withered Refugee to complete the quest.

-- A Highborne Among the High Elves
delete from quest_template where entry = 41244;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41243,41244,2,5225,7,5,0,0,'A Highborne Among the High Elves','Fear not, friend. Though my hopes were dashed, I have another task for you.$B$BPreviously, I made mention of the Highborne. To my amazement, it appears that one of them resides in a small tower on the Isle of Eternal Autumn, located northwest of here. It may be wise to seek her counsel, for she may possess knowledge vital to the salvation of all Quel\'dorei.','Find Viz\'neya Firefly on the Isle of Eternal Autumn.','Do tell.','Welcome, child of Dath\'remar, to my current abode.',0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 0,1860,310, 0,0,0,0,0,0,0,0, 0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61796, 41244);
replace into creature_involvedrelation  (id, quest) values (61798, 41244);

-- All Along the Farstride
delete from quest_template where entry = 41245;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,41245,2,5225,7,5,0,0,'All Along the Farstride','Must every land and shore be infested by these ridiculous abominations? There has not been one task, not one task without having to stare upon their filth. These dreaded murlocs are never a good sign. For where there are murlocs, soon the naga will follow.$B$BRid the Farstride of their filth and return to me, for I have better-suited tasks for you. Elune be praised. I can no longer endure the sight of them.','Slay the Farstride Murlocs all along the Farstride.','Spare none.','I was coming to check on you since you were gone for a long while, but all I saw was you dismantling them with ease. Skillfully done.',0,0,0,0,0,0,0,0, 61702,1,61703,1,0,0,0,0, 0,0, 350,4860,810, 269,150,0,0,0,0,0,0, 0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61797, 41245);
replace into creature_involvedrelation  (id, quest) values (61797, 41245);

-- Restless Autumn
delete from quest_template where entry = 41246;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,41246,2,5225,8,5,0,0,'Restless Autumn','There is something that does not allow the spirits of the fallen to rest in these forests. I have my concerns and I truly do not wish for them to be true. Before that, as I am not to leave my station here, I will ask you to bring peace to these restless souls.$B$BBe not afraid, for they can be slain, and if by any chance they resemble someone you know, look away. It is wrong for them to be here and they must return to the cradle of the world beyond.','Slay the restless spirits of the Isle of Eternal Autumn.','Not as easy as it may seem, is it?','Anything interesting you\'d like to mention?',0,0,0,0,0,0,0,0, 61718,10,61719,1,0,0,0,0, 0,0, 0,5520,920, 269,150,0,0,0,0,0,0, 0,0,0, 41184,1,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61797, 41246);
replace into creature_involvedrelation  (id, quest) values (61797, 41246);

-- The House of Theron
delete from quest_template where entry = 41247;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41246,41247,2,5225,8,5,0,0,'The House of Theron','You found a signet with initials on it  amongst the ashes of one of the spirits? How interesting. Theron, Theron, I seem to remember this name from somewhere but I am not quite sure.$B$B<Sira ponders for a brief moment.>$B$BIt was one of the council members, I believe his name was Lor\'themar Theron. Perhaps this holds some emotional value or a family history. Not for us to judge, but you could seek him and return it. You might get a reward.','Bring your report to Lor\'themar Theron.','On with it.','This belonged to my uncle. He was my guardian, my mentor. I knew he had fallen on these lands but never did I think he\'d be without rest. In a way, I think he knew Quel\'Thalas fell, which is why he had returned beyond the grave. $B$BYou\'ve done me a great service, a reward is due.',0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 0,2700,450, 269,150,0,0,0,0,0,0, 0,0,0, 41185,1,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61797, 41247);
replace into creature_involvedrelation  (id, quest) values (61799, 41247);

-- Naga All Along
delete from quest_template where entry = 41248;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41245,41248,2,5225,9,5,0,0,'Naga All Along','While you were away, my suspicions have been validated. There is a sundered ruin nearby where the naga seem to be conducting a ritual. This not only disrupts the peace of these lands but may lead to far graver consequences.$B$BBefore you journey into the ruins to confront their leaders, you must be prepared. The naga are formidable underwater foes, and you\'ll need a means to survive beneath the surface. I carry water-breathing potions, but their efficacy has been compromised due to the peculiar aura of this isle.$B$BI possess some knowledge of alchemy and can rectify the issue, but I require naga scales to do so. Bring them to me, and I shall provide you with these potions. However, exercise caution and avoid delving too deeply into the waters.','Bring 9 Reefscale Naga Scales to Sira Moonwarden.','Any luck?','Very well.$B$B<Sira crushes the scales, adding them to her potions. The mixture sizzles and begins to glow.>$B$BHere you go. Three potions should suffice. Use them judiciously, for I won\'t provide you with more.',41198,9,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 0,5880,980, 269,150,0,0,0,0,0,0, 0,0,0, 5996,3,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61797, 41248);
replace into creature_involvedrelation  (id, quest) values (61797, 41248);

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41198,21835,'Reefscale Naga Scale',12,1,2048,1,-1,-1,1,9,-1,-1,-1,-1,4,'0',0,8);

replace into creature_loot_template values
(61709,41198,-70,0,1,1,0),
(61710,41198,-70,0,1,1,0),
(61711,41198,-70,0,1,1,0);

-- Leaders of the Reefscale
delete from quest_template where entry = 41249;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41248,41249,2,5225,10,5,0,0,'Leaders of the Reefscale','Some of the Naga have the ability to call upon the tides, submerging entire regions. If they\'re performing such a ritual, our fate may be sealed. I implore you to steel your resolve and ready your sea legs, for you are the one destined to thwart their plans.$B$BThe Naga function under a strict hierarchy. If you can eliminate their leaders, their forces will scatter and retreat to the depths of Nazjatar. Ensure the demise of their commanders, but it wouldn\'t hurt to dispatch a few of their sunderers as well. Just for the thrill of it.$B$B<Sira chuckles beneath her helmet.>','Slay the leaders of the Reefscale and 8 Reefscale Sunderers for Sira Moonwarden.','Have they been dealt with?','What could the Naga hope to achieve by attacking the Quel\'dorei? Someone must be aiming to inflict further suffering upon these already broken people.',0,0,0,0,0,0,0,0, 61711,7,61712,1,61713,1,0,0, 0,0, 0,6900,1150, 269,200,0,0,0,0,0,0, 0,0,0, 0,0,0,0,0,0,0,0, 41186,1,41187,1,41188,1,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61797, 41249);
replace into creature_involvedrelation  (id, quest) values (61797, 41249);
update quest_template set type = 1 where entry = 41249;

-- Seek the Dryads
delete from quest_template where entry = 41250;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41244,41250,2,5225,7,5,0,0,'Seek the Dryads','I am quite pleased to be offered aid. Truthfully, I am here to help the Quel\'dorei find ways to quell their torment. While I have been teaching many of them to meditate and try to limit their use of the Arcane, it is not a permanent solution. Some become Withered faster than others.$B$BSince I am not allowed to leave my abode, as my guardian—or jailer—would not let me go, I would ask you to go to the Sleeping Tree right in the middle of the island. It is there that you will find Rine, a Sister of Autumn, one I encountered while meddling about. The last time I was there, we had left one who was slowly turning into a withered to rest inside.','Seek Rine at the Sleeping Tree.','Yes?','Greetings, I am Rine, and you are in the presence of the Sisters of Autumn.',0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 0,900,150, 0,0,0,0,0,0,0,0, 0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61798, 41250);
replace into creature_involvedrelation  (id, quest) values (61845, 41250);

update quest_template set prevquestid = 41250 where entry = 41232;
