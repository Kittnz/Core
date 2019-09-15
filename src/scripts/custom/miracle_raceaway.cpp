#include "scriptPCH.h"
#include "HardcodedEvents.h"
#include <array>

// Items:

#define GNOME_CAMERA_KEY   5916
#define GOBLIN_CAMERA_KEY  5937

#define ALREADY_REGISTERED_TXTID 50212

// Spells:

#define SALT_FLATS_RACE_SLOW      6601
#define SALT_FLATS_RACE_NORMAL    6602  // Decreases run speed, value -16%
#define SALT_FLATS_RACE_SPEED     6600  // Increases run speed, value +14%
#define DAMAGE_CAR                7084
#define I_CANT_DRIVE_55           31565 // What the actual fuck...
#define EXPLOSIVE_SHEEP_PASSIVE   4051
#define EXPLOSIVE_SHEEP           4050
#define SPELL_BOMB				  5134

bool GossipHello_npc_daisy(Player* p_Player, Creature* p_Creature)
{
    p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I'll join Goblin's Team.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I'll join Gnomes's Team.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
    p_Player->SEND_GOSSIP_MENU(90200, p_Creature->GetGUID());
    return true;
}

bool GossipSelect_npc_daisy(Player* p_Player, Creature* p_Creature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
#if 0
        p_Player->TeleportTo(1, -6168.598145F, -3907.561523F, -60.108891F + 1.5f, 3.0f);
        p_Player->SetDisplayId(15435); // Hiding player, else they'll be sitting on a spinning wheel.
        p_Player->SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID, 10318);
        p_Creature->MonsterSay("Dicks out for Goblins!", 0, 0);
#endif
		// register new goblin player
		MiracleRaceEvent* miracleEvent = sGameEventMgr.GetHardcodedEvent<MiracleRaceEvent>();
		if (miracleEvent != nullptr)
		{
			if (!miracleEvent->queueSystem().isPlayerQueuedAlready(p_Player->GetObjectGuid()))
			{
				miracleEvent->queueSystem().QueuePlayer(p_Player, MiracleRaceSide::Goblin);
			}
			else
			{
				p_Creature->MonsterWhisper(ALREADY_REGISTERED_TXTID, p_Player);
			}
		}
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
#if 0
        p_Player->TeleportTo(1, -6168.643555F, -3897.561523F, -60.092022F + 1.5f, 3.0f);
        p_Player->SetDisplayId(15435); // Hiding player, else they'll be sitting on a spinning wheel.
        p_Player->SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID, 2490);
        p_Creature->MonsterSay("Dicks out for Gnomes!", 0, 0);
#endif
		// register new gnome player
		MiracleRaceEvent* miracleEvent = sGameEventMgr.GetHardcodedEvent<MiracleRaceEvent>();
		if (miracleEvent != nullptr)
		{
			if (!miracleEvent->queueSystem().isPlayerQueuedAlready(p_Player->GetObjectGuid()))
			{
				miracleEvent->queueSystem().QueuePlayer(p_Player, MiracleRaceSide::Gnome);
			}
			else
			{
				p_Creature->MonsterWhisper(ALREADY_REGISTERED_TXTID, p_Player);
			}
		}

    }
    p_Player->CLOSE_GOSSIP_MENU();
    return true;
}

// Ignore this for while:

struct go_speed_up : public GameObjectAI
{
    explicit go_speed_up(GameObject* pGo) : GameObjectAI(pGo)
    {
        m_bUsed = false;
        m_uiJustUsedTimer = 1;
        m_uiUpdateTimer = 10;
    }

    bool m_bUsed;
    uint32 m_uiJustUsedTimer;
    uint32 m_uiUpdateTimer;

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_uiJustUsedTimer < uiDiff)
        {
            if (m_uiUpdateTimer < uiDiff)
            {
                std::list<Player*> players;
                MaNGOS::AnyPlayerInObjectRangeCheck check(me, 5.0f);
                MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(players, check);
                Cell::VisitWorldObjects(me, searcher, 5.0f);

                for (Player* p_Player : players)
                {
                    p_Player->CastSpell(p_Player, SALT_FLATS_RACE_SPEED, false);
                }
                m_uiUpdateTimer = 10;
            }
            else
            {
                m_uiUpdateTimer -= uiDiff;
            }
            m_bUsed = true;
        }
        else
        {
            m_uiJustUsedTimer -= uiDiff;
        }
    }
};

constexpr float SheepAcceptanceRadius = 3.4f;
constexpr float SheepAcceptanceRadiusSqr = SheepAcceptanceRadius * SheepAcceptanceRadius;

#define INVISIBLE_TRIGGER_ID 14495

struct npc_race_sheep : public ScriptedAI 
{
	npc_race_sheep(Creature* InCreature)
		: ScriptedAI(InCreature)
	{}

	std::set<ObjectGuid> racers;
	uint32 checkTimer = 0;

	static const uint32 CheckForRacersInterval = 200;


	virtual void Reset() override
	{
		checkTimer = CheckForRacersInterval;
	}

