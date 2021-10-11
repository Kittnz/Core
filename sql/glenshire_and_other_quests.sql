-- Reserved.
-- quest_template			40000-40200
-- creature_template		60300-60500
-- gameobject_template		2010700-2010900
-- item_template			60000-60200

-- In Need of Assistance --
delete from quest_template where entry = 40080;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40080,2,130,15,14,0,0,'In Need of Assistance','Ah, you are just who I need. A few days ago, Duchess Grelda of the Tirisfal Uplands asked for assistance. I already sent a detachment of my warriors, but another letter came today asking for further help.\n\nOur forces in Silverpine are already stretched thin as it is, which is why I need someone with your set of skills to head there and see what you can do to assist them.\n\nThe path to Tirisfal Uplands is just north of The Dead Field, the Duchess herself is hold up there at her manor along the road. You can\'t miss it.','Talk to the Duchess Grelda at the manor along the road to Western Tirisfal.','And who might you be?','So Hadrec refuses to send more troops, but, instead he sends you? The audacity.',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,125,68,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (1952, 40080);
replace into creature_involvedrelation (id, quest) values (91711, 40080);

-- Dire Situation --
delete from quest_template where entry = 40081;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40080,40081,2,130,15,14,0,0,'Dire Situation','Well, since you are already here, I might as well put your skills to the test. You see, my dear sister claimed the title of the rightful heiress of the Tirisfal Uplands when I became "this." As if she was not enough, now we have to deal with these wretched Worgen who invaded from Silverpine.\n\nSo what you will do is head further north, past the gate to my realm and seek Apothecary Volgrin. He went there to try and deal with the Worgen, but, as you can guess, he was not very successful as we are still stranded here.','Follow the path farther north and talk to the Apothecary Volgrin.','Please don\'t tell me that you need something from me too.','Ah, so you are here to help me. I guess that pompous Grelda finally decided to listen to me and send some actual help to deal with Worgen.',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,125,68,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91711, 40081);
replace into creature_involvedrelation (id, quest) values (91713, 40081);

-- Crumblepoint Tower --
delete from quest_template where entry = 40082;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40081,40082,2,85,15,14,0,0,'Crumblepoint Tower','I have no idea how they managed to slip past our forces in the Silverpine, but these Worgen came in great numbers. If we are to have any chance of securing Tirisfal Uplands for the Forsaken, we first need to get rid of them, which is why we have to reclaim the Crumblepoint Tower above us. It is a strategically important point as it will allow us to monitor further actions from both north and south.\n\n<Volgrin sizes you up from the top down>.\n\nYou didn\'t run, well consider me impressed. Good, then head above and kill those flea-ridden wretches.','Head to the Crumblepoint Tower and kill 6 Tirisclaw Ravagers and 4 Tirislcaw Shadowcasters.','Back so soon?','You actually did it? Well... I was honestly not expecting you to return. I wish you arrived a few days earlier we might have avoided this whole situation, to begin with.',0,0,0,0,0,0,0,0,91740,6,91741,4,0,0,0,0,0,0,700,980,68,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91713, 40082);
replace into creature_involvedrelation (id, quest) values (91713, 40082);

-- Head of The Pack --
delete from quest_template where entry = 40083;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40082,40083,2,85,15,14,0,0,'Head of The Pack','With their forces at the tower weakened, it is time for us to kill their leader. Yes, when I say us, I mean you. Their leader invaded the mine recently, and he has taken his bigger worgen down there with him. The Gracestone mine is a top priority. Without its resources, Glenshire doesn\'t stand a chance against the Humans, not to mention that the mines provide a perfect ambush point for worgens to attack any travelers between Silverpine and the Uplands.\n\nGo down there and bring me the head of their leader. Oh, and feel free to kill as many of his followers as you can.','Apothecary Volgrin has asked you to bring him the head of the Pack Leader Sharn and kill 5 Tirisclaw Ambushers and 4 Tirisclaw Scavengers.','How goes the attack?','Oh, I can smell the blood coming from your bag. Is that the head of the mongrel? Good, very good. If you keep going likes this, you might even earn the Duchess\'s favor.',60172,1,0,0,0,0,0,0,91760,5,91739,4,0,0,0,0,0,0,1000,1250,68,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91713, 40083);
replace into creature_involvedrelation (id, quest) values (91713, 40083);

delete from item_template where entry = 60172;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values (60172,36431,'Sharn\'s Head',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'Severed Head of the Pack Leader Sharn',0);

delete from creature_loot_template where entry = 1923 and item = 60172;
replace into creature_loot_template (entry, item, chanceorquestchance, mincountorref, maxcount, condition_id, patch_max) values (1923,60172,-100,1,1,0,10);

-- Worthy Ally --
delete from quest_template where entry = 40083;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40083,40084,2,85,16,15,0,0,'Worthy Ally','With the bulk of their forces gone, me and my Deathguards will be more than enough to get rid of any strugglers. As for you, my friend, I think you should have the honor of relaying the news of what transpired here to Duchess. No doubt that she will have more for you to do after learning of your capabilities.\n\nI rarely say this, but it has been a pleasure working with you.','Return to the Duchess Grelda and inform her about the events at Tower and the Mines.','What now?','Well, well. When I first sent you to Volgrin, I did it just so you would stop pestering me. However, it appears that Hadrec provided a worthy ally.',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,290,68,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91713, 40084);
replace into creature_involvedrelation (id, quest) values (91711, 40084);

-- Into The Uplands --
delete from quest_template where entry = 40085;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40084,40085,2,130,16,15,0,0,'Into The Uplands','You certainly know how to impress a lady. With those pests gone, we can focus on the more pressing matters. I need you to bring supplies and this letter to my husband, Nargelas, at Glenshire. He is currently leading a campaign to reclaim the Tirisfal Uplands to its rightful ruler and the Forsaken, of course.','Find Duke Nargelas at Glenshire and deliver supplies and the letter to him.','What\'s this, a letter for me?','So you single-handedly reclaimed both the tower and the mine? While I believe Grelda, you can imagine that your situation raises quite a number of questions.',60173,1,60174,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,290,68,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91711, 40085);
replace into creature_involvedrelation (id, quest) values (91712, 40085);

