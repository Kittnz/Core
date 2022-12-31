UPDATE `quest_template` SET `Details` = 'So the shield really belonged to the tauren from Brackenwall. Good work.\n\nOn the other hand, the reported killing of Paval Reethe by our soldiers is troubling. Deeply troubling. I cannot just trust the Horde on this. My role, as a captain, is not only to order, but also to serve.\n\nI\'m worried that Lieutenant Caldwell only acted in his self defence. But, if the orc was really speaking the truth, you may find some evidence in Caldwell\'s belongings. You can find his quarters downstairs. He was sent there with a soldier named Hallan. Check hers, too.\n\nI will prepare the report for Lady Jaina.' WHERE `entry` = 40559;

UPDATE `quest_template` SET `Details` = 'Already we have established contact with the Horde Diplomat named Kagoro.\n\n$N, Please remain calm, and try not to provoke them. I know it may be difficult, given our history, but they are much like you and me.\n\nJust perhaps a bit more green.' WHERE `entry` = 40558;

UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue2` = -100 WHERE `creature_id` = 4662;
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1` = 20 WHERE `creature_id` = 4640;

UPDATE `quest_template` SET `MinLevel` = 32 WHERE `ZoneOrSort` = 5077;

UPDATE `quest_template` SET `RewRepFaction1` = 108 WHERE `entry` IN (40554, 40555, 40556, 40557, 40558);

UPDATE `item_template` SET `stackable` = 60 WHERE `entry` = 81301;

UPDATE `quest_template` SET `Details` = 'I feel pride. The fire that had settled before has once again been fueled. It\'s time for my last order.\n\n$N, I command you to find Zetharia and end this nightmare. As a last gift to my people, the Lord of the Living Flame has granted me the way to find her.\n\nFar to the south west in these lands and atop the rocks, she lingers, forever searching for new souls to torture. Make sure you succeed, if not she will probably torment your soul for generations, as she did to me and my people.' WHERE `entry` = 40717;

UPDATE `quest_template` SET `Details` = 'Trust is something you can\'t buy, $R.\n\nHere\'s the deal, lad. You earn the trust of this gryphon over here and you\'ll get your ride to the camp. Fail and he\'ll have you as his breakfast.\n\nHah! Of course I\'m pulling your leg here, lad. This winged beast won\'t even budge unless it trust you completely.\n\nHow, you ask? Food, of course.\n\nAnd a toy. Go figure. He likes to gnaw on them discarded bones the Lion\'s Pride Inn\'s cook throws out with the trash.\n\nHe\'s gone and snapped all his, judging by the refuse at his talons.' WHERE `entry` = 60070;

UPDATE `quest_template` SET `OfferRewardText` = 'The gryphon sniffs the air about you excitedly, sensing the treats you\'ve brought.\n\nHis pupils grow wide and he chirps with joy at the sight of his favorite Chew Toy in your hand.\n\nHe looks happy!' WHERE `entry` = 60070;

UPDATE `broadcast_text` SET `male_text` = 'The gryphon\'s languid demeanor suggests he\'s not ready for flight any time soon.\n\nLethargic and hungry, no doubt. Some spare Dwarven Mild would perk him right up and likely earn you a flight.', `female_text` = NULL, `chat_type` = 0, `sound_id` = 0, `language_id` = 0, `emote_id1` = 0, `emote_id2` = 0, `emote_id3` = 0, `emote_delay1` = 0, `emote_delay2` = 0, `emote_delay3` = 0 WHERE `entry` = 90366;

UPDATE `quest_template` SET `Details` = 'Winter. A time to eat, and eat well! I always love to try new foods and exchange cultural foods of my people with others.\n\nPerhaps we can make a trade, yes? I would like to sample some of the foods of other races. You find some, and I will offer you a special dish in return.\n\nGather for me a variety that my people and I may enjoy a feast, and I will make sure you are well rewarded for your seasonal spirit!' WHERE `entry` = 40743;

UPDATE `item_template` SET `description` = 'A gesture of good faith from a snowman. Maybe you\'re not on Greatfather Winter\'s naughty list after all!' WHERE `entry` = 84039;

