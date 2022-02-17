/*
 * Copyright (C) 2021-2022 Nolin (nolin.nolin.nolin.nolin@gmail.org)
 *
 * This is private software and may not be shared under any circumstances,
 * absent permission of Nolin.
 */

#include "scriptPCH.h"
#include "scarlet_citadel.h"

#pragma once

namespace nsArdaeus
{
    template <typename Functor>
    void DoAfterTime(Creature* pCreature, const uint32& uiTime, Functor&& function)
    {
        pCreature->m_Events.AddEvent(new LambdaBasicEvent<Functor>(std::move(function)), pCreature->m_Events.CalculateTime(uiTime));
    }

    struct Location
    {
        float m_fX{}, m_fY{}, m_fZ{}, m_fO{}, m_fR0{}, m_fR1{}, m_fR2{}, m_fR3{};
    };

    static constexpr uint32 NPC_SUN{ 2000019 };
    static const Location vfSunMovePoints[] =
    {
        { 255.f, -100.f, 60.0f, 0.f, 0.f, 0.f, 0.f, 0.f }, // Spawn location
        { 255.f, -100.f, 18.5f, 0.f, 0.f, 0.f, 0.f, 0.f }  // End location
    };

    // Sun
    static constexpr uint32 DAMAGE_DONE_TO_MOVE_UPWARDS{ 25000 }; // Required damage to move Sun upwards
    static constexpr uint32 SUN_SPEED_INCREASE_TIMER{ 10000 };    // Interval for speed update
    static constexpr float INCREASE_Z_AXIS{ 5.0f };               // Set new Z destination to move Sun upwards
    static constexpr float INCREASE_SPEED{ 5.0f };                // Set new speed

    // Gossip Menu
    static constexpr uint32 GOSSIP_TEXT{ 1000001 };
    static constexpr auto GOSSIP_ANSWER{ "Give us your worst, fanatic mage." };

    // Achievment
    static constexpr uint32 ACHIEVEMENT_CHECK_TIMER{ 1000 };
    static constexpr uint32 GO_ACHIEVEMENT_CHEST{ 5000014 };              // Chest to loot the achievement reward
    static constexpr uint32 GO_ACHIEVEMENT_CHEST_DESPAWN_TIMER{ 900000 }; // 15 Minutes
    static constexpr float ACHIEVEMENT_FAILED_BELOW{ 20.75f };
    static const Location vfAchievementChestSpawnPoint[] =                // Chest spawn location
    {
        { 236.068649f, -99.972031f, 23.774151f, 6.271617f, 0.f, 0.f, 0.0f,  0.0f } // TODO: Check rotation
    };

    // Misc
    static constexpr float ROOM_DIAGONAL{ (54.0f / 2) }; // Room size
    static constexpr uint32 FACTION_SCARLET{ 67 };       // Scarlet Citadel Faction // TODO: Find proper ID
    static constexpr uint32 FACTION_NEUTRAL{ 189 };      // Neutral Faction


    enum class CombatNotifications
    {
        ABOUT_TO_START,
        START,
        RAIDWIPE,
        BOSSDIED,
        ACHIEVEMENT_FAILED
    };

    std::string [[nodiscard]] CombatNotification(const CombatNotifications& combatNotifications)
    {
        switch (combatNotifications)
        {
            case CombatNotifications::ABOUT_TO_START:
            {
                return "ABOUT_TO_START";
            }
            case CombatNotifications::START:
            {
                return "START";
            }
            case CombatNotifications::RAIDWIPE:
            {
                return "RAIDWIPE";
            }
            case CombatNotifications::BOSSDIED:
            {
                return "BOSSDIED";
            }
            case CombatNotifications::ACHIEVEMENT_FAILED:
            {
                return "ACHIEVEMENT_FAILED";
            }
        }
    }

    std::string [[nodiscard]] SayOnPlayersDeath(const uint8 uiRandomNumber)
    {
        switch (uiRandomNumber)
        {
            case 0:
            {
                return "PLACEHOLDER0";
            }
            case 1:
            {
                return "PLACEHOLDER1";
            }
            case 2:
            {
                return "PLACEHOLDER2";
            }
            case 3:
            {
                return "PLACEHOLDER3";
            }
            default:
            {
                break;
            }
        }
    }
}
