
replace into `item_template` values (81228, 0, 0, 0, 'Skin Change Token: Tauren Spirit Walker', '', 30658, 2, 0, 1, 0, 0, 0, -1, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12244, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'item_skin_change');
update item_template set quality = 1 where entry = 81228;
update item_template set name = 'Skin Change Token: Human Death Knight', allowable_race = 1 where entry = 81210;
update item_template set name = 'Skin Change Token: Human Scholomance Student', allowable_race = 1 where entry = 50106;

replace into `item_template` values (81229, 0, 0, 0, 'Skin Change Token: Dwarf Death Knight', '', 30658, 2, 0, 1, 0, 0, 0, -1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12244, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'item_skin_change');
update item_template set quality = 1 where entry = 81229;

update item_template set quality = 3, max_count = 1 where entry in (12325, 12326, 12327, 8630, 12302, 12303);

replace into `item_template` values (81230, 0, 0, 0, 'Skin Change Token: Gnome Scholomance Student', '', 30658, 2, 0, 1, 0, 0, 0, -1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12244, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'item_skin_change');
update item_template set quality = 1 where entry = 81230;

update item_template set display_id = 17607 where entry = 18768;
update item_template set display_id = 17606 where entry = 12303;
update item_template set display_id = 17606 where entry = 80446;
update item_template set display_id = 17606 where entry = 18902;

update item_template set name = 'Black Zulian Panther', description = 'The jungle trolls have long coveted panther fangs, using them for rituals or as ingredients in mojos.', max_count = 1, spellid_1 = 10787 where entry = 12303;

REPLACE INTO `item_template` VALUES (81231, 10, 15, 0, 'Tamed Rak\'Shiri', 'Taming this savage breed requires patience, strength, and a large supply of fake mice and twine.', 23606, 3, 80, 1, 100000, 0, 0, -1, -1, 40, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46208, 0, 0, 0, -1, 330, 3000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1, NULL);

REPLACE INTO `item_template` VALUES (81232, 10, 15, 0, 'Azure Frostsaber', 'The lack of spots or stripes marks this beast as a descendant of the most ancient frostsaber line.', 23606, 3, 80, 1, 100000, 0, 0, -1, -1, 40, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46207, 0, 0, 0, -1, 330, 3000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1, NULL);

update item_template set name = 'White Stallion', description = 'The powerful and unyielding white stallion features heavily in the myths of ancient human tribes.', max_count = 1 where entry = 12353;
update item_template set name = 'Armored Alliance Steed', max_count = 1, quality = 4 where entry = 80449;
update item_template set name = 'Armored Black Deathcharger', description = 'When fallen heroes are raised into undeath, so too are their horses.', max_count = 1 where entry = 23193;
update item_template set name = 'Nightmare Shadowrunner', description = 'A nightmarish steed of hardened steel and vengeful spirits, this companion will follow you to the depths of the Molten Core and back without complaint.',  max_count = 1 where entry = 50407;

update item_template set name = 'Armored Brewfest Ram', description = 'Dwarves attribute this breed\'s even temperament to rigorous training, but other races argue that a daily diet of strong ale has something to do with it.', max_count = 1, quality = 4 where entry = 80443;

REPLACE INTO `item_template` VALUES (81233, 10, 15, 0, 'Armored Ironforge Ram', 'Wildhammer Fact Checker claims that this specific breed was the first type of ram domesticated by the dwarves when they settled in Dun Morogh.', 17343, 4, 64, 1, 1000000, 0, 0, -1, 589, 60, 60, 762, 150, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 45032, 0, 0, 0, 1, 330, 3000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);

update item_template set required_reputation_faction = 47, required_reputation_rank = 7 where entry = 81233;

REPLACE INTO `item_template` VALUES (81234, 10, 15, 0, 'Brewfest Ram', 'Brewers retired this mount from active advertising service after complaints that the beasts were "too temperamental" to control in major cities.', 17343, 3, 80, 1, 100000, 0, 0, -1, -1, 40, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 45034, 0, 0, 0, -1, 330, 3000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1, NULL);

update item_template set name = 'Ancient Quel\'dorei Steed', description = 'Comes from a lineage of fine horses that once grazed near the shores of the Well of Eternity.', max_count = 1, quality = 3, spellid_1 = 46445 where entry = 50399;

delete from item_template where entry in (875, 80439, 80440, 8583, 2415, 50400, 14062);

