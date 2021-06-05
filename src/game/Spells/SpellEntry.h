/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef _SPELLENTRY_H
#define _SPELLENTRY_H

#include <array>
#include "DBCStructure.h"
#include "SharedDefines.h"
#include "SpellDefines.h"
#include "SpellAuraDefines.h"

class Spell;
class Unit;
class WorldObject;
class SpellEntry;

namespace Spells
{
    SpellSpecific GetSpellSpecific(uint32 spellId);

    // Diminishing Returns interaction with spells
    inline DiminishingReturnsType GetDiminishingReturnsGroupType(DiminishingGroup group)
    {
        switch (group)
        {
            case DIMINISHING_CONTROL_STUN:
            case DIMINISHING_TRIGGER_STUN:
            case DIMINISHING_KIDNEYSHOT:
                return DRTYPE_ALL;
            case DIMINISHING_SLEEP:
            case DIMINISHING_CONTROL_ROOT:
            case DIMINISHING_TRIGGER_ROOT:
            case DIMINISHING_FEAR:
            case DIMINISHING_CHARM:
            case DIMINISHING_POLYMORPH:
            case DIMINISHING_SILENCE:
            case DIMINISHING_DISARM:
            case DIMINISHING_DEATHCOIL:
            case DIMINISHING_FREEZE:
            case DIMINISHING_BANISH:
            case DIMINISHING_WARLOCK_FEAR:
            case DIMINISHING_KNOCKOUT:
                return DRTYPE_PLAYER;
            default:
                break;
        }

        return DRTYPE_NONE;
    }

    inline float GetDiminishingRate(uint32 type)
    {
        switch (type)
        {
            case DIMINISHING_LEVEL_1:
                return 1.0f;
            case DIMINISHING_LEVEL_2:
                return 0.5f;
            case DIMINISHING_LEVEL_3:
                return 0.25f;
            case DIMINISHING_LEVEL_IMMUNE:
                return 0.0f;
            default:
                break;
        }

        return 1.0f;
    }

    // Different spell properties
    inline float GetSpellRadius(SpellRadiusEntry const *radius) { return (radius ? radius->Radius : 0); }
    inline float GetSpellMinRange(SpellRangeEntry const *range) { return (range ? range->minRange : 0); }
    inline float GetSpellMaxRange(SpellRangeEntry const *range) { return (range ? range->maxRange : 0); }
    int32 CompareAuraRanks(uint32 spellId_1, uint32 spellId_2);
    bool CompareSpellSpecificAuras(SpellEntry const* spellInfo_1, SpellEntry const* spellInfo_2);

    // order from less to more strict
    // target not allow have more one spell specific from same caster
    inline bool IsSingleFromSpellSpecificPerTargetPerCaster(SpellSpecific spellSpec1, SpellSpecific spellSpec2)
    {
        switch (spellSpec1)
        {
            case SPELL_BLESSING:
            case SPELL_AURA:
            case SPELL_STING:
            case SPELL_CURSE:
            case SPELL_ASPECT:
            case SPELL_POSITIVE_SHOUT:
            case SPELL_JUDGEMENT:
                return spellSpec1 == spellSpec2;
            default:
                return false;
        }
    }

    // target not allow have more one ranks from spell from spell specific per target
    inline bool IsSingleFromSpellSpecificSpellRanksPerTarget(SpellSpecific spellSpec1, SpellSpecific spellSpec2)
    {
        switch (spellSpec1)
        {
            case SPELL_BLESSING:
            case SPELL_AURA:
            case SPELL_CURSE:
            case SPELL_ASPECT:
            case SPELL_JUDGEMENT:
                return spellSpec1 == spellSpec2;
            default:
                return false;
        }
    }