delete from item_template where entry = 60173;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values (60173,60860,'Forsaken Supplies',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'A heavy box of supplies from Undercity',0);

delete from item_template where entry = 60174;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values (60174,5567,'Grelda\'s Letter',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'A sealed letter addressed to Nargelas',0);

update creature_template set script_name = 'npc_grelda' where entry = 91711;

-- Outnumbered --
delete from quest_template where entry = 40086;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40085,40086,2,85,16,15,0,0,'Outnumbered','Here is deal, while the supplies you brought us certainly help. It does not change the fact that the living currently outnumbers us 7 to 1. The good thing is that they are not aware of that yet, and I would appreciate it if they are kept in the dark for a bit longer.\n\nAnd that is where you come in. I got information that scouts of the Lordaeron Remnants are already on their way here, and you are going to make sure that they never return to their masters.','Duke Nargelas wants you to kill 8 Remnants Scouts In The Whispering Forest north of Glenshire.','Is it done?','Well done. With those scouts gone, they will think twice before sending an attack force on Glenshire.',0,0,0,0,0,0,0,0,91773,8,0,0,0,0,0,0,0,0,800,1150,68,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91712, 40086);
replace into creature_involvedrelation (id, quest) values (91712, 40086);

-- In The Dark --
delete from quest_template where entry = 40087;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40086,40087,2,85,16,15,0,0,'In The Dark','With their scouts gone, we can finally go on the offensive.  But before we can do anything grand, like cutting their supply lines, we need to reduce their ability to monitor our movement.\n\nJust north of The Whispering Woods, there is a tower called Shatteridge. Remnant\'s Sentries have made that tower their center of operation and are there to warn their main base of any potential danger. Their numbers at the tower are great, which is precisely why they won\'t expect a single yet powerful foe to attack them directly. So are you up to the task?','Duke Nargelas wants you to kill 10 Remnants Sentry at the Shateridge Tower.','Tell me, how goes the attack?','Ah, my greatest asset returns, successful no less. With Sentries gone, we will have a much easier time dealing with the miserable Humans.',0,0,0,0,0,0,0,0,91772,10,0,0,0,0,0,0,0,0,900,1150,68,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91712, 40087);
replace into creature_involvedrelation (id, quest) values (91712, 40087);

-- Cutting Them Off --
delete from quest_template where entry = 40088;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40087,40088,2,85,17,15,0,0,'Cutting Them Off','While you were gone, I sent a few of our scouts to investigate supply lines for the Humans main base. It appears that most of their supplies come from the eastern road. This indicates that they are most likely getting their food from the Garrick Stead.\n\nI need you to go there and kill their Farmers and those guarding them. Also, we found out that the man in charge of supplies is called Bill. While killing his man will suffice, I want Bill\'s head so that I can send a message to my dear sister in law.','I have been tasked by Duke to kill 10 Remnants Farmers, 6 Remnants Militia and bring Head of the Foreman Bill.','Back already?','Yeees... a fine trophy. With their supplies cut off, It is just a matter of time before they start to panic.',60175,1,0,0,0,0,0,0,91980,10,91981,7,0,0,0,0,0,0,1200,1500,68,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91712, 40088);
replace into creature_involvedrelation (id, quest) values (91712, 40088);

delete from item_template where entry = 60175;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values (60175,2945,'Foreman Bill\'s Head',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'A severed human head',0);

delete from creature_loot_template where entry = 2503 and item = 60175;
replace into creature_loot_template (entry, item, chanceorquestchance, mincountorref, maxcount, condition_id, patch_max) values (2503,60175,-100,1,1,0,10);

-- Uncanny Allies --
delete from quest_template where entry = 40096;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40088,40096,2,85,18,15,0,0,'Uncanny Allies','There you are! Hitting their supply lines might have destabilized Humans for a time, but if we don\'t capitalize on this victory, it\'s just a matter of time before they retaliate.\n\nAlone, we cannot win against them, but what we can do is force the local Gnolls into the war with them. However, as you can imagine, they are not so fond of us either.\n\nThat\'s why we need to get rid of their leaders first before trying to deceive those small-minded creatures. You can find those mongrels northwest of Glenshire. Head there and kill their Shaman and those who are protecting him.','Duke Nargelas wants me to kill Gnoll\'s Shaman and his protectors.','Is the Shaman dead?','A job well done indeed. Without their Shaman, the Gnolls will have no one to guide them in their spiritual ways. Now we can proceed to the next part of the plan.',0,0,0,0,0,0,0,0,91735,10,91738,8,91717,1,0,0,0,0,1500,1800,68,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91712, 40096);
replace into creature_involvedrelation (id, quest) values (91712, 40096);

-- Divide and Conquer --
delete from quest_template where entry = 40097;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext4) values (40096,40097,2,85,19,15,0,0,'Divide and Conquer','With their Shaman dead, it is time for the final part of the plan. You are to return to Gnolls camp and kill their Chief Rnarl as well as those around him. Make it look like there was a large-scale battle, and after you are done plant this in their base.\n\n<The Duke hands you a Lordaeron Banner>.\n\nHopefully, this will be enough to convince those still alive, that the assault on their camp was orchestrated by the Humans and not us.','Duke Nargelas wants me to kill Chief Rnarl and his guards and pin the assault on the Humans by planting their Banner in the Gnoll camp.','Yes?','Hahaha... Good to see you back here in one piece! My scouts tell me that the Gnolls launched an assault on the Human base. Soon we will be able to retake this land to its rightful rulers.',0,0,0,0,0,0,0,0,91736,6,91737,6,91716,1,60323,1,60189,1,1700,1900,68,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'The Banner of Lordaeron is established');

replace into creature_questrelation (id, quest) values (91712, 40097);
replace into creature_involvedrelation (id, quest) values (91712, 40097);

