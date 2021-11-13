-- Reserved.
-- quest_template			40000-40200
-- creature_template		60300-60500
-- gameobject_template		2010700-2010900
-- item_template			60000-60200
-- gossip_menu				41000-43000
-- creature_equip_template	20000-21000
-- broadcast_text			30000-31000
-- creature_ai_events		2200000-2201000
-- creature_ai_scripts		2200000-2201000

-- Grubgar <Fisher Orc> , display ID 3877, level 12, faction 125, weapon 6256, greeting text: "Nothing is greater then fishing!" 
-- Zantiki <Leatherworking Trainer> , display ID 12041, level 15,faction 126, weapon 2092, greeting text : "Ey mon, you looking to learn to work with nature?"
-- Keeper Laena, display ID 2216, level 58, weapon1 20718, ((Use Keeper Iselus' faction 189)), greeting text: "Well, this is new, I don't often get visitors." 

delete from creature_template where entry between 60510 and 60512;
replace into creature_template VALUES
(60510, 3877, 0, 0, 0, 'Grubgar', 'Fisher Orc', 0, 12, 12, 247, 247, 0, 0, 573, 125, 19, 1, 1.14286, 0, 20, 5, 0, 0, 1, 26, 30, 0, 66, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 21.2784, 29.2578, 100, 1, 0, 60510, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, ''),
(60511, 12041, 0, 0, 0, 'Zantiki', 'Leatherworking Trainer', 0, 15, 15, 328, 328, 0, 0, 660, 126, 19, 1, 1.14286, 0, 20, 5, 0, 0, 1, 21, 27, 0, 74, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 21.2784, 29.2578, 100, 7, 0, 60511, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 550, 0, 0, 0, 0, 2, 0, ''),
(60512, 2216, 0, 0, 0, 'Keeper Laena', '', 0, 58, 58, 3875, 3875, 0, 0, 3408, 189, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 106, 136, 0, 262, 1, 2000, 2000, 1, 2, 0, 0, 0, 0, 0, 0, 72.9872, 100.357, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 1048578, 0, '');

set @equip_template = 20030; set @weapon_1 = 8196; set @weapon_2 = 0; set @creature = 60510;
replace into creature_equip_template values (@equip_template, @weapon_1, @weapon_2, 0);
update creature_template set equipment_id = @equip_template where entry = @creature;

set @equip_template = 20031; set @weapon_1 = 2092; set @weapon_2 = 0; set @creature = 60511;
replace into creature_equip_template values (@equip_template, @weapon_1, @weapon_2, 0);
update creature_template set equipment_id = @equip_template where entry = @creature;

set @equip_template = 20032; set @weapon_1 = 20718; set @weapon_2 = 0; set @creature = 60512;
replace into creature_equip_template values (@equip_template, @weapon_1, @weapon_2, 0);
update creature_template set equipment_id = @equip_template where entry = @creature;

set @gossip_menu_id = 41036; set @magic_number = 60510;
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); 
replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Nothing is greater then fishing!'); 
replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); 
update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 41037; set @magic_number = 60511;
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); 
replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Ey mon, you looking to learn to work with nature?'); 
replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); 
update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 41038; set @magic_number = 60512;
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); 
replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Well, this is new, I don\'t often get visitors.'); 
replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); 
update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

delete from npc_trainer where entry = 60510 and 60511;
REPLACE INTO npc_trainer VALUES
-- Grubgar <Fisher Orc>
(60510, 7733, 100, 0, 0, 5),
(60510, 7734, 500, 356, 50, 0),
-- Zantiki <Leatherworking Trainer>
(60511, 2155, 10, 0, 0, 5),
(60511, 2177, 100, 165, 55, 0),
(60511, 2178, 100, 165, 60, 0),
(60511, 2338, 50, 165, 15, 0),
(60511, 2883, 100, 165, 40, 0),
(60511, 3782, 75, 165, 25, 0),
(60511, 3784, 150, 165, 55, 0),
(60511, 3821, 50, 165, 35, 0),
(60511, 9061, 100, 165, 30, 0),
(60511, 9063, 100, 165, 30, 0);

update creature_template set unit_flags = 0 where entry = 60498;
update creature_template set script_name = 'npc_fearoth' where entry = 60499;
update quest_template set limittime = 194 where entry = 40214;