-- Arcane Channeling Visual
INSERT INTO `spell_template` (`entry`, `school`, `category`, `castUI`, `dispel`, `mechanic`, `attributes`, `attributesEx`, `attributesEx2`, `attributesEx3`, `attributesEx4`, `stances`, `stancesNot`, `targets`, `targetCreatureType`, `requiresSpellFocus`, `casterAuraState`, `targetAuraState`, `castingTimeIndex`, `recoveryTime`, `categoryRecoveryTime`, `interruptFlags`, `auraInterruptFlags`, `channelInterruptFlags`, `procFlags`, `procChance`, `procCharges`, `maxLevel`, `baseLevel`, `spellLevel`, `durationIndex`, `powerType`, `manaCost`, `manCostPerLevel`, `manaPerSecond`, `manaPerSecondPerLevel`, `rangeIndex`, `speed`, `modelNextSpell`, `stackAmount`, `totem1`, `totem2`, `reagent1`, `reagent2`, `reagent3`, `reagent4`, `reagent5`, `reagent6`, `reagent7`, `reagent8`, `reagentCount1`, `reagentCount2`, `reagentCount3`, `reagentCount4`, `reagentCount5`, `reagentCount6`, `reagentCount7`, `reagentCount8`, `equippedItemClass`, `equippedItemSubClassMask`, `equippedItemInventoryTypeMask`, `effect1`, `effect2`, `effect3`, `effectDieSides1`, `effectDieSides2`, `effectDieSides3`, `effectBaseDice1`, `effectBaseDice2`, `effectBaseDice3`, `effectDicePerLevel1`, `effectDicePerLevel2`, `effectDicePerLevel3`, `effectRealPointsPerLevel1`, `effectRealPointsPerLevel2`, `effectRealPointsPerLevel3`, `effectBasePoints1`, `effectBasePoints2`, `effectBasePoints3`, `effectBonusCoefficient1`, `effectBonusCoefficient2`, `effectBonusCoefficient3`, `effectMechanic1`, `effectMechanic2`, `effectMechanic3`, `effectImplicitTargetA1`, `effectImplicitTargetA2`, `effectImplicitTargetA3`, `effectImplicitTargetB1`, `effectImplicitTargetB2`, `effectImplicitTargetB3`, `effectRadiusIndex1`, `effectRadiusIndex2`, `effectRadiusIndex3`, `effectApplyAuraName1`, `effectApplyAuraName2`, `effectApplyAuraName3`, `effectAmplitude1`, `effectAmplitude2`, `effectAmplitude3`, `effectMultipleValue1`, `effectMultipleValue2`, `effectMultipleValue3`, `effectChainTarget1`, `effectChainTarget2`, `effectChainTarget3`, `effectItemType1`, `effectItemType2`, `effectItemType3`, `effectMiscValue1`, `effectMiscValue2`, `effectMiscValue3`, `effectTriggerSpell1`, `effectTriggerSpell2`, `effectTriggerSpell3`, `effectPointsPerComboPoint1`, `effectPointsPerComboPoint2`, `effectPointsPerComboPoint3`, `spellVisual1`, `spellVisual2`, `spellIconId`, `activeIconId`, `spellPriority`, `name`, `nameFlags`, `nameSubtext`, `nameSubtextFlags`, `description`, `descriptionFlags`, `auraDescription`, `auraDescriptionFlags`, `manaCostPercentage`, `startRecoveryCategory`, `startRecoveryTime`, `minTargetLevel`, `maxTargetLevel`, `spellFamilyName`, `spellFamilyFlags`, `maxAffectedTargets`, `dmgClass`, `preventionType`, `stanceBarOrder`, `dmgMultiplier1`, `dmgMultiplier2`, `dmgMultiplier3`, `minFactionId`, `minReputation`, `requiredAuraVision`, `customFlags`) VALUES (45665, 0, 0, 0, 0, 0, 402653440, 268435520, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 70, 0, 0, 0, 4127, 4127, 0, 101, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 263, 0, 99, 263, 0, 'Arcane Channeling', 4128894, '', 4128892, '', 4128892, '', 4128892, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 1, 1, 0, 0, 0, 0);

