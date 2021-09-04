-- The First Settlement

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (0,80289,2040,30,26,0,0,'The First Settlement','Ah there you are, $N.\n\nYou have proven to be of some use in the past. I have observed that you have an uncanny knack for running errands.\n\nSeven thousand years ago my ancestors were exiled from Kalimdor, but if you think they created Quel\'thalas right away, then you are wrong, they landed in what is today known as the Tirisfal Glades.\n\nAccording to records left behind in Alah\'thalas, the first settlement was known as Ishnu\'danil. Now as you can guess we didn\'t remain there.\n\nWhy is a mystery, our surviving records claim that our people were afflicted by mental instability.\n\nI have sent one of my subordinates, Scryer Lordal Thas\'alah to investigate alongside some assistants. He hasn\'t reported in recently, get over there and find him.','Locate Scryer Lor\'dal Thas\'alah in the western Tirisfal Glades.','Who are you, $r?','Arcanist Anu\'delen sent you? That\'s good, this expedition has been a disaster and I hope you can help.\n\nWe have discovered a lot but ever since we came everything has been going wrong, equipment breaking, people hearing voices, some even claim this place is haunted.',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,140,475,629,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (80231, 80289);
replace into creature_involvedrelation (id, quest) values (91806, 80289);

-- The Lost Tablets

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (80289,80290,2040,30,26,0,0,'The Lost Tablets','I would have you assist me with some Archaeological work.\n\nThere is a stone tablet within the building etched into the cliff. It seems that the building was never fully completed, we use magic to shape the land into our buildings, but this building was partially abandoned.\n\nOnce I ventured inside I was filled with dread and horror so strong I had to leave. You\'re a courageous adventurer, I am sure something like that doesn\'t scare you.','Obtain the Tablet within the Unfinished building.','Did you get it?','It was haunted? A shame we could not speak to the spirit.\n\nAnyway let\'s see, this tablet is written in Thalassian. It details the establishment of Ishnu\'danil as the new home of the Highborne and Alah\'aran. A well of immense power?\n\nBut there\'s more, an addendum has been hastily carved at a seemingly later date, it states:\n\n\<Avoid the Shalla\'aran, avoid the Ishnu\'danil. All is lost, do not return here, do not settle here, follow Dath\'remar.>\n\nIshnu\'danil is fortune\'s peak in my tongue, and Shalla\'aran means the shadow well.\n\nThis is odd, we must investigate this shadow well.',81358,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,140,2475,629,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (91806, 80290);
replace into creature_involvedrelation (id, quest) values (91806, 80290);

replace into item_template values (81358, 0, 12, 0, 'Ancient Thalassian Tablet', '', 18204, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);

replace into gameobject_template values (181583, 0, 2, 25965, 'Ancient Thalassian Tablet', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'runed_thalassian_tablet');

update quest_template set type = 1 where entry = 80290;
update creature_template set loot_id = 91808, script_name = 'highborne_wraith' where entry = 91808;
replace into creature_loot_template values (91808, 81358, -100, 6, 1, 1, 0, 0, 10);