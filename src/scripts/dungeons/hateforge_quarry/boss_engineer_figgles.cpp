
#include "scriptPCH.h"


class boss_engineer_figglesAI : public ScriptedAI // TODO: Implement Voice Scripts
{
public:
    explicit boss_engineer_figglesAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        boss_engineer_figglesAI::Reset();
    }

    static constexpr uint32 SPELL_CORROSIVE_POISON{ 24111 };

    uint32 m_uiCorrosivePoison_Timer{};

    void Reset() override
    {
        m_uiCorrosivePoison_Timer = 10000;
    }

    void CastCorrosivePoison(const uint32& uiDiff)
    {
        if (m_uiCorrosivePoison_Timer < uiDiff)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_CORROSIVE_POISON);
            // No Timer reset, this spell should only be casted once
        }
        else
            m_uiCorrosivePoison_Timer -= uiDiff;
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        CastCorrosivePoison(uiDiff);

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_engineer_figglesAI(Creature* pCreature)
{
    return new boss_engineer_figglesAI(pCreature);
}


void AddSC_boss_engineer_figgles()
{
    Script* pNewscript;
    pNewscript = new Script;
    pNewscript->Name = "boss_engineer_figgles";
    pNewscript->GetAI = &GetAI_boss_engineer_figglesAI;
    pNewscript->RegisterSelf();
}