	virtual void MoveInLineOfSight(Unit* unit) override
	{
		ScriptedAI::MoveInLineOfSight(unit);

		// check if unit is player and have race id mount
		if (unit->IsPlayer())
		{
			Player* player = (Player*)unit;

			uint32 mountId = player->GetMountID();

			if (mountId == GNOMECAR_DISPLAYID || mountId == GOBLINCAR_DISPLAYID)
			{
				racers.insert(unit->GetObjectGuid());
			}
		}
	}


	virtual void UpdateAI(const uint32 deltaTime) override
	{
		ScriptedAI::UpdateAI(deltaTime);

		if (checkTimer < deltaTime)
		{
			for (auto iter = racers.begin(); iter != racers.end();)
			{
				if (Player* player = sObjectMgr.GetPlayer(*iter))
				{
					float distSqr = me->GetDistanceSqr(player->GetPositionX(), player->GetPositionY(), player->GetPositionZ());
					if (distSqr < SheepAcceptanceRadiusSqr)
					{
						// our client
						player->AddAura(SALT_FLATS_RACE_SLOW);

						me->CastSpell(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 5162, true);
						me->DespawnOrUnsummon(1000);
						//player->AddAura(5162);
						player->CastSpell(player, 5162, true);
					}
				}
				else
				{
					iter = racers.erase(iter);
					continue;
				}
				iter++;
			}
			checkTimer = CheckForRacersInterval;
		}
		else
		{
			checkTimer -= deltaTime;
		}
	}

};


struct npc_race_car : public ScriptedAI 
{
	npc_race_car(Creature* InCreature)
		: ScriptedAI(InCreature)
	{}

	virtual void UpdateAI(const uint32 delta) override
	{
		if (Unit* pawn = me->GetMap()->GetUnit(PlayerControllerGuid))
		{
			WorldLocation currentPosition;
			me->GetPosition(currentPosition);
			float x, y, z;

			me->GetNearPoint(me, x, y, z, 0.0f, 3.0f, pawn->GetOrientation());

			me->StopMoving(true);
			me->MonsterMove(x, y, z);
		}
	}


	virtual void Reset() override
	{
	}

	ObjectGuid PlayerControllerGuid;

	virtual void InformGuid(const ObjectGuid guid, uint32 = 0) override
	{
		PlayerControllerGuid = guid;
	}

};

struct MiracleRaceTestRound : public QuestInstance
{
	MiracleRaceTestRound(ObjectGuid player)
		: QuestInstance(player, 9500)
	{}

	virtual void OnQuestStarted() override
	{
		// Check for event
		
		// Move player to specific vis layer

		// Initialize race
	}

	virtual void OnQuestCanceled() override
	{
		// move to global vis layer
		
		// despawn car, return control to main player pawn
	}

	virtual void OnQuestFinished() override
	{
	}

};

bool ItemUse_Miracle_AcceptInvite(Player* player, Item* item, SpellCastTargets const& target)
{
	MiracleRaceEvent* miracleEvent = sGameEventMgr.GetHardcodedEvent<MiracleRaceEvent>();
	if (miracleEvent != nullptr)
	{
		miracleEvent->queueSystem().PlayerAcceptInvite(player);
	}

	return true;
}


GameObjectAI* GetAI_go_speed_up(GameObject* gameobject)
{
    return new go_speed_up(gameobject);
}

CreatureAI* GetAI_npc_race_car(Creature* creature)
{
	return new npc_race_car(creature);
}

CreatureAI* GetAI_npc_race_sheep(Creature* creature)
{
	return new npc_race_sheep(creature);
}

QuestInstance* GetQuest_MiracleRaceTest(ObjectGuid PlayerGuid)
{
	return new MiracleRaceTestRound(PlayerGuid);
}

void AddSC_miracle_raceaway()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_daisy";
    newscript->pGossipHello = &GossipHello_npc_daisy;
    newscript->pGossipSelect = &GossipSelect_npc_daisy;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_speed_up";
    newscript->GOGetAI = &GetAI_go_speed_up;
    newscript->RegisterSelf();

	newscript = new Script;
	newscript->Name = "npc_race_car";
	newscript->GetAI = GetAI_npc_race_car;
	newscript->RegisterSelf();

	newscript = new Script;
	newscript->Name = "quest_miracle_race_test_round";
	newscript->GetQuestInstance = GetQuest_MiracleRaceTest;
	newscript->RegisterSelf();

	newscript = new Script;
	newscript->Name = "item_miracle_acceptInvite";
	newscript->pItemUse = ItemUse_Miracle_AcceptInvite;
	newscript->RegisterSelf();

	newscript = new Script;
	newscript->Name = "npc_race_sheep";
	newscript->GetAI = GetAI_npc_race_sheep;
	newscript->RegisterSelf();

    //newscript = new Script;
    //newscript->Name = "npc_raceaway_sheep";
    //newscript->pGossipHello = &GossipHello_npc_raceaway_sheep;
    //newscript->pGossipSelect = &GossipSelect_npc_raceaway_sheep;
    //newscript->RegisterSelf();
}