delete from creature_template where entry = 60323;
replace into creature_template (entry, name, display_id1) values (60323, 'quest_40097_dummy_triger', 328);

delete from item_template where entry = 60189;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values (60189,932,'Lordaeron Banner',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'A Banner used by the Remnants of Lordaeron',0);

delete from gameobject_template where entry = 2010824;
replace into gameobject_template (entry, type, displayid, size, name, flags, script_name) values (2010824, 2, 49, 0.8, 'Pile of Dirt', 32, 'go_pile_of_dirt');

-- Fresh Perspective --
delete from quest_template where entry = 40098;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext4) values (40097,40098,2,85,19,15,0,0,'Fresh Perspective','<As you approach the Duke, you notice that he is reading a missive marked with the Forsaken sigil>.\n\nHow is this possible?! I sent my man to scout the Humans base, and instead of telling me how the damnable Humans are suffering, they informed me that they held a celebration. How on earth are they able to celebrate without their supplies?!\n\n<The Duke suddenly calms himself and turns towards Father Birghtcopf with a troubled look>.\n\nI wished to avoid having to use her, but I guess I have no choice. Listen, northwest of here is a port called Steepcliff. I need you to take this letter and look for the orc named Norga and try your best to get on her good side she is... Ahm can be, a valuable ally.','The Duke wants me to go to Steepcliff Port and hand the letter to the orc named Norga.','What business do you have with me?','Hah! He does not listen to my warnings and now sends you to fix his mistakes. How amusing.',60190,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60190,1,0,340,68,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91712, 40098);
replace into creature_involvedrelation (id, quest) values (91720, 40098);

delete from item_template where entry = 60190;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values (60190,3018,'Letter for a Friend',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'A letter addressed to Norga branded with the Royal Seal of Tirisfal Uplands',0);

-- The Price --
delete from quest_template where entry = 40099;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext4) values (40098,40099,2,85,19,15,0,0,'The Price','This certainly is an interesting turn of events. I can imagine that Duke didn\'t inform you of how our relationship works. So let me tell you how things work around here. I don\'t care if the Queen of the Forsaken sent you herself. The information which I offer does not come for free.\n\nWith that out the way, let\'s make a deal. Near the northern road to Tirisfal Glades lived a man called Lafford. Long story short, he owns me quite a bit, but apparently, he is gone missing when some ruffians burned his house down.\n\nWhile he maybe is gone, I learned that he has a small buried chest behind his house, so here is the deal, you get me that chest, and in return, I will share with you the information on how the Humans are able to resupply their base while being cut off from the rest of the Alliance.','Norga wants me to find Laffords house and locate his buried treasure.','How goes the treasure hunt?','Would you look at that. Who knew that the drunken stories could prove to be so reliable.',60191,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,68,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91720, 40099);
replace into creature_involvedrelation (id, quest) values (91720, 40099);

delete from item_template where entry = 60191;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values (60191,36510,'Laffords Treasure',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'A Richly Decorated Chest',0);

delete from gameobject_template where entry = 2010825;
replace into gameobject_template values
(2010825, 0, 3, 49, 'Pile of Dirt', 0, 4, 1, 43, 2010825, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

delete from gameobject_loot_template where entry = 2010825;
replace into gameobject_loot_template (entry, item, chanceorquestchance, mincountorref, maxcount, condition_id, patch_max) values (2010825,60191,-100,1,1,0,10);

-- Indebted --
delete from quest_template where entry = 40127;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext4) values (40099,40127,2,85,19,15,0,0,'Indebted','Well you certainly know how to get a job done. I promised that I would get you the information that you are looking for so here it is. In the Hills directly east of Garricks Stead, there is a place called Rogue Heights, it used to be a lawless area held by the unorganized band of thieves and murderers.\n\nHowever since not so long ago they appeared to have reformed their organization and have become a formidable force. Not only that but it appears that they have allied themselves with the Remnants of Lordaeron. My sources spoke of a man named Salorn, a former Kirin Tor mage who along with his rogue brethren appears to have taken over the Rogue Heights.\n\nAnd there you go, oh and be kind to remind the Duke that he still owes quite a bit.','I need to return to Duke Nargelas and inform him about the enemy in The Rogue Heights.','So? Tell me, what are the news?','Mages in The Rogue Heights? No wonder I heard nothing from Storn if he lost the leadership of his band of misfits. Anyways, good job on getting this information out of Norga. I envy that you won\'t have to deal with her after all of this is done.',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,500,68,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91720, 40127);
replace into creature_involvedrelation (id, quest) values (91712, 40127);

-- An Ancient Aquisition --
delete from quest_template where entry = 40128;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext4) values (0,40128,2,17,18,18,0,0,'An Ancient Aquisition','Greetings, Torble Sparksprocket here, Junior archaeologist of the Explorer\'s League here! A few weeks ago the dig found this strange contraption. It appears to be the torso of an automaton, it is clearly of Titan make but we haven\'t seen anything like it before, that\'s why I was called here.\n\nI quickly realized that it is a modular automaton of some kind. The other parts were found some days later but someone tripped some defense and the dig is now full of Golems. Can you head in there and find the other pieces? You need two arms, two legs, and a head. Look through crates and such.','Gather two Automaton Legs, two Automaton arms, and an Automaton Head from the Bael\'modan Digsite.','Did you find it?','Well done. This contraption will take some time to repair. Do visit sometime in the future and I may have news for you!',60192,2,60193,2,60194,1,0,0,0,0,0,0,0,0,0,0,0,0,3740,1075,47,250,54,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (60441, 40128);
replace into creature_involvedrelation (id, quest) values (60441, 40128);

delete from creature_template where entry = 60441 and 60442;
replace into creature_template values
(60441, 0, 6632, 0, 0, 0, 'Torble Sparksprocket', 'Junior Archaeologist', 0, 25, 25, 712, 712, 0, 0, 1009, 55, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 31, 40, 0, 106, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 38.72, 53.24, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 'npc_torble_and_kex'),
(60442, 0, 4445, 0, 0, 0, 'Bael\'modan Golem', '', 0, 19, 20, 404, 433, 0, 0, 699, 415, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 27, 34, 0, 90, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 28.6704, 39.4218, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 34, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, '');

delete from item_template where entry between 60192 and 60194;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60192,8629,'Automaton Arm',12,1,2048,1,-1,-1,1,2,-1,-1,-1,-1,4,'',0),
(60193,23856,'Automaton Leg',12,1,2048,1,-1,-1,1,2,-1,-1,-1,-1,4,'',0),
(60194,66119,'Automaton Head',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0);