    // target not allow have more one spell specific per target from any caster
    inline bool IsSingleFromSpellSpecificPerTarget(SpellSpecific spellSpec1, SpellSpecific spellSpec2)
    {
        switch (spellSpec1)
        {
            case SPELL_SEAL:
            case SPELL_TRACKER:
            case SPELL_WARLOCK_ARMOR:
            case SPELL_MAGE_ARMOR:
            case SPELL_ELEMENTAL_SHIELD:
            case SPELL_MAGE_POLYMORPH:
            case SPELL_WELL_FED:
            case SPELL_NEGATIVE_HASTE:
            case SPELL_SNARE:
                return spellSpec1 == spellSpec2;
            case SPELL_BATTLE_ELIXIR:
                return spellSpec2 == SPELL_BATTLE_ELIXIR
                    || spellSpec2 == SPELL_FLASK_ELIXIR;
            case SPELL_GUARDIAN_ELIXIR:
                return spellSpec2 == SPELL_GUARDIAN_ELIXIR
                    || spellSpec2 == SPELL_FLASK_ELIXIR;
            case SPELL_FLASK_ELIXIR:
                return spellSpec2 == SPELL_BATTLE_ELIXIR
                    || spellSpec2 == SPELL_GUARDIAN_ELIXIR
                    || spellSpec2 == SPELL_FLASK_ELIXIR;
            case SPELL_FOOD:
                return spellSpec2 == SPELL_FOOD
                    || spellSpec2 == SPELL_FOOD_AND_DRINK;
            case SPELL_DRINK:
                return spellSpec2 == SPELL_DRINK
                    || spellSpec2 == SPELL_FOOD_AND_DRINK;
            case SPELL_FOOD_AND_DRINK:
                return spellSpec2 == SPELL_FOOD
                    || spellSpec2 == SPELL_DRINK
                    || spellSpec2 == SPELL_FOOD_AND_DRINK;
            default:
                return false;
        }
    }

    bool IsPassiveSpell(uint32 spellId);
    bool IsPositiveSpell(uint32 spellId);
    bool IsPositiveSpell(uint32 spellId, Unit* caster, Unit* victim);

    inline bool IsPositiveTarget(uint32 targetA, uint32 targetB)
    {
        switch (targetA)
        {
            // non-positive targets
            case TARGET_CHAIN_DAMAGE:
            case TARGET_ALL_ENEMY_IN_AREA:
            case TARGET_ALL_ENEMY_IN_AREA_INSTANT:
            case TARGET_IN_FRONT_OF_CASTER:
            case TARGET_ALL_ENEMY_IN_AREA_CHANNELED:
            case TARGET_CURRENT_ENEMY_COORDINATES:
                return false;
            // positive or dependent
            case TARGET_CASTER_COORDINATES:
                return (targetB == TARGET_ALL_PARTY || targetB == TARGET_ALL_FRIENDLY_UNITS_AROUND_CASTER || targetB == TARGET_AREAEFFECT_INSTANT);
            default:
                break;
        }
        if (targetB)
            return IsPositiveTarget(targetB, 0);
        return true;
    }

    inline bool IsExplicitPositiveTarget(uint32 targetA)
    {
        // positive targets that in target selection code expect target in m_targers, so not that auto-select target by spell data by m_caster and etc
        switch (targetA)
        {
            case TARGET_SINGLE_FRIEND:
            case TARGET_SINGLE_PARTY:
            case TARGET_CHAIN_HEAL:
            case TARGET_SINGLE_FRIEND_2:
            case TARGET_AREAEFFECT_PARTY_AND_CLASS:
                return true;
            default:
                break;
        }
        return false;
    }

    inline bool IsExplicitNegativeTarget(uint32 targetA)
    {
        // non-positive targets that in target selection code expect target in m_targers, so not that auto-select target by spell data by m_caster and etc
        switch (targetA)
        {
            case TARGET_CHAIN_DAMAGE:
            case TARGET_CURRENT_ENEMY_COORDINATES:
                return true;
            default:
                break;
        }
        return false;
    }

    // Requires you to manually select an unit as the target.
    inline bool IsExplicitlySelectedUnitTarget(uint32 target)
    {
        switch (target)
        {
            case TARGET_CHAIN_DAMAGE:
            case TARGET_SINGLE_FRIEND:
            case TARGET_UNIT_TARGET_ANY:
            case TARGET_CHAIN_HEAL:
            case TARGET_CURRENT_ENEMY_COORDINATES :
            case TARGET_SINGLE_FRIEND_2:
            //case TARGET_AREAEFFECT_PARTY_AND_CLASS:
                return true;
        }
        return false;
    }

    inline bool IsIgnoreLosTarget(uint32 target)
    {
        switch (target)
        {
            case TARGET_AREAEFFECT_PARTY:
            case TARGET_AREAEFFECT_PARTY_AND_CLASS:
                return true;
        }
        return false;
    }

    bool IsSingleTargetSpells(SpellEntry const *spellInfo1, SpellEntry const *spellInfo2);

