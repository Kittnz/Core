UPDATE `spell_template` SET `description` = 'Targets in a $a1 yard cone in front of the caster take $s2 Frost damage and are slowed by $s1% for $d.' WHERE `entry` = 10160;
UPDATE `spell_template` SET `description` = 'Targets in a $a1 yard cone in front of the caster take $s2 Frost damage and are slowed by $s1% for $d.' WHERE `entry` = 10161;
UPDATE `spell_template` SET `description` = 'Targets in a $a1 yard cone in front of the caster take $s2 Frost damage and are slowed by $s1% for $d.' WHERE `entry` = 10159;
UPDATE `spell_template` SET `description` = 'Targets in a $a1 yard cone in front of the caster take $s2 Frost damage and are slowed by $s1% for $d.' WHERE `entry` = 8492;
UPDATE `spell_template` SET `description` = 'Targets in a $a1 yard cone in front of the caster take $s2 Frost damage and are slowed by $s1% for $d.' WHERE `entry` = 120;

UPDATE `spell_template` SET `description` = 'Blasts enemies within $a1 yards near the caster for $s1 Frost damage and freezes them in place for up to $d.  Damage caused may interrupt the effect.' WHERE `entry` = 122;
UPDATE `spell_template` SET `description` = 'Blasts enemies within $a1 yards near the caster for $s1 Frost damage and freezes them in place for up to $d.  Damage caused may interrupt the effect.' WHERE `entry` = 865;
UPDATE `spell_template` SET `description` = 'Blasts enemies within $a1 yards near the caster for $s1 Frost damage and freezes them in place for up to $d.  Damage caused may interrupt the effect.' WHERE `entry` = 6131;
UPDATE `spell_template` SET `description` = 'Blasts enemies within $a1 yards near the caster for $s1 Frost damage and freezes them in place for up to $d.  Damage caused may interrupt the effect.' WHERE `entry` = 10230;

UPDATE `spell_template` SET `description` = 'A wave of flame radiates outward from the caster, damaging all enemies caught within the $a1 yard blast for $s1 Fire damage, and dazing them for $d.' WHERE `entry` = 11113;
UPDATE `spell_template` SET `description` = 'A wave of flame radiates outward from the caster, damaging all enemies caught within the $a1 yard blast for $s1 Fire damage, and dazing them for $d.' WHERE `entry` = 13018;
UPDATE `spell_template` SET `description` = 'A wave of flame radiates outward from the caster, damaging all enemies caught within the $a1 yard blast for $s1 Fire damage, and dazing them for $d.' WHERE `entry` = 13019;
UPDATE `spell_template` SET `description` = 'A wave of flame radiates outward from the caster, damaging all enemies caught within the $a1 yard blast for $s1 Fire damage, and dazing them for $d.' WHERE `entry` = 13020;
UPDATE `spell_template` SET `description` = 'A wave of flame radiates outward from the caster, damaging all enemies caught within the $a1 yard blast for $s1 Fire damage, and dazing them for $d.' WHERE `entry` = 13021;

UPDATE `spell_template` SET `description` = 'Ignites the area surrounding the caster, causing $s2 Fire damage to $ghimself:herself; and $5857s1 Fire damage to all nearby enemies within $s1 yards every $t2 sec.  Lasts $d.' WHERE `entry` = 1949;
UPDATE `spell_template` SET `description` = 'Ignites the area surrounding the caster, causing $s2 Fire damage to $ghimself:herself; and $5857s1 Fire damage to all nearby enemies within $s1 yards every $t2 sec.  Lasts $d.' WHERE `entry` = 11683;
UPDATE `spell_template` SET `description` = 'Ignites the area surrounding the caster, causing $s2 Fire damage to $ghimself:herself; and $5857s1 Fire damage to all nearby enemies within $s1 yards every $t2 sec.  Lasts $d.' WHERE `entry` = 11684;

-- Item 61810 also needs to be enabled to enchant properly its broken like other belt buckles used to be.
-- Update its display ID to 67817
-- Update item 61799 display ID to 634
-- Item 61804 also needs to be enabled to enchant properly, broken like belt buckles used to

UPDATE `item_template` SET `class` = 7, `flags` = 64, `display_id` = 67817 WHERE `entry` = 61810;
UPDATE `item_template` SET `display_id` = 634 WHERE `entry` = 61799;
UPDATE `item_template` SET `class` = 7, `flags` = 64 WHERE `entry` = 61804;

-- Fix spells: 57196, 57193, 57191, 57187, 57169: should be in blacksmithing window

