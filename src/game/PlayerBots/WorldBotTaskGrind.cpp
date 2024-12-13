#include "WorldBotAI.h"
#include "WorldBotTravelSystem.h"
#include "WorldBotTaskManager.h"
#include "PlayerBotMgr.h"
#include "Map.h"
#include "GridSearchers.h"
#include "Creature.h"
#include <cmath>

extern std::vector<GrindQuestInfo> grindQuests;

bool WorldBotAI::CanPerformGrind() const
{
    std::string botName = me->GetName();
    std::transform(botName.begin(), botName.end(), botName.begin(), ::tolower);

    /*return m_taskManager.IsTaskLevelAppropriate(TASK_GRIND, me->GetLevel()) &&
        !me->IsInCombat() && botName.find("bank") == std::string::npos;*/
    return true;
}

void WorldBotAI::StartGrinding()
{
    if (grindQuests.empty())
        return;

    // Reset previous grinding state
    m_grindEntryTarget = 0;
    m_grindMaxLevel = 0;
    m_isAtGrindDestination = false;
    m_grindRadius = VISIBILITY_DISTANCE_NORMAL;

    if (!SetGrindDestination())
    {
        if (me->IsBeingTeleported())
        {
            sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "WorldBotAI: %s is being teleported. Will attempt to set grind destination again later.", me->GetName());
            return;
        }
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldBotAI: %s failed to set grind destination", me->GetName());
            m_taskManager.CompleteCurrentTask();
            return;
        }
    }
}

bool WorldBotAI::IsGrindingComplete() const
{
    return me->GetLevel() > m_grindMaxLevel + 4;
}

bool WorldBotAI::SetGrindDestination()
{
    // Check if we have valid grind quests
    if (grindQuests.empty())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldBotAI: No grind quests available");
        return false;
    }

    // Check if the bot is on the correct map
    uint32 correctMapId = (me->GetTeam() == ALLIANCE) ? 0 : 1;
    if (me->GetMapId() != correctMapId)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WorldBotAI: Bot %s is on incorrect map. Teleporting to major city.", me->GetName());
        if (me->GetTeam() == ALLIANCE)
            me->TeleportTo(0, -9002.163f, 867.087f, 29.620f, 2.244f);
        else
            me->TeleportTo(1, 1469.857f, -4220.508f, 58.993f, 6.195f);
        return false;
    }

    // Find suitable grind quest for bot's level and faction
    std::vector<const GrindQuestInfo*> validQuests;
    for (const auto& quest : grindQuests)
    {
        if ((quest.faction == "Both" ||
            (me->GetTeam() == ALLIANCE && quest.faction == "Alliance") ||
            (me->GetTeam() == HORDE && quest.faction == "Horde")) &&
            quest.mapId == me->GetMapId() &&
            quest.level <= me->GetLevel() + 3 &&
            quest.level >= me->GetLevel() - 3)
        {
            validQuests.push_back(&quest);
        }
    }

    if (validQuests.empty())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldBotAI: No valid grind quests found for bot %s (level %u)", me->GetName(), me->GetLevel());
        return false;
    }

    // Select closest valid quest
    const GrindQuestInfo* selectedQuest = nullptr;
    float closestDistance = std::numeric_limits<float>::max();

    for (const auto* quest : validQuests)
    {
        float distance = me->GetDistance(quest->avgPosX, quest->avgPosY, quest->avgPosZ);
        if (distance < closestDistance)
        {
            closestDistance = distance;
            selectedQuest = quest;
        }
    }

    if (!selectedQuest)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldBotAI: Failed to select grind quest for bot %s", me->GetName());
        return false;
    }

    m_grindEntryTarget = selectedQuest->creatureId;
    m_grindMaxLevel = selectedQuest->level + 3;
    m_grindDestination.x = selectedQuest->avgPosX;
    m_grindDestination.y = selectedQuest->avgPosY;
    m_grindDestination.z = selectedQuest->avgPosZ;

    sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "WorldBotAI: Set grind destination for bot %s (level %u) to kill %s (level %u) at position (%.2f, %.2f, %.2f)",
        me->GetName(), me->GetLevel(), selectedQuest->creatureName.c_str(), selectedQuest->level,
        m_grindDestination.x, m_grindDestination.y, m_grindDestination.z);

    return StartNewPathToSpecificDestination(m_grindDestination.x, m_grindDestination.y, m_grindDestination.z, me->GetMapId(), false);
}

void WorldBotAI::UpdateGrindingBehavior()
{
    if (ShouldStopGrinding())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "WorldBotAI: %s stopping grinding task", me->GetName());
        m_taskManager.CompleteCurrentTask();
        return;
    }

    // If we're in combat, let the combat AI handle it
    if (me->IsInCombat())
        return;

    // Check if we're at the grind destination
    float distanceToDestination = me->GetDistance(m_grindDestination.x, m_grindDestination.y, m_grindDestination.z);
    if (distanceToDestination <= m_grindRadius)
    {
        m_isAtGrindDestination = true;
        // Look for target to attack
        if (Unit* target = FindNearestCreatureToGrind())
        {
            AttackStart(target);
            return;
        }
    }
    else if (!me->IsMoving() && !me->IsTaxiFlying())
    {
        m_isAtGrindDestination = false;
        // Resume movement to grind destination
        StartNewPathToSpecificDestination(m_grindDestination.x, m_grindDestination.y, m_grindDestination.z, me->GetMapId(), false);
    }
}

Unit* WorldBotAI::FindNearestCreatureToGrind()
{
    float searchRange = m_grindRadius;
    Unit* nearestTarget = nullptr;
    float nearestDistance = searchRange;

    for (const auto& guid : me->m_visibleGUIDs)
    {
        if (!guid.IsCreature())
            continue;

        if (Creature* creature = me->GetMap()->GetCreature(guid))
        {
            if (creature->GetEntry() != m_grindEntryTarget)
                continue;

            if (!creature->IsAlive() || !me->IsValidAttackTarget(creature))
                continue;

            float distance = me->GetDistance(creature);
            if (distance < nearestDistance)
            {
                nearestDistance = distance;
                nearestTarget = creature;
            }
        }
    }

    return nearestTarget;
}

bool WorldBotAI::ShouldStopGrinding() const
{
    return me->GetLevel() > m_grindMaxLevel + 1;
}

void WorldBotAI::RegisterGrindTask()
{
    m_taskManager.RegisterTask({
        TASK_GRIND,
        "Grind",
        PRIORITY_HIGH,
        [this](WorldBotAI* bot) { return this->CanPerformGrind(); },
        [this](WorldBotAI* bot) { this->StartGrinding(); },
        [this](WorldBotAI* bot) { return this->IsGrindingComplete(); },
        true,
        1,
        60
        });
}