    inline bool IsCasterSourceTarget(uint32 target)
    {
        switch (target )
        {
            case TARGET_SELF:
            case TARGET_PET:
            case TARGET_ALL_PARTY_AROUND_CASTER:
            case TARGET_IN_FRONT_OF_CASTER:
            case TARGET_MASTER:
            case TARGET_MINION:
            case TARGET_ALL_PARTY:
            case TARGET_ALL_PARTY_AROUND_CASTER_2:
            case TARGET_SELF_FISHING:
            case TARGET_TOTEM_EARTH:
            case TARGET_TOTEM_WATER:
            case TARGET_TOTEM_AIR:
            case TARGET_TOTEM_FIRE:
            case TARGET_AREAEFFECT_GO_AROUND_DEST:
                return true;
            default:
                break;
        }
        return false;
    }

    inline bool IsPointEffectTarget(SpellTarget target)
    {
        switch (target )
        {
            case TARGET_INNKEEPER_COORDINATES:
            case TARGET_TABLE_X_Y_Z_COORDINATES:
            case TARGET_CASTER_COORDINATES:
            case TARGET_SCRIPT_COORDINATES:
            case TARGET_CURRENT_ENEMY_COORDINATES:
            case TARGET_DUELVSPLAYER_COORDINATES:
                return true;
            default:
                break;
        }
        return false;
    }

    inline bool IsAreaEffectPossitiveTarget(SpellTarget target)
    {
        switch (target )
        {
            case TARGET_ALL_PARTY_AROUND_CASTER:
            case TARGET_ALL_FRIENDLY_UNITS_AROUND_CASTER:
            case TARGET_ALL_FRIENDLY_UNITS_IN_AREA:
            case TARGET_ALL_PARTY:
            case TARGET_ALL_PARTY_AROUND_CASTER_2:
            case TARGET_AREAEFFECT_PARTY:
            case TARGET_ALL_RAID_AROUND_CASTER:
            case TARGET_AREAEFFECT_PARTY_AND_CLASS:
                return true;
            default:
                break;
        }
        return false;
    }

    inline bool IsAreaEffectTarget(SpellTarget target)
    {
        switch (target )
        {
            case TARGET_AREAEFFECT_INSTANT:
            case TARGET_AREAEFFECT_CUSTOM:
            case TARGET_ALL_ENEMY_IN_AREA:
            case TARGET_ALL_ENEMY_IN_AREA_INSTANT:
            case TARGET_ALL_PARTY_AROUND_CASTER:
            case TARGET_IN_FRONT_OF_CASTER:
            case TARGET_ALL_ENEMY_IN_AREA_CHANNELED:
            case TARGET_ALL_FRIENDLY_UNITS_AROUND_CASTER:
            case TARGET_ALL_FRIENDLY_UNITS_IN_AREA:
            case TARGET_ALL_PARTY:
            case TARGET_ALL_PARTY_AROUND_CASTER_2:
            case TARGET_AREAEFFECT_PARTY:
            case TARGET_AREAEFFECT_GO_AROUND_DEST:
            case TARGET_ALL_RAID_AROUND_CASTER:
            case TARGET_AREAEFFECT_PARTY_AND_CLASS:
                return true;
            default:
                break;
        }
        return false;
    }

    inline bool IsAreaAuraEffect(uint32 effect)
    {
        return
                effect == SPELL_EFFECT_APPLY_AREA_AURA_PARTY  ||
                effect == SPELL_EFFECT_APPLY_AREA_AURA_PET    ||
                // Post-vanilla but very useful sometimes.
                effect == SPELL_EFFECT_APPLY_AREA_AURA_RAID   ||
                effect == SPELL_EFFECT_APPLY_AREA_AURA_ENEMY  ||
                effect == SPELL_EFFECT_APPLY_AREA_AURA_FRIEND ;
    }

    inline uint32 GetDispellMask(DispelType dispel)
    {
        // If dispell all
        if (dispel == DISPEL_ALL)
            return DISPEL_ALL_MASK;
        else
            return (1 << dispel);
    }

    inline bool IsEffectAppliesAura(uint32 effectName)
    {
        switch (effectName)
        {
            case SPELL_EFFECT_APPLY_AURA:
            case SPELL_EFFECT_APPLY_AREA_AURA_PARTY:
            case SPELL_EFFECT_APPLY_AREA_AURA_PET:
            case SPELL_EFFECT_APPLY_AREA_AURA_RAID:
            case SPELL_EFFECT_APPLY_AREA_AURA_FRIEND:
            case SPELL_EFFECT_APPLY_AREA_AURA_ENEMY:
                return true;
        }

        return false;
    }
}