update item_template set name = 'Armored Stormwind Warhorse' where entry = 81225;

update item_template set name = 'Armored Red Deathcharger', description = 'When fallen heroes are raised into undeath, so too are their horses.' where entry = 18248;
update item_template set name = 'Armored Green Deathcharger', description = 'When fallen heroes are raised into undeath, so too are their horses.' where entry = 13334;
update item_template set name = 'Armored Purple Deathcharger', description = 'When fallen heroes are raised into undeath, so too are their horses.' where entry = 18791;

update item_template set name = 'Blue Skeletal Horse', description = 'The Forsaken believe that without a purpose, even beasts of burden suffer in undeath.' where entry = 13332;
update item_template set name = 'Brown Skeletal Horse', description = 'The Forsaken believe that without a purpose, even beasts of burden suffer in undeath.' where entry = 13333;
update item_template set name = 'Red Skeletal Horse', description = 'The Forsaken believe that without a purpose, even beasts of burden suffer in undeath.' where entry = 13331;

update creature_template set subname = 'War Mount Quartermaster' where entry = 12796;

REPLACE INTO `item_template` VALUES (81235, 10, 15, 0, 'Armored Crimson Deathcharger', 'Some horses merely adopt the dark. This horse was born in it.', 17786, 3, 80, 1, 100000, 0, 0, -1, -1, 40, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 45042, 0, 0, 0, -1, 330, 3000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1, NULL);

update item_template set name = 'Rivendare\'s Deathcharger', description = 'When Baron Rivendare became a champion of the Scourge, he condemned his favorite horse to join him in undeath.', quality = 4 where entry = 13335;

update item_template set name = 'Armored Brown Steed', description = 'A veteran of some of the toughest battles fought by the Argent Crusade.' where entry = 18777;
update item_template set name = 'Armored White Steed', description = 'A veteran of some of the toughest battles fought by the Argent Crusade.' where entry = 18778;
update item_template set name = 'Armored Golden Steed', description = 'Prized by horse breeders for their discipline and steadfastness.' where entry = 18776;

REPLACE INTO `item_template` VALUES (12354, 10, 15, 0, 'Palomino', 'Human nobles have long favored this majestic breed for its beautiful golden coat and flowing white mane.', 13108, 3, 64, 1, 100000, 0, 0, -1, 589, 40, 40, 762, 75, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16082, 0, 0, 0, 1, 330, 3000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);

update item_template set name = 'Pinto', description = 'Its calm temperament makes it ideal to train young children in horseback riding.' where entry = 2414;
update item_template set name = 'Chestnut Mare', description = 'Sturdy and steady.' where entry = 5655;
update item_template set name = 'Brown Horse', description = 'A favorite among Stormwind\'s guards thanks to its patience and stamina.' where entry = 5656;
update item_template set name = 'Black Stallion', description = 'Rumored to be favored by SI:7 for night missions due to its dark coat.' where entry = 1460;

update item_template set name = 'Armored Black War Steed', description = 'Trained to withstand brutal hand-to-hand combat in the fiercest battlefields.' where entry = 18241;

REPLACE INTO `item_template` VALUES (12353, 10, 15, 0, 'White Stallion', 'The powerful and unyielding white stallion features heavily in the myths of ancient human tribes.', 13108, 3, 64, 1, 100000, 0, 0, -1, 589, 40, 40, 762, 75, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16083, 0, 0, 0, 1, 330, 3000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);

REPLACE INTO `item_template` VALUES (81236, 10, 15, 0, 'Armored Grey Steed', 'A veteran of some of the toughest battles fought by the Argent Crusade.', 13108, 3, 80, 1, 100000, 0, 0, -1, -1, 40, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 45040, 0, 0, 0, -1, 330, 3000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1, NULL);

update item_template set name = 'Armored Dark Rider\'s Steed', max_count = 1 where entry = 81090;

update item_template set name = 'Zebra', description = 'It has stripes!', max_count = 1, display_id = 22037 where entry = 50426;

REPLACE INTO `item_template` VALUES (50400, 10, 15, 0, 'Barrens Zhevra', 'Zhevras are rarely used as mounts in Azeroth due to their stubborn nature and tendency to bite.', 36688, 3, 80, 1, 100000, 0, 0, -1, -1, 40, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46453, 0, 0, 0, -1, 330, 3000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1, NULL);

