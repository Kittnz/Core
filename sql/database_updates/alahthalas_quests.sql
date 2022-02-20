-- A Diplomatic Mission --
delete from quest_template where entry = 40371;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (80256,40371,2,2040,60,60,512,0,'A Diplomatic Mission','Greetings, $N. While others see our people as only refugees and survivors of a once-great nation, we must show the rest of the Alliance that the Quel\'dorei are here to stay.\n\nWith Alah\'thalas prospering and our people slowly mobilizing into a formidable force, this is a perfect time for us to officially join the Alliance.\n\nOur magisters have prepared a missives that needs to be delivered directly to the leaders of the Alliance, and I think that the honor of delivering such an important message should be yours.','Seek audience with all four Alliance leaders and represent Alah\'thalas interests.','Have you met them yet?','As expected... The Night Elves continue to hold their ancient grudge. Although this is not an ideal situation, we still got positive replies from the majority of the Alliance members.\n\nNow we can focus on earning their trust and forging new allies. I hope we can count on you again should such need arise, and $N, thank you for all you have done.',83016,1,83017,1,83018,1,83019,1,0,0,0,0,0,0,0,0,83015,4,0,0,269,350,0,0,0,0,0,0,0,0,0,65018,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (80245, 40371);
replace into creature_involvedrelation (id, quest) values (80245, 40371);

-- Appealing to the Alliance: Humans --
delete from quest_template where entry = 40372;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (80256,40372,2,2040,60,60,512,0,'Appealing to the Alliance: Humans','Our magisters have prepared a missive that needs to be delivered directly to the Highlord Bolvar Fordargon, and I think that the honor of delivering such an important message should be yours.\n\nOnce you receive Stormwind\'s response, return to me with the news.','Deliver a Sealed Missive to Highlord Bolvar Fordragon.','What is it, $R?','I have no objections. During the Second war, the High Elves were instrumental in defeating the Orcish Horde. And I cannot deny that the refugees have done a lot for the Alliance.\n\nIt would be remiss of me to reject their aid. Even Lady Prestor has taken a personal interest in this topic and has lobbied to send the military abroad to help. With that said, please give my reply to Alah\'thalas.',83015,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,269,150,0,0,0,0,0,0,0,0,0,83016,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (80245, 40372);
replace into creature_involvedrelation (id, quest) values (1748, 40372);

-- Appealing to the Alliance: Dwarves --
delete from quest_template where entry = 40373;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (80256,40373,2,2040,60,60,512,0,'Appealing to the Alliance: Dwarves','This one needs to be delivered to King Magni Bronzebeard himself, and I do not doubt that having you be the one to do it will only improve the outcome.\n\nOnce you receive Ironforge\'s response, return to me with the news.','Deliver a Sealed Missive to the King Magni Bronzebeard.','What is it, $R?','The Senate will need to discuss this matter in detail. But know that I have been supportive of the Quel\'dorei ascension in the Alliance for a while now. Especially after all the refugees have done to help secure Loch Modan.\n\nNot to mention the aid we received from them during the Second War, without their help and that of the Alliance, who knows how the war would have turned out for us. As I see it, now is our turn to return the favor. Deliver my reply, and I wish you safe travels.',83015,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,269,150,0,0,0,0,0,0,0,0,0,83017,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (80245, 40373);
replace into creature_involvedrelation (id, quest) values (2784, 40373);

-- Appealing to the Alliance: Gnomes --
delete from quest_template where entry = 40374;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (80256,40374,2,2040,60,60,512,0,'Appealing to the Alliance: Gnomes','We haven\'t had the pleasure of working too closely with the Gnomes, but they are an invaluable ally and a valued member of the Alliance. That is why I need you to deliver this message to the High Tinker Mekkatorque.\n\nOnce you complete this task, make sure to report back to me with the news.','Deliver a Sealed Missive to the High Tinker Mekkatorque.','What is it, $R?','Hmm, an expected proposal. Even if we ignore the deeds that the High Elves have done in the past, one cannot deny that having another powerful ally on our side could prove beneficial.\n\nYes, you may let our friends at Alah\'Thalas know that they indeed have the support of our brilliant people.',83015,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,269,150,0,0,0,0,0,0,0,0,0,83019,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (80245, 40374);
replace into creature_involvedrelation (id, quest) values (7937, 40374);

-- Appealing to the Alliance: Night Elves --
delete from quest_template where entry = 40375;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (80256,40375,2,2040,60,60,512,0,'Appealing to the Alliance: Night Elves','Lastly, we prepared a unique message just for High Priestess Tyrande Whisperwind. While we expect a negative response, I hope that Tyrande alone can at least see that only by working together can we craft a better future for both our nations.\n\nGood luck, and please return with her reply as soon as you receive it.','Deliver a Sealed Missive to the High Priestess Tyrande Whisperwind.','What is it, $R?','This again?! Must I remind everyone that the Highborne were responsible for the Legions invasion? And again, they betrayed us by unleashing a magical storm on Ashenvale. Not to mention their stubbornness to reject their use of Arcane magic and even having the audacity to spread its use to the Human nations.\n\nWe will have no part in this, so our answer remains clear. The Night Elves won\'t allow history to repeat, and we refuse to let Quel\'dorei join the Alliance. You got your answer, now go. I do not wish to waste my time on this topic again.',83015,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,269,150,0,0,0,0,0,0,0,0,0,83018,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (80245, 40375);
replace into creature_involvedrelation (id, quest) values (7999, 40375);

update quest_template set prevquestid = 40371 where entry = 40049;

-- Do NOT reuse the entries!!!
delete from quest_template where entry in (40049, 40050, 40058, 40059, 40060, 40069, 40070);

-- The Kaldorei Problem --
delete from quest_template where entry = 40376;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40371,40376,2,2040,60,60,0,0,'The Kaldorei Problem','You have done well. I think it is high time for you to meet our leader. She awaits your arrival atop the Citadel.','Ascend the summit of the Citadel of the Sun and speak to the leader of the Silvermoon Remnant.','So you are the one that everyone has been talking about. It\'s a pleasure to meet you $N. My name is Vereesa Windrunerr, and I wanted to personally thank you for your efforts in bringing our people closer to the Alliance. Although it is unfortunate that Kaldorei still doubt our intentions.','You see, when the Scourge ravaged our lands, we were left beaten and broken. So I gathered those I could find and set out to reclaim this outpost. It was not an easy task, but now we have a place to call home.\n\nI only wish Prince Kael\'thas could have seen all of this. But, now is not the time to mourn. We have to hold our heads high and look forward.',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (80245, 40376);
replace into creature_involvedrelation (id, quest) values (80877, 40376);

-- Breaking the Felstar --
delete from quest_template where entry = 40377;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40376,40377,2,2040,60,60,0,0,'Breaking the Felstar','With the pleasantries out of the way, it is time I let you in on our next move. I knew from the start that gaining the support of the Kaldorei would be hard, given our shared history. But we must show them that we are not the enemy.\n\nThat is why I have sent a detachment of my best rangers to assist them, and they were successful in uncovering that a powerful Satyr is plotting to invade Ashenvale from Felwood. We cannot allow that to happen, which is why I have arranged for you to meet my rangers near the border of Felwood, north of Raynewood\'s Retreat.\n\nHelp them stop this attack and make sure to take proof of your victory to the Ashylah Starcaller in Darnassus. She is an ally to our cause.','Rendezvous with Rangers and defeat the Satyr threat to Ashenvale. Take the Satyr horns to Ashylah Starcaller in Darnassus.','What can I do for you?','Dra\'lox Felstar is dead? It appears that my decision to give Quel\'Dorei a chance proved fruitful. Now it is my turn to return the favor.',60148,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (80877, 40377);
replace into creature_involvedrelation (id, quest) values (80242, 40377);

delete from creature_template where entry in (60425,60426,60427,60429);
REPLACE INTO creature_template VALUES
(60425, 12334, 0, 0, 0, 'Dra\'lox Felstar', '', 0, 60, 60, 8900, 8900, 0, 0, 3489, 90, 0, 1, 1.14286, 0, 30, 30, 150, 1, 1, 354, 456, 0, 268, 1, 1200, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 59.9488, 82.4296, 100, 3, 0, 60425, 0, 0, 0, 0, 0, 0, 0, 0, 7164, 8258, 15572, 0, 0, 0, 474, 624, 'EventAI', 0, 1, 0, 0, 3, 4623, 0, 0, 0, 0, 0, 0, 1, 'npc_dralox_felstar'),
(60426, 2011, 0, 0, 0, 'Felstone Guardian', '', 0, 58, 59, 3875, 3875, 0, 0, 3462, 90, 0, 1, 1.14286, 0, 30, 30, 150, 0, 1, 101, 126, 0, 268, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 71.9664, 98.9538, 100, 3, 0, 6073, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 133, 179, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 4, 0, 0, 1, ''),
(60427, 1185, 0, 0, 0, 'Felstone Guardian', '', 0, 58, 59, 3875, 3875, 0, 0, 3462, 90, 0, 1, 1.14286, 0, 30, 30, 150, 0, 1, 101, 126, 0, 268, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 71.9664, 98.9538, 100, 3, 0, 6073, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 133, 179, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 4, 0, 0, 1, ''),
(60429, 18220, 18221, 18222, 18223, 'High Elf Ranger', '', 0, 60, 60, 3875, 3875, 0, 0, 3462, 231, 0, 1, 1.14286, 0, 50, 30, 0, 0, 1, 101, 126, 0, 268, 2, 2000, 2000, 1, 4096, 0, 0, 0, 0, 0, 0, 71.9664, 98.9538, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 133, 179, 'EventAI', 0, 3, 0, 0, 3, 80216, 0, 0, 0, 0, 525312, 0, 1, '');

-- Thalassian Ascension --
delete from quest_template where entry = 40378;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40377,40378,2,2040,60,60,0,0,'Thalassian Ascension','There it is done. I have prepared a writ for the High Priestess, explaining how instrumental you and the Quel\'Dorei were in slaying our ancient enemy Dra\'lox Felster. His deeds were unforgivable, which is why your actions may prove just enough to sway the High Priestess.','Present the Sealed Writ to Tyrande Whisperwind in Darnassus.','What news do you bring?','A message from the Ashylah? So you and your allies managed to slay Felstar. I must say, I\'m impressed. But one good action is not enough to rectify centuries of betrayal and wickedness.\n\n<She lets out a long sigh>.\n\nYet I cannot deny that your actions and that of your allies saved countless lives, and for that, I am grateful. I\'m willing to withdraw my opposition to the ascension of the Quel\'Dorei in the Alliance but know that we will be watching their every move.',60154,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60154,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (80242, 40378);
replace into creature_involvedrelation (id, quest) values (7999, 40378);

-- Darnassian Endorsement --
delete from quest_template where entry = 40379;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40378,40379,2,2040,60,60,0,0,'Darnassian Endorsement','Here is the endorsement you have been waiting for, take it to Highlord Bolvar Fordragon in Stormwind. I only pray to the goddess that this was not a mistake.','Present the Darnassian Endorsement to Highlord Bolvar Fordragon in Stormwind.','What brings you here?','What wonderful news! With the Darnassian Endorsement, the Alliance has agreed that the Quel\'dorei of Alah\'thalas will officially join the Alliance. Let us discuss further steps, my friend.',60155,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60155,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (7999, 40379);
replace into creature_involvedrelation (id, quest) values (1748, 40379);

-- The Magical Ailment --
delete from quest_template where entry = 40380;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40379,40380,2,2040,60,60,0,0,'The Magical Ailment','With Quel\'Dorei ascension in the Alliance, I do not doubt that it is only a matter of time before we rise to our former glory. But as my people celebrate, I must keep track of the problems that remain.\n\nFor years my people relied on the magic of the great fount called Sunwell. Its destruction made us realize how dependent we became on its magic. Without it, we were vulnerable to succumbing to magic addiction. Miraculously the rangers who were hunting Dra\'lox with you stumbled upon a mystical pool of water whose effects mimic Sunwell, if only a little.\n\nIf this is true, this could be our salvation. I need you to travel to Dranassus and ask Ashylah Starcaller if those waters can be procured for the Quel\'Dorei.','Travel to Darnassus and speak to Ashylah Starcaller.','I take it the Quel\'dorei sent you. What can I do for you?','Have they lost their minds?! A Moonwell is the sacred fount of Elune. It is not something we can just entrust to anyone.',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (80877, 40380);
replace into creature_involvedrelation (id, quest) values (80242, 40380);

-- A Quest for the Moonwell --
delete from quest_template where entry = 40381;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40380,40381,2,2040,60,60,0,0,'A Quest for the Moonwell','A Moonwell is something we sentinels protect with our lives. I sympathize with the Quel\'dorei\'s plight, but I would never betray my people by turning over the sacred waters to them. But, perhaps there is another way.\n\nIf the Quel\'Dorei are truly willing to repent for their past deeds and are able to prove it, then there might be a chance to plead for a small well to be built in Alah\'talas. After all, they agreed once before to do the same for the Stormwind. Travel to the Feathermoon Stronghold in Feralas and look for Vestia Moonspear.\n\nShe alone may be the only priestess sympathetic enough to your cause to listen to you. Give her this missive and pay close attention to what she has to say.','Travel to Feralas and deliver the missive to Vestia Moonspear.','What brings you here?','What you ask is difficult, but not impossible. As you probably know by now, the waters of Moonwells are sacred to us. It contains the pure power of our Goddess Elune but also a fragment of the original Well of Eternity.\n\nHaving such well corrupted is considered a great offense to Elune. Unfortunately, even with our constant watch, this can happen.\n\nA twin set of Moonwells exist outside Elder\'thalas, known to many as Dire Maul. While one well remains pure, the other was defiled by Ogres. Help us cleanse the Moonwell and bring those responsible to justice, and I will present your case to the High Priestess herself.',60156,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60156,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (80242, 40381);
replace into creature_involvedrelation (id, quest) values (7878, 40381);

-- Sacred Waters of Eldre'thalas --
delete from quest_template where entry = 40382;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40381,40382,2,2040,60,60,0,0,'Sacred Waters of Eldre\'thalas','Splendid! I will go ahead and quietly prepare everything that is required for the ritual. There is no doubt that the ogres will react aggressively to our attempt to cleanse the Moonwell.\n\nSo I will wait in the shadows until you arrive. The ritual will require my full attention, so I will need you to protect me while I do it.','Protect Vestia Moonspear while she\'s cleansing waters of corrupted Moonwell outside Dire Maul.','May Elune guide us.','An exhilarating experience. Let\'s make a deal to avoid these kinds of things from now on, okay? Jokes aside, you have my gratitude. And as promised, I will do my best to help you with your case.',0,0,0,0,0,0,0,0,60318,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'The ьщщтwell has been cleaned');

replace into creature_questrelation (id, quest) values (7878, 40382);
replace into creature_involvedrelation (id, quest) values (7878, 40382);

replace into creature_template (entry, name, display_id1, unit_flags, flags_extra) values (10, 'invisible_npc-controller', 328, 33554434, 128);

delete from creature_template where entry in (60431,60666);
REPLACE INTO creature_template VALUES
(60666, 6986, 0, 0, 0, 'Vestia Moonspear', NULL, 61001, 55, 55, 2718, 2718, 2117, 2117, 2654, 80, 3, 1, 1.14286, 0, 18, 5, 0, 0, 1, 96, 125, 0, 248, 1, 2000, 2000, 2, 33554432, 0, 0, 0, 0, 0, 0, 70.664, 97.163, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 524298, 0, 1, ''),
(60431, 11561, 0, 0, 0, 'Tu\'whak', '', 0, 58, 59, 3875, 3875, 0, 0, 3462, 45, 0, 1, 1.14286, 0, 30, 30, 100, 0, 1, 101, 126, 0, 268, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 71.9664, 98.9538, 100, 7, 0, 5241, 5241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 52410, 0, 133, 179, 'EventAI', 0, 1, 0, 0, 3, 5241, 0, 0, 0, 0, 0, 0, 1, '');

-- Vestia's Missive --
delete from quest_template where entry = 40383;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40382,40383,2,2040,60,60,0,0,'Vestia\'s Missive','Take this. I have convinced a few of my fellow priestesses to vouch for you and your Quel\'Dorei friends, but know that creating a new Moonwell and immediately giving it up won\'t be easy, even with our assurances. Let\'s hope that the High Priestess sees this request as a chance to mend old wounds.','Deliver Vestia\'s Missive to Tyrande Whisperwind in Darnassus.','Yes?','See how quickly they grasp at the chance to return to their old ways? Was having them accepted in the Alliance not enough?\n\n<Tyrande opens up and reads the missive>.\n\nMy reaction may have been brash, but you must understand it is not easy to forget wrongdoings done to us throughout the centuries. Yet your actions prove that there is a possibility of us working together with Quel\'Dorei. I need time to think this over.',60519,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60519,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (7878, 40383);
replace into creature_involvedrelation (id, quest) values (7999, 40383);

REPLACE INTO item_template VALUES (60519, 12, 0, 'Vestia\'s Missive', '', 3022, 1, 2048, 1, 0, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);