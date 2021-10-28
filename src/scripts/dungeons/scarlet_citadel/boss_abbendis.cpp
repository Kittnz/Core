#include "scriptPCH.h"
#include "scarlet_citadel.h"

struct boss_abbendisAI : public ScriptedAI
{
    explicit boss_abbendisAI(Creature* p_Creature) : ScriptedAI(p_Creature)
    {
        m_pInstance = static_cast<ScriptedInstance*>(p_Creature->GetInstanceData());
        Reset();
    }

    ScriptedInstance* m_pInstance;

    void Reset() override
    {

    }

    void Aggro(Unit* /*p_Who*/) override
    {
        if (!m_pInstance)
            return;

        m_pInstance->SetData(ScarletCitadelEncounter::TYPE_ABBENDIS, IN_PROGRESS);
        m_creature->SetInCombatWithZone();
    }

    void JustReachedHome() override
    {
        if (!m_pInstance)
            return;
        
        m_pInstance->SetData(ScarletCitadelEncounter::TYPE_ABBENDIS, FAIL);
    }

    void JustDied(Unit* /*p_Killer*/) override
    {
        if (!m_pInstance)
            return;
    
        m_pInstance->SetData(ScarletCitadelEncounter::TYPE_ABBENDIS, DONE);
    }

    void UpdateAI(const uint32 ui_Diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_abbendis(Creature* p_Creature)
{
    return new boss_abbendisAI(p_Creature);
}

void AddSC_boss_abbendis()
{
    Script *p_Newscript;
    p_Newscript = new Script;
    p_Newscript->Name = "boss_abbendis";
    p_Newscript->GetAI = &GetAI_boss_abbendis;
    p_Newscript->RegisterSelf();
}