delete from gameobject_template where entry between 2010825 and 2010827;
replace into gameobject_template values
(2010825, 0, 3, 24109, 'Crates with Mechanical Arms', 0, 4, 1, 43, 2010825, 0, 0.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010826, 0, 3, 24109, 'Crates with Mechanical Legs', 0, 4, 1, 43, 2010826, 0, 0.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2010827, 0, 3, 33051, 'Mechagnome Head', 0, 4, 1, 43, 2010827, 0, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

delete from gameobject_loot_template where entry between 2010825 and 2010827;
replace into gameobject_loot_template (entry, item, chanceorquestchance, mincountorref, maxcount, condition_id, patch_max) values 
(2010825,60192,-100,1,1,0,10),
(2010826,60193,-100,1,1,0,10),
(2010827,60194,-100,1,1,0,10);

-- Stealing a Core --
delete from quest_template where entry = 40129;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext4) values (40128,40129,2,17,45,45,0,0,'Stealing a Core','Hello again, impeccable timing! I have done what I can with the parts you acquired from the dig, but we\'re missing a crucial piece. This automaton\'s power source is some advanced crystalline power core.\n\nUnfortunately the one in the chest has cracked and it\'s energy has been depleted. None have been found here and the dig has slowed down due to the Golems. Do not despair though, similar power sources have been found in the Uldaman dig bordering between Loch Modan and the Badlands.\n\nThat dig has also run into issues with the Dark Irons and with awakened defenders. You helped out here, so why not head over there, help them out, and grab me a power core while you\'re at it?','Acquire an Intact Power Core from Uldaman\'s Ancient Treasure.','Is that a Power core in your pocket, or are you just happy to see me?','This is it! Well done! Now I just have to fix this up, and we\'re good to go soon! Come visit again in the future.',60195,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23740,4075,47,250,54,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (60441, 40129);
replace into creature_involvedrelation (id, quest) values (60441, 40129);

delete from item_template where entry = 60195;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60195,24730,'Intact Power Core',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0);