class SpellEntry
{
public:
    SpellEntry() = default;
    ~SpellEntry() = default;
    void InitCachedValues();


    /// DBC DATA:
    uint32    Id = 0;                                          // 0
    uint32    School = 0;                                      // 1
    uint32    Category = 0;                                    // 2
    //uint32    castUI;                                          // 3 not used
    uint32    Dispel = 0;                                      // 4
    uint32    Mechanic = 0;                                    // 5
    uint32    Attributes = 0;                                  // 6
    uint32    AttributesEx = 0;                                // 7
    uint32    AttributesEx2 = 0;                               // 8
    uint32    AttributesEx3 = 0;                               // 9
    uint32    AttributesEx4 = 0;                               // 10
    uint32    Stances = 0;                                     // 11
    uint32    StancesNot = 0;                                  // 12
    uint32    Targets = 0;                                     // 13
    uint32    TargetCreatureType = 0;                          // 14
    uint32    RequiresSpellFocus = 0;                          // 15
    uint32    CasterAuraState = 0;                             // 16
    uint32    TargetAuraState = 0;                             // 17
    uint32    CastingTimeIndex = 0;                            // 18
    uint32    RecoveryTime = 0;                                // 19
    uint32    CategoryRecoveryTime = 0;                        // 20
    uint32    InterruptFlags = 0;                              // 21
    uint32    AuraInterruptFlags = 0;                          // 22
    uint32    ChannelInterruptFlags = 0;                       // 23
    uint32    procFlags = 0;                                   // 24
    uint32    procChance = 0;                                  // 25
    uint32    procCharges = 0;                                 // 26
    uint32    maxLevel = 0;                                    // 27
    uint32    baseLevel = 0;                                   // 28
    uint32    spellLevel = 0;                                  // 29
    uint32    DurationIndex = 0;                               // 30
    uint32    powerType = 0;                                   // 31
    uint32    manaCost = 0;                                    // 32
    uint32    manaCostPerlevel = 0;                            // 33
    uint32    manaPerSecond = 0;                               // 34
    uint32    manaPerSecondPerLevel = 0;                       // 35
    uint32    rangeIndex = 1;                                  // 36
    float     speed = 0.f;                                     // 37
    //uint32    modalNextSpell;                                  // 38 not used
    uint32    StackAmount = 0;                                 // 39
    uint32    Totem[MAX_SPELL_TOTEMS] = {};                    // 40-41
    int32     Reagent[MAX_SPELL_REAGENTS] = {};                // 42-49
    uint32    ReagentCount[MAX_SPELL_REAGENTS] = {};           // 50-57
    int32     EquippedItemClass = -1;                          // 58 (value)
    int32     EquippedItemSubClassMask = 0;                    // 59 (mask)
    int32     EquippedItemInventoryTypeMask = 0;               // 60 (mask)
    uint32    Effect[MAX_EFFECT_INDEX] = {};                   // 61-63
    int32     EffectDieSides[MAX_EFFECT_INDEX] = {};           // 64-66
    uint32    EffectBaseDice[MAX_EFFECT_INDEX] = {};           // 67-69
    float     EffectDicePerLevel[MAX_EFFECT_INDEX] = {};       // 70-72
    float     EffectRealPointsPerLevel[MAX_EFFECT_INDEX] = {}; // 73-75
    int32     EffectBasePoints[MAX_EFFECT_INDEX] = {};         // 76-78
    uint32    EffectMechanic[MAX_EFFECT_INDEX] = {};           // 79-81
    uint32    EffectImplicitTargetA[MAX_EFFECT_INDEX] = {};    // 82-84
    uint32    EffectImplicitTargetB[MAX_EFFECT_INDEX] = {};    // 85-87
    uint32    EffectRadiusIndex[MAX_EFFECT_INDEX] = {};        // 88-90
    uint32    EffectApplyAuraName[MAX_EFFECT_INDEX] = {};      // 91-93
    uint32    EffectAmplitude[MAX_EFFECT_INDEX] = {};          // 94-96
    float     EffectMultipleValue[MAX_EFFECT_INDEX] = {};      // 97-99
    uint32    EffectChainTarget[MAX_EFFECT_INDEX] = {};        // 100-102
    uint32    EffectItemType[MAX_EFFECT_INDEX] = {};           // 103-105
    int32     EffectMiscValue[MAX_EFFECT_INDEX] = {};          // 106-108
    uint32    EffectTriggerSpell[MAX_EFFECT_INDEX] = {};       // 109-111
    float     EffectPointsPerComboPoint[MAX_EFFECT_INDEX] = {};// 112-114
    uint32    SpellVisual = 0;                                 // 115
    //uint32    SpellVisual2;                                    // 116 not used
    uint32    SpellIconID = 0;                                 // 117
    uint32    activeIconID = 0;                                // 118
    uint32    spellPriority = 0;                               // 119
    std::array<std::string, MAX_DBC_LOCALE> SpellName{};       // 120-127
    //uint32    SpellNameFlag;                                   // 128     not used
    std::array<std::string, MAX_DBC_LOCALE> Rank{};            // 129-136
    //uint32    RankFlags;                                       // 137     not used
    //char*     Description[8];                                  // 138-145 not used
    //uint32    DescriptionFlags;                                // 146     not used
    //char*     ToolTip[8];                                      // 147-154 not used
    //uint32    ToolTipFlags;                                    // 155     not used
    uint32    ManaCostPercentage = 0;                          // 156
    uint32    StartRecoveryCategory = 0;                       // 157
    uint32    StartRecoveryTime = 0;                           // 158
    uint32    MaxTargetLevel = 0;                              // 160
    uint32    SpellFamilyName = 0;                             // 161
    uint64    SpellFamilyFlags = 0;                            // 162
    uint32    MaxAffectedTargets = 0;                          // 163
    uint32    DmgClass = 0;                                    // 164
    uint32    PreventionType = 0;                              // 165
    //int32     StanceBarOrder;                                  // 166 not used
    float     DmgMultiplier[MAX_EFFECT_INDEX] = {};            // 167-169
    //uint32    MinFactionId;                                    // 170 not used
    //uint32    MinReputation;                                   // 171 not used
    //uint32    RequiredAuraVision;                              // 172 not used

