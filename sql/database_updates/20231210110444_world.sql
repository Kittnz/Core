-- Refugees no More
delete from quest_template where entry = 41187;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,41187,2,5225,1,1,0,0,'Refugees no More','Oh, by the Sunwell, another caravan? It feels like the very ground beneath us is groaning from the weight of weary travelers. There\'s scarcely enough space to catch one\'s breath, let alone find a place to rest.$B$BPlease, find a small patch of ground, any corner will do, and try to make it yours, at least for now. Unpack your belongings, as meager as they may be. It seems as if we\'re all carrying the weight of shattered lives in our hands.$B$BTake a moment to collect yourself amidst the chaos. And look, there\'s Commander Anarileth, over there, orchestrating what little order we have left. She seems to be in need of capable souls, and by the look of you, resilience marks your spirit.$B$BApproach her when you can, offer your aid. May the Light guide us through these dark times.','Report to Commander Anarileth in Brinthilien.','Ah, it warms my heart to witness more of our kin finding their way to this newfound sanctuary. Isn\'t it a sight to behold? There\'s a certain magnificence in the familiarity of these surroundings, reminiscent of the outskirts of Silvermoon City.','Aerthand\'s judgment has proven sound in sending you my way. You bear the mark of capability, unmistakable in your presence, $c. There\'s no doubt we could use your skills in this tumultuous time.$B$BThere\'s much to be done, and with every caravan that arrives, our needs grow. Are you ready to lend your hand to our cause?',0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 10,315,45, 269,50,0,0,0,0,0,0, 0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61807, 41187);
replace into creature_involvedrelation  (id, quest) values (61851, 41187);
update quest_template set requiredraces = 589		 where entry = 41187;

-- Provisions for Refugees
delete from quest_template where entry = 41188;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41187,41188,2,5225,1,1,0,0,'Provisions for Refugees','The Regency Council has bestowed upon me the responsibility of providing sustenance and shelter for all those who seek refuge in this land. A task, noble in intent, but one burdened by a stark lack of resources.$B$BThe local boar population is abundant, a potential source of nourishment for our people. However, the reality is harsh—many here lack the necessary equipment or skills to hunt them down. It falls upon shoulders willing and able to bridge this gap.$B$BIf you have the means and the skill, could you gather at least ten young boar flanks for our cause? It would be a tremendous help in easing the hunger that gnaws at the spirits of those who have sought safety here.','Bring 10 Young Thalassian Boar Flanks to Commander Anarileth in Brinthillien.','You can find boars all over this valley.','Thank you, $c. Your willingness to contribute is like a small beacon of hope in the vast sea of our needs. It may seem like a mere drop amidst the ocean of challenges we face, but with each kind gesture, we inch closer to the restoration of our former glory.',41118,10,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 0,1330,190, 269,100,0,0,0,0,0,0, 0,0,0, 0,0,0,0,0,0,0,0, 41103,1,41104,1,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61851, 41188);
replace into creature_involvedrelation  (id, quest) values (61851, 41188);
update quest_template set requiredraces = 589		 where entry = 41188;

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41118,2376,'Young Thalassian Boar Flank',12,1,2048,1,-1,-1,1,10,-1,-1,-1,-1,4,'',0,3);

replace into creature_loot_template values
(61689,41118,-80,0,1,1,0);

-- Safety for Refugees
delete from quest_template where entry = 41189;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41188,41189,2,5225,2,1,0,0,'Safety for Refugees','During your foray into the wilderness, I\'m sure you observed the growing threat posed by the lynxes that plague these forests. While they may be a mere nuisance at present, we cannot afford to let their population spiral out of control.$B$BI must task you with a somber duty: venture once more into the woods and cull the young of these lynxes. We cannot permit their numbers to swell, for the safety and well-being of our people depend on maintaining a balance in this newfound home.','Slay 12 Young Crimson Lynxes for Commander Anarileth.','Remember, it\'s the young ones you are after.','Ah, a welcome relief to know that the burgeoning threat of the lynx population has been curbed. Your actions bring a sense of solace, and I can rest easier knowing that you\'ve shouldered this responsibility for our community, young $c.',0,0,0,0,0,0,0,0, 61690,12,0,0,0,0,0,0, 0,0, 50,1750,250, 269,100,0,0,0,0,0,0, 0,0,0, 0,0,0,0,0,0,0,0, 41105,1,41106,1,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61851, 41189);
replace into creature_involvedrelation  (id, quest) values (61851, 41189);
update quest_template set requiredraces = 589		 where entry = 41189;

