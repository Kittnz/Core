#include "scriptPCH.h"
#include "scarlet_citadel.h"

#include <unistd.h>

struct instance_scarlet_citadel : public ScriptedInstance
{
    explicit instance_scarlet_citadel(Map* p_Map) : ScriptedInstance(p_Map)
    {
        Initialize();
    };

    uint32 m_auiEncounter[MAX_ENCOUNTER];
    uint64 m_auiData[MAX_DATA];
    std::string str_InstData;

    void Initialize() override
    {
        memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));
        memset(&m_auiData, 0, sizeof(m_auiData));
    }

    bool IsEncounterInProgress() const override
    {
        for (uint32 i : m_auiEncounter)
        {
            if (i == IN_PROGRESS)
                return true;
        }

        return false;
    }

    void OnObjectCreate(GameObject* p_Go) override
    {
        switch (p_Go->GetEntry())
        {
            case GO_DOOR_VENDOR_LEFT:
            {
                m_auiData[DATA_DOOR_VENDOR_LEFT] = p_Go->GetObjectGuid();

                if (m_auiEncounter[TYPE_DAELUS] == DONE)
                    p_Go->SetGoState(GO_STATE_ACTIVE); // Open it

                break;
            }
            case GO_DOOR_VENDOR_RIGHT:
            {
                m_auiData[DATA_DOOR_VENDOR_RIGHT] = p_Go->GetObjectGuid();

                if (m_auiEncounter[TYPE_DAELUS] == DONE)
                    p_Go->SetGoState(GO_STATE_ACTIVE); // Open it

                break;
            }
            case GO_DOOR_DAELUS:
            {
                m_auiData[DATA_DOOR_DAELUS] = p_Go->GetObjectGuid();

                if (m_auiEncounter[TYPE_DAELUS] == DONE)
                    p_Go->DeleteLater(); // Remove it (Looks better)

                break;
            }
            case GO_DOOR_ARDAEUS_ENTER:
            {
                m_auiData[DATA_DOOR_ARDAEUS_ENTER] = p_Go->GetObjectGuid();

                if (m_auiEncounter[TYPE_ARDAEUS] == DONE)
                    p_Go->SetGoState(GO_STATE_ACTIVE); // Open it

                break;
            }
            case GO_DOOR_ARDAEUS_EXIT:
            {
                m_auiData[DATA_DOOR_ARDAEUS_EXIT] = p_Go->GetObjectGuid();

                if (m_auiEncounter[TYPE_ARDAEUS] == DONE)
                    p_Go->DeleteLater(); // Remove it (Looks better)

                break;
            }
            case GO_DOOR_RIGHT_WING:
            {
                m_auiData[DATA_DOOR_RIGHT_WING] = p_Go->GetObjectGuid();

                if (m_auiEncounter[TYPE_MARIELLA] == DONE)
                    p_Go->DeleteLater(); // Remove it

                break;
            }
            case GO_DOOR_MARIELLA:
            {
                m_auiData[DATA_DOOR_MARIELLA] = p_Go->GetObjectGuid();

                if (m_auiEncounter[TYPE_MARIELLA] == DONE)
                    p_Go->SetGoState(GO_STATE_ACTIVE); // Open it

                break;
            }
            case GO_DOOR_ABBENDIS:
            {
                m_auiData[DATA_DOOR_ABBENDIS] = p_Go->GetObjectGuid();

                if (m_auiEncounter[TYPE_ABBENDIS] == DONE)
                    p_Go->DeleteLater(); // Remove it

                break;
            }
        }
    }

    void OnCreatureCreate(Creature* p_Creature) override
    {
        switch (p_Creature->GetEntry())
        {
            case NPC_DAELUS:
            {
                m_auiData[DATA_DAELUS_GUID] = p_Creature->GetObjectGuid();
                break;
            }
            case NPC_ARDAEUS:
            {
                m_auiData[DATA_ARDAEUS_GUID] = p_Creature->GetObjectGuid();
                break;
            }
            case NPC_MARIELLA:
            {
                m_auiData[DATA_MARIELLA_GUID] = p_Creature->GetObjectGuid();
                break;
            }
            case NPC_ABBENDIS:
            {
                m_auiData[DATA_ABBENDIS_GUID] = p_Creature->GetObjectGuid();
                break;
            }
        }
    }

    uint64 GetData64(uint32 ui_Data) override
    {
        if (ui_Data < MAX_DATA)
            return m_auiData[ui_Data];

        return 0;
    }

    void SetData(uint32 ui_Type, uint32 ui_Data) override
    {
        switch (ui_Type)
        {
            case TYPE_DAELUS:
            {
                m_auiEncounter[TYPE_DAELUS] = ui_Data;
                if (ui_Data == DONE)
                {
                    if (GameObject* p_Go = instance->GetGameObject(m_auiData[DATA_DOOR_VENDOR_LEFT]))
                    {
                        if (p_Go->GetGoState() != GO_STATE_ACTIVE)
                            DoUseDoorOrButton(m_auiData[DATA_DOOR_VENDOR_LEFT]); // Open it
                    }

                    if (GameObject* p_Go = instance->GetGameObject(m_auiData[DATA_DOOR_VENDOR_RIGHT]))
                    {
                        if (p_Go->GetGoState() != GO_STATE_ACTIVE)
                            DoUseDoorOrButton(m_auiData[DATA_DOOR_VENDOR_RIGHT]); // Open it
                    }

                    if (GameObject* p_Go = instance->GetGameObject(m_auiData[DATA_DOOR_DAELUS]))
                    {
                        if (p_Go->GetGoState() != GO_STATE_ACTIVE)
                            p_Go->DeleteLater(); // Remove it (Looks better)
                    }
                }

                break;
            }
            case TYPE_ARDAEUS:
            {
                m_auiEncounter[TYPE_ARDAEUS] = ui_Data;
                if (ui_Data == IN_PROGRESS)
                {
                    if (GameObject* p_Go = instance->GetGameObject(m_auiData[DATA_DOOR_ARDAEUS_ENTER]))
                    {
                        if (p_Go->GetGoState() == GO_STATE_ACTIVE)
                            DoUseDoorOrButton(m_auiData[DATA_DOOR_ARDAEUS_ENTER]); // Close it
                    }
                }
                else if (ui_Data == DONE)
                {
                    if (GameObject* p_Go = instance->GetGameObject(m_auiData[DATA_DOOR_ARDAEUS_EXIT]))
                    {
                        if (p_Go->GetGoState() != GO_STATE_ACTIVE)
                            p_Go->DeleteLater(); // Remove it (Looks better)
                    }

                    if (GameObject* p_Go = instance->GetGameObject(m_auiData[DATA_DOOR_ARDAEUS_ENTER]))
                    {
                        if (p_Go->GetGoState() != GO_STATE_ACTIVE)
                            DoUseDoorOrButton(m_auiData[DATA_DOOR_ARDAEUS_ENTER]); // Open it
                    }
                }
                else if (ui_Data == FAIL)
                {
                    if (GameObject* p_Go = instance->GetGameObject(m_auiData[DATA_DOOR_ARDAEUS_ENTER]))
                    {
                        if (p_Go->GetGoState() != GO_STATE_ACTIVE)
                            DoUseDoorOrButton(m_auiData[DATA_DOOR_ARDAEUS_ENTER]); // Open it
                    }
                }

                break;
            }
            case TYPE_MARIELLA:
            {
                m_auiEncounter[TYPE_MARIELLA] = ui_Data;
                if (ui_Data == IN_PROGRESS)
                {
                    if (GameObject* p_Go = instance->GetGameObject(m_auiData[DATA_DOOR_MARIELLA]))
                    {
                        if (p_Go->GetGoState() == GO_STATE_ACTIVE)
                            DoUseDoorOrButton(m_auiData[DATA_DOOR_MARIELLA]); // Close it
                    }
                }
                else if (ui_Data == DONE)
                {
                    if (GameObject* p_Go = instance->GetGameObject(m_auiData[DATA_DOOR_MARIELLA]))
                    {
                        if (p_Go->GetGoState() != GO_STATE_ACTIVE)
                            DoUseDoorOrButton(m_auiData[DATA_DOOR_MARIELLA]); // Open it
                    }
                    if (GameObject* p_Go = instance->GetGameObject(m_auiData[DATA_DOOR_RIGHT_WING]))
                    {
                        if (p_Go->GetGoState() != GO_STATE_ACTIVE)
                            p_Go->DeleteLater(); // Remove it
                    }
                }
                else if (ui_Data == FAIL)
                {
                    if (GameObject* p_Go = instance->GetGameObject(m_auiData[DATA_DOOR_MARIELLA]))
                    {
                        if (p_Go->GetGoState() != GO_STATE_ACTIVE)
                            DoUseDoorOrButton(m_auiData[DATA_DOOR_MARIELLA]); // Open it
                    }
                }

                break;
            }
            case TYPE_ABBENDIS:
            {
                m_auiEncounter[TYPE_ABBENDIS] = ui_Data;
                if (ui_Data == IN_PROGRESS)
                {
                    if (GameObject* p_Go = instance->GetGameObject(m_auiData[DATA_DOOR_ABBENDIS]))
                    {
                        if (p_Go->GetGoState() == GO_STATE_ACTIVE)
                            DoUseDoorOrButton(m_auiData[DATA_DOOR_ABBENDIS]); // Close it
                    }
                }
                else if (ui_Data == DONE)
                {
                    if (GameObject* p_Go = instance->GetGameObject(m_auiData[DATA_DOOR_ABBENDIS]))
                    {
                        if (p_Go->GetGoState() != GO_STATE_ACTIVE)
                            p_Go->DeleteLater(); // Remove it
                    }
                }
                else if (ui_Data == FAIL)
                {
                    if (GameObject* p_Go = instance->GetGameObject(m_auiData[DATA_DOOR_ABBENDIS]))
                    {
                        if (p_Go->GetGoState() != GO_STATE_ACTIVE)
                            DoUseDoorOrButton(m_auiData[DATA_DOOR_ABBENDIS]); // Open it
                    }
                }

                break;
            }
        }

        if (ui_Data == DONE)
        {
            OUT_SAVE_INST_DATA;

            std::ostringstream saveStream;
            saveStream << m_auiEncounter[0] << " " << m_auiEncounter[1] << " " << m_auiEncounter[2] << " " << m_auiEncounter[3];

            str_InstData = saveStream.str();

            SaveToDB();
            OUT_SAVE_INST_DATA_COMPLETE;
        }
    }

    char const* Save() override
    {
        return str_InstData.c_str();
    }

    uint32 GetData(uint32 ui_Type) override
    {
        if (ui_Type < MAX_ENCOUNTER)
            return (m_auiEncounter[ui_Type]);

        return 0;
    }

    void Load(char const* chr_In) override
    {
        if (!chr_In)
        {
            OUT_LOAD_INST_DATA_FAIL;
            return;
        }

        OUT_LOAD_INST_DATA(chr_In);

        std::istringstream loadStream(chr_In);

        loadStream >> m_auiEncounter[0] >> m_auiEncounter[1] >> m_auiEncounter[2] >> m_auiEncounter[3];

        for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
            if (m_auiEncounter[i] == IN_PROGRESS)
                m_auiEncounter[i] = NOT_STARTED;

        OUT_LOAD_INST_DATA_COMPLETE;
    }
};