update item_template set name = 'Armored White Kodo', description = 'An alpha member of the herd, this kodo is a prime example of the mighty creatures which thunder through the Northern Barrens.' where entry = 18793;
update item_template set name = 'Armored Grey Kodo', description = 'An alpha member of the herd, this kodo is a prime example of the mighty creatures which thunder through the Northern Barrens.' where entry = 18795;
update item_template set name = 'Armored Brown Kodo', description = 'An alpha member of the herd, this kodo is a prime example of the mighty creatures which thunder through the Northern Barrens.' where entry = 18794;

update item_template set name = 'Brown Kodo', description = 'The kodo is the backbone of our people. Wherever the Horde goes - in trade, settlement, or war - there you will find the mighty kodo.' where entry = 15290;
update item_template set name = 'Brown Kodo', description = 'The kodo is the backbone of our people. Wherever the Horde goes - in trade, settlement, or war - there you will find the mighty kodo.' where entry = 15277;

update item_template set name = 'Ancient Teal Kodo', description = 'The kodo is the backbone of our people. Wherever the Horde goes - in trade, settlement, or war - there you will find the mighty kodo.' where entry = 15293;

REPLACE INTO `item_template` VALUES (15292, 10, 15, 0, 'Ancient Green Kodo', 'An alpha member of the herd, this kodo is a prime example of the mighty creatures which thunder through Desolace.', 29449, 3, 64, 1, 1000000, 0, 0, -1, -1, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18991, 0, 0, 0, 0, 330, 3000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);

delete from npc_vendor where item in (15293, 15292);

update item_template set name = 'Armored Thunder Bluff Kodo' where entry = 81198;
update item_template set name = 'Armored Brewfest Kodo' where entry = 80455;

update item_template set spellid_1 = 46483 where entry = 51421;
update item_template set spellid_1 = 46459, description = 'Carries all your worldly possessions, there and back.' where entry = 50007;
update item_template set spellid_1 = 46457 where entry = 50005;
update item_template set spellid_1 = 46472 where entry = 50602;
update item_template set spellid_1 = 46460 where entry = 50009;
update item_template set spellid_1 = 46002 where entry = 51715;
update item_template set spellid_1 = 46466 where entry = 50085;

delete from custom_pet_entry_relation where item_entry in (51421, 50007, 50005, 50602, 50009, 50085);