-- Thalassian Goulash
delete from quest_template where entry = 41190;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41187,41190,2,5225,3,2,0,0,'Thalassian Goulash','Hey there! New face, right? Pleasure\'s mine – I\'m, but you can just call me! Been part of Alah\'Thalas since its very beginnings, and let me tell you, I\'ve been putting my culinary skills to work around here. I\'m the resident cook, and if I do say so myself, the rations these refugees are getting are downright laughable. Dry meat, and Elwynn\'s rotting grain? Not exactly fit for the Quel\'dorei palate.$B$BNow, here\'s the thing: I\'m itching to whip up my famous goulash, but they\'re not letting me get my hands on the right ingredients. If you could do me a solid and gather some Forest Hawkstrider legs and Lynx steaks, we\'ll have a feast fit for our people in no time! Let\'s turn this drab menu into something worth savoring!','Gather 8 Forest Hawkstrider Legs and 12 Lynx Steaks for Dalicia Sweetsilver in Brinthillien.','How\'s it going, friend?','Ah, finally! A bounty of good, fresh ingredients to work with. Thank you a thousand times over! It\'s about time we bring some flavor to this place, don\'t you think?',41119,8,41120,12,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 90,2520,360, 269,150,0,0,0,0,0,0, 0,0,0, 0,0,0,0,0,0,0,0, 41107,1,41108,1,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61881, 41190);
replace into creature_involvedrelation  (id, quest) values (61881, 41190);
update quest_template set requiredraces = 589		 where entry = 41190;

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41119,31516,'Forest Hawkstrider Leg',12,1,2048,1,-1,-1,1,8,-1,-1,-1,-1,4,'',0,3),
(41120,25472,'Lynx Steak',12,1,2048,1,-1,-1,1,12,-1,-1,-1,-1,4,'',0,3);

replace into creature_loot_template values
(61691,41119,-65,0,1,1,0),
(61693,41120,-35,0,1,1,0);

-- A Crown of Flowers
delete from quest_template where entry = 41191;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41187,41191,2,5225,4,2,0,0,'A Crown of Flowers','Hey, you there!$B$B<Avenant lowers his voice, a sense of urgency in his tone.>$B$BFor a while now, I\'ve had my eye on that lady over yonder. No need to turn and stare, mind you; subtlety is key. The catch is, she\'s not exactly warming up to my advances. Now, here\'s where you come in—I\'m thinking a beautiful flower crown could work wonders, don\'t you agree?$B$B<Avenant glances around cautiously before continuing.>$B$BEmbarrassingly enough, I\'m not exactly the bravest soul when it comes to venturing into the forest alone. Lynxes, spiders, you name it—I\'ve seen them all, and it gives me the shivers. So, here\'s the deal: If you could gather some flowers for me, I might just stand a chance at winning the heart of that lovely lady. What do you say?','','Jolie will be mine.','You must be jesting.$B$BTo think these flowers could sway anyone, let alone win the favor of someone as fair as she is—it\'s a futile endeavor. Worthless, utterly worthless. Winning her heart seems like an insurmountable task. I\'ll likely wither away in solitude here, far from the homeland that once held the promise of connection.$B$BJust leave me be, so I can indulge in my melodrama in peace.$B$B<Avenant dismissively throws away the flowers with a touch of contempt.>',41121,10,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 30,1925,275, 269,100,0,0,0,0,0,0, 0,0,0, 80221,1,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61809, 41191);
replace into creature_involvedrelation  (id, quest) values (61809, 41191);
update quest_template set requiredraces = 589		 where entry = 41191;

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41121,7396,'Thalassian Daisies',12,1,2048,1,-1,-1,1,10,-1,-1,-1,-1,4,'',0,7);

REPLACE INTO gameobject_template VALUES
(2020072, 3, 269, 'Thalassian Daisy', 0, 4, 1, 43, 2020072, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

replace into gameobject_loot_template values
(2020072,41121,-100,0,1,1,0);

-- Arcane Golem Revolt
delete from quest_template where entry = 41192;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41187,41192,2,5225,5,3,0,0,'Arcane Golem Revolt','Do you see these... withered husks?$B$B<Phylas sighs with frustration, his gaze fixed on the malnourished, once-elves>$B$BWe may very well end up like this if the Silver Sun Mine remains unreclaimed. The arcane golems, once loyal laborers, have been struck by some sort of arcane discharge – no doubt the handiwork of those so-called Blood Elves. It\'s driven them mad! The mine is now inaccessible, and we\'ve been severed from the source of those sweet, sweet arcane crystals.$B$B<Phylas shrugs, a mix of resignation and frustration on his face.>$B$BBut alas, the Regency Council seems more interested in courtly backstabbing than offering any meaningful assistance. So, if you\'ve got the mettle for it, maybe you could clear out the mine of these deranged arcane golems? Payment, of course, will be in clear silver. A fair compensation for a dangerous task.','Clear out the Silver Sun Mine by disposing of 8 Malfunctioning Arcane Golems, 6 Defective Arcane Golems and 4 Arcane Pounders.','Every moment you linger means less arcane crystals for those in need.','The common folk yet again take matters into their own hands, endeavoring to mend the fallout left by those who consider themselves above such concerns. Thank you, $c. You have saved many.',0,0,0,0,0,0,0,0, 61777,8,61778,6,61779,4,0,0, 0,0, 100,3150,450, 269,150,0,0,0,0,0,0, 0,0,0, 0,0,0,0,0,0,0,0, 41109,1,41110,1,41111,1,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61829, 41192);
replace into creature_involvedrelation  (id, quest) values (61829, 41192);
update quest_template set requiredraces = 589		 where entry = 41192;

