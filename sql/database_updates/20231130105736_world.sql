-- The Supercutter 1500
delete from quest_template where entry = 41161;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,41161,2,5536,6,3,0,0,'The Supercutter 1500','When you came here all the way from the Black Ash Coalpits, then you\'ve probably seen the big, hulking machine. Gazzik considers it his masterpiece - the Supercutter 1500! With it we harvested this island faster than any shredder could. Truly marvelous, I have to admit. Too bad some idiot decided it would be a great idea to drive the thing into the mud. Really, groundbreaking stuff, I wish I could\'ve caught that guy and strangled him for messing with our efficiancy that much.$B$B<Fanzo sighs and rubs his temples.>$B$BIt\'s not been that long, but I don\'t remember who controlled it that day. Furthermore, we weren\'t able to assess the damage yet because of this overblown work schedule. I want you to go to the crash site and look at how badly damaged it is. While you\'re there, recover the Supercutter\'s remote, so we can check it for any malfunctions.','Retrieve the Supercutter 1500\'s remote from the Supercutter 1500 north of the Black Ash Coalpits for Fanzo Edgeline at Gazzik\'s Workshop.','Seriously, this thing moves really, REALLY slowly. How can one crash it into mud?!','What? Your coworkers attacked you? Have they gone mad? You need to report this to Rustgate immediately!$B$BNevertheless, I thank you for recovering the remote. I\'ll have Gazzik take a look at its insides. Though in the end it\'s probably going to be me who\'s gonna do that.$B$B<Fanzo lets out another deep sigh.>',41030,1,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 500,2820,470,1001,200,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation	(id, quest) 	values (61749, 41161);
replace into creature_involvedrelation  (id, quest) values (61749, 41161);
update quest_template set requiredraces = 434		 where entry = 41161;

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41030,8622,'Supercutter 1500 Remote',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0,3);

REPLACE INTO gameobject_template VALUES
(2020065, 3, 5743, 'Crudely Broken Locker', 0, 4, 1, 43, 2020065, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

replace into gameobject_loot_template values
(2020065,41030,-100,0,1,1,0);

-- Clearing Nuisances
delete from quest_template where entry = 41162;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,41162,2,5536,6,3,0,0,'Clearing Nuisances','You\'d think as an assistant I\'d be doing only half the work of the guy I\'m assisting, but no! While everyone is drowning in work - including myself! - Gazzik is tinkering day in day out without a care in the world. I don\'t know what kind of backhanded deal he has struck with Rustgate, but it seems to be paying off!$B$BOn top of that, our supply routes are constantly interrupted by either slobbering gnolls or the local wildlife, delaying any work progress even further.$B$BYou seem capable enough, I guess. Go back over the bridge and get rid of anything that isn\'t a goblin!','Kill Ashfeather Scavengers and Blackvenom Scorpids for Fanzo Edgeline at Hazzik\'s Workshop.','Are you done yet? The sooner you are, the quicker I can get back to worrying about other problems.','Thank you, all this work gets to my head. It is good to finally have some reliable work forces.',0,0,0,0,0,0,0,0, 61686,8,61662,8,0,0,0,0, 0,0, 500,3780,630,1001,200,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 1180,2,955,2,0,0,0,0, 0,0,'');

replace into creature_questrelation	(id, quest) 	values (61749, 41162);
replace into creature_involvedrelation  (id, quest) values (61749, 41162);
update quest_template set requiredraces = 434		 where entry = 41162;

-- Battletron Calamity
delete from quest_template where entry = 41163;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,41163,2,5536,6,3,0,0,'Battletron Calamity','I was comissioned to make several combat robots for Taxxlo in order to fight the Venture Co. which began appearing on the island. Little did I know the very materials I was crafting these battletrons were themselves made by those we are fighting. Suffice to say that each and every one of our new combatants have fallen into a state of annoyance.$B$BTaxxlo tried to save some gold and put the entire island at risk, we were lucky they didn\'t outright turn on us. Regardless, we have to clean up this mess, and the aimless robots could still cause issues.$B$BYou can find most of them wandering just south of Rustgate Ridge to the west of here, destroy them so that they don\'t fall into the hands of our enemy.','Destroy 10 Faulty Battletron 1000\'s for Gazzik at Gazzik\'s Worshop on Blackstone Island.','So, you break those faulty bots?','Good work kid, it\'s nice having someone reliable for a change, with Taxxlo you don\'t know if you\'re going to actually get what you\'re asking for.',0,0,0,0,0,0,0,0, 61688,10,0,0,0,0,0,0, 0,0, 1000,2460,410,1001,200,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation	(id, quest) 	values (61748, 41163);
replace into creature_involvedrelation  (id, quest) values (61748, 41163);
update quest_template set requiredraces = 434		 where entry = 41163;

