replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (0,55100,11,27,20,0,0,'Join The League!','The Explorer\'s league is always looking for new members, are you looking to see the world, and travel the sea\'s of azeroth in search of forgotten artifacts, and buried treasures?!\n\nWell then, you should seek out my friend Merrin Rockweaver, one of the many excavators and explorer\'s from the league uncovering old artifacts and bones!\n\nHead east of here and find Whelgar\'s Excavation site, it should be tucked against the southern mountains, so keep your eyes peeled explorer!','Report to Merrin Rockweaver to become a great explorer!','Yeah, can I help you? Things are a bit of a mess here.','Is Menethil Harbor still in the dark about what has happened here?\n\nI need proof to report to that fool Grovug stationed in the mountains, you\'ll help right?',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1400,375,47,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (3182, 55100);
replace into creature_involvedrelation (id, quest) values (1076, 55100);