REPLACE INTO `creature_template` VALUES (81102, 0, 18542, 0, 0, 0, 'Chieftain\'s Kodo', '', 0, 1, 1, 64, 64, 0, 0, 0, 35, 0, 1, 1.14286, 1, 20, 5, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');

REPLACE INTO `item_template` VALUES (81237, 10, 15, 0, 'Chieftain\'s Kodo', 'This Kodo with a Ceremonial Attire is usually reserved for Clan Chieftains, but after the Tauren joined the Horde, they have been made available to Champions of Thunderbluff.', 29448, 4, 64, 1, 3500000, 0, 0, -1, 434, 40, 60, 762, 150, 0, 0, 0, 81, 7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18363, 0, 0, 0, 1, 330, 3000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);

replace into custom_mount_entry_relation values (81237, 81102);

update item_template set name = 'Armored Black War Wolf', description = 'Prized by Orgrimmar guards for their keen sense of smell.' where entry = 18245;
update item_template set name = 'Armored Black War Kodo', description = 'Bred for their aggressive, unpredictable demeanor by the Kor\'kron stablemasters, the Black War Kodos\' trumpeting call signifies that blood will soon be shed.' where entry = 18247;

update item_template set name = 'Armored Black War Raptor', description = 'Bred from the same vicious line of raptors which sired Ohgan and brought victory to the Gurubashi Empire.' where entry = 18246;

update item_template set name = 'Monster - Mace1H, Korth\'azz', description = '' where entry = 22724;

delete from npc_vendor where item in (12330, 12351, 8586, 13317);

update item_template set name = 'Armored Brown Wolf', description = 'The wolves of the Horde are befriended, not domesticated.' where entry = 18796;
update item_template set name = 'Armored Gray Wolf', description = 'The wolves of the Horde are befriended, not domesticated.' where entry = 18798;
update item_template set name = 'Armored Timber Wolf', description = 'The wolves of the Horde are befriended, not domesticated.' where entry = 18797;

update item_template set name = 'Brown Wolf', description = 'Can howl loudly enough to be heard for miles.' where entry = 5668;
update item_template set name = 'Dire Wolf', description = 'Can howl loudly enough to be heard for miles.' where entry = 5665;
update item_template set name = 'Timber Wolf', description = 'Can howl loudly enough to be heard for miles.' where entry = 1132;

update item_template set name = 'Frostwolf Howler', description = 'Raised in the Alterac Mountains by the Frostwolf Clan.' where entry = 19029;
update item_template set name = 'Winter Wolf', description = 'Ancient furbolg legends claim that wolves born with a white coat are blessed by Azeroth\'s two moons.' where entry = 1133;

update item_template set name = 'Ancient Black Wolf', description = 'Once thought to be nearly extinct, this wolf can still occasionally be seen in the company of a few Horde veterans.' where entry = 1041;
update item_template set name = 'Armored Horde Wolf', description = 'If asked to fetch, will most likely bring you back the head of a small mammal or humanoid.' where entry = 80447;

delete from item_template where entry in (12330, 5663, 1133, 80448, 8586, 13317, 8590, 80436);

REPLACE INTO `item_template` VALUES (5663, 10, 15, 0, 'Ancient Red Wolf', 'Almost none remain in the whole of Azeroth; only the most experienced will have seen one.', 16208, 3, 80, 1, 100000, 0, 0, -1, -1, 40, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 579, 0, 0, 0, -1, 330, 3000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1, NULL);

REPLACE INTO `item_template` VALUES (12351, 10, 15, 0, 'Ancient Arctic Wolf', 'Ancient furbolg legends claim that wolves born with a white coat are blessed by Azeroth\'s two moons.', 16208, 3, 80, 1, 100000, 0, 0, -1, -1, 40, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16081, 0, 0, 0, -1, 330, 3000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1, NULL);

REPLACE INTO `item_template` VALUES (51249, 0, 15, 0, 'Snowball', 'Happy New Year!', 16207, 3, 0, 1, 0, 0, 0, -1, -1, 60, 60, 762, 150, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 581, 0, 0, 0, 1, 330, 3000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);

update item_template set name = 'Armored Darkspear Raptor' where entry = 81182;
update item_template set name = 'Armored Blue Raptor', description = 'Longtime allies of the trolls, these jungle hunters form a special bond with their masters. They become steed, guardian, and friend.' where entry = 18788;
update item_template set name = 'Armored Olive Raptor', description = 'Longtime allies of the trolls, these jungle hunters form a special bond with their masters. They become steed, guardian, and friend.' where entry = 18789;
update item_template set name = 'Armored Orange Raptor', description = 'Longtime allies of the trolls, these jungle hunters form a special bond with their masters. They become steed, guardian, and friend.' where entry = 18790;

update item_template set name = 'Turquoise Raptor', description = 'Bred from the fiercest stock anywhere and guaranteed not to bite (much).' where entry = 8591;
update item_template set name = 'Emerald Raptor', description = 'Bred from the fiercest stock anywhere and guaranteed not to bite (much).' where entry = 8588;
update item_template set name = 'Violet Raptor', description = 'Bred from the fiercest stock anywhere and guaranteed not to bite (much).' where entry = 8592;

update item_template set name = 'Armored Razzashi Raptor', description = 'The only known Razzashi Raptors were said to have been in the custody of Bloodlord Mandokir in Zul\'Gurub. This species of raptor has not been seen in many years.' where entry = 19872;

update item_template set name = 'Armored Violet Raptor', description = 'Longtime allies of the trolls, these jungle hunters form a special bond with their masters. They become steed, guardian, and friend.', max_count = 1 where entry = 50402;
update item_template set name = 'Armored Red Raptor', description = 'Longtime allies of the trolls, these jungle hunters form a special bond with their masters. They become steed, guardian, and friend.', max_count = 1 where entry = 50403;
update item_template set name = 'Armored Ivory Raptor', description = 'Longtime allies of the trolls, these jungle hunters form a special bond with their masters. They become steed, guardian, and friend.', max_count = 1 where entry = 50401;
update item_template set name = 'Armored Obsidian Raptor', description = 'Longtime allies of the trolls, these jungle hunters form a special bond with their masters. They become steed, guardian, and friend.', max_count = 1 where entry = 50404;

update item_template set name = 'Black Bear', description = 'He\'s big, he\'s ready for battle, and he\'s a bear. What more could you want in a mount?' where entry = 80433;
update item_template set name = 'Brown Bear', description = 'He\'s big, he\'s ready for battle, and he\'s a bear. What more could you want in a mount?' where entry = 80438;
update item_template set name = 'Armored Brown Bear', description = 'The Amani trolls decorate these ferocious mounts in magic amulets and ceremonial masks as a way to venerate the bear god Nalorakk.' where entry = 81226;

update item_template set name = 'Armored Black Bear', description = 'This ursine mount\'s swiftness is enhanced by its heavy armor.' where entry = 81154;
update item_template set name = 'Armored Purple Bear', description = 'This ursine mount\'s swiftness is enhanced by its heavy armor.' where entry = 81153;
update item_template set name = 'Armored Red Bear', description = 'This ursine mount\'s swiftness is enhanced by its heavy armor.' where entry = 81155;
update item_template set name = 'Armored White Bear', description = 'This ursine mount\'s swiftness is enhanced by its heavy armor.' where entry = 81158;

update item_template set description = 'Its moon changes like the wind.' where entry = 81207;

-- Make mounts into its own category:

update item_template set class = 15, subclass = 4 where entry in (23720, 50071,
50072,
50073,
50076,
50074,
81100,
81120,
81121,
12325,
12326,
8630,
12302,
12303,
18768,
80430,
12353,
80449,
23193,
50407,
80443,
15293,
80455,
1041,
12351,
80447,
8590,
50404,
50401,
50402,
50403,
81091,
81153,
81154,
81155,
81158,
13325,
81190,
81191,
15292,
81227,
80431,
81231,
50075,
81102,
18796,
18798, 
18797,
5668,
5665, 
1132,
81234,
13328,
18786,
18787,
18785,
13329,
5873
); -- Shop items
update item_template set class = 15, subclass = 4 where required_skill = 762;
update item_template set class = 15, subclass = 4 where name like '%Armored%';
update item_template set class = 15, subclass = 4 where name like '%Mechaspider%';
update item_template set class = 15, subclass = 4 where name like '%Steed%';
update item_template set class = 15, subclass = 4 where name like '%Leopard%';

-- todo: continue, fetch the rest.

delete from item_template where entry in (5875, 5874, 80456, 80442, 80444);
update item_template set class = 15, subclass = 0 where entry = 21222;
update item_template set class = 1, subclass = 0 where entry = 932;
delete from item_template where entry = 81225 and patch = 0;
update item_template set display_id = 13108 where entry = 81225;

delete from npc_vendor where item in (13328, 13327, 13326);

update item_template set name = 'Ancient Black Ram', description = 'I\'ve not seen this breed in in ages, but when they\'re ram tough they stick around. -Veron Amberstill.', required_skill = 0, required_level = 1, allowable_race = -1, quality = 3 where entry = 13328;

update item_template set name = 'Armored Brown Ram', description = 'The Barak Tor\'ol ram\'s thick bony skull and massive horns make it the ideal mount for charging through groups of armored enemies.' where entry = 18786;
update item_template set name = 'Armored Gray Ram', description = 'The Barak Tor\'ol ram\'s thick bony skull and massive horns make it the ideal mount for charging through groups of armored enemies.' where entry = 18787;
update item_template set name = 'Armored White Ram', description = 'The Barak Tor\'ol ram\'s thick bony skull and massive horns make it the ideal mount for charging through groups of armored enemies.' where entry = 18785;

update item_template set description = 'Male rams will often smash their thick skulls against each other for hours to impress a female. In that way, they\'re very similar to dwarves.' where entry in (5872, 13329, 5864, 5873);
update item_template set description = 'We have made a lot of improvements, but they are still based on the Mekkatorque designs.' where entry in (18772, 18773, 18774, 5873);
update item_template set description = 'The terradynamic exo-plotters are conjoined by hydraulic imaging to the equilibrium enhancers...' where entry in (8595, 13321, 8563);
update item_template set description = 'Forced to recall the model after numerous complaints of an "uncontrollable throttle", Gnomish engineers now refer to a proto-type blunder as a "model B".' where entry = 13326;
update item_template set description = 'This historic piece of gnomish engineering was forced into retirement due to its extremely "touchy" gyroscometer.' where entry = 13327;
update item_template set description = 'It\'s green.' where entry = 13325;

update item_template set name = 'Armored Green Mechanostrider' where entry = 18772;
update item_template set name = 'Armored White Mechanostrider' where entry = 18773;
update item_template set name = 'Armored Yellow Mechanostrider' where entry = 18774;