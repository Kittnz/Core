-- Proving A Point
delete from quest_template where entry = 41140;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,41140,2,47,46,40,0,0,'Proving A Point','Me good-for-nothing brother Sindri over there thinks he can one up me by makin\' empty promises to mother - just te stick it up te the ole kvinn! He damn well know\'s it is ME who\'s the better smith \'ere. Just ye wait, brother, I\'ll smith yer a weapon ye can stick up yer gryphon roost! Ye will help me with that, stranger.$B$BYe know the cave at Skulk Rock? The mine still has lots o\' mithril in it, but I don\'t need any ole stinkin\' mithril - no, I need etched mithril! Those sludge buggers roamin\' there absorb all ore shards lyin\' around, but their acid ain\'t strong enough to destroy it completely. If ye melt it, it becomes incredibly sturdy!$B$BSindri might tell ye he read in some ole dusty, crusty book that it won\'t work, but do ye think me ancestors were readin\' books before swinging their hammer? Ye can bet your arse on it, they didn\'t!','Gather 15 Etched Mithril Shards for Brok Thunderforge in Aerie Peak for his new creation.','Seein\' his dumb face when mother scoffs at his work gives a feelin\' in my belly like nothin\' else.','Oho! These shards are great. Come on, give \'em to me!$B$B<Brok almost rips the mithril shards out of your hand and throws them into the forge.>$B$BAhaha! This will be grand, mate, I\'m tellin\' ye! Just you wait, Sindri, ye\'ll be bawlin\' your eyes out like ye\'ll always do!',41000,15,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 0,26400,4400,471,200,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61756, 41140);
replace into creature_involvedrelation	(id, quest) values (61756, 41140);
update quest_template set requiredraces = 589		 where entry = 41140;

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41000,20661,'Etched Mithril Shard',12,1,2048,1,-1,-1,1,15,-1,-1,-1,-1,4,'',0,4);

replace into creature_loot_template values
(2655,41000,-70,0,1,1,0),
(2656,41000,-70,0,1,1,0);

-- I've Read It In A Book Once
delete from quest_template where entry = 41141;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41140,41141,2,47,49,40,0,0,'I\'ve Read It In A Book Once','I heard what you were talking about with Brok. Almost impossible with his yapping, you can\'t even hear your own creative thoughts! He might\'ve told you that I\'m an amateur blacksmith, but that couldn\'t be further from the truth! You\'ll find no one better among us Wildhammer dwarves - besides our dear mother, of course.$B$BIt is true, however. I do intend to present Mother with a weapon to prove her once and for all to stop wasting time on that buffoon, who crafts his weapons on emotional whims and disregards tradition, technique and - most of all - class! He\'d be better off in some backwater Bronzebeard village, if you ask me.$B$BSince you helped him, it is only fair that you help me, too. The books I\'ve bought from the recent traveling merchants describe giants of stone created by nature magic. Their bodies are full of energized minerals, ideal for my weapon! The lush forests of northern Feralas are the place they call home. Get me some sizable samples from their bodies, please.','Sindri Thunderforge needs samples of mountain giants for his creation. He specifically mentioned the ones living in Feralas.','Brok is so full of himself. The pout he\'s showing when proven wrong is priceless, I\'m telling you!','That\'s marvelous, just look at all the energy emanating from it! Haha, I can\'t lose with this at my disposal!$B$B<Sindri is gazing into the chunks of stone and quickly forgets about you.>',41001,10,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 0,33600,5600,471,350,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61757, 41141);
replace into creature_involvedrelation	(id, quest) values (61757, 41141);
update quest_template set requiredraces = 589		 where entry = 41141;
update quest_template set type = 1					 where entry = 41141;

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41001,20657,'Glowing Mineral',12,1,2048,1,-1,-1,1,10,-1,-1,-1,-1,4,'',0,3);

replace into creature_loot_template values
(5357 ,41001,-100,0,1,1,0),
(14604,41001,-100,0,1,1,0);