UPDATE `quest_template` SET `Details` = 'Not all of us yetis are evil. There was a time when my kind stood alongside the great tree and offered presents to the denizens of Azeroth.\n\nSuch a time has passed, and many of the yeti now walk a darker path.\n\nTo the south is their den, in which they house the evil Snowball. Uttering such a name chills even me.\n\nI ask that you lessen their ranks, and to let those that celebrate do so in peace without the worry of evil overshadowing the good of the holiday.' WHERE `entry` = 40772;

UPDATE `broadcast_text` SET `male_text` = 'Welcome to Icepaw Village. The others will treat you with kindness in these lands.\n\nLet us join together to enjoy this Winter Veil, and perhaps spread some of the foreign food around, yes?', `female_text` = NULL, `chat_type` = 0, `sound_id` = 0, `language_id` = 0, `emote_id1` = 0, `emote_id2` = 0, `emote_id3` = 0, `emote_delay1` = 0, `emote_delay2` = 0, `emote_delay3` = 0 WHERE `entry` = 61121;

UPDATE `broadcast_text` SET `male_text` = 'I am not that scary. Don\'t be afraid to say hello. The other yetis give us all a bad name.', `female_text` = NULL, `chat_type` = 0, `sound_id` = 0, `language_id` = 0, `emote_id1` = 0, `emote_id2` = 0, `emote_id3` = 0, `emote_delay1` = 0, `emote_delay2` = 0, `emote_delay3` = 0 WHERE `entry` = 61136;

UPDATE `quest_template` SET `OfferRewardText` = 'Well, that took long enough. Last time I deal with him. He\'s a horrible contractor.\n\nA goblin should know never to be late, especially not with me. Here, take the extra coin he gave me for actually getting me this fur.\n\nNo doubt you\'re responsible for it getting here at all. Without you, I\'d be out of a shipment of fancy cloaks.' WHERE `entry` = 55038;

UPDATE `gameobject` SET `spawntimesecsmin` = 2700, `spawntimesecsmax` = 2700 WHERE `id` = 324;
UPDATE `gameobject` SET `spawntimesecsmin` = 2700, `spawntimesecsmax` = 2700 WHERE `id` = 2002626;

UPDATE `quest_template` SET `QuestLevel` = 56 WHERE `entry` = 40286;

UPDATE `creature_template` SET `dmg_min` = 130, `dmg_max` = 186 WHERE `entry` = 5295;

UPDATE `quest_template` SET `RewItemId1` = 0, `RewItemCount1` = 0 WHERE `entry` = 40549;
UPDATE `quest_template` SET `RewItemId1` = 0, `RewItemCount1` = 0 WHERE `entry` = 40573;

UPDATE `quest_template` SET `RewRepFaction1` = 54 WHERE `entry` = 40651;

UPDATE `quest_template` SET `Details` = 'It does appear that the Deserter\'s are behind the burning of the inn. If there is ever to be justice, we must stop them from continually dragging more and more of our most loyal into their ranks.\n\nThere shall be no quarter, they are wanted and we shall dole out justice, for all of the lives lost. For the deceit caused.\n\nDirectly to the west of Theramore, to the north eastern edge of the Quagmire is the Deserter\'s Hideout, it is there that they gain their strength.\n\nFind Sellick Voss, the new leader of the camp, slay him, and bring his medallion to me as proof of the deed.', `Objectives` = 'Find Sellick Voss, slay him, and bring his medallion to Captain Garran Vimes at Theramore Isle in Dustwallow Marsh.', `OfferRewardText` = 'Without you, we would still be in the dark. Who knows, maybe you stopped another war between the Horde and the Alliance? You are a hero of Theramore, for all of the work you have done to ease the tensions, and solve this mystery.\n\nFor this, I would like you to take one of these weapons from my personal armory.\n\nConcerning the Vengeful Mariner. Sailors coming to Theramore have reported seeing a shadowy figure stalking the coast. Some of our fishermen have gone missing in recent months, too. It may be connected. But, a question remains. Why was he so important to the deserters, that they killed innocents to keep this a secret for just a while longer? We need to get to the bottom of this.' WHERE `entry` = 40565;