UPDATE `spell_template` SET  `attributes` = 65536, `targets` = 256, `castingTimeIndex` = 6, `equippedItemClass` = 4, `equippedItemSubClassMask` = 31, `equippedItemInventoryTypeMask` = 64 WHERE `entry` = 57169;
UPDATE `spell_template` SET `effectImplicitTargetA1` = 0 WHERE `entry` = 57169;
REPLACE INTO `skill_line_ability` (`id`, `skill_id`, `spell_id`, `race_mask`, `class_mask`, `req_skill_value`, `superseded_by_spell`, `learn_on_get_skill`, `max_value`, `min_value`, `req_train_points`) VALUES (36478, 164, 57169, 0, 0, 0, 0, 0, 320, 310, 0);
UPDATE `spell_template` SET `castUI` = 0 WHERE `entry` = 57196;
UPDATE `spell_template` SET `attributes` = 65584, `targets` = 256, `castingTimeIndex` = 48 WHERE `entry` = 57196;
UPDATE `spell_template` SET `castingTimeIndex` = 38, `equippedItemClass` = -1, `equippedItemSubClassMask` = 0, `equippedItemInventoryTypeMask` = 0, `effectBonusCoefficient1` = 0, `effectItemType1` = 61810 WHERE `entry` = 57196;
UPDATE `spell_template` SET `equippedItemSubClassMask` = -1, `effectMechanic1` = 0, `effectImplicitTargetA1` = 1 WHERE `entry` = 57195;
UPDATE `spell_template` SET `attributes` = 0, `attributesEx2` = 0, `castingTimeIndex` = 14, `equippedItemSubClassMask` = 31, `equippedItemInventoryTypeMask` = 64, `spellVisual1` = 215, `dmgMultiplier2` = 1, `dmgMultiplier3` = 1 WHERE `entry` = 57186;
UPDATE `spell_template` SET `effectBonusCoefficient1` = 0 WHERE `entry` = 57186;

UPDATE `spell_template` SET name = 'Plans: Copper Belt Buckle' WHERE entry = 57162;
UPDATE `spell_template` SET name = 'Plans: Bronze Belt Buckle' WHERE entry = 57165;
UPDATE `spell_template` SET name = 'Plans: Iron Belt Buckle' WHERE entry = 57168;
UPDATE `spell_template` SET name = 'Plans: Mithril Belt Buckle'	WHERE entry = 57171;
UPDATE `spell_template` SET name = 'Plans: Thorium Belt Buckle'	WHERE entry = 57174;
UPDATE `spell_template` SET name = 'Plans: Arcanite Belt Buckle' WHERE entry = 57177;
UPDATE `spell_template` SET name = 'Plans: Dreamsteel Belt Buckle' WHERE entry = 57180;
UPDATE `spell_template` SET name = 'Plans: Bloody Belt Buckle' WHERE entry = 57195;