-- Why Not Both?
delete from quest_template where entry = 41142;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41141,41142,2,47,50,40,0,0,'Why Not Both?','Although I love me boys, I wish I could whack \'em over their heads with me hammer when I see \'em like this. If they\'d stop their bickerin\', they\'d be able te achieve so much more.$B$BI\'m not the lass to sugarcoat \'em, maybe their father would\'ve, but that disappointment of a man is long gone. We will make our own weapon te remind both of \'em, what real dwarven smithin\' looks like. They were on the right track, but they sadly lack vision. We will combine both of their ideas.$B$BYour adventurer friends tell the wildest stories about the most mind-bogglin\' creatures. In the white ravines of Maraudon in Desolace lives the giant Landslide, made of pure marbled stone. Rumors say deep within the Hateforge Quarry of the Burning Steppes, the acid pools are so potent, a bein\' manifested itself from them!$B$BTe smith a truly powerful weapon, bring me pieces of both of their bodies.','Obtain the Heart of Landslide from the depths of Maraudon, and the Essence of Corrosis from Hateforge Quarry for Frig Thunderforge at Aerie Peak','Let\'s bring me boys back down to earth.','Incredible materials, both of \'em. Ye did great work. Here, have some coin for your troubles.$B$BBrok and Sindri have expertise, they\'re me sons after all! They have te get past their differences one day and reflect on what the other does and they themselves don\'t.$B$BBrok is te emotional in his work, if he gets a sudden idea, he rushes off te try it out only te see it could\'ve never had worked te begin with. Sindri is too strict on himself - doesn\'t trust his skills - that\'s why he always follows anythin\' he does by the book. And that in turn shortens his horizon.$B$BEnough sentimental chatter, let\'s put them in their place!',41002,1,41003,1,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 0,47600,6800,471,200,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61758, 41142);
replace into creature_involvedrelation	(id, quest) values (61758, 41142);
update quest_template set requiredraces = 589		 where entry = 41142;
update quest_template set type = 81					 where entry = 41142;

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41002,15709,'Heart of Landslide',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0,3),
(41003,20657,'Essence of Corrosis',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0,3);

replace into creature_loot_template values
(12203,41002,-100,0,1,1,0),
(60829,41003,-100,0,1,1,0);

-- Thunderforge Mastery
delete from quest_template where entry = 41143;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41142,41143,2,47,50,40,0,0,'Thunderforge Mastery','Alright, the weapons are ready. Just look at \'em with that smirk on their faces, pah! A smith can be proud, sure, but stayin\' humble is equally important. That\'s a lesson they will now get taught.$B$BJust stay and watch the lecture, it\'s gonna be a blast.','Witness the Thunderforge lecture.','Just say the word.','That didn\'t go as bad as I thought. Guess it\'s finally time for both of \'em to grow up and become real blacksmiths. Don\'t get me wrong, they still got lots of improvin\' te do, but there\'s no need te walk the path of blacksmithing alone. They got me, they got themselves. I love me boys with all me heart, so don\'t ye think I\'ll be lettin\' em do this on their own. Besides, me forge wouldn\'t stand long if I left \'em alone!$B$B<Frig\'s hearty laughter fills the forge.>$B$BSince ye did most of the work, ye can keep the weapon I made, a true Thunderforge masterpiece!',0,0,0,0,0,0,0,0, 60052,1,0,0,0,0,0,0, 0,0, 0,7200,1200,471,200,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'Lesson in humility');

replace into creature_questrelation		(id, quest) values (61758, 41143);
replace into creature_involvedrelation	(id, quest) values (61758, 41143);
update quest_template set requiredraces = 589		 where entry = 41143;

REPLACE INTO creature_template VALUES
(60052, 328, 0, 0, 0, 0, 'quest_41143_dummy_triger', NULL, 0, 1, 1, 0, 0, 0, 0, 0, 35, 0, 1, 1.14286, 1, 20, 5, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, '');

update creature_template set script_name = 'npc_frig_thunderforge' where entry = 61758;