-- Gossip option for Ralathius.
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (41396, 0, 0, 'I’m ready. Start the ritual.', 0, 1, 1, 0, 0, 41396, 0, 0, NULL, 0, 40957);

-- 40957: Target Has Incomplete Quest 40957 In Log
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (40957, 9, 40957, 1, 0, 0, 0);

-- Texts
INSERT INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (65014, 'I invoke the Ancient Pact! Dreamways, open before me.', 'I invoke the Ancient Pact! Dreamways, open before me.', 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (65015, 'Something is wrong…', 'Something is wrong…', 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (65016, 'I invoke the Ancient Pact! Open the way to the Emerald Dream!', 'I invoke the Ancient Pact! Open the way to the Emerald Dream!', 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (65017, 'These were the minions of Nightmare for sure. Oh, what is happening…', 'These were the minions of Nightmare for sure. Oh, what is happening…', 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (65018, 'Who dares to open the Dreamways?', 'Who dares to open the Dreamways?', 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (65019, 'Lady Ysera… ', 'Lady Ysera… ', 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (65020, 'Speak quickly, Ralathius. The Nightmare is advancing on our positions.', 'Speak quickly, Ralathius. The Nightmare is advancing on our positions.', 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (65021, 'We are in need of your blessing, my lady. I’ve found a mortal soul willing to stop the Awakening.', 'We are in need of your blessing, my lady. I’ve found a mortal soul willing to stop the Awakening.', 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (65022, 'Not a moment too soon. Solnius already enclosed himself in the Emerald Sanctum. The Awakening is upon us.', 'Not a moment too soon. Solnius already enclosed himself in the Emerald Sanctum. The Awakening is upon us.', 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (65023, 'Yet, I cannot grant my blessing to this mortal. It is too dangerous. The Dreamway in Hyjal can be destroyed at any moment.', 'Yet, I cannot grant my blessing to this mortal. It is too dangerous. The Dreamway in Hyjal can be destroyed at any moment.', 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (65024, 'Larannikus has fallen to the Nightmare. In this very moment, he is working to sever the connection of the Dream to the World Tree.', 'Larannikus has fallen to the Nightmare. In this very moment, he is working to sever the connection of the Dream to the World Tree.', 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (65025, 'If this happens… The reflection of Nordrassil in the Dream would be vulnerable to attack, and the Dreamways would close, trapping those without the innate ability to Dreamwalk.', 'If this happens… The reflection of Nordrassil in the Dream would be vulnerable to attack, and the Dreamways would close, trapping those without the innate ability to Dreamwalk.', 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (65026, 'Larannikus must be slain before I grant my blessing.', 'Larannikus must be slain before I grant my blessing.', 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (65027, 'Lady Ysera, they are approaching. We must go.', 'Lady Ysera, they are approaching. We must go.', 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (65028, 'Ralathius, my faithful servant. Fate of the Emerald Dream is in your hands.', 'Ralathius, my faithful servant. Fate of the Emerald Dream is in your hands.', 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (65029, 'Oh no…', 'Oh no…', 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `broadcast_text` (`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`) VALUES (65030, '%s stops his cast.', '%s stops his cast.', 2, 0, 0, 0, 0, 0, 0, 0, 0);

-- 41396: Extra Targets Of Scripted Map Event 41396 Satisfy Condition (121:  Not (Target Is Alive))
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (41396, 47, 41396, 121, 0, 0, 0);

-- Spawn script for Nightmare Apparition
DELETE FROM `generic_scripts` WHERE `id`=4139601;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4139601, 0, 0, 63, 41396, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Nightmare Apparition - Add to Scripted Map Event');

-- Script on clicking gossip option on Ralathius.
DELETE FROM `gossip_scripts` WHERE `id`=41396;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(41396, 0, 0, 15, 45665, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ralathius - Cast Spell Arcane Channeling'),
(41396, 0, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ralathius - Remove NPC FLags'),
(41396, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65014, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ralathius - Say Text'),
(41396, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65015, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ralathius - Say Text'),
(41396, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65016, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ralathius - Say Text'),
(41396, 17, 0, 61, 41396, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4139602, 0, 0, 0, 0, 0, 'Into the Dream: Ralathius - Start Scripted Map Event'),
(41396, 18, 0, 10, 61544, 120000, 0, 0, 0, 0, 0, 0, 0, 4139601, 0, 2, 5516.61, -3691.11, 1594.54, 5.7, 0, 'Into the Dream: Ralathius - Summon Creature Nightmare Apparition'),
(41396, 18, 0, 10, 61544, 120000, 0, 0, 0, 0, 0, 0, 0, 4139601, 0, 2, 5517.57, -3702.73, 1594.93, 0.2, 0, 'Into the Dream: Ralathius - Summon Creature Nightmare Apparition'),
(41396, 18, 0, 10, 61544, 120000, 0, 0, 0, 0, 0, 0, 0, 4139601, 0, 2, 5528.24, -3711.74, 1596.8, 1.2, 0, 'Into the Dream: Ralathius - Summon Creature Nightmare Apparition'),
(41396, 19, 0, 69, 41396, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41396, 4139602, 0, 0, 0, 0, 0, 'Into the Dream: Ralathius - Edit Scripted Map Event');

-- Script to continue event after Nightmare Apparition are dead.
DELETE FROM `generic_scripts` WHERE `id`=4139602;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4139602, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65017, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ralathius - Say Text'),
(4139602, 3, 0, 10, 61545, 54000, 1, 30, 0, 0, 0, 0, 8, 0, -1, 2, 5527.98, -3700.56, 1595.89, 0.41, 0, 'Into the Dream: Ralathius - Summon Creature Ysera'),
(4139602, 3, 0, 10, 61546, 54000, 1, 30, 0, 0, 0, 0, 8, 0, -1, 2, 5528.81, -3694.41, 1595.86, 5.63, 0, 'Into the Dream: Ralathius - Summon Creature Ursoc'),
(4139602, 3, 0, 10, 61547, 54000, 1, 30, 0, 0, 0, 0, 8, 0, -1, 2, 5533.4, -3703.88, 1596.73, 1.34, 0, 'Into the Dream: Ralathius - Summon Creature Goldrinn'),
(4139602, 4, 0, 0, 0, 0, 0, 0, 61545, 30, 8, 2, 65018, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ysera - Say Text'),
(4139602, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65019, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ralathius - Say Text'),
(4139602, 14, 0, 0, 0, 0, 0, 0, 61545, 30, 8, 2, 65020, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ysera - Say Text'),
(4139602, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65021, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ralathius - Say Text'),
(4139602, 24, 0, 0, 0, 0, 0, 0, 61545, 30, 8, 2, 65022, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ysera - Say Text'),
(4139602, 29, 0, 0, 0, 0, 0, 0, 61545, 30, 8, 2, 65023, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ysera - Say Text'),
(4139602, 34, 0, 0, 0, 0, 0, 0, 61545, 30, 8, 2, 65024, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ysera - Say Text'),
(4139602, 39, 0, 0, 0, 0, 0, 0, 61545, 30, 8, 2, 65025, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ysera - Say Text'),
(4139602, 44, 0, 0, 0, 0, 0, 0, 61545, 30, 8, 2, 65026, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ysera - Say Text'),
(4139602, 49, 0, 0, 0, 0, 0, 0, 61546, 30, 8, 2, 65027, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ursoc - Say Text'),
(4139602, 54, 0, 0, 0, 0, 0, 0, 61545, 30, 8, 2, 65028, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ysera - Say Text'),
(4139602, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65029, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ralathius - Say Text'),
(4139602, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65030, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ralathius - Say Text'),
(4139602, 60, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ralathius - Stop Casting'),
(4139602, 61, 0, 8, 60044, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Give Kill Credit to Player'),
(4139602, 62, 0, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Into the Dream: Ralathius - Add NPC Flags');