UPDATE `spell_template` SET `school` = 0, `category` = 0, `castUI` = 0, `dispel` = 0, `mechanic` = 0, `attributes` = 65584, `attributesEx` = 0, `attributesEx2` = 0, `attributesEx3` = 0, `attributesEx4` = 0, `stances` = 0, `stancesNot` = 0, `targets` = 0, `targetCreatureType` = 0, `requiresSpellFocus` = 1, `casterAuraState` = 0, `targetAuraState` = 0, `castingTimeIndex` = 39, `recoveryTime` = 0, `categoryRecoveryTime` = 0, `interruptFlags` = 15, `auraInterruptFlags` = 0, `channelInterruptFlags` = 0, `procFlags` = 0, `procChance` = 101, `procCharges` = 0, `maxLevel` = 0, `baseLevel` = 0, `spellLevel` = 0, `durationIndex` = 0, `powerType` = 0, `manaCost` = 0, `manCostPerLevel` = 0, `manaPerSecond` = 0, `manaPerSecondPerLevel` = 0, `rangeIndex` = 1, `speed` = 0, `modelNextSpell` = 0, `stackAmount` = 0, `totem1` = 5956, `totem2` = 0, `reagent1` = 12655, `reagent2` = 12360, `reagent3` = 11371, `reagent4` = 61673, `reagent5` = 3824, `reagent6` = 0, `reagent7` = 0, `reagent8` = 0, `reagentCount1` = 12, `reagentCount2` = 14, `reagentCount3` = 10, `reagentCount4` = 6, `reagentCount5` = 8, `reagentCount6` = 0, `reagentCount7` = 0, `reagentCount8` = 0, `equippedItemClass` = -1, `equippedItemSubClassMask` = 0, `equippedItemInventoryTypeMask` = 0, `effect1` = 24, `effect2` = 0, `effect3` = 0, `effectDieSides1` = 1, `effectDieSides2` = 0, `effectDieSides3` = 0, `effectBaseDice1` = 1, `effectBaseDice2` = 0, `effectBaseDice3` = 0, `effectDicePerLevel1` = 0, `effectDicePerLevel2` = 0, `effectDicePerLevel3` = 0, `effectRealPointsPerLevel1` = 0, `effectRealPointsPerLevel2` = 0, `effectRealPointsPerLevel3` = 0, `effectBasePoints1` = 0, `effectBasePoints2` = 0, `effectBasePoints3` = 0, `effectBonusCoefficient1` = 0, `effectBonusCoefficient2` = -1, `effectBonusCoefficient3` = -1, `effectMechanic1` = 0, `effectMechanic2` = 0, `effectMechanic3` = 0, `effectImplicitTargetA1` = 1, `effectImplicitTargetA2` = 0, `effectImplicitTargetA3` = 0, `effectImplicitTargetB1` = 0, `effectImplicitTargetB2` = 0, `effectImplicitTargetB3` = 0, `effectRadiusIndex1` = 0, `effectRadiusIndex2` = 0, `effectRadiusIndex3` = 0, `effectApplyAuraName1` = 0, `effectApplyAuraName2` = 0, `effectApplyAuraName3` = 0, `effectAmplitude1` = 0, `effectAmplitude2` = 0, `effectAmplitude3` = 0, `effectMultipleValue1` = 0, `effectMultipleValue2` = 0, `effectMultipleValue3` = 0, `effectChainTarget1` = 0, `effectChainTarget2` = 0, `effectChainTarget3` = 0, `effectItemType1` = 60007, `effectItemType2` = 0, `effectItemType3` = 0, `effectMiscValue1` = 0, `effectMiscValue2` = 0, `effectMiscValue3` = 0, `effectTriggerSpell1` = 0, `effectTriggerSpell2` = 0, `effectTriggerSpell3` = 0, `effectPointsPerComboPoint1` = 0, `effectPointsPerComboPoint2` = 0, `effectPointsPerComboPoint3` = 0, `spellVisual1` = 395, `spellVisual2` = 0, `spellIconId` = 140, `activeIconId` = 0, `spellPriority` = 0, `name` = 'Towerforge Crown', `nameFlags` = 4128894, `nameSubtext` = '', `nameSubtextFlags` = 4128892, `description` = '', `descriptionFlags` = 4128894, `auraDescription` = '', `auraDescriptionFlags` = 4128892, `manaCostPercentage` = 0, `startRecoveryCategory` = 0, `startRecoveryTime` = 0, `minTargetLevel` = 0, `maxTargetLevel` = 0, `spellFamilyName` = 0, `spellFamilyFlags` = 0, `maxAffectedTargets` = 0, `dmgClass` = 0, `preventionType` = 0, `stanceBarOrder` = -1, `dmgMultiplier1` = 1, `dmgMultiplier2` = 1, `dmgMultiplier3` = 1, `minFactionId` = 0, `minReputation` = 0, `requiredAuraVision` = 0, `customFlags` = 0 WHERE `entry` = 57187;
UPDATE `spell_template` SET `school` = 0, `category` = 0, `castUI` = 0, `dispel` = 0, `mechanic` = 0, `attributes` = 65584, `attributesEx` = 0, `attributesEx2` = 0, `attributesEx3` = 0, `attributesEx4` = 0, `stances` = 0, `stancesNot` = 0, `targets` = 0, `targetCreatureType` = 0, `requiresSpellFocus` = 1, `casterAuraState` = 0, `targetAuraState` = 0, `castingTimeIndex` = 39, `recoveryTime` = 0, `categoryRecoveryTime` = 0, `interruptFlags` = 15, `auraInterruptFlags` = 0, `channelInterruptFlags` = 0, `procFlags` = 0, `procChance` = 101, `procCharges` = 0, `maxLevel` = 0, `baseLevel` = 0, `spellLevel` = 0, `durationIndex` = 0, `powerType` = 0, `manaCost` = 0, `manCostPerLevel` = 0, `manaPerSecond` = 0, `manaPerSecondPerLevel` = 0, `rangeIndex` = 1, `speed` = 0, `modelNextSpell` = 0, `stackAmount` = 0, `totem1` = 5956, `totem2` = 0, `reagent1` = 12655, `reagent2` = 12360, `reagent3` = 11371, `reagent4` = 61673, `reagent5` = 22202, `reagent6` = 0, `reagent7` = 0, `reagent8` = 0, `reagentCount1` = 12, `reagentCount2` = 12, `reagentCount3` = 12, `reagentCount4` = 6, `reagentCount5` = 6, `reagentCount6` = 0, `reagentCount7` = 0, `reagentCount8` = 0, `equippedItemClass` = -1, `equippedItemSubClassMask` = 0, `equippedItemInventoryTypeMask` = 0, `effect1` = 24, `effect2` = 0, `effect3` = 0, `effectDieSides1` = 1, `effectDieSides2` = 0, `effectDieSides3` = 0, `effectBaseDice1` = 1, `effectBaseDice2` = 0, `effectBaseDice3` = 0, `effectDicePerLevel1` = 0, `effectDicePerLevel2` = 0, `effectDicePerLevel3` = 0, `effectRealPointsPerLevel1` = 0, `effectRealPointsPerLevel2` = 0, `effectRealPointsPerLevel3` = 0, `effectBasePoints1` = 0, `effectBasePoints2` = 0, `effectBasePoints3` = 0, `effectBonusCoefficient1` = 0, `effectBonusCoefficient2` = -1, `effectBonusCoefficient3` = -1, `effectMechanic1` = 0, `effectMechanic2` = 0, `effectMechanic3` = 0, `effectImplicitTargetA1` = 1, `effectImplicitTargetA2` = 0, `effectImplicitTargetA3` = 0, `effectImplicitTargetB1` = 0, `effectImplicitTargetB2` = 0, `effectImplicitTargetB3` = 0, `effectRadiusIndex1` = 0, `effectRadiusIndex2` = 0, `effectRadiusIndex3` = 0, `effectApplyAuraName1` = 0, `effectApplyAuraName2` = 0, `effectApplyAuraName3` = 0, `effectAmplitude1` = 0, `effectAmplitude2` = 0, `effectAmplitude3` = 0, `effectMultipleValue1` = 0, `effectMultipleValue2` = 0, `effectMultipleValue3` = 0, `effectChainTarget1` = 0, `effectChainTarget2` = 0, `effectChainTarget3` = 0, `effectItemType1` = 60008, `effectItemType2` = 0, `effectItemType3` = 0, `effectMiscValue1` = 0, `effectMiscValue2` = 0, `effectMiscValue3` = 0, `effectTriggerSpell1` = 0, `effectTriggerSpell2` = 0, `effectTriggerSpell3` = 0, `effectPointsPerComboPoint1` = 0, `effectPointsPerComboPoint2` = 0, `effectPointsPerComboPoint3` = 0, `spellVisual1` = 395, `spellVisual2` = 0, `spellIconId` = 140, `activeIconId` = 0, `spellPriority` = 0, `name` = 'Towerforge Breastplate', `nameFlags` = 4128894, `nameSubtext` = '', `nameSubtextFlags` = 4128892, `description` = '', `descriptionFlags` = 4128894, `auraDescription` = '', `auraDescriptionFlags` = 4128892, `manaCostPercentage` = 0, `startRecoveryCategory` = 0, `startRecoveryTime` = 0, `minTargetLevel` = 0, `maxTargetLevel` = 0, `spellFamilyName` = 0, `spellFamilyFlags` = 0, `maxAffectedTargets` = 0, `dmgClass` = 0, `preventionType` = 0, `stanceBarOrder` = -1, `dmgMultiplier1` = 1, `dmgMultiplier2` = 1, `dmgMultiplier3` = 1, `minFactionId` = 0, `minReputation` = 0, `requiredAuraVision` = 0, `customFlags` = 0 WHERE `entry` = 57189;
UPDATE `spell_template` SET `school` = 0, `category` = 0, `castUI` = 0, `dispel` = 0, `mechanic` = 0, `attributes` = 65584, `attributesEx` = 0, `attributesEx2` = 0, `attributesEx3` = 0, `attributesEx4` = 0, `stances` = 0, `stancesNot` = 0, `targets` = 0, `targetCreatureType` = 0, `requiresSpellFocus` = 1, `casterAuraState` = 0, `targetAuraState` = 0, `castingTimeIndex` = 39, `recoveryTime` = 0, `categoryRecoveryTime` = 0, `interruptFlags` = 15, `auraInterruptFlags` = 0, `channelInterruptFlags` = 0, `procFlags` = 0, `procChance` = 101, `procCharges` = 0, `maxLevel` = 0, `baseLevel` = 0, `spellLevel` = 0, `durationIndex` = 0, `powerType` = 0, `manaCost` = 0, `manCostPerLevel` = 0, `manaPerSecond` = 0, `manaPerSecondPerLevel` = 0, `rangeIndex` = 1, `speed` = 0, `modelNextSpell` = 0, `stackAmount` = 0, `totem1` = 5956, `totem2` = 0, `reagent1` = 12655, `reagent2` = 12360, `reagent3` = 11371, `reagent4` = 61673, `reagent5` = 12800, `reagent6` = 0, `reagent7` = 0, `reagent8` = 0, `reagentCount1` = 10, `reagentCount2` = 10, `reagentCount3` = 8, `reagentCount4` = 4, `reagentCount5` = 4, `reagentCount6` = 0, `reagentCount7` = 0, `reagentCount8` = 0, `equippedItemClass` = -1, `equippedItemSubClassMask` = 0, `equippedItemInventoryTypeMask` = 0, `effect1` = 24, `effect2` = 0, `effect3` = 0, `effectDieSides1` = 1, `effectDieSides2` = 0, `effectDieSides3` = 0, `effectBaseDice1` = 1, `effectBaseDice2` = 0, `effectBaseDice3` = 0, `effectDicePerLevel1` = 0, `effectDicePerLevel2` = 0, `effectDicePerLevel3` = 0, `effectRealPointsPerLevel1` = 0, `effectRealPointsPerLevel2` = 0, `effectRealPointsPerLevel3` = 0, `effectBasePoints1` = 0, `effectBasePoints2` = 0, `effectBasePoints3` = 0, `effectBonusCoefficient1` = 0, `effectBonusCoefficient2` = -1, `effectBonusCoefficient3` = -1, `effectMechanic1` = 0, `effectMechanic2` = 0, `effectMechanic3` = 0, `effectImplicitTargetA1` = 1, `effectImplicitTargetA2` = 0, `effectImplicitTargetA3` = 0, `effectImplicitTargetB1` = 0, `effectImplicitTargetB2` = 0, `effectImplicitTargetB3` = 0, `effectRadiusIndex1` = 0, `effectRadiusIndex2` = 0, `effectRadiusIndex3` = 0, `effectApplyAuraName1` = 0, `effectApplyAuraName2` = 0, `effectApplyAuraName3` = 0, `effectAmplitude1` = 0, `effectAmplitude2` = 0, `effectAmplitude3` = 0, `effectMultipleValue1` = 0, `effectMultipleValue2` = 0, `effectMultipleValue3` = 0, `effectChainTarget1` = 0, `effectChainTarget2` = 0, `effectChainTarget3` = 0, `effectItemType1` = 60009, `effectItemType2` = 0, `effectItemType3` = 0, `effectMiscValue1` = 0, `effectMiscValue2` = 0, `effectMiscValue3` = 0, `effectTriggerSpell1` = 0, `effectTriggerSpell2` = 0, `effectTriggerSpell3` = 0, `effectPointsPerComboPoint1` = 0, `effectPointsPerComboPoint2` = 0, `effectPointsPerComboPoint3` = 0, `spellVisual1` = 395, `spellVisual2` = 0, `spellIconId` = 140, `activeIconId` = 0, `spellPriority` = 0, `name` = 'Towerforge Pauldrons', `nameFlags` = 4128894, `nameSubtext` = '', `nameSubtextFlags` = 4128892, `description` = '', `descriptionFlags` = 4128894, `auraDescription` = '', `auraDescriptionFlags` = 4128892, `manaCostPercentage` = 0, `startRecoveryCategory` = 0, `startRecoveryTime` = 0, `minTargetLevel` = 0, `maxTargetLevel` = 0, `spellFamilyName` = 0, `spellFamilyFlags` = 0, `maxAffectedTargets` = 0, `dmgClass` = 0, `preventionType` = 0, `stanceBarOrder` = -1, `dmgMultiplier1` = 1, `dmgMultiplier2` = 1, `dmgMultiplier3` = 1, `minFactionId` = 0, `minReputation` = 0, `requiredAuraVision` = 0, `customFlags` = 0 WHERE `entry` = 57191;
UPDATE `spell_template` SET `school` = 0, `category` = 0, `castUI` = 0, `dispel` = 0, `mechanic` = 0, `attributes` = 65584, `attributesEx` = 0, `attributesEx2` = 0, `attributesEx3` = 0, `attributesEx4` = 0, `stances` = 0, `stancesNot` = 0, `targets` = 0, `targetCreatureType` = 0, `requiresSpellFocus` = 1, `casterAuraState` = 0, `targetAuraState` = 0, `castingTimeIndex` = 39, `recoveryTime` = 0, `categoryRecoveryTime` = 0, `interruptFlags` = 15, `auraInterruptFlags` = 0, `channelInterruptFlags` = 0, `procFlags` = 0, `procChance` = 101, `procCharges` = 0, `maxLevel` = 0, `baseLevel` = 0, `spellLevel` = 0, `durationIndex` = 0, `powerType` = 0, `manaCost` = 0, `manCostPerLevel` = 0, `manaPerSecond` = 0, `manaPerSecondPerLevel` = 0, `rangeIndex` = 1, `speed` = 0, `modelNextSpell` = 0, `stackAmount` = 0, `totem1` = 5956, `totem2` = 0, `reagent1` = 12655, `reagent2` = 12360, `reagent3` = 11371, `reagent4` = 61673, `reagent5` = 22203, `reagent6` = 18335, `reagent7` = 0, `reagent8` = 0, `reagentCount1` = 12, `reagentCount2` = 14, `reagentCount3` = 14, `reagentCount4` = 8, `reagentCount5` = 2, `reagentCount6` = 1, `reagentCount7` = 0, `reagentCount8` = 0, `equippedItemClass` = -1, `equippedItemSubClassMask` = 0, `equippedItemInventoryTypeMask` = 0, `effect1` = 24, `effect2` = 0, `effect3` = 0, `effectDieSides1` = 1, `effectDieSides2` = 0, `effectDieSides3` = 0, `effectBaseDice1` = 1, `effectBaseDice2` = 0, `effectBaseDice3` = 0, `effectDicePerLevel1` = 0, `effectDicePerLevel2` = 0, `effectDicePerLevel3` = 0, `effectRealPointsPerLevel1` = 0, `effectRealPointsPerLevel2` = 0, `effectRealPointsPerLevel3` = 0, `effectBasePoints1` = 0, `effectBasePoints2` = 0, `effectBasePoints3` = 0, `effectBonusCoefficient1` = 0, `effectBonusCoefficient2` = -1, `effectBonusCoefficient3` = -1, `effectMechanic1` = 0, `effectMechanic2` = 0, `effectMechanic3` = 0, `effectImplicitTargetA1` = 1, `effectImplicitTargetA2` = 0, `effectImplicitTargetA3` = 0, `effectImplicitTargetB1` = 0, `effectImplicitTargetB2` = 0, `effectImplicitTargetB3` = 0, `effectRadiusIndex1` = 0, `effectRadiusIndex2` = 0, `effectRadiusIndex3` = 0, `effectApplyAuraName1` = 0, `effectApplyAuraName2` = 0, `effectApplyAuraName3` = 0, `effectAmplitude1` = 0, `effectAmplitude2` = 0, `effectAmplitude3` = 0, `effectMultipleValue1` = 0, `effectMultipleValue2` = 0, `effectMultipleValue3` = 0, `effectChainTarget1` = 0, `effectChainTarget2` = 0, `effectChainTarget3` = 0, `effectItemType1` = 60010, `effectItemType2` = 0, `effectItemType3` = 0, `effectMiscValue1` = 0, `effectMiscValue2` = 0, `effectMiscValue3` = 0, `effectTriggerSpell1` = 0, `effectTriggerSpell2` = 0, `effectTriggerSpell3` = 0, `effectPointsPerComboPoint1` = 0, `effectPointsPerComboPoint2` = 0, `effectPointsPerComboPoint3` = 0, `spellVisual1` = 395, `spellVisual2` = 0, `spellIconId` = 140, `activeIconId` = 0, `spellPriority` = 0, `name` = 'Towerforge Demolisher', `nameFlags` = 4128894, `nameSubtext` = '', `nameSubtextFlags` = 4128892, `description` = '', `descriptionFlags` = 4128894, `auraDescription` = '', `auraDescriptionFlags` = 4128892, `manaCostPercentage` = 0, `startRecoveryCategory` = 0, `startRecoveryTime` = 0, `minTargetLevel` = 0, `maxTargetLevel` = 0, `spellFamilyName` = 0, `spellFamilyFlags` = 0, `maxAffectedTargets` = 0, `dmgClass` = 0, `preventionType` = 0, `stanceBarOrder` = -1, `dmgMultiplier1` = 1, `dmgMultiplier2` = 1, `dmgMultiplier3` = 1, `minFactionId` = 0, `minReputation` = 0, `requiredAuraVision` = 0, `customFlags` = 0 WHERE `entry` = 57193;