REPLACE INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES
(30141, 'Okay, boys. Listen up. I got yer weapons and to be frank with ye, I am disappointed. Not only did ye use this stranger for yer own benefit, but also misused the art of blacksmithing te bolster yer own little egos.', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30142, 'Brok. Yer axe is as brittle as Sindri\'s confidence. Etched ore alone won\'t make a sturdy metal. Ye have to combine it with different materials or it\'s gonna end up like this. I bet I could break it if I sat my arse on it! Put more thought into yer work.', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30143, 'Yer mace is well made in all the ways theory teaches us. But it lacks any soul. A blacksmith breathes life into their creations. Not ye, though. This thing has as much to say as Brok after his tenth ale. If ye don\'t learn to feel yer craft, ye not gonna craft weapons worthy of the Thunderforge name.', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30144, 'One last word: Start listenin\' te eachother. Yer brothers, fer Khardros\' sake! If ye stop thinking yer better than the other, ye\'d be able to smith a weapon like this lance here and impress me fer once in your life. Now get yer hammers and start swingin\'!', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30145, 'Yes, mother...', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30146, 'I\'m all ears, Frig.', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Rite Of Passage
delete from quest_template where entry = 41144;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,41144,2,47,44,38,0,0,'Rite Of Passage','Ye kno\', we Wildhammers weren\'t always \'ere in these wild lands. We used to live underground, just like our fair brothers, the Bronzebeards. I have never seen our great city of Grim Batol, but me grandfather Bemoth told me stories about it in front of the hearth.$B$BYe can\'t say that the Wildhammers from the past are the same than the current ones, they\'re just differen\'. Sure, some traditions took over, but we also made new customs, more fittin\' fer us gryphon riders.$B$B<Doran looks you up and down and hesitates for a bit.>$B$BInterested in learnin\' about \'em, eh? \'ere, lemme show ye.$B$BYoung Wildhammer are s\'pposed to make their own headdress out of feathers before turning of age - as a rite of passage, if ye will. If ye wanna make ye own, get some feathers from the owlbeasts roaming the Hinterlands. Don\'t forget to get different colours, me friend.','Gather 10 Red Owlbeast Feathers, 10 Black Ownbeast Feathers, and 10 Brown Ownbeast Feathers from the ownbeasts in the Hinterlands for Doran Steelwing in Aerie Peak.','If a fledgling is about to leave the nest, what better way to help it fly than givin\' it some feathers, eh?','<Doran\'s voice sounds a bit shaky, the old dwarf takes the feathers with utmost caution.>$B$BThese are magnificent, thank ye very much fer your interest in our traditions, me friend. Now that we have the feathers, we need a framin\' to put them in.',41004,10,41005,10,41006,10,0,0, 0,0,0,0,0,0,0,0, 0,0, 0,27600,4600,471,100,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (7778 , 41144);
replace into creature_involvedrelation	(id, quest) values (7778 , 41144);
update quest_template set requiredraces = 589		 where entry = 41144;

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41004,32743,'Red Owlbeast Feather',12,1,2048,1,-1,-1,1,10,-1,-1,-1,-1,4,'',0,7),
(41005,19531,'Black Owlbeast Feather',12,1,2048,1,-1,-1,1,10,-1,-1,-1,-1,4,'',0,7),
(41006,19572,'Brown Owlbeast Feather',12,1,2048,1,-1,-1,1,10,-1,-1,-1,-1,4,'',0,7);

replace into creature_loot_template values
-- Red Owlbeast Feather
(2927,41004,-60,0,1,1,0),
(2928,41004,-60,0,1,1,0),
(2929,41004,-60,0,1,1,0),
(7808,41004,-60,0,1,1,0),
-- Black Owlbeast Feather
(2927,41005,-60,0,1,1,0),
(2928,41005,-60,0,1,1,0),
(2929,41005,-60,0,1,1,0),
(7808,41005,-60,0,1,1,0),
-- Brown Owlbeast Feather
(2927,41006,-60,0,1,1,0),
(2928,41006,-60,0,1,1,0),
(2929,41006,-60,0,1,1,0),
(7808,41006,-60,0,1,1,0);

