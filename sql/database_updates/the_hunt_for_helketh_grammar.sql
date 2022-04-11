-- The Hunt for Helketh
update quest_template set rewitemid1 = 60525, rewitemcount1 = 1, details = 'You\'ve done well so far, but the biggest of the plains creepers stands before you, $c. The Witherbark trolls have been harvesting venom from the spider after putting it to sleep with mojo in her food!\n\nHeketh is a fearsome foe that many trolls have fallen to, so keep your wits about you! You can find the great spider just west of Go\'Shek Farm.\n\nFind her and put an end to the Witherbark\'s source of powerful venom!', requestitemstext = 'Has she been slain?', offerrewardtext = 'You truly are a master hunter and a friend to the Wildtusk, $N! Take this for all of your help, thank you!' where entry = 40015;
-- Creeper Fang Necklace
replace into item_template (entry, name, description, class, subclass, material, quality, display_id, bonding, required_level, max_count, allowable_class, allowable_race, buy_price, sell_price, inventory_type, sheath, flags, extra_flags, buy_count, stackable, container_slots, dmg_min1, dmg_max1, delay, dmg_type1, ammo_type, max_durability, armor, block, bag_family, item_level, range_mod, disenchant_id, holy_res, fire_res, nature_res, frost_res, shadow_res, arcane_res, stat_type1, stat_value1, stat_type2, stat_value2, spellid_1, spelltrigger_1, spellcharges_1, spellppmrate_1, spellcooldown_1, spellcategory_1, spellcategorycooldown_1, random_property, required_reputation_faction, required_reputation_rank) values (60525, 'Creeper Fang Necklace', '', 4, 0, 1, 2, 9860, 1, 0, 0, -1, -1, 25934, 6483, 2, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 39, 0, 7, 0, 0, 0, 0, 0, 0, 3, 4, 6, 4, 20877, 1, 0, 0, -1, 0, -1, 0, 0, 0);