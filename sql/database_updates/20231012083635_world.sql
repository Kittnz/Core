-- A way to end Vagrant's Challenge:

REPLACE INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (67035, 'I would like to end the Vagrant\'s Challenge once and for all.', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Cleaning cloth fix for 1.17.1:

UPDATE `skill_line_ability` SET `skill_id` = 142 WHERE `id` = 30033;
DELETE FROM `npc_vendor` WHERE `item`= 60002;

-- Removed deprecated Scarlet Monastery quartermaster.

DELETE FROM `creature_template` WHERE `entry` = 80950;