-- A Proper Framing
delete from quest_template where entry = 41145;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41144,41145,2,47,44,38,0,0,'A Proper Framing','Usually the wee lads would hunt for their own leather, but I am not sure if yer knowledgeable in the art of skinnin\'.$B$BSpeak with me good friend Drakk Stonehand just down the stairs, he\'s our master leatherworker, ye won\'t find any better work than from his crafty hands.$B$BTell him Doran sent you, the ole chum still owes me one, he\'ll help an adventurer like ye out anytime.','Speak with Drakk Stonehand in Aerie Peak about the headdress framing.','Beautiful day, isn\'t it?','Aye, welcome to Aerie Peak! Anythin\' I can help ye with?',0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 0,4020,670,471,100,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (7778 , 41145);
replace into creature_involvedrelation	(id, quest) values (11097, 41145);
update quest_template set requiredraces = 589		 where entry = 41145;

-- Every Step Of The Way
delete from quest_template where entry = 41146;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41145,41146,2,47,44,38,0,0,'Every Step Of The Way','Doran sent ye, eh? Well, he is a close friend, that\'s fer sure. And he wants me to help ye with a feathered headdress, like our fledglings do?$B$B<Drakk is silent for a moment.>$B$BIf ye wanna do it the Wildhammer way, ye have to get the leather yerself, wouldn\'t be authentic otherwise, would it? Here\'s the deal - get me fifteen silvermane hides for me stock and I will make you a framin\' from one of the finest leathers I have.$B$BWhat? Doran told ye, I owe him one? Don\'t worry, I\'m doin\' this for Doran, but ye still have to have the entire experience, ye kno\'? We don\'t\' wanna sugarcoat you or anythin\', eh?$B$BHere, take this skinnin\' knife, it isn\'t as hard as many would say, ye just have to carefully sever the skin from the meat and tissue. With all the slashin\' ye adventurers do, I\'m sure ye will get the hang of it in no time. Just try not to cut yerself, chum!$B$B<Drakk cackles and hands you the skinning knife.>','Bring 15 Silvermane Hides back to Drakk Stonehand in Aerie Peak.','How\'s the hunt? Don\'t let ole Doran wait too long!','Not bad, not bad. Fer an amateur, this ain\'t too shabby. Thank ye for the help and thank ye fer doin\' this fer Doran. Ye might not realize how important this is fer \'im.',41007,1,41008,15,0,0,0,0, 0,0,0,0,0,0,0,0, 41007,1, 0,27600,4600,471,100,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (11097, 41146);
replace into creature_involvedrelation	(id, quest) values (11097, 41146);
update quest_template set requiredraces = 589		 where entry = 41146;

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41007,5139,'Drakk\'s Skinning Knife',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0,1),
(41008,3164,'Silvermane Hide',12,1,2048,1,-1,-1,1,15,-1,-1,-1,-1,4,'',0,8);

replace into creature_loot_template values
(2923,41008,-80,0,1,1,0),
(2924,41008,-80,0,1,1,0),
(2925,41008,-80,0,1,1,0),
(2926,41008,-80,0,1,1,0);

-- Clipped Wings
delete from quest_template where entry = 41147;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41146,41147,2,47,44,38,0,0,'Clipped Wings','Here, this framin\' is one of me finer works, ye can bet yer bum on that.$B$BI\'ve known Doran fer almost a decade now, he\'s a good fellow. His heart is in the right place, but ever since his lass passed away, he ain\'t the same anymore. Now he seems distant and lost reminiscin\' of past stories, he surely told you about it. It\'s heartbreakin\' seein\' him like that, I can assure ye.$B$BTake the framin\' with ye, Doran will show ye how to finish the headdress.$B$B<Drakk hands you the framing and sends you off with a deep sigh.>','Take the headdress framing to Doran Steelwing upstairs.','Yer back, did Drakk remember my favor?','<Doran takes the framing from you, slowly and with shaking hands. He again has trouble finding words.>$B$BThank ye, kind friend. We\'re almost done.',41009,1,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 41009,1, 0,2100,350,471,100,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (11097, 41147);
replace into creature_involvedrelation	(id, quest) values (7778 , 41147);
update quest_template set requiredraces = 589		 where entry = 41147;

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41009,25147,'Headdress Framing',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0,3);