delete from gameobject_template where entry = 2010828;
replace into gameobject_template values
(2010828, 0, 3, 259, 'Ancient Treasures Chest', 0, 4, 1, 43, 2010828, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

delete from gameobject_loot_template where entry = 2010828;
replace into gameobject_loot_template (entry, item, chanceorquestchance, mincountorref, maxcount, condition_id, patch_max) values 
(2010828,60195,-100,1,1,0,10);

-- A Profitable Aquisition --
delete from quest_template where entry = 40130;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext4) values (0,40130,2,17,18,18,0,0,'A Profitable Aquisition','Yo! You look like a capable sort! The Dwarves recently struck rich! They found some juicy technology when they found a way inside the facility across the road. See, I managed to snatch this little thing while they were distracted with the facility defenses activating, but what I got is an incomplete piece of a greater whole!\n\nGet in there and grab me the rest, if you help, we\'ll be partners! I\'ll give you a generous...\n\n40% share? We\'re talkin\' priceless technology so don\'t worry it\'s enough! Go in there find me two matching legs, arms, and a head. There\'s some defenses but it\'s nothin\' you can\'t handle!','Gather two Automaton Legs, two Automaton arms, and an Automaton Head from the Bael\'modan Digsite.','Did you find it? If not get movin\'! Time is money.','Hah! Perfect! Tell ya what, here\'s an advance payment. I may require your aid again so keep on keeping on! For now go do some other stuff, I got tinkering to do!',60192,2,60193,2,60194,1,0,0,0,0,0,0,0,0,0,0,0,0,3740,1075,76,250,1001,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (60443, 40130);
replace into creature_involvedrelation (id, quest) values (60443, 40130);

delete from creature_template where entry = 60443;
replace into creature_template values
(60443, 0, 7059, 0, 0, 0, 'Kex Blowmaster', 'Tinker Extraordinaire', 0, 25, 25, 712, 712, 0, 0, 1009, 1692, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 31, 40, 0, 106, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 38.72, 53.24, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 'npc_torble_and_kex');

-- Requisitioning a Core --
delete from quest_template where entry = 40131;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext4) values (40130,40131,2,17,45,45,0,0,'Requisitioning a Core','Yo! Good to see you man! I made progress but see, somethin\'s missing and I doubt it can be found here, not in an intact state anyway. A normal power source won\'t do, not for this baby.\n\nIt requires some major juice, so either I hook it up to a massive generator the size of a house, which I cannot currently acquire... Or we acquire a compatible power core! There\'s a ruin in the other part of the continent, Uldaman I believe it\'s called yeah!\n\nIt\'s made by those Titanics or whatever they\'re called. Go to this ruin and get me a core, the deeper complex is exposed there so you can do it!','Acquire an Intact Power Core from Uldaman\'s Ancient Treasure.','Got the core for me? Come on I\'m countin\' on you here!','Perfect! Yes this will fit, some modification and we\'ll be good to go! I knew I could count on you partner! Here\'s your share! Now leave, I got work to do. The sooner I patch this up, the sooner we\'ll strike it rich! This technology will revolutionize my position within Labor Union!',60195,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23740,4075,76,250,1001,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (60443, 40131);
replace into creature_involvedrelation (id, quest) values (60443, 40131);

-- The Activation --
delete from quest_template where entry = 40132;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40129,40132,2,17,55,53,0,0,'The Activation','Thank you again, I believe the core is installed. So now all that\'s left to do is the final assembly and then we\'ll have this automaton working! Speak to me again and say the word and we\'ll turn it on.','Speak to Torble Sparksprocket and activate Analyzer X-51','Stand By... Processing.','Analyzer X-51 huh? The memory banks are restricted. I\'ll have to figure out how to unlock them, imagine the secrets it may possess! The secrets of the Titans! He\'s very cooperative though, so I\'d say we\'ve made some headway.\n\nI\'ll keep working with Analyzer X-51 and see if he can help the digsite for now. I\'ll call you once I have a hint regarding the memory banks. In the mean time, I have something for you, I have modified Analyzer X-51\'s old depleted power core into an amulet you can wear.\n\nWhile the energies within are but a fraction of what the core once held, it can still sustain your magical energies if you use magic... If not, I bet it can be sold to someone who\'d be interested.',0,0,0,0,0,0,0,0,60324,1,0,0,0,0,0,0,0,0,33740,8075,47,250,54,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Ask to Torble Sparksprocket to turn on the Analyzer X-51 and observe what will happen.');

replace into creature_questrelation (id, quest) values (60441, 40132);
replace into creature_involvedrelation (id, quest) values (60441, 40132);

delete from creature_template where entry = 60324;
replace into creature_template (entry, name, display_id1) values (60324, 'quest_40132_dummy_triger', 328);

delete from creature_template where entry = 60444;
replace into creature_template values
(60444, 0, 18594, 0, 0, 0, 'Analyzer X-51', '', 0, 55, 55, 2614, 2614, 0, 0, 4500, 35, 0, 1.1, 1.14286, 0, 20, 5, 0, 0, 1, 50, 73, 0, 248, 1, 2000, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 40129, '');

-- The Profitable Activation --
delete from quest_template where entry = 40133;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40131,40133,2,17,55,53,0,0,'The Profitable Activation','Yo Partner! It\'s all done, I\'m about ready to get this thing turned on, so once you\'re ready talk to me and we will turn it on!','Speak to Kex Blowmaster and activate Analyzer X-48','Well well well...','Analyzer X-48 huh? I had expected more than a robotic Gnome, but hey! It\'s smart, and the analyzing ability can make me some dosh...\n\nBut more than that, there\'s the memory banks! I gotta find a way to dig into them, that\'s where the true treasure are partner! Schematics and knowledge belonging to the ancient Titans!\n\nWho knows what treasure it might hold! I\'ll call you soon partner! Oh wait, I made this thing for you from it\'s original power core, you may find it useful or somethin\'. Have a good one Partner!',0,0,0,0,0,0,0,0,60324,1,0,0,0,0,0,0,0,0,33740,8075,76,250,1001,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Ask to Kex Blowmaster to turn on the Analyzer X-48 and observe what will happen.');

replace into creature_questrelation (id, quest) values (60443, 40133);
replace into creature_involvedrelation (id, quest) values (60443, 40133);

delete from creature_template where entry = 60445;
replace into creature_template values
(60445, 0, 18594, 0, 0, 0, 'Analyzer X-48', '', 0, 55, 55, 2614, 2614, 0, 0, 4500, 35, 0, 1.1, 1.14286, 0, 20, 5, 0, 0, 1, 50, 73, 0, 248, 1, 2000, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 40131, '');

-- War On Two Fronts --
delete from quest_template where entry = 40134;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40127,40134,2,85,20,15,0,0,'War On Two Fronts','Listen, we do not have much time. I got the news that the Remnants are preparing for an attack on the Steepclif Port. If we send all of our forces to defend the port, that will make us open for an attack from the Rogue Heights.\n\nThat is why I need you to buy us time to defend the Port by attacking the rogues and killing their leader Salorn. While their numbers are numerous, it is very unlikely that they are expecting an attack on their camp. Now go! Every second counts.','I have been tasked with stopping the rogue army by killing their leader Salorn.','May the Dark Lady watch over you.','You are a sight for sore eyes. With the army at Rogue Heights dismantled and the attack on the port repelled, it is finally time to take the fight to Humans main base.',0,0,0,0,0,0,0,0,91761,8,91762,6,91763,3,91719,1,0,0,2000,2000,68,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91712, 40134);
replace into creature_involvedrelation (id, quest) values (91712, 40134);

-- Fall Of The Usurper --
delete from quest_template where entry = 40135;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40134,40135,2,85,20,15,0,0,'Fall Of The Usurper','The day when we restore Grelda as the rightful ruler of the Uplands is upon us $n. Thanks to your efforts, the Humans and those leading them have never been more vulnerable.\n\nBe that as it may, there is no denying that a direct attack on their base is not something that can easily be done. That is why I recommend you find those who would assist you in that endeavor. But have in mind that the time is at hand, and the longer we wait, the more time they have to recuperate.','Nargelas wants me to assault Remnants Camp and kill Duchess Faliona and Captain Silas.','Is it done?','You actually did it?! Who knew that there would come a day when I would celebrate the death of my sister in law. Oh, who am I kidding? It was bound to happen one way or another, hahaha.\n\nMy friend in a short time you have done more for us than all of my servants combined. With the Remnants of Lordaeron crushed it is just a matter of time before the Forsaken have total control over the whole Tirisfal.\n\nAnd don\'t think for a second that I would let your deeds go unrewarded, I think that you have more than earned this.',0,0,0,0,0,0,0,0,91352,8,91975,4,91721,1,91974,1,0,0,2500,2400,68,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91712, 40135);
replace into creature_involvedrelation (id, quest) values (91712, 40135);

-- Dwindling Supplies --
delete from quest_template where entry = 40136;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40136,2,85,16,15,0,0,'Dwindling Supplies','You there! Yes, you. New in town, ay? Look, I\'m not sure if you are aware, but we are currently at war with the Humans, and as you can imagine, it has taken quite a toll on our dwindling supplies.\n\nThat is why I\'m looking for someone to collect boar meat from the local Cragtusk Boars. So, feeling up for it?','I have been tasked by Butcher Reeves to bring 8 Chunk of Meat.','Back already?','Look at that, a chunk of fine cut meat. Are you sure you are not some mysterious chef who is an adventurer by the day and chef by night? Anyways, thanks a lot, this will surely help. And here I hope this helps.',60196,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,700,950,68,75,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91727, 40136);
replace into creature_involvedrelation (id, quest) values (91727, 40136);