    /// CUSTOM FIELDS:
    uint32 MinTargetLevel = 0;                                 // 159
    uint32 Custom = 0;                                         // 173
    uint32 Internal = 0;                                       // Assigned by the core.
protected:
    bool _isBinary = false;
    bool _isDispel = false;
    bool _isNonPeriodicDispel = false;
    void ComputeBinary();
    void ComputeNonPeriodicDispel();
    void ComputeDispel();
public:
    bool IsBinary() const { return _isBinary; }
    bool IsDispel() const { return _isDispel; }
    bool IsNonPeriodicDispel() const { return _isNonPeriodicDispel; }
    bool IsPvEHeartBeat() const;
    bool IsCCSpell() const;
    DiminishingGroup GetDiminishingReturnsGroup(bool triggered) const;

    // helpers
    int32 CalculateSimpleValue(SpellEffectIndex eff) const { return EffectBasePoints[eff] + int32(EffectBaseDice[eff]); }

    bool IsFitToFamilyMask(uint64 familyFlags) const
    {
        return !!(SpellFamilyFlags & familyFlags);
    }

    bool IsFitToFamily(SpellFamily family, uint64 familyFlags) const
    {
        return SpellFamily(SpellFamilyName) == family && IsFitToFamilyMask(familyFlags);
    }

    template <SpellFamily family, ClassFlag... Args>
    bool IsFitToFamily() const
    {
        return SpellFamily(SpellFamilyName) == family && !!(SpellFamilyFlags & BitMask<uint64, Args...>::value);
    }

    template <ClassFlag... Args>
    bool IsFitToFamilyMask() const
    {
        return !!(SpellFamilyFlags & BitMask<uint64, Args...>::value);
    }

    bool IsAuraAddedBySpell(uint32 auraType) const
    {
        for (int i = 0; i < MAX_EFFECT_INDEX; i++)
            if (EffectApplyAuraName[i] == auraType)
                return true;
        return false;
    }

    uint32 GetAllSpellMechanicMask() const
    {
        uint32 mask = 0;
        if (Mechanic)
            mask |= 1 << (Mechanic - 1);
        for (int i=0; i< MAX_EFFECT_INDEX; ++i)
            if (EffectMechanic[i])
                mask |= 1 << (EffectMechanic[i]-1);
        return mask;
    }

