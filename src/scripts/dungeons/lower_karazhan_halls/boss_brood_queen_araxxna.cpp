#include "scriptPCH.h"
#include "lower_karazhan_halls.h"

struct boss_brood_queen_araxxnaAI : public ScriptedAI
{
	boss_brood_queen_araxxnaAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		m_pInstance = (ScriptedInstance*)m_creature->GetInstanceData();
		Reset();
	}

	ScriptedInstance* m_pInstance;
	std::vector<ObjectGuid> summonList;
	uint32 m_BroodVenomVolleyTimer;
	uint32 m_AraxxnaPoisonTimer;
	uint32 m_SpawnEggsTimer;

	void Reset() override
	{
		summonList.clear();
		m_BroodVenomVolleyTimer = urand(7 * IN_MILLISECONDS, 12 * IN_MILLISECONDS);
		m_AraxxnaPoisonTimer = 15 * IN_MILLISECONDS;
		m_SpawnEggsTimer = 35 * IN_MILLISECONDS;
	}

	void SpawnEggs()
	{
		m_creature->MonsterYell("Brood Queen Araxxna spawns two Skitterweb Egg!");
		for (uint8 i = 0; i < 2; ++i)
			DoSpawnCreature(30008, 15.0f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 2000);
	}

	void EnterEvadeMode() override
	{
		if (summonList.empty())
			return;

		for (const auto& guid : summonList)
		{
			if (Creature* summon = m_pInstance->instance->GetCreature(guid))
				summon->DespawnOrUnsummon();
		}

		summonList.clear();
	}

	void JustSummoned(Creature* summon) override
	{
		summonList.push_back(summon->GetObjectGuid());
	}

	void UpdateAI(const uint32 uiDiff) override
	{
		if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
			return;

		if (m_BroodVenomVolleyTimer < uiDiff)
		{
			if (DoCastSpellIfCan(m_creature, 57063) == CAST_OK)
				m_BroodVenomVolleyTimer = urand(7 * IN_MILLISECONDS, 12 * IN_MILLISECONDS);
		}
		else
			m_BroodVenomVolleyTimer -= uiDiff;

		if (m_AraxxnaPoisonTimer < uiDiff)
		{
			if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 1, nullptr, SELECT_FLAG_PLAYER))
			{
				if (DoCastSpellIfCan(pTarget, 57089) == CAST_OK)
					m_AraxxnaPoisonTimer = urand(40 * IN_MILLISECONDS, 45 * IN_MILLISECONDS);
			}
		}
		else
			m_AraxxnaPoisonTimer -= uiDiff;

		if (m_SpawnEggsTimer < uiDiff)
		{
			SpawnEggs();
			m_SpawnEggsTimer = urand(48 * IN_MILLISECONDS, 58 * IN_MILLISECONDS);
		}
		else
			m_SpawnEggsTimer -= uiDiff;

		DoMeleeAttackIfReady();
	}
};

CreatureAI* GetAI_boss_brood_queen_araxxna(Creature* pCreature)
{
	return new boss_brood_queen_araxxnaAI(pCreature);
}

struct skitterweb_eggAI : public Scripted_NoMovementAI
{
	skitterweb_eggAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature)
	{
		m_pInstance = (ScriptedInstance*)m_creature->GetInstanceData();
		Reset();
	}

	ScriptedInstance* m_pInstance;
	uint32 m_SpawnTimer;
	std::vector<uint32> entries;

	void Reset() override
	{
		m_SpawnTimer = 20 * IN_MILLISECONDS;

		entries = {61206,61207,61209};
	}

	void UpdateAI(const uint32 uiDiff) override
	{
		if (m_SpawnTimer < uiDiff)
		{
			m_creature->Kill(m_creature, nullptr);
			m_SpawnTimer = DAY * IN_MILLISECONDS;
			return;
		}
		else
			m_SpawnTimer -= uiDiff;
	}

	void JustDied(Unit* pKiller) override
	{
		if (m_creature->GetObjectGuid() == pKiller->GetObjectGuid())
		{
			if (Creature* queen = m_pInstance->GetCreature(m_pInstance->GetData64(DATA_BROOD_QUEEN_ARAXXNA)))
			{
				auto randEntry = SelectRandomContainerElement(entries);
				if (Creature* spider = DoSpawnCreature(randEntry, 0.0f, 0.0f, 0.0f, m_creature->GetOrientation(), TEMPSUMMON_CORPSE_TIMED_DESPAWN, 5000))
				{
					spider->SetInCombatWithZone();
					queen->AI()->JustSummoned(spider);
				}
			}
		}
	}
};

CreatureAI* GetAI_skitterweb_egg(Creature* pCreature)
{
	return new skitterweb_eggAI(pCreature);
}

void AddSC_boss_brood_queen_araxxna()
{
	Script* newscript;

	newscript = new Script;
	newscript->Name = "boss_brood_queen_araxxna";
	newscript->GetAI = &GetAI_boss_brood_queen_araxxna;
	newscript->RegisterSelf();

	newscript = new Script;
	newscript->Name = "skitterweb_egg";
	newscript->GetAI = &GetAI_skitterweb_egg;
	newscript->RegisterSelf();
}