-- Tinyfin thing from discord
REPLACE INTO creature_involvedrelation VALUES (3978, 40115);

-- https://github.com/slowtorta/turtlewow-bug-tracker/issues/1179
UPDATE item_template SET item_level = 5 WHERE entry = 60112;

-- Fix for Coun
UPDATE creature_template SET name = '*' WHERE entry = 7;

-- make Shades of Jin'do undead instead of beasts / Xerron
update creature_template set type = 6 where entry = 14986;

-- https://github.com/slowtorta/turtlewow-bug-tracker/issues/1205
UPDATE creature SET spawntimesecsmin = 300, spawntimesecsmax = 300 WHERE id = 9318;

-- https://github.com/slowtorta/turtlewow-bug-tracker/issues/1193
UPDATE quest_template SET Details = 'Lapidis was always an interesting, if strange man, at the time we hadn\'t considered his refusal to our curiosity as something potentially bad. But hearing of what he has done upon Lapidis Isle has certainly shifted my opinion.\n\n<Ansirem Runeweaver studies the Shimmering Brass Key>. It would appear that this key still has lingering of magic upon it. It is possible to reconstruct the enchantment, but may take considerable power and regeants to do so. If the key is to work upon the lock as suggested, it will need to be both attuned, and enchanted to the magic that once powered it.\n\nIt is within my power to enchant this key with the same magic that once powered it. The coast of Feralas is covered in water elementals. Bring me a Pure Aqua Orb from one of them, it should be sufficient and powerful enough to mimic the magic of the key.' WHERE entry = 40165;

-- https://github.com/slowtorta/turtlewow-bug-tracker/issues/1203
UPDATE creature_template SET mechanic_immune_mask = 16401 WHERE entry = 8907;

-- Fix NPCS for Coun
UPDATE creature_template SET ai_name = "" WHERE entry IN (60664, 60665);
UPDATE creature SET spawntimesecsmin = 300, spawntimesecsmax = 300 WHERE id IN (60664, 60665); -- Not spawned on prod yet

-- fixed quest for Dragunovi
UPDATE quest_template SET RewItemId1 = 60270, RewItemCount1 = 1, RewChoiceItemId1 = 0, RewChoiceItemCount1 = 0 WHERE entry = 40196;

-- Fixed quest for Dragunovi
UPDATE quest_template SET Title = 'Krilana\'s Magnificent Quest', Details = 'Hello! You look strong! I need the help of someone strong. I am Krilana. Mama Eliza is taking care of me because my real mom died. She told me that my mother was the only survivor that managed to get to Caelan\'s Rest. In one of her stories, mama mentioned a necklace that my papa gave to my real mom but that it was lost in the wreckage.\n\nExpect for mama\'s story I have nothing to remember my parents. Could, could you please look for it? I heard that it was pretty and that it looked like the sun! I wanted to go and look for it myself, but mama won\'t let me, she says that there are ghosts there.', Objectives = 'Search the crates in high elven wrecks by the northwestern coast of Gilijim Isle for the Tattered Necklace. Put the mournful apparition to rest.' WHERE entry = 40370;

-- Dragunovi — 14.03.2022 at 11:00 pm: delete https://database.turtle-wow.org/?item=80764 as its a defunct version to avoid confusion
DELETE FROM item_template WHERE entry = 80764;

-- Item fix Dragunovi
UPDATE item_template SET name = 'Azshara Keeper\'s Staff', required_level = 0 WHERE entry = 60333;
