-- Ms. Fix-it!

replace into item_template values (70030, 0, 12, 0, 'Wood', 'Dried logs of timber that will easily burn.', 929, 1, 0, 1, 0, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, null);

replace into gameobject_template values (1772000, 0, 3, 24459, 'Dry Fire Wood', 0, 0, 1, 57, 1772000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

replace into gameobject_loot_template (entry, item, chanceorquestchance, groupid, mincountorref, maxcount) values (1772000, 70030, -100, 1, 1, 1);

update creature_template set npc_flags = 2 where entry = 81061;

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (0,70050,15,40,36,0,0,'Ms. Fix-it!','It is absolutely outrageous! I am here for serious matters, not this mundane and meaningless task.\n\nI will not stand for this, no, no! $N, please, help me out. I rather pay you up than give that man the satisfaction that he convinced someone of my intellect to this, this “thing”.\n\nThere should be some old lumber around these ruins, this desolate place has no trees, look at it, it’s just a red rock! Try and find any lumber and bring it back to me so we can set a fire, and probably cook?\n\nI don’t know why he even asked me to light a fire, it’s so hot here!\n\nUgh, also we will need some cloth to repair these tents. I hear the Ogres in the west may be an easy way to grab some, but believe me I have no idea how that works!','Help Noli to do necessary repairs.','That drunk old dwarf, ugh, please come back as soon as you can!','You have no idea how much your aid means to me, I wouldn’t have done that ever, and I meant it!\n\nHere’s a little token of my appreciation.',4306,20,70030,5,0,0,0,0,0,0,0,0,0,0,0,'Objective Mask 4',0,0,5000,2100,0,0,0,0,0,0,0,0,0,22730,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (81061, 70050);
replace into creature_involvedrelation (id, quest) values (81061, 70050);

-- Oil-Stained Gold

replace into item_template values (70031, 0, 12, 0, 'Oil Canister', '', 40136, 1, 0, 1, 0, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);

replace into gameobject_template values (1772001, 0, 3, 32882, 'Oil Canister', 0, 0, 1, 57, 1772001, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

replace into gameobject_loot_template (entry, item, chanceorquestchance, groupid, mincountorref, maxcount) values (1772001, 70031, -100, 1, 1, 1);

replace into item_template values (70032, 0, 4, 1, 'Scruffy Cloth Hat', '', 31675, 1, 0, 1, 3740, 935, 1, -1, -1, 8, 7, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, null);

replace into `creature_template` values (70060, 0, 7229, 0, 0, 0, 'Frizzo Villamar', '', 0, 5, 5, 319, 319, 0, 0, 852, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 24, 31, 0, 90, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 31.856, 43.802, 100, 7, 4096, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');

update creature_template set npc_flags = 2 where entry = 70060;

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (0,70051,14,9,7,0,0,'Oil-Stained Gold','Psst bub, come here for a second, will ya?\n\nHey, how you doing today? Bet just speaking to me made your day, eh. Listen here boss, it’s getting even better!\n\nI got myself some neato information I gotta share with you, you see. There’s these uh, what’d you call ‘em? Shipwrecks, yea, some old Alliance boats that supposedly still got some fuel left in them.\n\nAnd ya know, fuel is kinda a huge thing especially for us goblins so we can uh, test our intellect when it comes to engineering.\n\nAnyway, let’s not bore ourselves to death, bring me whatever you manage to salvage from those wrecks.','Bring 5 Barrels of Oil to Frizzo Villamar in Razor Hill.','Hey, pal, I know them wrecks ain’t going anywhere but can we like get them today?','Yea, that’s perfect, absolutely perfect.\n\nYou made this goblin so happy I almost got teary eyes, jokes aside, here’s your pay bub, now move along, I got oil to sell.',70031,5,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,420,652,1001,150,0,0,0,0,0,0,0,0,0,70032,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (70060, 70051);
replace into creature_involvedrelation (id, quest) values (70060, 70051);

delete from gameobject where id = 1772001;

replace into `gameobject` values 

(4009488, 1772001, 1, 19.5486, -5333.44, -13.629, 2.33024, 0, 0, 0.918837, 0.394638, 300, 300, 100, 1, 0, 0, 0, 10),
(4009489, 1772001, 1, 45.9993, -5346.48, -14.1916, 5.67369, 0, 0, 0.300051, -0.953923, 300, 300, 100, 1, 0, 0, 0, 10),
(4009490, 1772001, 1, 62.0081, -5371.72, -9.96358, 0.409957, 0, 0, 0.203546, 0.979065, 300, 300, 100, 1, 0, 0, 0, 10),
(4009491, 1772001, 1, 176.877, -5239.62, -8.45846, 0.728043, 0, 0, 0.356035, 0.934473, 300, 300, 100, 1, 0, 0, 0, 10),
(4009492, 1772001, 1, 216.686, -5242.57, -7.6579, 1.52129, 0, 0, 0.68939, 0.72439, 300, 300, 100, 1, 0, 0, 0, 10),
(4009493, 1772001, 1, 13.5941, -5202.85, -10.2298, 2.22423, 0, 0, 0.896637, 0.442766, 300, 300, 100, 1, 0, 0, 0, 10),
(4009494, 1772001, 1, -185.46, -5309.33, -7.47469, 0.775187, 0, 0, 0.377961, 0.925821, 300, 300, 100, 1, 0, 0, 0, 10),
(4009495, 1772001, 1, -327.75, -5264.84, -8.63313, 6.05699, 0, 0, 0.112858, -0.993611, 300, 300, 100, 1, 0, 0, 0, 10),
(4009496, 1772001, 1, -220.906, -5326.64, -9.00828, 5.68, 0, 0, 0.297041, -0.954865, 300, 300, 100, 1, 0, 0, 0, 10);