delete from item_template where entry = 60196;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60196,25475,'Chunk of Meat',12,1,2048,1,-1,-1,1,8,-1,-1,-1,-1,4,'Lump of Cragtusk Meat',0);

delete from creature_loot_template where entry = 1191 and item = 60196;
replace into creature_loot_template (entry, item, chanceorquestchance, mincountorref, maxcount, condition_id, patch_max) values (1191,60196,-100,1,1,0,10);

-- Strike Them Down --
delete from quest_template where entry = 40137;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40136,40137,2,85,17,15,0,0,'Strike Them Down','Just a person that I need. Listen. A few months ago, a pack of wolves inhabited the cave just north of here. At first, we thought it was just a small number of them, so we didn\'t pay those beasts much attention. Being busy with war and all. But they have become aggressive of late and even got bold enough to attack residents of Glenshire.\n\nSo how about this, you go and cull their numbers and in the meantime, I will try to gather some coins from the residents for you, deal?','I have been tasked by Butcher Reeves to kill 10 Graypaw Wolfs.','Any luck?','Thanks, they might not have been eradicated completely, but this will surely make them think twice before attacking us again. Oh and here is your reward.',0,0,0,0,0,0,0,0,91989,10,0,0,0,0,0,0,0,0,900,1100,68,75,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91727, 40137);
replace into creature_involvedrelation (id, quest) values (91727, 40137);

-- Bandit Lord --
delete from quest_template where entry = 40138;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40138,2,85,19,15,0,0,'Bandit Lord','You look like someone who can get things done. I have a proposition for you. You see I have been hunting a man by the name of Storn for a while now, however, he was always surrounded by his minions and was untouchable. But it appears that he had a falling out with his man and has since been in hiding.\n\nGood thing is that I know that he is hiding in a cave close to Rogue Heights in the eastern hills of Tirisfal Uplands. The bad thing is that I need to wait for my client to get here, and she has a habit of leaving early if I do not meet her at her specific time. This is why I need someone to go and hunt Storn for me. So what do you say? You get me Storn\'s head, and I will split the reward for the bounty with you.','I need to find and kill Storn in the cave near Rogue Heights.','How goes the hunt?','You are fast. Have you ever considered changing your profession to being a bounty hunter? Anyways here is your share and thanks for the job well done.',60197,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,900,1900,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91749, 40138);
replace into creature_involvedrelation (id, quest) values (91749, 40138);

delete from item_template where entry = 60197;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60197,1445,'Storn\'s Head',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'The head of the bandit lord Storn',0);

delete from creature_loot_template where entry = 122 and item = 60197;
replace into creature_loot_template (entry, item, chanceorquestchance, mincountorref, maxcount, condition_id, patch_max) values (122,60197,-100,1,1,0,10);

-- Reaperence Of The Damned --
delete from quest_template where entry = 40139;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40139,2,85,17,15,0,0,'Reaperence Of The Damned','Welcome to the Glenshire. I hope that you have come to assist us. We are currently beset by the enemies on every side and could surely use any help that we can get. West of here is a farm where a large battle occurred recently between our troops and Humans of Lordaeron. We planned to use the dead there to boost our troops, but the Cult of the Damned appeared before us with the same idea.\n\nIf left unchecked, the scourge will soon have a large force to attack from the west, and we cannot let that happen. If you are feeling up to it, I got a reward ready for anyone who is willing to put a stop to the scourge advances.','Father Brightcopf wants me to put a stop to scourges advances on the Corinth Farm.','Were you successful?','Finally, some good news. As promised, here is your reward.',0,0,0,0,0,0,0,0,91756,10,91757,6,0,0,0,0,0,0,1200,1500,68,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91726, 40139);
replace into creature_involvedrelation (id, quest) values (91726, 40139);

-- Cleaning The Farm --
delete from quest_template where entry = 40140;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40139,40140,2,85,19,15,0,0,'Cleaning The Farm','With the bulk of the undead gone, it is time to face the one responsible for taking our new troops from us. Go to the Corinth Farm once again and kill the Necromancer responsible for this.\n\nAnd be careful if the Necromancer is capable of summoning a small army of undead he is certainly not someone who should be underestimated.','I was tasked with killing the Necromancer responsible for resurrecting the undead on Corinth Farm.','Yes?','So the Necromancer is dead, this truly is reassuring news. Without you, we might have had to retreat into the Tirisfal Glades, and even worse the scourge would have been able to attack the Forsaken from both the west and east. You have done us a great service, and I think you should have this as a just reward for your deeds.',0,0,0,0,0,0,0,0,91759,1,0,0,0,0,0,0,0,0,1800,1900,68,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91726, 40140);
replace into creature_involvedrelation (id, quest) values (91726, 40140);

-- Rewards for "War on Two Fronts"
replace into item_template values
 ('60198', '0', '2', '10', 'Acolyte\'s Staff', '', '20391', '2', '0', '1', '13924', '3481', '17', '-1', '-1', '25',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '6', '6', '5',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3300', '0',
 '0', '44', '67', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '1', '2', '0', '0', '75', '0', '0', '0', '0', '23', '0', '0', '0',
 '0', '1', NULL);
 replace into item_template values
 ('60199', '0', '4', '1', 'Duskmind Boots', '', '4272', '2', '0', '1', '3236', '809', '8', '-1', '-1', '25',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '7', '7', '-2',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '27', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '7', '1', '0', '0', '35', '0', '0', '0', '0', '3', '0', '0', '0',
 '0', '1', NULL);
 replace into item_template values
 ('60200', '0', '2', '7', 'Infantry Shortblade', '', '28093', '2', '0', '1', '10776', '2694', '13', '-1', '-1', '25',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '4', '4', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0',
 '0', '22', '42', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '1', '3', '0', '0', '65', '0', '0', '0', '0', '23', '0', '0', '0',
 '0', '1', NULL);