-- Salvaging Convoys
delete from quest_template where entry = 41164;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,41164,2,5536,7,3,0,0,'Salvaging Convoys','Are you the promising worker that\'s been cleaning up all the messes down in the coalpits? You must have something to your name, my brother usually kicks out anyone from the pits sneaking their way into his tower.$B$BI could use your abilities, frankly. In the last weeks we suffered more and more ambushes by the renegade gnolls. Their small dog brains seek violence and chaos, something I cannot understand as a logistics guy. They raided our supply convoys and stole mostly food and weapons, but left most of the tools lying around. Too advanced for them, I\'m sure.$B$BWe need those tools back as soon as possible. Vultures and hyenas have been roaming the wrecked carts, feasting on whoever couldn\'t make it back here. You can find them scattered all over the island, you can\'t miss \'em.','Retrieve Rustgate Tools from the broken convoys all over Blackstone Island. Bring them to Supplymaster Maxlo at Rustgate Ridge.','We\'re not getting new supplies from Sparkwater as often as we\'d like, so we have to salvage as much as we can.','Hm, the weather didn\'t do them any good. But nothing the workers can\'t repair. Good job out there. Keep this up and soon we may have normalcy back on this island again.',41031,13,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 500,2520,420,1001,200,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation	(id, quest) 	values (61730, 41164);
replace into creature_involvedrelation  (id, quest) values (61730, 41164);
update quest_template set requiredraces = 434		 where entry = 41164;

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41031,73435,'Rustgate Tool',12,1,2048,1,-1,-1,1,13,-1,-1,-1,-1,4,'',0,1);

REPLACE INTO gameobject_template VALUES
(2020066, 3, 1210, 'Bucket of Tools', 0, 4, 1, 43, 2020066, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

replace into gameobject_loot_template values
(2020066,41031,-100,0,1,1,0);

-- Dry As A Desert
delete from quest_template where entry = 41165;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,41165,2,5536,8,3,0,0,'Dry As A Desert','What do you think the most important thing on this island is? Water, ofcourse! Taxxlo was a good answer, buddy, but even he has to admit that we cannot keep the workers going if they\'re shriveled up like a deep-fried plantain.$B$BTo the north, past the mines, you will find Blackstone\'s waterhole. Pumpmaster Galvax was ordered to send a shipment of water here to Rustgate Ridge, but this has taken longer than I\'d like it to have. Ask him what is taking so long!','Pumpmaster Galvax at The Water Hole can tell you more about the missing water delivery.','You\'re far from Rustgate, pal.','The water shipment? Yes, I know about that one, if you look up the cliff behind you, you can see where it ended up.',0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 0,660,110,1001,50,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation	(id, quest) 	values (61730, 41165);
replace into creature_involvedrelation  (id, quest) values (61746, 41165);
update quest_template set requiredraces = 434		 where entry = 41165;

-- Redistribution
delete from quest_template where entry = 41166;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,41166,2,5536,7,3,0,0,'Redistribution','By any chance, did you help Copperlight down in the coalpits with his machine mayhem? He\'s been requesting some parts for additional modifications on his creations.$B$BWhat he wants is sadly not here in my storage, but Gazzik in his workshop is due to send a new shipment up to Rustgate Ridge. He can be a bit on the slacking side of things, but there is no one else like him on this island, so Taxxlo turns a blind eye to his shenanigans.$B$BHis workshop is to the southeast, across the makeshift bridge. Gazzik can tell you where the shipment is; once you have it, bring it to me.','Bring Supplymaster Maxlo at Rustgate Ridge the Crate of Rebalanced Frameworks from Gazzik\'s Workshop.','The longer you take, the more work piles on for you.','Ah, there they are. I will have them be delivered to Copperlight once another worker shows his mug around here. Thank you, $n, I will mention this on your monthly resume.',41032,1,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 300,1680,280,1001,100,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation	(id, quest) 	values (61730, 41166);
replace into creature_involvedrelation  (id, quest) values (61730, 41166);
update quest_template set requiredraces = 434		 where entry = 41166;

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41032,4629,'Crate of Rebalanced Frameworks',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0,3);