-- Restore previously overriden fixes:

REPLACE INTO `spell_template` (`entry`, `school`, `category`, `castUI`, `dispel`, `mechanic`, `attributes`, `attributesEx`, `attributesEx2`, `attributesEx3`, `attributesEx4`, `stances`, `stancesNot`, `targets`, `targetCreatureType`, `requiresSpellFocus`, `casterAuraState`, `targetAuraState`, `castingTimeIndex`, `recoveryTime`, `categoryRecoveryTime`, `interruptFlags`, `auraInterruptFlags`, `channelInterruptFlags`, `procFlags`, `procChance`, `procCharges`, `maxLevel`, `baseLevel`, `spellLevel`, `durationIndex`, `powerType`, `manaCost`, `manCostPerLevel`, `manaPerSecond`, `manaPerSecondPerLevel`, `rangeIndex`, `speed`, `modelNextSpell`, `stackAmount`, `totem1`, `totem2`, `reagent1`, `reagent2`, `reagent3`, `reagent4`, `reagent5`, `reagent6`, `reagent7`, `reagent8`, `reagentCount1`, `reagentCount2`, `reagentCount3`, `reagentCount4`, `reagentCount5`, `reagentCount6`, `reagentCount7`, `reagentCount8`, `equippedItemClass`, `equippedItemSubClassMask`, `equippedItemInventoryTypeMask`, `effect1`, `effect2`, `effect3`, `effectDieSides1`, `effectDieSides2`, `effectDieSides3`, `effectBaseDice1`, `effectBaseDice2`, `effectBaseDice3`, `effectDicePerLevel1`, `effectDicePerLevel2`, `effectDicePerLevel3`, `effectRealPointsPerLevel1`, `effectRealPointsPerLevel2`, `effectRealPointsPerLevel3`, `effectBasePoints1`, `effectBasePoints2`, `effectBasePoints3`, `effectBonusCoefficient1`, `effectBonusCoefficient2`, `effectBonusCoefficient3`, `effectMechanic1`, `effectMechanic2`, `effectMechanic3`, `effectImplicitTargetA1`, `effectImplicitTargetA2`, `effectImplicitTargetA3`, `effectImplicitTargetB1`, `effectImplicitTargetB2`, `effectImplicitTargetB3`, `effectRadiusIndex1`, `effectRadiusIndex2`, `effectRadiusIndex3`, `effectApplyAuraName1`, `effectApplyAuraName2`, `effectApplyAuraName3`, `effectAmplitude1`, `effectAmplitude2`, `effectAmplitude3`, `effectMultipleValue1`, `effectMultipleValue2`, `effectMultipleValue3`, `effectChainTarget1`, `effectChainTarget2`, `effectChainTarget3`, `effectItemType1`, `effectItemType2`, `effectItemType3`, `effectMiscValue1`, `effectMiscValue2`, `effectMiscValue3`, `effectTriggerSpell1`, `effectTriggerSpell2`, `effectTriggerSpell3`, `effectPointsPerComboPoint1`, `effectPointsPerComboPoint2`, `effectPointsPerComboPoint3`, `spellVisual1`, `spellVisual2`, `spellIconId`, `activeIconId`, `spellPriority`, `name`, `nameFlags`, `nameSubtext`, `nameSubtextFlags`, `description`, `descriptionFlags`, `auraDescription`, `auraDescriptionFlags`, `manaCostPercentage`, `startRecoveryCategory`, `startRecoveryTime`, `minTargetLevel`, `maxTargetLevel`, `spellFamilyName`, `spellFamilyFlags`, `maxAffectedTargets`, `dmgClass`, `preventionType`, `stanceBarOrder`, `dmgMultiplier1`, `dmgMultiplier2`, `dmgMultiplier3`, `minFactionId`, `minReputation`, `requiredAuraVision`, `customFlags`) VALUES (57518, 0, 0, 3, 0, 0, 65536, 0, 0, 0, 0, 0, 0, 0, 0, 883, 0, 0, 39, 604800000, 0, 15, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 61197, 61673, 61199, 20725, 13468, 12803, 0, 0, 5, 25, 25, 10, 5, 80, 0, 0, -1, 0, 0, 24, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 61732, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1168, 0, 1757, 0, 0, 'Eternal Dreamstone Shard', 4128894, '', 4128892, 'The combining of dream fragments can only be done at a moonwell, and only ocassionally will the waters permit themselves to be used in such a way.', 4128894, '', 4128892, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 1, 1, 0, 0, 0, 0);
REPLACE INTO `spell_template` (`entry`, `school`, `category`, `castUI`, `dispel`, `mechanic`, `attributes`, `attributesEx`, `attributesEx2`, `attributesEx3`, `attributesEx4`, `stances`, `stancesNot`, `targets`, `targetCreatureType`, `requiresSpellFocus`, `casterAuraState`, `targetAuraState`, `castingTimeIndex`, `recoveryTime`, `categoryRecoveryTime`, `interruptFlags`, `auraInterruptFlags`, `channelInterruptFlags`, `procFlags`, `procChance`, `procCharges`, `maxLevel`, `baseLevel`, `spellLevel`, `durationIndex`, `powerType`, `manaCost`, `manCostPerLevel`, `manaPerSecond`, `manaPerSecondPerLevel`, `rangeIndex`, `speed`, `modelNextSpell`, `stackAmount`, `totem1`, `totem2`, `reagent1`, `reagent2`, `reagent3`, `reagent4`, `reagent5`, `reagent6`, `reagent7`, `reagent8`, `reagentCount1`, `reagentCount2`, `reagentCount3`, `reagentCount4`, `reagentCount5`, `reagentCount6`, `reagentCount7`, `reagentCount8`, `equippedItemClass`, `equippedItemSubClassMask`, `equippedItemInventoryTypeMask`, `effect1`, `effect2`, `effect3`, `effectDieSides1`, `effectDieSides2`, `effectDieSides3`, `effectBaseDice1`, `effectBaseDice2`, `effectBaseDice3`, `effectDicePerLevel1`, `effectDicePerLevel2`, `effectDicePerLevel3`, `effectRealPointsPerLevel1`, `effectRealPointsPerLevel2`, `effectRealPointsPerLevel3`, `effectBasePoints1`, `effectBasePoints2`, `effectBasePoints3`, `effectBonusCoefficient1`, `effectBonusCoefficient2`, `effectBonusCoefficient3`, `effectMechanic1`, `effectMechanic2`, `effectMechanic3`, `effectImplicitTargetA1`, `effectImplicitTargetA2`, `effectImplicitTargetA3`, `effectImplicitTargetB1`, `effectImplicitTargetB2`, `effectImplicitTargetB3`, `effectRadiusIndex1`, `effectRadiusIndex2`, `effectRadiusIndex3`, `effectApplyAuraName1`, `effectApplyAuraName2`, `effectApplyAuraName3`, `effectAmplitude1`, `effectAmplitude2`, `effectAmplitude3`, `effectMultipleValue1`, `effectMultipleValue2`, `effectMultipleValue3`, `effectChainTarget1`, `effectChainTarget2`, `effectChainTarget3`, `effectItemType1`, `effectItemType2`, `effectItemType3`, `effectMiscValue1`, `effectMiscValue2`, `effectMiscValue3`, `effectTriggerSpell1`, `effectTriggerSpell2`, `effectTriggerSpell3`, `effectPointsPerComboPoint1`, `effectPointsPerComboPoint2`, `effectPointsPerComboPoint3`, `spellVisual1`, `spellVisual2`, `spellIconId`, `activeIconId`, `spellPriority`, `name`, `nameFlags`, `nameSubtext`, `nameSubtextFlags`, `description`, `descriptionFlags`, `auraDescription`, `auraDescriptionFlags`, `manaCostPercentage`, `startRecoveryCategory`, `startRecoveryTime`, `minTargetLevel`, `maxTargetLevel`, `spellFamilyName`, `spellFamilyFlags`, `maxAffectedTargets`, `dmgClass`, `preventionType`, `stanceBarOrder`, `dmgMultiplier1`, `dmgMultiplier2`, `dmgMultiplier3`, `minFactionId`, `minReputation`, `requiredAuraVision`, `customFlags`) VALUES (57519, 0, 0, 0, 0, 0, 262400, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 14, 0, 0, 15, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 57518, 0, 0, 0, 0, 0, 107, 0, 241, 0, 0, 'Formula: Eternal Dreamstone Shard', 4128894, '', 4128892, 'Teaches you how to create an Eternal Dreamstate Essence.', 4128894, '', 4128892, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 1, 1, 0, 0, 0, 0);

UPDATE `item_template` SET `display_id` = 24730 WHERE `entry` = 61732;
UPDATE `item_template` SET `spellid_1` = 57519 WHERE `entry` = 61733;
