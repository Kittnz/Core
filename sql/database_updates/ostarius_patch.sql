-- Make pedestal target bunny float.
REPLACE INTO `creature_template` (`entry`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `phase_quest_id`, `phase_quest_action`, `script_name`) VALUES (80969, 6908, 0, 0, 0, 'Uldum Pedestal Target Bunny', '', 0, 1, 1, 1, 1, 0, 0, 0, 35, 0, 0.91, 1.14286, 0.2, 20, 5, 0, 0, 0, 7, 7, 0, 290, 1, 2000, 2200, 1, 33554432, 0, 8, 0, 0, 0, 0, 1.76, 2.42, 100, 8, 5242886, 0, 0, 0, 0, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 'NullAI', 0, 4, 0, 0, 3, 0, 0, 0, 2147483648, 0, 0, 0, 1, '');

-- Assign 7-day respawn timer for pedestal bunny.
REPLACE INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `display_id`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`) VALUES (2565818, 80969, 0, 0, 0, 1, 0, 0, -9619.19, -2815.02, 10.8949, 2.23141, 604800, 25, 0, 100, 100, 0, 0, 0);

-- Add gossip text to pedestal gameobject.
INSERT INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (90630, '<Ancient structure formed as a pedestal. Looks like made of stone. You could swear it\'s humming!>', '<Ancient structure formed as a pedestal. Looks like made of stone. You could swear it\'s humming!>', 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadcastTextID1`, `Probability1`, `BroadcastTextID2`, `Probability2`, `BroadcastTextID3`, `Probability3`, `BroadcastTextID4`, `Probability4`, `BroadcastTextID5`, `Probability5`, `BroadcastTextID6`, `Probability6`, `BroadcastTextID7`, `Probability7`) VALUES (90630, 90630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Respawn pedestal gameobject.
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`) VALUES (17230, 142343, 1, -9619.27, -2815.05, 8.21132, -3.13287, 0, 0, 0.99999, -0.004363, 2, 2, 100, 1, 0, 0);
