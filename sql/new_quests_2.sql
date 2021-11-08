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
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40228,2,3,40,34,0,0,'Captain Barlgruf','The Dark Iron Dwarves have been a long standing rival of ours, their attacks agianst our people have been ruthless. I have come to attempt to bolster our strength in the region, and if we want that to be possible, then we must set our sights on Angor Fortress.\n\nThe place is run by Captain Barlgruf, he has been sent from Shadowforge City to oversee actions here within the Badlands, cut him down, and the rest of them will be aimless. He should be inside Angor Fortress, no doubt nestled with the rest of his lackeys.\n\nKill him, and return to me.','Slay Captain Barlgruf within Angor Fortress for Senator Broadbelt in Badlands.','If there is to ever be peace, then we must act with swiftness.','Excellent work! The Dark Iron Dwarves need to be checked, and halted at each corner of the world, lest they gain the power to attack more openly.',0,0,0,0,0,0,0,0,91766,1,0,0,0,0,0,0,0,0,0,2750,69,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (91767, 40228);
replace into creature_involvedrelation (id, quest) values (91767, 40228);