InstanceData* GetInstanceData_instance_scarlet_citadel(Map* p_Map)
{
    return new instance_scarlet_citadel(p_Map);
}

// Trash NPCs

struct Location
{
    float m_fX, m_fY, m_fZ, m_fO;
};

static const Location vf_SpawnPoint[] =
{
    { 151.764f, -56.7610f, 18.007f, 1.57898f }
};

static const Location vf_LastWaypoint[] =
{
    { 153.686f, -18.3206f, 18.007f, 1.56408f },
    { 148.870f, -18.3653f, 18.007f, 1.56408f },
    { 151.397f, -18.3903f, 18.007f, 1.56408f },
    { 155.877f, -18.4343f, 18.007f, 1.56408f },
    { 146.708f, -18.4572f, 18.007f, 1.56408f },
    { 155.489f, -36.2737f, 18.007f, 1.56408f },
    { 154.648f, -27.2310f, 18.007f, 1.56408f },
    { 151.687f, -27.2111f, 18.007f, 1.56408f },
    { 148.733f, -27.2969f, 18.007f, 1.56408f },
    { 154.648f, -27.2310f, 18.007f, 1.56408f },
    { 151.687f, -27.2111f, 18.007f, 1.56408f },
    { 148.733f, -27.2969f, 18.007f, 1.56408f },
    { 153.173f, -36.1897f, 18.007f, 1.56408f },
    { 150.240f, -36.1585f, 18.007f, 1.56408f },
    { 147.945f, -36.1340f, 18.007f, 1.56408f },
    { 155.489f, -36.2737f, 18.007f, 1.56408f },
    { 153.965f, -44.8860f, 18.007f, 1.56408f },
    { 149.106f, -44.8231f, 18.007f, 1.56408f },
    { 151.731f, -44.7851f, 18.007f, 1.56408f },
    { 146.929f, -44.8546f, 18.007f, 1.56408f },
    { 156.001f, -44.9314f, 18.007f, 1.56408f }
};

