-- Balai's Experiment
delete from quest_template where entry = 40406;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,40406,2,15,38,33,0,0,'Balai\'s Experiment','Hello mon!\n\nAnother beautiful day in the marsh, right? Some of the ogres here dislike it, but Balai sees great potential in the marsh.\n\nMany plants and creatures to harvest from for potions and poisons. No better place Balai says.\n\nDo you wish to do Balai a favour? Balai pay nicely. You will need to venture into the marsh and find Withervine Mire Beasts, kill them, bring me the core and you get paid.\n\nThe Mire Beast core can be a strong poison if altered properly, the Warchief said not to touch the humans of Theramore but if they come too far, Balai will know how to deal with them!','Collect 5 Withervine Mire Beast Core\'s for Balai Lok\'wein in Brackenwall Village.','You back already, mon?','Perfect mon.\n\nThis will make for great poison, Balai makes the poison and dips darts in it. Balai uses this small wooden thing to shoot darts at the enemy, with poison!\n\nSmall little things can kill you, the marsh teaches, think about the mosquitos. And here\'s your reward, it will help you one day.',60588,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3500,2750,76,100,0,0,0,0,0,0,0,0,0,3823,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

replace into creature_questrelation (id, quest) values (13476, 40406);
replace into creature_involvedrelation (id, quest) values (13476, 40406);

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text) values
(60588,26571,'Withervine Mire Beast Core',12,1,2048,1,-1,-1,1,5,-1,-1,-1,-1,4,'It\'s sticky and it smells.',0);

REPLACE INTO creature_loot_template VALUES
(4387, 60588, -70, 0, 1, 1, 0);