-- For Her
delete from quest_template where entry = 41148;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41147,41148,2,47,44,38,0,0,'For Her','Here, take a closer look, us Wildhammer have a certain technique on how to sew the feathers to the headdress. Ye can\'t learn this anywhere else. They\'re passed down from generation to generation...$B$B<You watch Doran sew the feathers to the headdress. He looks more distressed than before, but is very diligent and graceful with both framing and feathers.>$B$BAight, this is how a real Wildhammer headdress is crafted, if yer were a fledgling ye\'d take this to yer first gryphon ridin\' lesson. Wearin\' it while yer bondin\' to yer gryphon is a magical moment in the life of any adolescent Wildhammer. I still remember mine like it was yesterday. Ya, like yesterday...$B$B<Doran pauses for a moment and takes a deep breath.>$B$BI\'m sorry, friend. I told ye this is fer ye, but would ye be kind enough to put the headdress on a grave on Aerie Peak\'s graveyard? It is the tombstone between the rune-marked trees, to yer right as ye enter. $B$BIf ye could do this fer me, this ole dwarf would be forever in yer debt.','Place the Wildhammer Feather Headdress on the tombstone Doran described in Aerie Peak\'s graveyard.','This must be the gravestone Doran told you about.','<You place the headdress on the tombstone. Its inscription says: "Dulin Steelwing - Beloved son of Doran and Sigrun. May your gryphon take you to the greatest heights.">',41010,1,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 41010,1, 0,2100,350,471,100,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		 (id, quest) values (7778   , 41148);
replace into gameobject_involvedrelation (id, quest) values (2020062, 41148);
update quest_template set requiredraces = 589		 	where entry = 41148;

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41010,1123,'Wildhammer Feather Headdress',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0,3);

REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `phase_quest_id`, `script_name`) VALUES
(2020062, 2, 499, 'Aerie Peak Gravestone', 0, 32, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Fly High, Little Dulin
delete from quest_template where entry = 41149;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41148,41149,2,47,44,38,0,0,'Fly High, Little Dulin','<You take a closer look at the gravestone. It is of Doran\'s son Dulin. You decide to return to him and speak with him about it.>','Speak with Doran Steelwing about the headdress and the gravestone.','Aye?','I am sorry fer not speakin\' the whole truth. Ye see, today would\'ve been my son Dulin\'s sixteenth birthday, the age at which Wildhammers become men of the skies.$B$B<Doran\'s voice is trembling and you can hear his throat closing up>$B$BHe sadly died...$B$BMy lass Sigrun never recovered from this day forward, her heart was too broken... She developed a sickness, one that took a heavy toll on her health. We tried everythin\' we could, but, alas... On her deathbed, I promised her to make Dulin his headdress, but I couldn\'t bring myself to do it...$B$B<Doran takes a moment and procures a gryphon carving from his bag>$B$BThank ye so very much, friend. Ye helped this ole dwarf find closure...Take this, Dulin made it fer me, when he was a wee lad...$B$BPlease, if yer ever feel like needing a home, Aerie Peak will always have an open sky fer ye.',0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 0,8100,1350,471,300,0,0,0,0,0,0,0,0,0, 41011,1,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into gameobject_questrelation	(id, quest) values (2020062, 41149);
replace into creature_involvedrelation  (id, quest) values (7778   , 41149);
update quest_template set requiredraces = 589		   where entry = 41149;

REPLACE INTO item_template (`entry`, `class`, `subclass`, `name`, `description`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`, `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`, `required_spell`, `required_honor_rank`, `required_city_rank`, `required_reputation_faction`, `required_reputation_rank`, `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `delay`, `range_mod`, `ammo_type`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `block`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmrate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmrate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmrate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmrate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmrate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `page_text`, `page_language`, `page_material`, `start_quest`, `lock_id`, `material`, `sheath`, `random_property`, `set_id`, `max_durability`, `area_bound`, `map_bound`, `duration`, `bag_family`, `disenchant_id`, `food_type`, `min_money_loot`, `max_money_loot`, `wrapped_gift`, `extra_flags`, `other_team_entry`, `script_name`) VALUES
 ('41011', '4', '0', 'Wooden Gryphon Carving', '\"For paps.\" is etched on the gryphon figure.', '37425', '2', '0', '1', '22000', '5500', '12', '-1', '-1', '44',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '9', '7', '7',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0',
 '0', '0', '1', NULL);