UPDATE `quest_template` SET `Details` = 'Hmm. One day, you may walk among us as an esteemed visitor, $r. You should be thankful some of our kind already respect you.\n\nWhen we think you have helpes us enough to be truly accepted, I will have further words with you. There are some matters that I cannot entrust with many in the tribe, let alone an outsider.\n\n<He continues rambling quietly to himself for some time after his business with you is finished.>', `Objectives` = 'Reach honored reputation with the Gelkis Centaur, when complete, return to Yesu\'gei at Gelkis Village in Desolace.', `OfferRewardText` = 'What is your name, $r? $N? Very well... You have earned our trust enough.\n\nListen to what I have to say next...' WHERE `entry` = 40625;

UPDATE `quest_template` SET `Details` = 'Why hello there!\n\nWhat, shocked to see a gnome so far west? Well, you should be, there isn\'t many of my kind so far from home.\n\nOr well, what used to be home.\n\nEither way, I\'m looking to conduct experiments now that I have some time and space to myself, the first of which requires some flammable, and quite dangerous materials!\n\nFar to the west is a place called The Charred Vale, it is there that roving flame elementals can be found, from them I\'d like to acquire something called a \'Flickering Flame\'.\n\nGet it for me, and I\'ll make sure you\'re compensated.', `Objectives` = 'Acquire a Flickering Flame from the fire elementals in The Charred Vale for Spigol Kneebolt at Bael Hardul in Stonetalon Mountains.', `OfferRewardText` = 'Oh, my word, this certainly is quite exotic!\n\nI must thank you for going through all the trouble, now if you would please, my mind is racing with ideas!' WHERE `entry` = 40699;

UPDATE `quest_template` SET `Details` = 'The devastation caused by the Venture Co. knows no end. Each day, we hear more and more news of the sheer horror they commit against the land.\n\nThe balance of nature is a delicate matter, one that must be handled with care.\n\nYet, the Venture Co. cares little for it. The are driven by greed and their actions are directly responsible for much of the suffering of the lands they inhabit. I\'ve recently received news of their most terrible operation yet.\n\nTo the southwest, just north of the Charred Vale, a new passageway into the mountains has been carved out for their latest exploitation of the land.\n\nThis path leads to the Blacksand Oil Fields. The land has been ripped asunder, dominated by a large oil platform that oversees the entire operation.\n\nPut an end to their operation, once and for all!', `Objectives` = 'Slay Oilmaster Higgle Wirefuse to put an end to the Blacksand Oil Fields operations, then return to Silmaron at Stonetalon Peak in Stonetalon Mountains.', `OfferRewardText` = 'Your efforts are truly spectacular, without your help, I am not sure how we would have been able to put an end to the Venture Co. within the Blacksand Oil Fields.\n\nI must thank you, and from the bottom of my heart, perhaps we may bring balance to Stonetalon after all.' WHERE `entry` = 40706;

UPDATE `quest_template` SET `Details` = 'For too long have we druids been merciful towards our enemy, The Venture Company.\n\nThey care nothing for the world around them, stubbornly working towards their goals for their own greed. If we are ever to put an end to their callous destruction of the land, then we must match their brutality.\n\nThere is too much at stake for us to stand idle, and so I ask that you slay the workers at the Blacksand Oil Fields. Collect their Blacksand Badges as proof of your deeds, cutting down as many of their numbers as you can.\n\nYou can find this misbegotten place northwest of the Charred Vale, through a passageway they\'ve cut into the mountains.\n\nGo there and put an end to this madness.', `Objectives` = 'Gather 18 Blacksand Badges from Venture Co. at Blacksand Oil Fields for Silmaron at Stonetalon Peak in Stonetalon Mountains.', `RequestItemsText` = 'If we do not act decisively, the world will continue to be devastated and exploited for the Venture Company\'s profits.' WHERE `entry` = 40707;

