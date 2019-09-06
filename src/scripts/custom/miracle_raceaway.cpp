#include "scriptPCH.h"
#include <array>

// Spells:

#define SALT_FLATS_RACE_SLOW      6601
#define SALT_FLATS_RACE_NORMAL    6602  // Decreases run speed, value -16%
#define SALT_FLATS_RACE_SPEED     6600  // Increases run speed, value +14%
#define DAMAGE_CAR                7084
#define I_CANT_DRIVE_55           31565 // What the actual fuck...
#define EXPLOSIVE_SHEEP_PASSIVE   4051
#define EXPLOSIVE_SHEEP           4050

// Items:

#define GNOME_CAMERA_KEY   5916
#define GOBLIN_CAMERA_KEY  5937

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
        p_Player->TeleportTo(1, -6168.598145F, -3907.561523F, -60.108891F + 1.5f, 3.0f);
        p_Player->SetDisplayId(15435); // Hiding player, else they'll be sitting on a spinning wheel.
        p_Player->SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID, 10318);
        p_Creature->MonsterSay("Dicks out for Goblins!", 0, 0);
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        p_Player->TeleportTo(1, -6168.643555F, -3897.561523F, -60.092022F + 1.5f, 3.0f);
        p_Player->SetDisplayId(15435); // Hiding player, else they'll be sitting on a spinning wheel.
        p_Player->SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID, 2490);
        p_Creature->MonsterSay("Dicks out for Gnomes!", 0, 0);
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


GameObjectAI* GetAI_go_speed_up(GameObject* gameobject)
{
    return new go_speed_up(gameobject);
}

CreatureAI* GetAI_npc_race_car(Creature* creature)
{
	return new npc_race_car(creature);
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

    //newscript = new Script;
    //newscript->Name = "npc_raceaway_sheep";
    //newscript->pGossipHello = &GossipHello_npc_raceaway_sheep;
    //newscript->pGossipSelect = &GossipSelect_npc_raceaway_sheep;
    //newscript->RegisterSelf();
}