-- A Troubling Presence
delete from quest_template where entry = 41193;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41189,41193,2,5225,5,3,0,0,'A Troubling Presence','$N, may I borrow a moment of your time? Your past assistance has not gone unnoticed, and there\'s a delicate matter that requires your attention.$B$BIt appears we are not alone in this new refuge. Our scouts have reported the presence of a significant force atop a nearby hill—our former brethren, the so-called blood elves. They are loyal to the traitorous prince, Kael\'thas, and their dependence on dark magic clouds their judgment. They pose a threat to our cause, and their proximity to Brinthilien raises concerns.$B$BI must task you with a challenging mission: seek out and eliminate this group of blood elves. They are led by a man named Veloren Brightstar, a figure whose removal will sow chaos among their ranks. The safety of our community hinges on the success of this mission.','Find the blood elf camp and eliminate the threat to Brinthilien. Return to Commander Anarileth once the task is done.','Have you found the blood elf camp?','The news of our former kin\'s demise brings me no pleasure; it is a somber reminder of the conflicts that have arisen among those who were once united. Their aggression left us with no recourse but to defend our newfound home.$B$BMay their spirits find solace in the embrace of the Eternal Sun, despite the shadows that clouded their hearts.',0,0,0,0,0,0,0,0, 61786,8,61787,1,0,0,0,0, 0,0, 100,2730,390, 269,150,0,0,0,0,0,0, 0,0,0, 0,0,0,0,0,0,0,0, 41112,1,41113,1,41114,1,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61851, 41193);
replace into creature_involvedrelation  (id, quest) values (61851, 41193);
update quest_template set requiredraces = 589		 where entry = 41193;

-- A Letter from the Royalty
delete from quest_template where entry = 41194;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41189,41194,2,5225,5,3,0,0,'A Letter from the Royalty','I trust this letter finds you in good health. It is with a heavy heart that I bring to your attention a matter of utmost importance. Intelligence has been gathered, suggesting that the dissidents from Alah\'Thalas are in the preparatory stages of a movement against us.$B$BWhile our agents are vigilant within the city, it is imperative that you maintain a watchful eye over the refugees situated in Brinthilien. Exercise utmost caution and restraint, refraining from any provocation or direct confrontation with the individuals in question. $B$BI urge you to remain unseen in your observations, acting with discretion and prudence. Your commitment to this task is crucial in safeguarding the welfare of our people and the integrity of our cause.$B$BWith unwavering trust in your capabilities,$B$BViceroy Eldin Sunstrider.','Bring the Feltouched Letter to Commander Anarileth.','Yes?','So, this missive was recovered from the commander\'s remains?$B$BThe contents are disquieting, and it is imperative that this letter reaches the Regency Council in Alah\'Thalas without delay. The mention of spies infiltrating our ranks within the city is a matter of grave concern.',41122,1,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 30,3920,560, 269,100,0,0,0,0,0,0, 0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

-- replace into creature_questrelation		(id, quest) values (61851, 41194);
replace into creature_involvedrelation  (id, quest) values (61851, 41194);
update quest_template set requiredraces = 589		 where entry = 41194;

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41122,5567,'Feltouched Letter',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0,7);

update item_template set start_quest = 41194 where entry = 41122;

replace into creature_loot_template values
(61787,41122,100,0,1,1,0);

-- Message for the Windrunner
delete from quest_template where entry = 41195;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (41194,41195,2,5225,5,3,0,0,'Message for the Windrunner','Quickly now, time is of the essence. This missive must find its way to the Regency Council with the swiftness of the wind before circumstances turn dire.$B$B<Commander Anarileth leans in, her voice dropping to a hushed tone.>$B$BYet, a caution weighs upon these words. Not every member within the Council is to be held in unquestionable trust. Ensure, with the utmost discretion, that this message reaches Vereesa Windrunner\'s hands exclusively. She alone is to be entrusted with the contents therein.','Bring the Feltouched Letter to Lady Vereesa Windrunner in Alah\'Thalas.','Another one of our kin finds a way into Alah\'Thalas. Welcome.','<Vereesa gracefully accepts the letter from your hand, her keen eyes perusing its contents with a measured intensity.>$B$BThank you, $c, for your diligence in bringing this matter to my attention. The urgency of the situation is apparent, further corroborating my apprehensions. It appears that the once understandable discontent has evolved into blatant mutiny.$B$B<She pauses, her demeanor reflecting a mix of concern and determination.>$B$BNot all within our midst remain loyal to our shared cause. We must swiftly identify these agents still aligned with Kael\'thas and promptly expel them from our city.',41122,1,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 41122,1, 0,490,70, 269,150,0,0,0,0,0,0, 0,0,0, 41115,1,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61851, 41195);
replace into creature_involvedrelation  (id, quest) values (80877, 41195);
update quest_template set requiredraces = 589		 where entry = 41195;