update quest_template set rewchoiceitemid1 = 60198 where entry = 40134;
update quest_template set rewchoiceitemcount1 = 1 where entry = 40134;
update quest_template set rewchoiceitemid2 = 60199 where entry = 40134;
update quest_template set rewchoiceitemcount2 = 1 where entry = 40134;
update quest_template set rewchoiceitemid3 = 60200 where entry = 40134;
update quest_template set rewchoiceitemcount3 = 1 where entry = 40134;

-- Reward for "Fall of the Usurper"
 replace into item_template values
 ('60201', '0', '4', '0', 'Tattered Banner of Lordaeron', 'A testament of your triumph.', '932', '3', '0', '1', '21368', '5342', '12', '-1', '-1', '25',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '40', '0', '0', '0',
 '0', '0', '0', '9139', '1', '0', '0', '-1', '0', '-1', '9397', '1', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '7', '1', '0', '0', '0', '0', '0', '0', '0', '42', '0', '0', '0',
 '0', '1', NULL);
 
update quest_template set rewchoiceitemid1 = 60201 where entry = 40135;
update quest_template set rewchoiceitemcount1 = 1 where entry = 40135;

-- The Boran Family --
delete from quest_template where entry = 40141;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1,objectivetext2) values (0,40141,2,409,51,40,0,0,'The Boran Family','I come from a large family, one that once occupied the boroughs of Kul Tiras. We weren\'t exactly a rich family, but we were not poor either! I traveled out with two of my brothers when the third war started up in Lordaeron, hoping to earn some fortune and glory. I helped the navy , my brother Karl started work in Menethil Harbor, while Samual went to Southshore to assist the war effort.\n\nEver since I set said years ago, I have had no communication with them, and would like to reach out if you could deliver a letter to the both of them. They must have thought I perished after so long without a word or peep and I want to ease their minds.','Deliver the letters from Arnold Boran to his two brothers.','Have you seen my brothers yet? It will require travelling, but I would appreciate it greatly.','My family has always been close knit, and I know that such a long length without hearing from me would certainly cause worry. I am simply happy to dispell such concern and let them know all is fine. Thanks again, this has meant a lot for me.',60202,1,60203,1,0,0,0,0,60325,1,60326,1,0,0,0,0,0,0,8000,4650,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Deliver Letter to Karl','Deliver Letter to Samual');

replace into creature_questrelation (id, quest) values (91883, 40141);
replace into creature_involvedrelation (id, quest) values (91883, 40141);

delete from creature_template where entry = 60325 and 60326;
replace into creature_template (entry, name, display_id1) values (60325, 'quest_40141_dummy_triger', 328);
replace into creature_template (entry, name, display_id1) values (60326, 'quest_40141_dummy_triger', 328);

delete from item_template where entry = 60202 and 60203;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60202,3018,'Letter from Karl',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0),
(60203,13430,'Letter from Samual',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0),
(60204,3020,'Letter to Karl',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',50508),
(60205,3020,'Letter to Samual',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',50509);

replace into page_text values
(50508,'Hello Karl, it has been a long time, and I wanted to reach out in assurance that I am still alive, and kicking. It has been forever since we have seen, and I am eager to see you once again.\n\nAfter departing from Kul Tiras, the fleet spent an extended amount of time at sea. As of recently we were attacked and the ship was destroyed and now we currently reside on the Isle of Lapidis off the coast of Stranglethorn Vale. When the ship is repaired, I will be returning home, and will stop by to say hello like old times.\n\nYour Older Brother Arnold.',0),
(50509,'Little brother, it has been an eternity since we have seen one another. I am currently stranded on an island called Lapidis off the coast of Stranglethorn Vale near the south seas with others in the fleet. We call this place home, and have for a while now, and are repairing our ship.\n\nWhen repairs are done, I will be stopping to see you and Karl. I look forward to this day very well, and hope you are doing good.\n\nYour Older Brother Arnold.',0);

update creature_template set npc_flags = 3 where entry = 91883;
update creature_template set npc_flags = 3 where entry = 1242;
update creature_template set script_name = 'npc_arnold_boran' where entry = 91883;
update creature_template set script_name = 'npc_boran_brothers' where entry = 92936;
update creature_template set script_name = 'npc_boran_brothers' where entry = 1242;

-- Sailors Innovation --
delete from quest_template where entry = 40142;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40142,2,409,51,40,0,0,'Sailors Innovation','From our time at sea it is us Sailors who come up with the fine dining aboard ship and stuck on land. The same meals can get repetitive over, and over again, and so it is time to improvise and innovate.\n\nI came up with this recipe some time ago when we spent a few days on Tel\'Abim. All we had were sand crawlers and banana, fry it up together, and add a pinch of salt, and that was quite a meal! Sadly, we don\'t got bananas, but I do know that Chef Jenkel has some salt. Get the salt from him, and gather 6 Juicy Crawler Legs from any sort of sand crawler around these islands, then I can finally have a change of meal.','Collect 6 Juicy Crawler Legs and a Pinch of Salt for \'Slim\' in Caelan\'s Rest.','Make sure those crawler legs are juicy!','Ahh, yeah this should be everything, a meal worthy for the Admiral! Here, have some, as thanks.',60206,6,60207,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4850,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91872, 40142);
replace into creature_involvedrelation (id, quest) values (91872, 40142);

delete from item_template where entry = 60206 and 60207;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60206,5825,'Juicy Crawler Leg',12,1,2048,1,-1,-1,1,6,-1,-1,-1,-1,4,'',0),
(60207,2480,'Pinch of Salt',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0);

update creature_template set loot_id = 91831 where entry = 91831;
update creature_template set loot_id = 91832 where entry = 91832;
update creature_template set loot_id = 91833 where entry = 91833;
update creature_template set loot_id = 91146 where entry = 91146;
update creature_template set loot_id = 91147 where entry = 91147;