REPLACE INTO gameobject_template VALUES
(2020067, 3, 31, 'Overdue Shipment', 0, 4, 1, 43, 2020067, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

replace into gameobject_loot_template values
(2020067,41032,-100,0,1,1,0);

update creature_template set script_name = 'npc_gazzik' where entry = 61748;

REPLACE INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES
(30147, 'I am here for the overdue shipment of frameworks.', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30148, 'Oh, those... Yes, they\'re in the warehouse. It\'s the building opposite of this one. We had to deal with... a few shortages in the workforce, so we weren\'t able to send \'em over to Rustgate.$B$BJust tell that to Maxlo and he\'s gonna understand, alright?$B$B<The goblin winks at you deviously.>', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- The Murloc Threat
delete from quest_template where entry = 41167;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,41167,2,5536,6,3,0,0,'The Murloc Threat','Okay, listen up, buddy. You hate murlocs, right? Perfect. Everyone hates murlocs, those who don\'t end up as their meal real fast. And I for one don\'t want to be held responsible if any of our workers become some murloc\'s midnight snack.$B$BI want you to go down to the coast and kill as many fishy fiends as you can. I\'d rather be busy beating slobs back into working shape than to deal with those slimy creatures. And don\'t think of just pretending to kill them or I\'ll drag you to the Supreme Overseer myself. Prove to me you\'re reliable by bringing me their scales.','Hunt murlocs on the shores of Blackstone Island and present twenty of their scales to Bruiser Rakklan.','<Rakklan is threatening you by impatiently placing his bludgeon unto his hand again and again.>','Not half bad, runt. This gives me some more freetime to whip your slacking coworkers back into the pits. Much appreciated.',41033,20,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 600,2820,470,1001,200,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 41034,1,41035,1,0,0,0,0, 0,0,'');

replace into creature_questrelation	(id, quest) 	values (61752, 41167);
replace into creature_involvedrelation  (id, quest) values (61752, 41167);
update quest_template set requiredraces = 434		 where entry = 41167;


replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41033,6628,'Muckfin Scale',12,1,2048,1,-1,-1,1,20,-1,-1,-1,-1,4,'',0,8);

replace into creature_loot_template values
(61683,41033,-70,0,1,1,0),
(61682,41033,-70,0,1,1,0),
(61685,41033,-70,0,1,1,0);

REPLACE INTO item_template (`entry`, `class`, `subclass`, `name`, `description`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`, `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`, `required_spell`, `required_honor_rank`, `required_city_rank`, `required_reputation_faction`, `required_reputation_rank`, `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `delay`, `range_mod`, `ammo_type`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `block`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmrate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmrate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmrate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmrate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmrate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `page_text`, `page_language`, `page_material`, `start_quest`, `lock_id`, `material`, `sheath`, `random_property`, `set_id`, `max_durability`, `area_bound`, `map_bound`, `duration`, `bag_family`, `disenchant_id`, `food_type`, `min_money_loot`, `max_money_loot`, `wrapped_gift`, `extra_flags`, `other_team_entry`, `script_name`) VALUES
 ('41034', '4', '0', 'Rakklan\'s Targe', '', '26060', '1', '0', '1', '192', '48', '14', '-1', '-1', '8',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '112', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '0', '4', '0', '0', '40', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '1', NULL);

REPLACE INTO item_template (`entry`, `class`, `subclass`, `name`, `description`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`, `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`, `required_spell`, `required_honor_rank`, `required_city_rank`, `required_reputation_faction`, `required_reputation_rank`, `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `delay`, `range_mod`, `ammo_type`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `block`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmrate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmrate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmrate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmrate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmrate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `page_text`, `page_language`, `page_material`, `start_quest`, `lock_id`, `material`, `sheath`, `random_property`, `set_id`, `max_durability`, `area_bound`, `map_bound`, `duration`, `bag_family`, `disenchant_id`, `food_type`, `min_money_loot`, `max_money_loot`, `wrapped_gift`, `extra_flags`, `other_team_entry`, `script_name`) VALUES
 ('41035', '4', '1', 'Dirty Trousers', '', '14374', '1', '0', '1', '116', '29', '7', '-1', '-1', '8',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '11', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '30', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '1', NULL);