-- Maddening Hunger
delete from quest_template where entry = 41196;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,41196,2,5225,4,3,0,0,'Maddening Hunger','I can\'t take it- I can\'t take it anymore! You! YOU! Come here you little-$B$B<Ranathir shudders and shakes his head, his voice lowering.>$B$BNo, no that\'s not me. I\'m sorry. I\'m sorry, please don\'t- you must forgive me, that wasn\'t me, I didn\'t mean it. But I...you see...I haven\'t had my dose of mana in...in...$B$B...how long has it been? I feel like lately time has been standing still and laughing at me. Please, I need you to bring me an arcane crystal from the mines. The golems make it so hard to get them, and there are never enough. It\'s never enough...$B$BPlease. Please hurry. I can\'t...stand it.','Fetch a charged arcane crystal from the mines and bring it back to Ranathir.','Some days I\'m so worried that I\'m going to die...but some days I\'m terrified that I won\'t.','Oh! Oh you got it! Oh blessed-$B$B<Ranathir quickly lowers his voice, clutching the crystal to his chest and looking around at the other Withered.>$B$BThank you. Thank you. Today is going to be all right. Today will be great. This is great. This is...$B$B<His grasp on the crystal tightens, his hands beginning to shake. His voice suddenly drops to a trembling whisper.>$B$BNever enough...',41123,1,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0, 60,2730,390, 269,100,0,0,0,0,0,0, 0,0,0, 0,0,0,0,0,0,0,0, 41116,1,41117,1,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61850, 41196);
replace into creature_involvedrelation  (id, quest) values (61850, 41196);
update quest_template set requiredraces = 589		 where entry = 41196;

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41123,33969,'Charged Arcane Crystal',12,1,2048,1,-1,-1,1,10,-1,-1,-1,-1,4,'',0,4);

REPLACE INTO gameobject_template VALUES
(2020073, 3, 31, 'Arcane Crystal Package', 0, 4, 1, 43, 2020073, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

replace into gameobject_loot_template values
(2020073,41123,-100,0,1,1,0);

-- Delivery to Alah\'Thalas
delete from quest_template where entry = 41197;
replace into quest_template (prevquestid, entry, method, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, RewMoneyMaxLevel, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4,requiredminrepfaction,requiredminrepvalue,objectivetext1) values (0,41197,2,5225,5,4,0,0,'Delivery to Alah\'Thalas','Heading to the city of Alah\'Thalas, are you? If so, I\'ve a task that requires your aid. My companion Tiriel has established an inn for the influx of refugees making their way to the city, and, as you can imagine, it\'s teeming with occupants. We\'ve just received a fresh supply package from the Wildhammers, and it would be of immense help if you could deliver it to her. You\'ll find Tiriel\'s inn adjacent to the city entrance, the first building on your left as you traverse Anasterian Park.','Deliver the Wildhammer Supply Package to Tiriel Brightwater in Alah\'Thalas.','Welcome to my inn, traveler. We are out of beds for now, but you can always sleep on the floor, right?','Ah, it\'s from Solenia? My dear girl is truly sweet. I appreciate your kindness in delivering it, stranger. If you happen to cross paths with her again, convey my gratitude and tell her she must come to visit me. There are matters of great importance that we need to... discuss.',41124,1,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 41124,1, 0,910,130, 269,25,0,0,0,0,0,0, 0,0,0, 0,0,0,0,0,0,0,0, 2070,5,159,5,0,0,0,0, 0,0,'');

replace into creature_questrelation		(id, quest) values (61878, 41197);
replace into creature_involvedrelation  (id, quest) values (61831, 41197);
update quest_template set requiredraces = 589		 where entry = 41197;

replace into item_template (entry, display_id, name, class, quality, flags, buy_count, allowable_class, allowable_race, item_level, stackable, spellcooldown_1, spellcategorycooldown_1, spellcooldown_2, spellcategorycooldown_2, bonding, description, page_text, material) values
(41124,7925,'Wildhammer Supply Package',12,1,2048,1,-1,-1,1,1,-1,-1,-1,-1,4,'',0,3);

