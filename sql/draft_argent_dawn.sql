replace into creature_template values 
(91190, 9, 16204, 0, 0, 0, 'Grant Lafford', 'The Silver Hand', 0, 20, 30, 2104, 2104, 0, 0, 20, 814, 1, 1.125, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 272, 1, 1400, 1900, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 66, ''),
(91191, 9, 16204, 0, 0, 0, 'Saul Buckwaldt', 'The Argent Dawn', 0, 20, 30, 2104, 2104, 0, 0, 20, 814, 1, 1.125, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 272, 1, 1400, 1900, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 66, '');

update creature_template set faction = 529 where entry in (91190, 911991);
update creature_template set npc_flags = 3 where entry in (91191, 91190);

set @gossip_menu_id = 60005; set @magic_number = 91191; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'The Argent Dawn fights in far away lands to maintain order within Azeroth, even as chaos lurks.'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60006; set @magic_number = 91190; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Even while the kingdoms have fallen around us, and they are nothing but a crumbled reminder of greatness, there is still hope, do what you must to preserve honor.'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (0,50240,1519,34,28,0,0,'What Once Was','Hello, and Welcome to the Argent Dawn! We are a group that combats evil across the world to try and maintain order.\n\nOur roots come from many that originated both here and in Lordaeron, members of The Silver Hand, an order of paladins that did similar things that we do now.\n\nIf you wouldn\'t mind, I currently am in need of a favor, an old member of this order I have been trying to find for quite a while, he\'s a friend of mine, and infact my old teacher and master in the ways of the light.\n\nWith the collapse of Lordaeron at the onset of the Third War I had thought he simply had passed as many others had in that hellish war, but I have recieved a written account that he is possibly still alive from a friend of mine at the local Cathedral here in Stormwind!\n\nIf you could spare some time, can you find Apprentice Kryten within Refuge Pointe in the Arathi Highlands?\n\nLook for a man with long golden hair, shouldn\'t be too hard to miss.','Find Apprentice Kryten in Refuge Pointe located in The Arathi Highlands.','Is there anything that you need?','Why hello there traveller, yes my name is Apprentice Kryten!\n\nWelcome to Refuge Pointe, was there something that I could assist you with?',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,529,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

update quest_template set rewxp = 500 where entry = 50240;

replace into creature_questrelation (id, quest) values (91191, 50240);
replace into creature_involvedrelation (id, quest) values (2788, 50240);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (50240,50241,1519,34,30,0,0,'Finding The Forgotten','Hello! Hope you\'re finding what you need here in Refuge Pointe, I came from the Cathedral District in Stormwind to offer what aid I could once I had found out the troubles afflicting the once great nation of Stromgarde, and from what is left here, I certainly am happy I came!\n\n...Oh, that is why you\'re here, I sent that letter quite a while ago when a trader that I hadn\'t seen before came and had spoken a name that Saul had mentioned before in his old tales of paladins and the Silver Hand back before the Third War.\n\nHe certainly was old enough to fit the description, but came with a wagon full of apples that he had sold to some of the locals and guardsmen around here.\n\nHe hasn\'t returned since that first trip he came with the apples. I\'m not sure if he is who you\'re looking for, and I\'d hate to dissapoint Saul if it didn\'t turn out to be true, but if you are looking for him, he said he had a farmstead high in the hills to the north west by the old ruined wall, he certainly headed that way when he left as well.','Try and Locate the Old Silver Hand Paladin.','Yes?','Yes? Do I know you? Welcome to the Farmstead.',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,529,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

update quest_template set rewxp = 1500 where entry = 50241;

replace into creature_questrelation (id, quest) values (2788, 50241);
replace into creature_involvedrelation (id, quest) values (91190, 50241);