struct npc_areatriggerAI : public ScriptedAI
{
    npc_areatriggerAI(Creature* p_Creature) : ScriptedAI(p_Creature)
    {
        //m_pInstance = static_cast<ScriptedInstance*>(p_Creature->GetInstanceData());
        Reset();
    }

    //ScriptedInstance* m_pInstance;
    
    bool b_IsTrashSpawned = false;

    uint16 ui_CheckPulse = 500;
    uint8 ui_TrashMob = 21;
    uint8 ui_ITR = 0;

    void Reset() override
    {
        b_IsTrashSpawned = false;
        ui_CheckPulse = 500;
    }

    void SummonAdds()
    {
        b_IsTrashSpawned = true;

        for ( ; ui_ITR < ui_TrashMob + 1 ; ++ui_ITR)
            m_creature->SummonCreature(NPC_FIRST_WING_TRASH, vf_SpawnPoint[0].m_fX, vf_SpawnPoint[0].m_fY, vf_SpawnPoint[0].m_fZ, vf_SpawnPoint[0].m_fO, TEMPSUMMON_DEAD_DESPAWN, 30000);
    }

    void JustSummoned(Creature* p_Summoned) override
    {
        if (p_Summoned->GetEntry() == NPC_FIRST_WING_TRASH)
        {
            p_Summoned->MonsterMoveWithSpeed(vf_LastWaypoint[ui_ITR].m_fX, vf_LastWaypoint[ui_ITR].m_fY, vf_LastWaypoint[ui_ITR].m_fZ, vf_LastWaypoint[ui_ITR].m_fO, 1, uint32(MOVE_PATHFINDING | MOVE_FORCE_DESTINATION));
        }
    }

    void UpdateAI(uint32 const ui_Diff) override
    {
        if (ui_CheckPulse < ui_Diff && !b_IsTrashSpawned)
        {
            Map::PlayerList const &liste = m_creature->GetMap()->GetPlayers();
            for (const auto& i : liste)
            {
                if (i.getSource()->IsInRange3d(146.187f, 10.9377f, 18.01f, 0.0f, 5.0f))
                    SummonAdds();
            }

            ui_CheckPulse = 500;
        }
        else
            ui_CheckPulse -= ui_Diff;
    }
};

CreatureAI* GetAI_npc_areatrigger(Creature* p_Creature)
{
    return new npc_areatriggerAI(p_Creature);
}

void AddSC_instance_scarlet_citadel()
{
    Script *p_Newscript;
    p_Newscript = new Script;
    p_Newscript->Name = "instance_scarlet_citadel";
    p_Newscript->GetInstanceData = &GetInstanceData_instance_scarlet_citadel;
    p_Newscript->RegisterSelf();

    p_Newscript = new Script;
    p_Newscript->Name = "npc_areatrigger";
    p_Newscript->GetAI = &GetAI_npc_areatrigger;
    p_Newscript->RegisterSelf();
}
