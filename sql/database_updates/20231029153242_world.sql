-- Change greeting text of NPC ID 61255.
update broadcast_text set male_text = 'Why hello there, and welcome to the festivities. I apologize for the other guests not treating you with proper decency. It would appear they are quite... ravenous these days.$B$BI am Lord Ebonlocke of Darkshire. I traveled here of my own accord and have not returned since. I am quite aware of my current state in the tower, for I have been dead for some time. Most others that linger here are not as keen, unfortunately. It would appear that I am cursed to haunt these halls until something most fortuitous should free me from this eternal confinement.$B$BPerhaps we can help one another. I have come to learn a few things and meet others in a similar situation to mine during the time I have been bound here.' where entry = 61255;

-- Item "Nordanaar Herbal Tea" recreated.
delete from item_template where entry = 61675;
REPLACE INTO `item_template` (`entry`, `class`, `subclass`, `name`, `description`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`, `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`, `required_spell`, `required_honor_rank`, `required_city_rank`, `required_reputation_faction`, `required_reputation_rank`, `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `delay`, `range_mod`, `ammo_type`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `block`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmrate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmrate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmrate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmrate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmrate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `page_text`, `page_language`, `page_material`, `start_quest`, `lock_id`, `material`, `sheath`, `random_property`, `set_id`, `max_durability`, `area_bound`, `map_bound`, `duration`, `bag_family`, `disenchant_id`, `food_type`, `min_money_loot`, `max_money_loot`, `wrapped_gift`, `extra_flags`, `other_team_entry`, `script_name`) VALUES (61675, 0, 0, 'Nordanaar Herbal Tea', '', 18061, 2, 0, 1, 2400, 600, 0, -1, -1, 60, 50, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19199, 0, -3, 0, 0, 1153, 120000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);

-- Quest 41021 should be repeatable.
update quest_template set specialflags = 1 where entry = 41021;

-- Npc 61336 61337 shouldnt drop item 61712 at all, but should drop 61711 at 98% instead.
delete from creature_loot_template where item = 61711 and entry in (61336,61337);
delete from creature_loot_template where item = 61712 and entry in (61336,61337);
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(61336, 61711, 98, 0, 1, 1, 0),
(61337, 61711, 98, 0, 1, 1, 0);
-- Npc 61359 61358 61356 61357 61367 shouldnt drop item 61712.
delete from creature_loot_template where item = 61712 and entry in (61359,61358,61356,61357,61367);
-- Npc 61359 61358 61356 61357 61367 should drop item 61712 at 50%.
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(61359, 61712, 50, 0, 1, 1, 0),
(61358, 61712, 50, 0, 1, 1, 0),
(61356, 61712, 50, 0, 1, 1, 0),
(61357, 61712, 50, 0, 1, 1, 0),
(61367, 61712, 50, 0, 1, 1, 0);