delete from creature_loot_template where item = 60206 and entry between 91831 and 92147;
replace into creature_loot_template (entry, item, chanceorquestchance, mincountorref, maxcount, condition_id, patch_max) values
(91831,60206,-25,1,1,0,10),
(91832,60206,-25,1,1,0,10),
(91833,60206,-25,1,1,0,10),
(92146,60206,-25,1,1,0,10),
(92147,60206,-25,1,1,0,10);

update creature_template set npc_flags = 2 where entry = 91872;
update creature_template set npc_flags = 17 where entry = 91950;
update creature_template set script_name = 'npc_chef_jenkel' where entry = 91950;

-- Smashing the Southsea! --
delete from quest_template where entry = 40143;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40143,2,409,53,40,0,0,'Smashing the Southsea!','The Southsea Pirates are a direct threat to our survival on this island. Their operations here are much larger then we had first anticipated when we set out. They still have many powerful vessels, and whilst they haven\'t attempted to sail them infront of our town, the possibility is still real.\n\nKul Tiras has always been at war with piracy, those that threaten the merchants are a direct threat to our kingdom. I need you to claim the sashes of the Southsea Freebooters, a pirate gang that operates in a vast area. You can find them across both large islands and along the sandbar named after them to the south west of here off the coast of Lapidis.\n\nAs proof of your deeds, bring me twenty of their sashes that they wear. Your efforts will not only help us, but all who travel the vast sea.','Gather 20 Southsea Sashes from Southsea Pirates for Colonel Hardinus in Caelan\'s Rest.','The Southsea Freebooters must be stopped if we are to ever leave this place.','I salute you, you have made the waves a much safer place for all who travel them.',60208,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4850,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (92002, 40143);
replace into creature_involvedrelation (id, quest) values (92002, 40143);

delete from item_template where entry = 60208;
replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60208,1329,'Southsea Sash',12,1,2048,1,-1,-1,1,20,-1,-1,-1,-1,4,'',0);

update creature_template set loot_id = 92135 where entry = 92135;
update creature_template set loot_id = 92136 where entry = 92136;
update creature_template set loot_id = 92138 where entry = 92138;
update creature_template set loot_id = 92139 where entry = 92139;
update creature_template set loot_id = 91844 where entry = 91844;
update creature_template set loot_id = 91845 where entry = 91845;
update creature_template set loot_id = 91846 where entry = 91846;
update creature_template set loot_id = 91847 where entry = 91847;

delete from creature_loot_template where item = 60208 and entry = 92135;
delete from creature_loot_template where item = 60208 and entry = 92136;
delete from creature_loot_template where item = 60208 and entry = 92138;
delete from creature_loot_template where item = 60208 and entry = 92139;
delete from creature_loot_template where item = 60208 and entry = 6371;
delete from creature_loot_template where item = 60208 and entry = 91844;
delete from creature_loot_template where item = 60208 and entry = 91845;
delete from creature_loot_template where item = 60208 and entry = 91846;
delete from creature_loot_template where item = 60208 and entry = 91847;
replace into creature_loot_template (entry, item, chanceorquestchance, mincountorref, maxcount, condition_id, patch_max) values
(92135,60208,-26,1,1,0,10),
(92136,60208,-26,1,1,0,10),
(92138,60208,-26,1,1,0,10),
(92139,60208,-26,1,1,0,10),
(6371,60208,-26,1,1,0,10),
(91844,60208,-26,1,1,0,10),
(91845,60208,-26,1,1,0,10),
(91846,60208,-26,1,1,0,10),
(91847,60208,-26,1,1,0,10);

-- Southsea Interference --
delete from quest_template where entry = 40144;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (40143,40144,2,409,54,44,0,0,'Southsea Interference','With each sash collected the Southsea are weakened, but not destroyed. Their strength comes from the captains of each ship and each crew. A man with great charisma and promises of wealth, fortune and adventure can easily rile up a group with no future ahead of them.\n\nIt is these individuals that we will need to target, the captains of the Southsea Freebooters. You shall find them to the south west, along a dangerous strip of sand called The Southsea Sandbar. Be cautious, it is the basecamp of the pirates on both Gilijim, and Lapidis.\n\nYou shall find the captains upon the boats there, enter each, and kill the leaders.','Slay the Southsea Captains located on The Southsea Sandbar for Colonel Hardinus in Caelan\'s Rest.','Once the leaders are dead, the pirates will be sent into a state of chaos to establish new leadership.','The Admiral would be proud of everything done. I have no doubt it will take the Southsea many weeks before someone is their new leaders, and even then, they will be very much weaker then they were. Cheers, the dead of the fleet have been avenged.',0,0,0,0,0,0,0,0,92142,1,92143,1,92144,1,0,0,0,0,4500,6350,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60209,1,60210,1,60211,1,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (92002, 40144);
replace into creature_involvedrelation (id, quest) values (92002, 40144);

replace into item_template values
 ('60209', '0', '4', '4', 'Fleet Pauldrons', '', '32903', '2', '0', '1', '46416', '11604', '3', '-1', '-1', '59',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '6', '7', '4', '12',
 '7', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '424', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '6', '1', '0', '0', '70', '0', '0', '0', '0', '29', '0', '0', '0',
 '0', '1', NULL);
 
replace into item_template values
 ('60210', '0', '4', '1', 'Hydromancer Sash', '', '16704', '2', '0', '1', '27608', '6902', '6', '-1', '-1', '59',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '11', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '43', '0', '0', '0',
 '0', '0', '0', '7703', '1', '0', '0', '-1', '0', '-1', '21624', '1', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '7', '1', '0', '0', '25', '0', '0', '0', '0', '29', '0', '0', '0',
 '0', '1', NULL);
 
replace into item_template values
 ('60211', '0', '4', '2', 'Rowdy Sailor Wraps', '', '16816', '2', '0', '1', '40508', '10127', '9', '-1', '-1', '59',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '6', '11', '4', '8',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '68', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '8', '1', '0', '0', '30', '0', '0', '0', '0', '29', '0', '0', '0',
 '0', '1', NULL);
