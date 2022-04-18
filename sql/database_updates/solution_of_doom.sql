
-- Completion script for quest Solution to Doom.
DELETE FROM `quest_end_scripts` WHERE `id`=709;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(709, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 914, 0, 0, 0, 0, 0, 0, 0, 0, 'Solution to Doom: Theldurin the Lost - Say Text'),
(709, 0, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Solution to Doom: Theldurin the Lost - Emote OneShotKneel'),
(709, 3, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Solution to Doom: Theldurin the Lost - Emote OneShotCheer'),
(709, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 915, 0, 0, 0, 0, 0, 0, 0, 0, 'Solution to Doom: Theldurin the Lost - Say Text');
UPDATE `quest_template` SET `CompleteScript`=709 WHERE `entry`=709;