UPDATE `quest_template` SET `Details` = 'Shortly after you returned from scouting the Jasperlode Mine, I received reports that a brood of spiders have been seen moving from Duskwood into the depths of the mine.\n\nWorse still, they\'re preying on the kobolds in the mine, giving them an abundant source of food with which to increase their population.\n\nKobolds, the Defias, and now spiders? We cannot afford to spread our forces any thinner to deal with yet another threat.\n\nReturn to the Jasperlode Mine and clear out the infestation before they encroach upon the whole of Elwynn Forest!', `Objectives` = 'Kill 8 Mine Spiders in Jasperlode Mine northeast of Goldshire, then return to Marshal Dughan in Goldshire.', `OfferRewardText` = 'Such a relief it is to know that those spiders will threaten Elwynn no more.\n\nPlease accept this coin on behalf of Stormwind.' WHERE `entry` = 60154;

UPDATE `quest_template` SET `Details` = 'To the Nobles of Stormwind, a Paladin is an elite soldier recognized for acts of great valor on the battlefield and for smiting enemies of the kingdom with righteous fury. These are not the qualities which define us as servants of the Light, however. It is for our kindness and compassion for the weak and the poor we owe the people\'s faith. Even the most simple act of kindness is the cornerstone of a Paladin\'s duty and legacy, what separates us from a fool with a cudgel.\n\nThere is a struggling family in the Eastvale Logging Camp in need of assistance stocking their food stores for the year. I take it upon myself to aid them when possible, but with the mounting threats across the land of late, I am bound by duty to Goldshire. Please, aid them in my stead. Hunt the Rockhide Boars found to the south near the forest\'s edge along the riverbank, and bring their meat to the Eastvale Logging Camp.', `Objectives` = 'Objectives: Bring 8 pieces of Rockhide Boar Meat to Eldrin in the Eastvale Logging Camp.', `OfferRewardText` = '<You explain why Brother WIlhelm sent you. Eldrin\'s angry, defensive posture softens as you explain, and eventually you see the shine of tears in his eyes.>\n\nMiles away and as busy serving the Light as he is, yet he still finds time to help us. It pains me to burden him so yet again.\n\nHe\'s already done so much for us, you see. Things\'ve been hard this year, so I\'ve been goin\' without so Sara and Eric don\'t have to, and... Well, thank you.\n\nBless Brother Wilhelm, and bless you, $N.\n\nHere. I know it\'s not much, but Sara makes them for the locals. Maybe you can find some use in it.\n\nTake it! It\'s the least we can do in return for your selfless deed.' WHERE `entry` = 60141;

UPDATE `quest_template` SET `Details` = 'So, Mildred asked you to help retrieve her pumpkins? Of course I\'ll help! I\'ve always been fond of the Stonefields.\n\nWhere to find them? Well, the only gnolls I know of nearby are the Riverpaws. There\'s a large camp full of them led by a mighty gnoll known all over Elwynn as Fedfennel. Rumor has it he\'s been eaten by his own rivals...\n\nI digress. The camp is further up to the north, past Stone Cairn Lake. It\'s tucked away in a distant corner that the guards don\'t patrol, so the gnolls run rampant out there.\n\nWhile you\'re searching for stolen pumpkins, maybe you could help the Eastvale Logging Camp as well?\n\nThe gnolls won\'t be willing to part that easily with their pillaged goods, so you\'ll probably have to pry it from their cold dead paws. Sounds like Mildred would prefer it that way as well. Do us all a favor and cull some of the little vermin while you\'re there.\n\nWipe out a full brigade of them and we\'ll have at least a week of sound sleep.', `Objectives` = 'Kill 10 Riverpaw Runts and 10 Riverpaw Outrunners and return to Supervisor Raelen in Eastvale Logging Camp.', `OfferRewardText` = 'You did what? All by yourself?!\n\nWell, that\'s great news! Nt least the gnolls will no longer cause us trouble from now on!\n\nHow did you know? Terry told you?' WHERE `entry` = 60042;