    bool HasAttribute(SpellAttributes attribute) const { return Attributes & attribute; }
    bool HasAttribute(SpellAttributesEx attribute) const { return AttributesEx & attribute; }
    bool HasAttribute(SpellAttributesEx2 attribute) const { return AttributesEx2 & attribute; }
    bool HasAttribute(SpellAttributesEx3 attribute) const { return AttributesEx3 & attribute; }
    bool HasAttribute(SpellAttributesEx4 attribute) const { return AttributesEx4 & attribute; }
    inline bool HasEffect(SpellEffects effect) const
    {
        for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
            if (SpellEffects(Effect[i]) == effect)
                return true;
            
        return false;
    }

    inline bool IsSpellAppliesAura() const
    {
        return Internal & SPELL_INTERNAL_APPLIES_AURA;
    }

    inline bool IsSpellAppliesAura(uint32 effectMask) const
    {
        for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (effectMask & (1 << i))
            {
                if (Spells::IsEffectAppliesAura(Effect[i]) && EffectApplyAuraName[i])
                    return true;
            }
        }
        return false;
    }

    // Spells that apply damage or heal over time
    // Returns false for periodic and direct mixed spells (immolate, etc)
    inline bool IsSpellAppliesPeriodicAura() const
    {
        return Internal & SPELL_INTERNAL_APPLIES_PERIODIC_AURA;
    }

    inline bool IsEffectHandledOnDelayedSpellLaunch(SpellEffectIndex effecIdx) const
    {
        switch (Effect[effecIdx])
        {
            case SPELL_EFFECT_SCHOOL_DAMAGE:
            case SPELL_EFFECT_WEAPON_DAMAGE_NOSCHOOL:
            case SPELL_EFFECT_WEAPON_PERCENT_DAMAGE:
            case SPELL_EFFECT_WEAPON_DAMAGE:
            case SPELL_EFFECT_NORMALIZED_WEAPON_DMG:
                return true;
            default:
                return false;
        }
    }

    inline bool IsPeriodicRegenerateEffect(SpellEffectIndex effecIdx) const
    {
        switch (AuraType(EffectApplyAuraName[effecIdx]))
        {
            case SPELL_AURA_PERIODIC_ENERGIZE:
            case SPELL_AURA_PERIODIC_HEAL:
            case SPELL_AURA_PERIODIC_HEALTH_FUNNEL:
                return true;
            default:
                return false;
        }
    }

    inline bool HasAura(AuraType aura) const
    {
        for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
            if (AuraType(EffectApplyAuraName[i]) == aura)
                return true;
        
        return false;
    }

    inline bool HasSingleAura(AuraType aura) const
    {
        bool hasAura = false;
        for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
            if (AuraType(EffectApplyAuraName[i]) == aura)
                hasAura = true;
            else if (Effect[i] == SPELL_EFFECT_APPLY_AURA)
                return false;
        
        return hasAura;
    }

    inline bool IsSealSpell() const
    {
        //Collection of all the seal family flags. No other paladin spell has any of those.
        return IsFitToFamily<SPELLFAMILY_PALADIN, CF_PALADIN_SEAL_OF_THE_CRUSADER, CF_PALADIN_SEAL_OF_COMMAND, CF_PALADIN_SEALS>();
    }

    inline bool IsElementalShield() const
    {
        // family flags 10 (Lightning), 42 (Earth), 37 (Water), proc shield from T2 8 pieces bonus
        return IsFitToFamilyMask<CF_SHAMAN_LIGHTNING_SHIELD>() || Id == 23552;
    }

    inline bool IsFromBehindOnlySpell() const
    {
        return ((AttributesEx2 == 0x100000 && (AttributesEx & 0x200) == 0x200) || (Custom & SPELL_CUSTOM_BEHIND_TARGET));
    }

    inline bool IsPassiveSpell() const
    {
        // Nostalrius : 0x80 -> D'autres sorts passifs, dont les enchants par exemple
        return (Attributes & (SPELL_ATTR_PASSIVE)) != 0;
    }

    inline bool IsPassiveSpellStackableWithRanks() const
    {
        return Internal & SPELL_INTERNAL_PASSIVE_STACK_WITH_RANKS;
    }

    inline bool IsDeathOnlySpell() const
    {
        return (AttributesEx3 & SPELL_ATTR_EX3_CAST_ON_DEAD) || (Id == 2584);
    }

    inline bool IsDeathPersistentSpell() const
    {
        return HasAttribute(SPELL_ATTR_EX3_DEATH_PERSISTENT);
    }

    inline bool IsNonCombatSpell() const
    {
        return (Attributes & SPELL_ATTR_CANT_USED_IN_COMBAT) != 0;
    }

    inline bool IsPositiveSpell() const
    {
        return Internal & SPELL_INTERNAL_POSITIVE;
    }

        bool IsPositiveSpell(WorldObject* caster, Unit* victim) const;
        bool IsPositiveEffect(SpellEffectIndex effIndex, WorldObject* caster = nullptr, Unit* victim = nullptr) const;

    inline bool IsHealSpell() const
    {
        return Internal & SPELL_INTERNAL_HEAL;
    }

    inline bool IsDirectDamageSpell() const
    {
        return Internal & SPELL_INTERNAL_DIRECT_DAMAGE;
    }

    inline bool HasSingleTargetAura() const
    {
        return Custom & SPELL_CUSTOM_SINGLE_TARGET_AURA;
    }

    inline bool IsSpellWithCasterSourceTargetsOnly() const
    {
        return Internal & SPELL_INTERNAL_CASTER_SOURCE_TARGETS;
    }

    inline bool IsAreaOfEffectSpell() const
    {
        return Internal & SPELL_INTERNAL_AOE;
    }

    inline bool HasAreaAuraEffect() const
    {
        return Internal & SPELL_INTERNAL_AOE_AURA;
    }

    inline bool IsDismountSpell() const
    {
        return Internal & SPELL_INTERNAL_DISMOUNT;
    }

    inline bool IsCharmSpell() const
    {
        return Internal & SPELL_INTERNAL_CHARM;
    }

    inline bool IsReflectableSpell() const
    {
        return Internal & SPELL_INTERNAL_REFLECTABLE;
    }

    inline bool IsReflectableSpell(WorldObject* caster, Unit* victim) const
    {
        return DmgClass == SPELL_DAMAGE_CLASS_MAGIC && !HasAttribute(SPELL_ATTR_IS_ABILITY)
            && !HasAttribute(SPELL_ATTR_EX_CANT_BE_REFLECTED) && !HasAttribute(SPELL_ATTR_UNAFFECTED_BY_INVULNERABILITY)
            && !HasAttribute(SPELL_ATTR_PASSIVE) && !IsPositiveSpell(caster, victim);
    }

    inline bool IsAutoRepeatRangedSpell() const
    {
        return (Attributes & SPELL_ATTR_RANGED) && (AttributesEx2 & SPELL_ATTR_EX2_AUTOREPEAT_FLAG);
    }

    inline bool IsSpellRequiresRangedAP() const
    {
        return (SpellFamilyName == SPELLFAMILY_HUNTER && DmgClass != SPELL_DAMAGE_CLASS_MELEE);
    }

    inline bool IsChanneledSpell() const
    {
        return (AttributesEx & (SPELL_ATTR_EX_CHANNELED_1 | SPELL_ATTR_EX_CHANNELED_2));
    }

    inline bool NeedsComboPoints() const
    {
        return (AttributesEx & (SPELL_ATTR_EX_REQ_TARGET_COMBO_POINTS | SPELL_ATTR_EX_REQ_COMBO_POINTS));
    }

    inline bool IsTotemSummonSpell() const
    {
        return Effect[0] >= SPELL_EFFECT_SUMMON_TOTEM_SLOT1 && Effect[0] <= SPELL_EFFECT_SUMMON_TOTEM_SLOT4;
    }

    inline bool HasRealTimeDuration() const
    {
        return HasAttribute(SPELL_ATTR_EX4_REAL_TIME_DURATION);
    }

    inline bool HasAuraWithSpellTriggerEffect() const
    {
        for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            switch (EffectApplyAuraName[i])
            {
                case SPELL_AURA_PROC_TRIGGER_SPELL:
                    return true;
            }
        }
        
        return false;
    }

    inline bool IsNeedCastSpellAtFormApply(ShapeshiftForm form) const
    {
        if (!(Attributes & (SPELL_ATTR_PASSIVE | SPELL_ATTR_HIDDEN_CLIENTSIDE)) || !form)
            return false;

        // passive spells with SPELL_ATTR_EX2_NOT_NEED_SHAPESHIFT are already active without shapeshift, do no recast!
        // Feline Swiftness Passive 2a not have 0x1 mask in Stance field in spell data as expected
        return ((Stances & (1 << (form - 1)) || (Id == 24864 && form == FORM_CAT)) && !HasAttribute(SPELL_ATTR_EX2_NOT_NEED_SHAPESHIFT));
    }

    // Spell effects require a specific power type on the target
    inline bool IsTargetPowerTypeValid(Powers powerType) const
    {
        for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (Effect[i] == SPELL_EFFECT_NONE)
                continue;

            if ((Effect[i] == SPELL_EFFECT_POWER_BURN ||
                Effect[i] == SPELL_EFFECT_POWER_DRAIN ||
                EffectApplyAuraName[i] == SPELL_AURA_PERIODIC_MANA_LEECH ||
                EffectApplyAuraName[i] == SPELL_AURA_POWER_BURN_MANA) &&
                int32(powerType) != EffectMiscValue[i])
            {
                continue;
            }
            
            return true;
        }
        
        return false;
    }

    inline bool IsRemovedOnShapeLostSpell() const
    {
        return (Stances || Id == 24864) && !(AttributesEx2 & SPELL_ATTR_EX2_NOT_NEED_SHAPESHIFT) && !(Attributes & SPELL_ATTR_NOT_SHAPESHIFT);
    }

    inline SpellSchoolMask GetSpellSchoolMask() const
    {
        return GetSchoolMask(School);
    }

    inline uint32 GetSpellMechanicMask(uint32 effectMask) const
    {
        uint32 mask = 0;
        if (Mechanic)
            mask |= 1 << (Mechanic - 1);

        for (uint32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (!(effectMask & (1 << i)))
                continue;

            if (EffectMechanic[i])
                mask |= 1 << (EffectMechanic[i] - 1);
        }

        return mask;
    }

    inline Mechanics GetEffectMechanic(SpellEffectIndex effect) const
    {
        if (EffectMechanic[effect])
            return Mechanics(EffectMechanic[effect]);
            
        if (Mechanic)
            return Mechanics(Mechanic);
        
        return MECHANIC_NONE;
    }

    inline uint32 GetRecoveryTime() const
    {
        return RecoveryTime > CategoryRecoveryTime ? RecoveryTime : CategoryRecoveryTime;
    }

    int32 GetDuration() const;
    int32 GetMaxDuration() const;
    int32 CalculateDuration(WorldObject const* caster = nullptr) const;
    uint32 GetCastTime(Spell* spell = nullptr) const;
    uint32 GetCastTimeForBonus(DamageEffectType damagetype) const;
    uint16 GetAuraMaxTicks() const;
    WeaponAttackType GetWeaponAttackType() const;
    float CalculateDefaultCoefficient(DamageEffectType const damagetype) const;
    float CalculateCustomCoefficient(WorldObject const* caster, DamageEffectType const damageType, float coeff, Spell* spell, bool donePart) const;
    SpellCastResult GetErrorAtShapeshiftedCast(uint32 form) const;
    
    uint32 GetMechanic() const { return Mechanic; }
    uint32 GetManaCost() const { return manaCost; }
    uint32 GetSpellFamilyName() const { return SpellFamilyName; }
    uint32 GetAuraInterruptFlags() const { return AuraInterruptFlags; }
    uint32 GetStackAmount() const { return StackAmount; }
    uint32 GetEffectImplicitTargetAByIndex(SpellEffectIndex j) const { return EffectImplicitTargetA[j];}
    uint32 GetEffectImplicitTargetBByIndex(SpellEffectIndex j) const { return EffectImplicitTargetB[j];}
    uint32 GetEffectApplyAuraNameByIndex(SpellEffectIndex j) const { return EffectApplyAuraName[j];}
    uint32 GetEffectMiscValue(SpellEffectIndex j) const { return EffectMiscValue[j];}
    uint64 GetSpellFamilyFlags() const { return SpellFamilyFlags; }
    template <typename T, int Val>
    struct Shift
    {
        static T const value = T(1) << Val;
    };
    template <typename T, int N1, int N2 = -1, int N3 = -1, int N4 = -1, int N5 = -1, int N6 = -1, int N7 = -1, int N8 = -1, int N9 = -1, int N10 = -1>
    struct BitMask
    {
        static T const value = Shift<T, N1>::value | BitMask<T, N2, N3, N4, N5, N6, N7, N8, N9, N10, -1>::value;
    };

    template <typename T>
    struct BitMask<T, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1>
    {
        static T const value = 0;
    };
};

#endif
