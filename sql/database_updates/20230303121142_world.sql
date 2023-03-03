-- Hidden but not Gone
delete from quest_template where entry = 40796;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40796,2,331,28,24,0,0,'Hidden but not Gone','There are many things that can hurt me. After seeing so many years pass by, believe me when I say, physical pain is among the least of them.$B$BI assume you are not unfamiliar with the problems we have in Ashenvale, $c? Between the Horde and the Sayaads, the tranquillity of the forest is fast becoming just a memory. But we have persisted - and will persist - through this challenge and countless more, mark my words.$B$BThe disgusting demons that have an uncanny resemblance to us are the worst affronts to nature. They hide away in their hovels, plotting corruption and torturing us all. I want you to head to each one of their nooks and crannies, and do your fair share in thinning them out. Bring me a collection of their gnarled and twisted horns, and the Kaldorei will know of your bravery.','Collect 6 horns from each of the Satyr camps.','Blights on the land can be hidden with ease, but healed with difficulty. Remember this.','Exceptional. I hope you sustained no injuries during your battles? You have aided more in one skirmish than those childish sentinels have done since they arrived.',61150,6,61151,6,61152,6,0,0, 0,0,0,0,0,0,0,0, 0,0, 0,2150,69,200,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61145, 40796);
replace into creature_involvedrelation	(id, quest) values (61145, 40796);

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(61150,941,'Bleakheart Horn',12,1,2048,1,-1,-1,1,6,-1,-1,-1,-1,4,'',0);

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(61151,941,'Xavian horn',12,1,2048,1,-1,-1,1,6,-1,-1,-1,-1,4,'',0);

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(61152,941,'Felmusk horn',12,1,2048,1,-1,-1,1,6,-1,-1,-1,-1,4,'',0);

REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(3765, 61150, -45, 0, 1, 1, 0),
(3767, 61150, -45, 0, 1, 1, 0),
(3770, 61150, -45, 0, 1, 1, 0),
(3771, 61150, -45, 0, 1, 1, 0),
(3752, 61151, -45, 0, 1, 1, 0),
(3754, 61151, -45, 0, 1, 1, 0),
(3755, 61151, -45, 0, 1, 1, 0),
(3757, 61151, -45, 0, 1, 1, 0),
(3758, 61152, -45, 0, 1, 1, 0),
(3759, 61152, -45, 0, 1, 1, 0),
(3762, 61152, -45, 0, 1, 1, 0),
(3763, 61152, -45, 0, 1, 1, 0);

-- A Foul Effigy
delete from quest_template where entry = 40797;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40797,2,331,28,20,0,0,'A Foul Effigy','The carving of a Furbolg has been riddled with sharp thorns and splinters of metal. They are gouged into its face, neck, and body. And yet, the carving can clearly be made out to have an almost childlike appearance. Was this someone\'s toy once? What were the Satyr doing with it?','Return the Effigy to its owner.','<The Furbolg watches you curiously as you approach.>','<He peaks his ears and snatches the effigy away. He is silent for several seconds, before mewling quietly.>$B$BThis was given to me when I was a mere cub, by my parents. We bless them to protect us, always. They are deeply personal, you only ever get one in life. I sensed something I was barely able to see snatch it away as I came to Forest Song for refuge! I have no idea what they were doing to it, or why. Sometimes it is best not to ask.$B$B<Picking out the thorns, he hugs it to his chest and nods.>$B$BYou cannot know how much this means to me. I have very little, but I would have given everything away to keep this. So please, take... take.',61153,1,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 61153,1, 0,1800,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 61154,1,61155,1,61156,1,0,0, 0,0,'');

replace into creature_involvedrelation	(id, quest) values (61146, 40797);

update quest_template set requiredraces = 1101 where entry = 40797;

REPLACE INTO item_template values
(61153, 12, 0, 'Foul Effigy', '', 34261, 1, 2048, 1, 0, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 40797, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);

REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(3770, 61153, 30, 0, 1, 1, 0);

replace into item_template values
 ('61154', '2', '6', 'Savage Spear', 'Simple, but brutally effective.', '25630', '2', '0', '1', '25380', '6345', '17', '-1', '-1', '30',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '7', '5', '6',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2600', '0',
 '0', '41', '69', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '1', '2', '0', '0', '85', '0', '0', '0', '0', '24', '0', '0', '0',
 '0', '1', NULL);

replace into item_template values
 ('61155', '4', '0', 'Primitive Bead Necklace', 'Not quite to most tastes.', '9852', '2', '0', '1', '22692', '5673', '2', '-1', '-1', '32',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '5', '6', '4',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0',
 '0', '1', NULL);

replace into item_template values
 ('61156', '4', '2', 'Headband of a Hundred Feathers', 'Seems to have lost a few.', '28739', '2', '0', '1', '13160', '3290', '1', '-1', '-1', '32',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '7', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '68', '0', '0', '0',
 '0', '0', '0', '9329', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '8', '0', '0', '0', '50', '0', '0', '0', '0', '4', '0', '0', '0',
 '0', '1', NULL);

