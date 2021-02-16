-- Updated loottable of Gurubashi Arena Chest:

replace into gameobject_loot_template values (16718, 80845, 4.3, 0, 1, 1, 0, 0, 10);
replace into gameobject_loot_template values (16718, 80846, 4.5, 0, 1, 1, 0, 0, 10);
replace into gameobject_loot_template values (16718, 80847, 4.2, 0, 1, 1, 0, 0, 10);
replace into gameobject_loot_template values (16718, 80848, 4.7, 0, 1, 1, 0, 0, 10);

replace into item_template values
 ('81124', '0', '4', '4', 'Helmet of the Scarlet Avenger', 'A blazing heart and a pile of heretics at your feet.', '40193', '3', '0', '1', '20094', '20094', '1', '-1', '-1', '62',
 '57', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '4', '13', '5', '10',
 '7', '14', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '519', '0', '0', '0',
 '0', '0', '0', '7597', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '6', '1', '0', '0', '80', '0', '0', '0', '0', '49', '0', '0', '0',
 '0', '1', NULL);
replace into item_template values
 ('81125', '0', '4', '0', 'Inquisitor\'s Orb', '', '25072', '3', '0', '1', '15673', '15673', '23', '-1', '-1', '61',
 '56', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '8', '6', '13',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '9294', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '4', '6', '0', '0', '0', '0', '0', '0', '0', '49', '0', '0', '0',
 '0', '1', NULL);
 
replace into `creature_loot_template` (`entry`, `item`, chanceorquestchance, `groupid`) VALUES ('11032', '81124', 10, '6');
replace into `creature_loot_template` (`entry`, `item`, chanceorquestchance, `groupid`) VALUES ('11032', '81125', 10, '6');

-- Item Fixes and Rebalancing (Yes the item has the right ItemID)
replace into item_template values
 ('81123', '0', '4', '4', 'Crimson Defender\'s Leggings', '', '32337', '3', '65536', '1', '21346', '21346', '7', '-1', '-1', '61',
 '56', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '7', '20', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '557', '0', '0', '0',
 '0', '10', '0', '9343', '1', '0', '0', '-1', '0', '-1', '13383', '1', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '6', '1', '0', '0', '100', '0', '0', '0', '0', '49', '0', '0', '0',
 '0', '1', NULL);
 update item_template set display_id = 25889 where entry = 81021;
 update item_template set display_id = 21606 where entry = 81020;
 update item_template set spelltrigger_2 = 1  where entry = 80826;
 update item_template set spellid_1 = 9416 where entry = 81018;
 update item_template set spellid_1 = 0 where entry = 80715;
 
 UPDATE `item_template` SET `inventory_type`='15' WHERE (`entry`='80546') AND (`patch`='0');

-- Mortal mode stuff:
 
replace into `mangos_string` (`entry`, `content_default`) VALUES 
(50300, 'A tragedy has occurred. %s has fallen in combat with mortal mode enabled at level %u. May this sacrifice not be forgotten.'),
(50301, '%s has reached level %u in mortal mode! Their ascendance towards immortality continues, however, so do the dangers they will face'),
(50302, '%s has transcended death and reached level 60 on mortal mode without dying once! %s shall henceforth be known as the Immortal!');

-- Apply once:
-- ALTER TABLE `characters` ADD `mortality_status` TINYINT(3) NOT NULL DEFAULT '0' AFTER `ignore_titles`;
-- 0: not mortal 1: mortal 2: immortal 3: dead
