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
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext4) values (0,40128,2,17,18,18,0,0,'An Ancient Aquisition','Greetings, Torble Sparksprocket here, Junior archaeologist of the Explorer\'s League here! A few weeks ago the dig found this strange contraption. It appears to be the torso of an automaton, it is clearly of Titan make but we haven\'t seen anything like it before, that\'s why I was called here. I quickly realized that it is a modular automaton of some kind. The other parts were found some days later but someone tripped some defense and the dig is now full of Golems. Can you head in there and find the other pieces? You need two arms, two legs, and a head. Look through crates and such.','Gather two Automaton Legs, two Automaton arms, and an Automaton Head from the Bael\'modan Digsite.','Did you find it?','Well done. This contraption will take some time to repair. Do visit sometime in the future and I may have news for you!',60192,2,60193,2,60194,1,0,0,0,0,0,0,0,0,0,0,0,0,3740,1075,47,250,54,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (60441, 40128);
replace into creature_involvedrelation (id, quest) values (60441, 40128);

delete from creature_template where entry = 60441 and 60442;
replace into creature_template values
(60441, 0, 6632, 0, 0, 0, 'Torble Sparksprocket', 'Junior Archaeologist', 0, 25, 25, 712, 712, 0, 0, 1009, 55, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 31, 40, 0, 106, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 38.72, 53.24, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, ''),
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
(2010827, 0, 3, 33051, 'Mechagnome Head', 0, 4, 1, 43, 2010827, 0, 0.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

delete from gameobject_loot_template where entry between 2010825 and 2010827;
replace into gameobject_loot_template (entry, item, chanceorquestchance, mincountorref, maxcount, condition_id, patch_max) values 
(2010825,60192,-100,1,1,0,10),
(2010826,60193,-100,1,1,0,10),
(2010827,60194,-100,1,1,0,10);