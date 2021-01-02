-- Reserved.

update item_template set disenchant_id = 1 where entry = 51856;
update item_template set sheath = 1 where entry = 80105;
update item_template set inventory_type = 26 where entry = 51844;
update item_template set name = 'Serpent\'s Bite' where entry = 80807;
update item_template set bonding = 2 where entry in (80802, 80803);
update creature_template set faction = 73, scale = 1.1 where entry = 80936;

-- TODO: Needs weapon changed to 81057 | Needs 48 hour respawn timer

delete from quest_template where entry = 80122;

update creature_loot_template set chanceorquestchance = 0.01 where entry = 6206 and item = 80798;

delete from playercreateinfo_spell where race = 9 and class = 1 and spell = 198;
delete from playercreateinfo_spell where race = 9 and class = 1 and spell = 199;
insert into playercreateinfo_spell values
(9, 1, 198, 0, 5875, 'One-Handed Maces'),
(9, 1, 199, 0, 5875, 'Two-Handed Maces');

replace into creature_template values (80140, 0, 18480, 0, 0, 0, 'Illidari Dragonhawk', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80141, 0, 18491, 0, 0, 0, 'Armored Frostmane Riding Bear', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80142, 0, 18492, 0, 0, 0, 'Blizzcon Riding Bear', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80143, 0, 18487, 0, 0, 0, 'Armored Amani Riding Bear', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80144, 0, 18476, 0, 0, 0, 'Quel\'dorei Dragonhawk', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80145, 0, 18471, 0, 0, 0, 'Dragonhawk' , NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80146, 0, 18435, 0, 0, 0, 'Riding Ice Saber', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80147, 0, 18436, 0, 0, 0, 'Riding Aqua Saber', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80148, 0, 18341, 0, 0, 0, 'Black Bear Cub', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0.4, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80149, 0, 18340, 0, 0, 0, 'Brown Bear Cub', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0.4, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80150, 0, 18351, 0, 0, 0, 'White Bear Cub', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0.4, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80151, 0, 18352, 0, 0, 0, 'Gray Bear Cub', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0.4, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80152, 0, 18493, 0, 0, 0, 'Black Fox Kit', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0.4, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80153, 0, 18276, 0, 0, 0, 'Riding Chromatic Drake', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80154, 0, 18277, 0, 0, 0, 'Riding Black Drake', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80155, 0, 18278, 0, 0, 0, 'Riding Blue Drake', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80156, 0, 18279, 0, 0, 0, 'Riding Bronze Drake', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80157, 0, 18280, 0, 0, 0, 'Riding Green Drake', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80158, 0, 18281, 0, 0, 0, 'Riding Red Drake', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80159, 0, 18282, 0, 0, 0, 'Riding White Drake', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80160, 0, 18286, 0, 0, 0, 'Riding Nexus Drake', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80161, 0, 18288, 0, 0, 0, 'Riding Void Drake', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80162, 0, 18309, 0, 0, 0, 'Riding Infinite Drake', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80163, 0, 18271, 0, 0, 0, 'Riding Gryphon', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80164, 0, 18291,  0, 0, 0, 'Riding Armored Gryphon', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80165, 0, 18299, 0, 0, 0, 'Riding Cenarion Hippogryph', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80166, 0, 18301, 0, 0, 0, 'Riding Wyvern', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80167, 0, 18304, 0, 0, 0, 'Riding Armored Wyvern', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
replace into creature_template values (80168, 0, 18228, 0, 0, 0, 'Dark Rider\'s Steed', NULL, 0, 5, 5, 64, 64, 0, 0, 20, 35, 0, 1, 1.14286, 0, 20, 5, 0, 0, 1, 2, 2, 0, 44, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');


update item_template set display_id = 6947 where entry = 80218;
update item_template set display_id = 60692, name = 'Quel\'dorei Defender\'s Deflector' where entry = 80535;
update item_template set class = 4, subclass = 6, inventory_type = 14 where entry = 80643;

UPDATE `item_template` SET `dmg_type1`='5' WHERE (`entry`='80644') AND (`patch`='0');

delete from npc_vendor where item = 23002;

-- Defias Mask
replace into item_template values
 ('81007', '0', '4', '2', 'Enchanted Defias Mask', '', '15308', '3', '0', '1', '653', '653', '1', '1032', '-1', '21',
 '16', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '40', '0', '0', '0',
 '0', '0', '0', '17746', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '2', '0', '0', '0', '0', '0', '7', '1', '0', '0', '50', '0', '0', '0', '0', '41', '0', '0', '0',
 '0', '1', NULL);
 
replace into item_template values
 ('23556', '0', '2', '8', 'Battleworn Bastard Sword', '', '1542', '1', '0', '1', '1', '1', '17', '-1', '-1', '1',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2900', '0',
 '0', '3', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '25', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
delete from playercreateinfo_item where race = 10 and class = 2; 
insert `playercreateinfo_item` values 

-- Paladin

(10, 2, 24146, 1),
(10, 2, 24145, 1),
(10, 2, 24143, 1),
(10, 2, 80250, 2),
(10, 2, 80251, 4),
(10, 2, 23556, 1),
(10, 2, 6948, 1);


replace into broadcast_text (ID, MaleText) values (100202, 'What can I do for you? I am quite busy right now.');
replace into npc_text (ID, BroadcastTextID0) values (100202, 100202);

replace into broadcast_text (ID, MaleText) values (100203, 'My unicorns are for sale only to the elves of the Silvermoon Remnants and to their exalted allies.');
replace into npc_text (ID, BroadcastTextID0) values (100203, 100203);

update creature_template set script_name = 'npc_vanira_unicorn_vendor' where entry = 80453;