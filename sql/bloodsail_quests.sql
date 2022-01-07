-- Reserved.
-- quest_template			40000-41000
-- creature_template		60300-61000
-- gameobject_template		2010700-2011000
-- item_template			60000-61000
-- gossip_menu				41000-43000
-- creature_equip_template	20000-21000
-- broadcast_text			30000-31000
-- creature_ai_events		2200000-2201000
-- creature_ai_scripts		2200000-2201000

-- Naming the Vessel --
delete from quest_template where entry = 40354;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40354,2,33,48,42,0,0,'Naming the Vessel','Seems like the pirate life suits ye, ye scoundrel. Ah, I remember of me own adventures, to be young again. Anyway, since the ship\'s all yours and all, thought it\'d be the time for you to name it, savvy?\n\nI bet ye already got a name in mind, whenever ye feel ready.','Decide the name of the ship.','Any idea yet mate?','Hm, not something I would\'ve gone with. Alas, it be yer ship \'afore all.',0,0,0,0,0,0,0,0,60354,1,0,0,0,0,0,0,0,0,5934,1250,87,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Give your ship a name');

replace into creature_questrelation (id, quest) values (60496, 40354);
replace into creature_involvedrelation (id, quest) values (60496, 40354);

delete from creature_template where entry = 60354;
replace into creature_template (entry, name, display_id1) values (60354, 'quest_40354_dummy_triger', 328);