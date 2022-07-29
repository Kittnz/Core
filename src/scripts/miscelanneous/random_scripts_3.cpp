#include "scriptPCH.h"
#include "Utilities/EventProcessor.h"

template <typename Functor>
void DoAfterTime(Player* player, const uint32 p_time, Functor&& function)
{
    player->m_Events.AddEvent(new LambdaBasicEvent<Functor>(std::move(function)), player->m_Events.CalculateTime(p_time));
}

template <typename Functor>
void DoAfterTime(Creature* creature, const uint32 p_time, Functor&& function)
{
    creature->m_Events.AddEvent(new LambdaBasicEvent<Functor>(std::move(function)), creature->m_Events.CalculateTime(p_time));
}

void insomniDialogue(Player* pPlayer, Creature* pQuestGiver);

class DemorphAfterTime : public BasicEvent
{
public:
    explicit DemorphAfterTime(uint64 player_guid) : BasicEvent(), player_guid(player_guid) {}

    bool Execute(uint64 e_time, uint32 p_time) override
    {
        Player* player = ObjectAccessor::FindPlayer(player_guid);
        if (player)
            player->DeMorph();
        return false;
    }

private:
    uint64 player_guid;
};

class DismountAfterTime : public BasicEvent
{
public:
    explicit DismountAfterTime(uint64 player_guid) : BasicEvent(), player_guid(player_guid) {}

    bool Execute(uint64 e_time, uint32 p_time) override
    {
        Player* player = ObjectAccessor::FindPlayer(player_guid);
        if (player)
            player->Unmount(false);
        return false;
    }

private:
    uint64 player_guid;
};

bool GOHello_runed_thalassian_tablet(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestStatus(80290) == QUEST_STATUS_INCOMPLETE && !pPlayer->FindNearestCreature(91808, 20.0F)) // The Lost Tablets
        pGo->SummonCreature(91808, pPlayer->GetPositionX() + 2.0F, pPlayer->GetPositionY() + 2.0F, pPlayer->GetPositionZ() + 1.0F, 0.0F, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15 * IN_MILLISECONDS);
    return true;
}

struct highborne_wraithAI : public ScriptedAI
{
    highborne_wraithAI(Creature* c) : ScriptedAI(c) { Reset(); }

    bool transformed;
    bool fightBegun;

    void Reset()
    {
        transformed = false;
        fightBegun = false;
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (!fightBegun)
        {
            fightBegun = true;
            m_creature->MonsterYell("Leave this place! Leave! It took us, it will take you!");
        }

        DoMeleeAttackIfReady();
    }
    void EnterCombat() {}
    void JustRespawned() { Reset(); }
};

CreatureAI* GetAI_highborne_wraith(Creature* _Creature) { return new highborne_wraithAI(_Creature); }

bool GOHello_skeleton_thalo(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestStatus(80291) == QUEST_STATUS_INCOMPLETE && !pPlayer->FindNearestCreature(70891, 20.0F)) // The Shadow Well
    {
        pGo->SummonCreature(70891, pPlayer->GetPositionX() + 2.0F, pPlayer->GetPositionY() + 2.0F, pPlayer->GetPositionZ() + 1.0F, 0.0F, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15 * IN_MILLISECONDS);
        ChatHandler(pPlayer).SendSysMessage("|cffF58CBAWhisper: He sees all. Indulge yourself in his voice, for there is no point in defying the inevitable. The day of reckoning is approaching...|r");
    }
    return true;
}

CreatureAI* GetAI_skeleton_thalo(Creature* _Creature) { return new highborne_wraithAI(_Creature); }

bool GossipHello_analyzor_53(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(40044) == QUEST_STATUS_INCOMPLETE) // The Analyzation Chip
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Attempt to pull out the Analyzation Chip.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    pPlayer->SEND_GOSSIP_MENU(91775, pCreature->GetGUID());
    return true;
}

bool GossipSelect_analyzor_53(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->MonsterSayToPlayer("Foreign interference detected! Dispatch threat!", pPlayer);
        pCreature->SetFactionTemporary(14, TEMPFACTION_RESTORE_COMBAT_STOP);
        pCreature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        pCreature->HandleEmote(EMOTE_ONESHOT_ATTACK1H);
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_the_cow_king(Player* pPlayer, Creature* pCreature)
{
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "King Moo, I wish to challenge you.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    pPlayer->SEND_GOSSIP_MENU(91799, pCreature->GetGUID());
    return true;
}

bool GossipSelect_the_cow_king(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        DoAfterTime(pPlayer, 3 * IN_MILLISECONDS, [player = pPlayer, creature = pCreature]() {
            creature->MonsterSayToPlayer("Very well, young one...", player);
            creature->SetFactionTemporary(14, TEMPFACTION_RESTORE_COMBAT_STOP);
            creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            creature->HandleEmote(EMOTE_ONESHOT_ATTACK1H);
            });
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

enum cow_king_spells
{
    SPELL_FIREBALL = 20678,
    SPELL_SHADOWBOLT_VOLLEY = 25586,
    SPELL_THUNDERCLAP = 23931,
    SPELL_FROSTBOLT = 28479,
    SPELL_CHARGE = 22911,
    SPELL_WARSTOMP = 16727,
};

struct the_cow_kingAI : public ScriptedAI
{
public:
    the_cow_kingAI(Creature* pCreature) : ScriptedAI(pCreature) { Reset(); }

    void Reset() override
    {
        m_uiCleaveTimer = 10000;
        m_uiMortalStrikeTimer = 15000;
        m_uiUppercutTimer = 5000;
        m_uiChargeTimer = 20000;
        m_uiWarstompTimer = 0;
    }

    void SpellHitTarget(Unit* /*pTarget*/, const SpellEntry* pSpell) override
    {
        if (pSpell->Id == SPELL_CHARGE)
            m_uiWarstompTimer = 500;
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_uiCleaveTimer <= uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_FIREBALL) == CAST_OK)
                m_uiCleaveTimer = 10000;
        }
        else
            m_uiCleaveTimer -= uiDiff;

        if (m_uiMortalStrikeTimer <= uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SHADOWBOLT_VOLLEY) == CAST_OK)
                m_uiMortalStrikeTimer = 15000;
        }
        else
            m_uiMortalStrikeTimer -= uiDiff;

        if (m_uiUppercutTimer <= uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_FROSTBOLT) == CAST_OK)
                m_uiUppercutTimer = 20000;
        }
        else
            m_uiUppercutTimer -= uiDiff;

        if (m_uiChargeTimer <= uiDiff)
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 1))
            {
                if (DoCastSpellIfCan(pTarget, SPELL_CHARGE) == CAST_OK)
                    m_uiChargeTimer = urand(15000, 25000);
            }
        }
        else
            m_uiChargeTimer -= uiDiff;

        if (m_uiWarstompTimer)
        {
            if (m_uiWarstompTimer <= uiDiff)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_WARSTOMP) == CAST_OK)
                    m_uiWarstompTimer = 0;
            }
            else
                m_uiWarstompTimer -= uiDiff;
        }

        DoMeleeAttackIfReady();
        EnterEvadeIfOutOfCombatArea(uiDiff);
    }

private:
    uint32 m_uiCleaveTimer;
    uint32 m_uiMortalStrikeTimer;
    uint32 m_uiUppercutTimer;
    uint32 m_uiChargeTimer;
    uint32 m_uiWarstompTimer;
};

CreatureAI* GetAI_the_cow_king(Creature* pCreature) { return new the_cow_kingAI(pCreature); }

bool GossipHello_npc_bessy(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestRewardStatus(40056))
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Teleport me to the Cow Level", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    }
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(91798, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_bessy(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        static const WorldLocation m_CowLevel(801, 16649.712F, 16817.148F, 67.328f, 6.27F);
        pPlayer->TeleportTo(m_CowLevel);
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool QuestAccept_npc_wendo_wobblefizz(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 40068) //Wobblefree Fizz-gear
    {
        pQuestGiver->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

        DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->HandleEmote(EMOTE_STATE_WORK);
            });
        DoAfterTime(pPlayer, 5 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSayToPlayer("Now, I just put this here, and then...", player);
            });
        DoAfterTime(pPlayer, 9 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSayToPlayer("That's done it, I knew the Turbo-Charged Wobblefree Fizz-disk would come in handy.", player);
            });
        DoAfterTime(pPlayer, 13 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            npc->HandleEmote(EMOTE_STATE_NONE);
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60319))
                player->KilledMonster(cInfo, ObjectGuid());
            });
    }
    return false;
}

bool GOHello_go_grain_sacks(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestStatus(40099) == QUEST_STATUS_INCOMPLETE && pPlayer->GetQuestStatusData(40099)->m_creatureOrGOcount[2] != 5)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Poison grain.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    pPlayer->SEND_GOSSIP_MENU(2010824, pGo->GetGUID());
    return true;
}

bool GOSelect_go_grain_sacks(Player* pPlayer, GameObject* pGo, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1)
    {
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60323))
            pPlayer->KilledMonster(cInfo, ObjectGuid());
		pGo->Deactivate(150);
        // Purple smoke effect: 
		pPlayer->SummonGameObject(2000560, pGo->GetPositionX(), pGo->GetPositionY(), pGo->GetPositionZ(), 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 150, true);
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return false;
}

bool GossipHello_npc_torble_and_kex(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(40132) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(40133) == QUEST_STATUS_INCOMPLETE)
    {
        if (pCreature->GetEntry() == 60441 || pCreature->GetEntry() == 60443)
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Let's do it!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Not right now, give me a moment.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        }
    }

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(4654, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_torble_and_kex(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        switch (pCreature->GetEntry())
        {
        case 60441: // Torble Sparksprocket
            pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                npc->MonsterSay("Here we go! Awaken!");
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
                if (Creature* analyzer_x51 = player->FindNearestCreature(60444, 30.0F))
                {
                    analyzer_x51->SetVisibility(VISIBILITY_ON);
                }
                });
            DoAfterTime(pPlayer, 5 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x51 = player->FindNearestCreature(60444, 30.0F))
                {
                    analyzer_x51->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    analyzer_x51->MonsterSay("Initiating...");
                    analyzer_x51->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                });
            DoAfterTime(pPlayer, 7 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x51 = player->FindNearestCreature(60444, 30.0F))
                {
                    analyzer_x51->MonsterSay("Processing...");
                    analyzer_x51->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                });
            DoAfterTime(pPlayer, 9 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x51 = player->FindNearestCreature(60444, 30.0F))
                {
                    analyzer_x51->MonsterSay("Processing...");
                    analyzer_x51->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                });
            DoAfterTime(pPlayer, 11 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x51 = player->FindNearestCreature(60444, 30.0F))
                {
                    analyzer_x51->MonsterSay("Scanning Unknown beings, threat minimal, universal translator engaged.");
                    analyzer_x51->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                });
            DoAfterTime(pPlayer, 15 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x51 = player->FindNearestCreature(60444, 30.0F))
                {
                    analyzer_x51->MonsterSay("Systems Online. Analyzer X-51 Online. Memory banks are currently restricted. How can I assist you?");
                    analyzer_x51->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                });
            DoAfterTime(pPlayer, 20 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                npc->MonsterSay("It works! It speaks! It somehow scanned us and learned our language! Amazing! ahem... What are you?");
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 25 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x51 = player->FindNearestCreature(60444, 30.0F))
                {
                    analyzer_x51->MonsterSay("I am Analyzer X-51, my primary purpose is to analyze systems and mechanisms in order to understand any flaw. Forexample, your purpose has been lost and you have been rendered soft and organic.");
                    analyzer_x51->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                });
            DoAfterTime(pPlayer, 30 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                npc->MonsterSay("What? Wait, are you saying that you are...What Gnomes were originally?");
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 35 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x51 = player->FindNearestCreature(60444, 30.0F))
                {
                    analyzer_x51->MonsterSay("We share a basal design, correct. However I cannot say whether you are an analyzer or not. In fact judging by your structure I cannot even ascertain if you were ever granted a purpose. I require more information.");
                    analyzer_x51->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                });
            DoAfterTime(pPlayer, 40 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                npc->MonsterSay("That's... Amazing, what else can you tell us? Where did you work? Were you assigned to the facility here? Are there more like you?");
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 45 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x51 = player->FindNearestCreature(60444, 30.0F))
                {
                    analyzer_x51->MonsterSay("My limbs are from different models, and my core was not designed for this body. It is fair to assume that others like me existed or exist. I cannot answer your other questions as I do not know. 97 persent of my memory banks are restricted.");
                    analyzer_x51->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                });
            DoAfterTime(pPlayer, 50 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                npc->MonsterSay("Is there any way to unrestrict them?");
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 55 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x51 = player->FindNearestCreature(60444, 30.0F))
                {
                    analyzer_x51->MonsterSay("Negative. I require an additional component installed, an activation key.");
                    analyzer_x51->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                });
            DoAfterTime(pPlayer, 60 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                npc->MonsterSay("I see... Then we will have to acquire one later. Thank you Analyzer X-51. $R come over here for a moment.");
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 65 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x51 = player->FindNearestCreature(60444, 30.0F))
                {
                    analyzer_x51->MonsterSay("I stand by for further instructions or inquiries.");
                    analyzer_x51->HandleEmote(EMOTE_ONESHOT_TALK);
                    if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60324))
                        player->KilledMonster(cInfo, ObjectGuid());
                    analyzer_x51->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                }
                });
            break;

        case 60443: // Kex Blowmaster
            pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                npc->MonsterSay("Hah! Go on then turn on!");
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
                if (Creature* analyzer_x48 = player->FindNearestCreature(60445, 30.0F))
                {
                    analyzer_x48->SetVisibility(VISIBILITY_ON);
                }
                });
            DoAfterTime(pPlayer, 5 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x48 = player->FindNearestCreature(60445, 30.0F))
                {
                    analyzer_x48->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    analyzer_x48->MonsterSay("Initiating...");
                    analyzer_x48->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                });
            DoAfterTime(pPlayer, 10 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x48 = player->FindNearestCreature(60445, 30.0F))
                {
                    analyzer_x48->MonsterSay("Processing...");
                    analyzer_x48->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                });
            DoAfterTime(pPlayer, 15 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x48 = player->FindNearestCreature(60445, 30.0F))
                {
                    analyzer_x48->MonsterSay("Processing...");
                    analyzer_x48->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                });
            DoAfterTime(pPlayer, 15 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x48 = player->FindNearestCreature(60445, 30.0F))
                {
                    analyzer_x48->MonsterSay("Scanning Unknown beings, threat minimal, universal translator engaged.");
                    analyzer_x48->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                });
            DoAfterTime(pPlayer, 20 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x48 = player->FindNearestCreature(60445, 30.0F))
                {
                    analyzer_x48->MonsterSay("Systems Online. Analyzer X-48 Online. Memory banks are currently restricted. How can I assist you?");
                    analyzer_x48->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                });
            DoAfterTime(pPlayer, 25 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                npc->MonsterSay("Oh wow! I was afraid I had to get a Titanic translator or somethin', Yo dude! Tell us where to find gold and rare techologies!");
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 30 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x48 = player->FindNearestCreature(60445, 30.0F))
                {
                    analyzer_x48->MonsterSay("I am Analyzer X-48, my primary purpose is to analyze systems and mechanisms in order to understand any flaw in them. Forexample, your unadulterated greed and thirst for technology is errant and can lead to your destruction.");
                    analyzer_x48->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                });
            DoAfterTime(pPlayer, 35 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                npc->MonsterSay("What? Are you patronizing me?! I gave you life, ya know? I spent time, effort, and MONEY on makin' you work, so help me out yeah? Don't worry about me, I'll be fine even with my greed. Heck if I get enough money maybe it'll go away, so yeah, you can help.");
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 40 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x48 = player->FindNearestCreature(60445, 30.0F))
                {
                    analyzer_x48->MonsterSay("I doubt your sincerity, however I am in your debt. Would that I could help more, but my memory banks are currently restricted. 98 persent of my memory banks are locked and require a key to function.");
                    analyzer_x48->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                });
            DoAfterTime(pPlayer, 45 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                npc->MonsterSay("A key? Huh? Where would we find such a key? Is there another way to unlock your noggin? If we do it will you help?");
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 50 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x48 = player->FindNearestCreature(60445, 30.0F))
                {
                    analyzer_x48->MonsterSay("There is no other way to my knowledge. A key to unlock the memories within me are required. Once I have my memories back I will divulge the knowledge you seek in return for rebuilding me.");
                    analyzer_x48->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                });
            DoAfterTime(pPlayer, 55 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                npc->MonsterSay("Any idea what this knowledge is? Your analytic abilities might be useful, and could help me win some money through gambling or prospectin' or something, but I'd prefer something more substantial. Do you have the blueprints for yourself?");
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 60 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x48 = player->FindNearestCreature(60445, 30.0F))
                {
                    analyzer_x48->MonsterSay("I do not know which knowledge is stored in my restricted memory banks. I however, surmise that since the memories are restricted, they would be valuable secrets to my people. So yes it could contain blueprints or technology and other things.");
                    analyzer_x48->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                });
            DoAfterTime(pPlayer, 65 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                npc->MonsterSay("Sweet! Hey Partner, come over here and talk to me! Analyzer you may rest or somethin', we'll talk later.");
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 70 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
                if (Creature* analyzer_x48 = player->FindNearestCreature(60445, 30.0F))
                {
                    analyzer_x48->MonsterSay("Affirmative, standing by.");
                    analyzer_x48->HandleEmote(EMOTE_ONESHOT_TALK);
                    if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60324))
                        player->KilledMonster(cInfo, ObjectGuid());
                    analyzer_x48->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                }
                });
            break;
        }
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        if (pCreature->GetEntry() == 60441 || pCreature->GetEntry() == 60443)
        {
            pPlayer->CLOSE_GOSSIP_MENU();
        }
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool QuestAccept_npc_arnold_boran(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    bool first_item_added = false;
    bool second_item_added = false;

    if (pQuest->GetQuestId() == 40141) // The Boran Family
    {
        if (pPlayer->AddItem(60204)) first_item_added = true;
        if (pPlayer->AddItem(60205)) second_item_added = true;

        if (!first_item_added || !second_item_added)
        {
            pPlayer->RemoveQuest(40141);
            pPlayer->SetQuestStatus(40141, QUEST_STATUS_NONE);
            pPlayer->GetSession()->SendNotification("Your bags are full!");
            return false;
        }
    }
    return false;
}

bool GossipHello_npc_samuel_boran(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(40141) == QUEST_STATUS_INCOMPLETE && pPlayer->HasItemCount(60205, 1, false))
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "I have a letter from your brother.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    }

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(92936, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_samuel_boran(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
        if (pPlayer->HasItemCount(60205, 1, false))
        {
            pPlayer->DestroyItemCount(60205, 1, true);
            pPlayer->SaveInventoryAndGoldToDB();
        }
        DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("I knew Arnold was still out there somewhere, though I cannot imagine what it would be like stranded on some island at sea. Hopefully he returns home safely.", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 5 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("I have a letter for you, deliver it to him and with haste.", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            player->AddItem(60203, 1);
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60326))
                player->KilledMonster(cInfo, ObjectGuid());
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            });
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_karl_boran(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(40141) == QUEST_STATUS_INCOMPLETE && pPlayer->HasItemCount(60204, 1, false))
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "I have a letter from your brother.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    }

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(1042, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_karl_boran(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
        if (pPlayer->HasItemCount(60204, 1, false))
        {
            pPlayer->DestroyItemCount(60204, 1, true);
            pPlayer->SaveInventoryAndGoldToDB();
        }
        DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("A letter from Arnold... I thought he died at sea, I haven't heard from him in such a long time.", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 5 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("This is splendid news, here, please, take this to him.", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            player->AddItem(60202, 1);
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60325))
                player->KilledMonster(cInfo, ObjectGuid());
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            });
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_chef_jenkel(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pCreature->IsVendor())
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ACTION_TRADE, "Buy something?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Teach me how to cook, mon!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);

    if (pPlayer->GetQuestStatus(40142) == QUEST_STATUS_INCOMPLETE)
    {
        if (pCreature->GetEntry() == 91950 && !pPlayer->HasItemCount(60207, 1, false))
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Slim is asking for salt.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
        }
    }

    pPlayer->SEND_GOSSIP_MENU(91950, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_chef_jenkel(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
        pPlayer->GetSession()->SendListInventory(pCreature->GetGUID());

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 3)
    {
        pPlayer->AddItem(60207);
        if (pPlayer->HasItemCount(60207, 1, false))
        {
            pCreature->MonsterSayToPlayer("Alright, fine, but he owes me, make sure you tell him!", pPlayer);
            pCreature->HandleEmote(EMOTE_ONESHOT_TALK);
            pPlayer->CLOSE_GOSSIP_MENU();
            return true;
        }
        else
            pPlayer->GetSession()->SendNotification("Your bags are full!");
        return false;
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 5)
    {
        pPlayer->GetSession()->SendTrainerList(pCreature->GetGUID());
        return true;
    }

    return true;
}

bool GossipHello_npc_marty_moonshine(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsVendor())
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ACTION_TRADE, "I want to browse your goods.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pPlayer->GetQuestStatus(40148) == QUEST_STATUS_INCOMPLETE)
    {
        if (pCreature->GetEntry() == 92137 && !pPlayer->HasItemCount(60217, 1, false))
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Give me the Recipe for Southsea Reserve and you get to live!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        }
    }

    pPlayer->SEND_GOSSIP_MENU(92137, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_marty_moonshine(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
        pPlayer->GetSession()->SendListInventory(pCreature->GetGUID());

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        pPlayer->AddItem(60217);
        if (pPlayer->HasItemCount(60217, 1, false))
        {
            pCreature->MonsterSayToPlayer("Fine! Spare me please, here is the recipe!", pPlayer);
            pCreature->HandleEmote(EMOTE_ONESHOT_TALK);
            pPlayer->CLOSE_GOSSIP_MENU();
            return true;
        }
        else
            pPlayer->GetSession()->SendNotification("Your bags are full!");
        return false;
    }

    return true;
}

struct npc_captain_saltbeardAI : public ScriptedAI
{
    npc_captain_saltbeardAI(Creature* c) : ScriptedAI(c) { Reset(); }

    void Reset() {}
    void UpdateAI(const uint32 diff)
    {
        DoMeleeAttackIfReady();
    }
    void Aggro(Unit* who)
    {
        m_creature->MonsterSay("We got company on the ship! Push back these mainlanders!");
    }
    void JustRespawned() { Reset(); }
};

CreatureAI* GetAI_npc_captain_saltbeard(Creature* _Creature) { return new npc_captain_saltbeardAI(_Creature); }

struct npc_captain_blackeyeAI : public ScriptedAI
{
    npc_captain_blackeyeAI(Creature* c) : ScriptedAI(c) { Reset(); }

    void Reset() {}
    void UpdateAI(const uint32 diff)
    {
        DoMeleeAttackIfReady();
    }
    void Aggro(Unit* who)
    {
        m_creature->MonsterSay("Who are you? You think you can take my ship without a fight?!");
    }
    void JustRespawned() { Reset(); }
};

CreatureAI* GetAI_npc_captain_blackeye(Creature* _Creature) { return new npc_captain_blackeyeAI(_Creature); }

struct npc_captain_ironhoofAI : public ScriptedAI
{
    npc_captain_ironhoofAI(Creature* c) : ScriptedAI(c) { Reset(); }

    void Reset() {}
    void UpdateAI(const uint32 diff)
    {
        DoMeleeAttackIfReady();
    }
    void Aggro(Unit* who)
    {
        m_creature->MonsterSay("You wont stand a chance against me scurvy dog!");
    }
    void JustRespawned() { Reset(); }
};

CreatureAI* GetAI_npc_captain_ironhoof(Creature* _Creature) { return new npc_captain_ironhoofAI(_Creature); }

bool GOHello_go_blast_powder_keg(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestStatus(40174) == QUEST_STATUS_INCOMPLETE && pPlayer->HasItemCount(60373, 1, false))
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Pour water into the keg.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        pPlayer->SEND_GOSSIP_MENU(2010834, pGo->GetGUID());
    }

    if (pPlayer->GetQuestStatus(40186) == QUEST_STATUS_INCOMPLETE && pPlayer->HasItemCount(60257, 1, false))
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Ignite the gunpowder.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        pPlayer->SEND_GOSSIP_MENU(2010834, pGo->GetGUID());
    }
    return true;
}

bool GOSelect_go_blast_powder_keg(Player* pPlayer, GameObject* pGo, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->HandleEmote(EMOTE_ONESHOT_KNEEL);
        pGo->Deactivate(150);
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60328))
            pPlayer->KilledMonster(cInfo, ObjectGuid());
    }

    if (action == GOSSIP_ACTION_INFO_DEF + 2)
    {
        pGo->SummonGameObject(2000838, pGo->GetPositionX(), pGo->GetPositionY(), pGo->GetPositionZ() + 0.6f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 30, true); /*burning effect*/
        pPlayer->DestroyItemCount(60257, 1, true);
        pPlayer->SaveInventoryAndGoldToDB();
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60330))
            pPlayer->KilledMonster(cInfo, ObjectGuid());
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GOHello_go_keg_of_rum(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestStatus(40178) == QUEST_STATUS_INCOMPLETE && pPlayer->HasItemCount(60252, 1, false))
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Poison the rum.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        pPlayer->SEND_GOSSIP_MENU(100304, pGo->GetGUID());
    }
    return true;
}

bool GOSelect_go_keg_of_rum(Player* pPlayer, GameObject* pGo, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1)
    {
        if (pGo->GetEntry() == 2010836)
        {
            pPlayer->DestroyItemCount(60252, 1, true);
            pPlayer->SaveInventoryAndGoldToDB();
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60329))
                pPlayer->KilledMonster(cInfo, ObjectGuid());
        }
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return false;
}

bool GossipHello_npc_morgan_the_storm(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(40179) == QUEST_STATUS_INCOMPLETE) // Exterminate the Rat
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Spit in Morgan's face.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_morgan_the_storm(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        //pCreature->MonsterSayToPlayer("Prepare to die!", pPlayer);
        pCreature->SetFactionTemporary(14, TEMPFACTION_RESTORE_COMBAT_STOP);
        pCreature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        pCreature->HandleEmote(EMOTE_ONESHOT_ATTACK1H);
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_garfield_sparkblast(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(40172) == QUEST_STATUS_INCOMPLETE) // Red Flag over the Sea
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "I want to join you.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pPlayer->GetQuestStatus(40187) == QUEST_STATUS_INCOMPLETE) // Captain of the Bloodsail Buccaneers
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "I'm ready!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);

    if (pPlayer->GetQuestStatus(40354) == QUEST_STATUS_INCOMPLETE) // Naming the Vessel
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I'll call it The Crying Dandelion.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(60496, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_garfield_sparkblast(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        auto faction1 = sObjectMgr.GetFactionEntry(87); // Bloodsail Buccaneers
        if (faction1)
        {
            pPlayer->GetReputationMgr().SetReputation(faction1, 0);
            pCreature->HandleEmote(EMOTE_ONESHOT_APPLAUD);
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60332))
                pPlayer->KilledMonster(cInfo, ObjectGuid());
        }
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);

        DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("Well done, Cap'n!", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 3 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("Set yer veils high 'n conquer this world under yer name 'n the Jolly Roger o' the Bloodsail Buccaneers!", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 8 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterYell("Ahoy! Now let\'s get some rum \'n party.");
            npc->HandleEmote(EMOTE_ONESHOT_APPLAUD);
            });
        DoAfterTime(pPlayer, 12 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterYell("Yo-ho-ho!");
            npc->HandleEmote(EMOTE_ONESHOT_CHEER);
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60331))
                player->KilledMonster(cInfo, ObjectGuid());
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            });
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 3)
    {
        pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
        pCreature->MonsterSay("The Crying Dandelion, eh? Didn't take ye for a romantic. So be it, the vessel's name will be so from now on, I will let the crew know.");
        pCreature->HandleEmote(EMOTE_ONESHOT_TALK);

        DoAfterTime(pPlayer, 5 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60354))
                player->KilledMonster(cInfo, ObjectGuid());
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            });
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_thirael(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(40184) == QUEST_STATUS_INCOMPLETE) // No Hope for Tomorrow
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "I will end your pain.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_thirael(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->SetFactionTemporary(14, TEMPFACTION_RESTORE_COMBAT_STOP);
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

struct npc_thiraelAI : public ScriptedAI
{
    npc_thiraelAI(Creature* c) : ScriptedAI(c) { Reset(); }

    void Reset() { }
    void JustDied(Unit*) override
    {
        if(!m_creature->FindNearestCreature(60464, 5.0F))
        m_creature->SummonCreature(60464, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), m_creature->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 115 * IN_MILLISECONDS);
    }
};

CreatureAI* GetAI_npc_thirael(Creature* _Creature) { return new npc_thiraelAI(_Creature); }

bool QuestRewarded_npc_thirael_ghost(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40184) // No Hope for Tomorrow
    {
        DoAfterTime(pPlayer, 5 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->ForcedDespawn();
            });
    }

    return false;
}

bool QuestRewarded_npc_blazno(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40190) // The Blazno Touch
    {
        pQuestGiver->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
        DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSayToPlayer("Now, behold my brilliance, my sheer wit and power of mind! With these items, I will be rich again! Haha!", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 12 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSayToPlayer("Huh... Maybe its supposed to take a while, I'll think of a new method to make this work, thanks again pal!", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            });
    }

    return false;
}

bool QuestRewarded_npc_daela_evermoon(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40197) // Old Greypaw
    {
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_CRY);
    }

    return false;
}

bool GossipHello_npc_old_greypaw(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(40197) == QUEST_STATUS_INCOMPLETE) // Old Greypaw
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Daela Evermoon was asking if you were okay.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(60470, pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_old_greypaw(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("WHO?! Evermoon asking if I am weak?! Evermoon want to kill me huh?! Who are you, messenger, scout?", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 5 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("You think you can probe me for weakness?!", player);
            npc->SetFactionTemporary(14, TEMPFACTION_RESTORE_COMBAT_STOP);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            npc->HandleEmote(EMOTE_ONESHOT_ATTACK1H);
            });
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

struct npc_old_greypawAI : public ScriptedAI
{
    npc_old_greypawAI(Creature* c) : ScriptedAI(c) { Reset(); }

    void Reset() { }
    void JustDied(Unit*) override
    {
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        m_creature->SetFactionTemporary(15, TEMPFACTION_RESTORE_COMBAT_STOP);
    }
};

CreatureAI* GetAI_npc_old_greypaw(Creature* _Creature) { return new npc_old_greypawAI(_Creature); }

bool GossipHello_npc_insomni(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(40210) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "I am ready to hear your tale.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pPlayer->GetQuestStatus(40214) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "We must banish this evil together.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);

    pPlayer->SEND_GOSSIP_MENU(60446, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_insomni(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{

    auto playerGuid = pPlayer->GetObjectGuid();
    switch (uiAction)
    {
    case GOSSIP_ACTION_INFO_DEF + 1:
    {
        pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

        DoAfterTime(pCreature, 1 * IN_MILLISECONDS, [npc = pCreature]() {
            npc->MonsterSay("I come from a land far away, shrouded in mystery and green mist. I am blessed by those you would not understand, and those that inhabit this mystical land. I am an outcast of my kin, and have only come here to seek new purpose. This purpose was found upon these islands.");
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pCreature, 21 * IN_MILLISECONDS, [npc = pCreature]() {
            npc->MonsterSay("Slowly, day by day, a darkness came, a power much like myself that dared to challenge the rule I had established. Little by little I would lose this pitiful match of displaying power to attempt to keep the locals swayed to my side.");
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pCreature, 41 * IN_MILLISECONDS, [ npc = pCreature]() {
            npc->MonsterSay("In the end, I could not offer the secrets of my power to those that followed me. Eventually, most of my followers and worshippers stepped aside to bask in the glory of this dark energy. Now, I am seeking revenge, I am seeking to once again reclaim my throne upon these lands, do you understand mortal?");
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pCreature, 56 * IN_MILLISECONDS, [playerGuid, npc = pCreature]() {
            auto player = sObjectAccessor.FindPlayer(playerGuid);
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60334); cInfo && player)
                player->KilledMonster(cInfo, ObjectGuid());
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            });
        break;
    }
    case GOSSIP_ACTION_INFO_DEF + 2:
    {
        insomniDialogue(pPlayer, pCreature);
        break;
    }

    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool QuestAccept_npc_insomni(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    auto playerGuid = pPlayer->GetObjectGuid();

    if (pQuest->GetQuestId() == 40171) // The Tower of Lapidis IX
    {
        pQuestGiver->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        pQuestGiver->CastSpell(pQuestGiver, 13236, false);

        DoAfterTime(pQuestGiver, 18 * IN_MILLISECONDS, [npc = pQuestGiver]() {
            npc->HandleEmote(EMOTE_ONESHOT_YES);
            npc->CastSpell(npc, 5906, false);
            });
        DoAfterTime(pQuestGiver, 20 * IN_MILLISECONDS, [playerGuid, npc = pQuestGiver]() {
            auto player = sObjectAccessor.FindPlayer(playerGuid);
            if (player)
            {
                player->AddItem(60244);
                if (player->HasItemCount(60244, 1, false))
                {
                    npc->MonsterSayToPlayer("There, it is done, the key is attuned, do with it what you must. I hope whatever purpose you are using this for, serves you well.", player);
                    npc->HandleEmote(EMOTE_ONESHOT_TALK);
                    npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                    return true;
                }
                else
                    player->RemoveQuest(40171);
                player->SetQuestStatus(40171, QUEST_STATUS_NONE);
                player->GetSession()->SendNotification("Your bags are full!");
            }

            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            return false;
            });
    }

    if (pQuest->GetQuestId() == 40271) // The Maul'ogg Crisis VIII --
    {
        pQuestGiver->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        pQuestGiver->CastSpell(pQuestGiver, 13236, false);

        DoAfterTime(pQuestGiver, 18 * IN_MILLISECONDS, [npc = pQuestGiver]() {
            npc->HandleEmote(EMOTE_ONESHOT_YES);
            npc->CastSpell(npc, 5906, false);
            });
        DoAfterTime(pQuestGiver, 20 * IN_MILLISECONDS, [playerGuid, npc = pQuestGiver]() {
            auto player = sObjectAccessor.FindPlayer(playerGuid);

            if (player)
            {
                player->AddItem(60345);
                if (player->HasItemCount(60345, 1, false))
                {
                    npc->MonsterSayToPlayer("I must confess something to you mortal, for I am not one to withhold information, nor am I one to outwardly lie without purpose. I had many reasonings for the death of the Prophet Jammal'an within the depths of the Sunken Temple.", player);
                    npc->HandleEmote(EMOTE_ONESHOT_TALK);
                    npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    return true;
                }
                else
                    player->RemoveQuest(40271);
                player->SetQuestStatus(40271, QUEST_STATUS_NONE);
                player->GetSession()->SendNotification("Your bags are full!");
            }
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            return false;
            });
    }

    if (pQuest->GetQuestId() == 40214) // Uncovering Evil
        insomniDialogue(pPlayer, pQuestGiver);

    return false;
}

void insomniDialogue(Player* pPlayer, Creature* pQuestGiver)
{
    pQuestGiver->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

    auto pGuid = pPlayer->GetObjectGuid();

    DoAfterTime(pQuestGiver, 1 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
        {
            npc->SetWalk(true);
            npc->GetMotionMaster()->MovePoint(0, -12864.27F, 2809.63F, -6.85F, 0, 3.0F);
            npc->PMonsterSay("Come, %s. It is time to banish this evil.", player->GetName());
        }
        });
    DoAfterTime(pQuestGiver, 39 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
        {
            npc->MonsterSay("We must travel to the center of Kazon Island, there, I can channel the energies of both Lapidis, and Gillijim.");
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
        }
        });
    DoAfterTime(pQuestGiver, 42 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
        {
            npc->GetMotionMaster()->MovePoint(0, -12865.99F, 2821.96F, -0.82F, 0, 3.0F);
        }
        });
    DoAfterTime(pQuestGiver, 47 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
        {
            npc->MonsterSay("With the energies, and my own, I will be able to draw out the corruption that has plagued the land.");
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
        }
        });
    DoAfterTime(pQuestGiver, 48 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
        {
            npc->GetMotionMaster()->MovePoint(0, -12864.54F, 2908.59F, 10.24F, 0, 3.0F);
        }
        });
    DoAfterTime(pQuestGiver, 61 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
        {
            npc->GetMotionMaster()->MovePoint(0, -12865.12F, 2873.97F, 1.67F, 0, 3.0F);
        }
        });
    DoAfterTime(pQuestGiver, 65 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
        {
            npc->GetMotionMaster()->MovePoint(0, -12864.54F, 2908.59F, 10.24F, 0, 3.0F, 0.62F);
        }
        });
    DoAfterTime(pQuestGiver, 78 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
        {
            npc->MonsterSay("Now then - this will take much concentration to bring the entity forward into physical form, it is up to you to weaken it! When it is weak enough, I will be free to join you, until then, protect me!");
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
        }
        });
    DoAfterTime(pQuestGiver, 82 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
        {
            npc->CastSpell(npc, 13236, false);
            GameObject* riftSpell = npc->SummonGameObject(7000035, -12853.94f, 2915.04f, 10.81f, 0);
        }
        });

    DoAfterTime(pQuestGiver, 92 * IN_MILLISECONDS, [pGuid, npc = pQuestGiver]() {
       
        WorldObject* obj = nullptr;
        Player* pPlayer = ObjectAccessor::FindPlayer(pGuid);
        if (!pPlayer)
            obj = npc;
        else
            obj = pPlayer;

        if (GameObject* riftSpell = obj->FindNearestGameObject(7000035, 50.0f))
            riftSpell->AddObjectToRemoveList();
        });

    DoAfterTime(pQuestGiver, 92 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
        {
            npc->SummonCreature(60499, -12853.94f, 2915.04f, 10.81f, 3.83F, TEMPSUMMON_CORPSE_DESPAWN);
        }
        });
}

struct npc_fearothAI : public ScriptedAI
{
    npc_fearothAI(Creature* c) : ScriptedAI(c) { Reset(); }

    bool transformed;
    bool fightBegun;

    void Reset() 
    {
        transformed = false;
        fightBegun = false;
    }

    void UpdateAI(const uint32 diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (!fightBegun)
        {
            fightBegun = true;
            m_creature->MonsterSay("Who are you interlopers? Do you really think you can stop my plans?");
        }

        if (!transformed && m_creature->GetHealthPercent() < 25.0f)
        {
            if (Creature* insomni = m_creature->FindNearestCreature(60446, 100.0F))
            {
                Creature* insomnius = m_creature->SummonCreature(60498, insomni->GetPositionX(), insomni->GetPositionY(), insomni->GetPositionZ(), insomni->GetOrientation(), TEMPSUMMON_MANUAL_DESPAWN);

                transformed = true;

                insomni->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                insomni->DespawnOrUnsummon();
            }
        }

        DoMeleeAttackIfReady();
    }

    void JustDied(Unit*) 
    {
        Creature* insomnius = m_creature->FindNearestCreature(60498, 40.0F);

        if (insomnius)
        {
            insomnius->MonsterSay("It is done! The darkness has faded. Can you feel it dissipating before your very eyes? I'll be returning to the cave. Meet me there.");
            insomnius->DespawnOrUnsummon();
        }
    }

    void EnterEvadeMode() 
    {
        if (Creature* insomni = m_creature->FindNearestCreature(60446, 100.0F))
            insomni->DespawnOrUnsummon();

        if (Creature* insomnius = m_creature->FindNearestCreature(60498, 100.0F))
            insomnius->DespawnOrUnsummon();

        m_creature->DespawnOrUnsummon();
    }
};

CreatureAI* GetAI_npc_fearoth(Creature* _Creature) { return new npc_fearothAI(_Creature); }

struct npc_lapidisAI : public ScriptedAI
{
    npc_lapidisAI(Creature* c) : ScriptedAI(c) { Reset(); }

    void Reset() {}
    void UpdateAI(const uint32 diff)
    {
        DoMeleeAttackIfReady();
    }
    void Aggro(Unit* who)
    {
        m_creature->MonsterSay("Who let you in this tower?! Do you know who you are messing with?!");
    }
    void JustDied(Unit*) override
    {
        m_creature->MonsterSay("You know.. Nothing... I was more powerful then all of you.");
    }
    void EnterCombat() {}
    void JustRespawned() { Reset(); }
};

CreatureAI* GetAI_npc_lapidis(Creature* _Creature) { return new npc_lapidisAI(_Creature); }

bool GossipHello_npc_lorthiras(Player* pPlayer, Creature* pCreature)
{
    //if (pPlayer->GetQuestStatus(00000) == QUEST_STATUS_INCOMPLETE)
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "I am looking for a fight dreadlord.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(60503, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_lorthiras(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->SetFactionTemporary(554, TEMPFACTION_RESTORE_COMBAT_STOP);
        pCreature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        pCreature->HandleEmote(EMOTE_ONESHOT_ATTACK1H);
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool QuestRewarded_npc_lorthiras(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40239) // The Will of Lorthiras
    {
        pQuestGiver->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
        pQuestGiver->CastSpell(pQuestGiver, 698, false); // Ritual of Summoning

        DoAfterTime(pPlayer, 6 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSayToPlayer("You feel it, don't you, the knowledge swell within your mind, the very fabric of my magic clinging to your thoughts. You have been gifted knowledge which is forbidden to your kind, and once you craft the blade, it will be forgotten forever.", player);
            npc->CastSpell(npc, 1456, false); // Life Tap
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });

        DoAfterTime(pPlayer, 16 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            });
    }

    return false;
}

#define LAPIDIS_TOWER_KEY 60302
#define MAGICALLY_SEALED_DOOR_RESET 1

bool GOHello_magically_sealed_door(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->HasItemCount(LAPIDIS_TOWER_KEY, 1))
    {
        pGo->UseDoorOrButton(10);
        pPlayer->HandleEmote(EMOTE_ONESHOT_KNEEL);

        if (GameObjectAI* gAI = pGo->AI())
            gAI->SetData(MAGICALLY_SEALED_DOOR_RESET, 1);
    }
    else
        pPlayer->GetSession()->SendNotification("Requires Lapidis Tower Key.");

    return true;
}

struct magically_sealed_door : public GameObjectAI
{
    explicit magically_sealed_door(GameObject* pGo) : GameObjectAI(pGo) {}
    uint32 BackTimer = 0;

    virtual void UpdateAI(uint32 const uiDiff) override
    {
        if (BackTimer != 0)
        {
            if (BackTimer < uiDiff)
            {
                BackTimer = 0;
                me->ResetDoorOrButton();
            }
            else
            {
                BackTimer -= uiDiff;
                if (BackTimer == 0)
                {
                    me->ResetDoorOrButton();
                }
            }
        }
    }

    virtual void SetData(uint32 id, uint32 value) override
    {
        if (id == MAGICALLY_SEALED_DOOR_RESET)
            BackTimer = 25 * IN_MILLISECONDS;
        GameObjectAI::SetData(id, value);
    }
};

GameObjectAI* GetAI_magically_sealed_door(GameObject* Obj) { return new magically_sealed_door(Obj); }

bool QuestAccept_npc_iselus(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40247) // Staff of Eldara
    {
        pQuestGiver->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
        pQuestGiver->CastSpell(pQuestGiver, 23017, false); // Arcane Channeling

        DoAfterTime(pPlayer, 5 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSayToPlayer("We Keepers have been active within Azshara to leave the secrets of the region a mystery. We have fallen into shadow, into dissaray unable to even communicate effectively with one another, and spread over large distances. We are surrounded by enemies at all sides and what once was is nothing more then a faded memory of ruins.", player);
            });

        DoAfterTime(pPlayer, 20 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSayToPlayer("It has been a long time since I have had the chance to wield my magic in such a manner, and now, crafting this Staff of Eldara has granted me some glimmer of hope.", player);
            });

        DoAfterTime(pPlayer, 33 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->CastSpell(npc, 24171, false);
            });

        DoAfterTime(pPlayer, 35 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSayToPlayer("It is done.", player);
            if (CreatureInfo const* dummy_bunny = ObjectMgr::GetCreatureTemplate(60335))
                player->KilledMonster(dummy_bunny, ObjectGuid());
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            });
    }
    return false;
}

bool GossipHello_npc_iselus(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(40285) == QUEST_STATUS_INCOMPLETE)
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "I come asking for help in finding someone, have you met an orcish blademaster years ago?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(91722, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_iselus(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("Hmm, now that you've mentioned it, I recall such a figure, he was a muscular orc, though quite friendly. This was during the demonic invasion a few years back, he seeked battle within the Temple of Arrkoran the last I seen him, hopefully this helps your search.", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            if (CreatureInfo const* dummy_bunny = ObjectMgr::GetCreatureTemplate(60340))
                player->KilledMonster(dummy_bunny, ObjectGuid());
            });
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GOHello_go_way_stone(Player* pPlayer, GameObject* pGo)
{
    if (!pPlayer->HasItemCount(60372, 1, false))
    {
        pPlayer->GetSession()->SendNotification("Require The Staff of Eldara");
        pPlayer->CLOSE_GOSSIP_MENU();
    }
    else 
    {
        switch (pGo->GetEntry())
        {
        case 2010849:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Teleport to Shattered Strand.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            pPlayer->SEND_GOSSIP_MENU(100304, pGo->GetGUID());
            return true;
            break;

        case 2010850:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Teleport to Temple of Arkkoran.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            pPlayer->SEND_GOSSIP_MENU(100304, pGo->GetGUID());
            return true;
            break;
        }
    }
    return true;
}

bool GOSelect_go_way_stone(Player* pPlayer, GameObject* pGo, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1)
    {
        static const WorldLocation m_eldarath(1, 3814.92F, -5526.18F, 131.00f, 3.70F);
        pPlayer->TeleportTo(m_eldarath);
    }

    if (action == GOSSIP_ACTION_INFO_DEF + 2)
    {
        static const WorldLocation m_dorath(1, 4011.45F, -7131.67F, 24.81f, 3.70F);
        pPlayer->TeleportTo(m_dorath);
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return false;
}

bool GOHello_go_ashan_stone(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestStatus(40253) == QUEST_STATUS_INCOMPLETE)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Tizah Ashan Dal'asha.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        pPlayer->CLOSE_GOSSIP_MENU();
    }
    pPlayer->SEND_GOSSIP_MENU(100400, pGo->GetGUID());
    return true;
}

bool GOSelect_go_ashan_stone(Player* pPlayer, GameObject* pGo, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1)
    {
        GameObject* ashan_stone = pPlayer->FindNearestGameObject(2010851, 10.0F); // Ashan Stone
        if (pGo->GetEntry() == 2010851)
        {
            if (CreatureInfo const* dummy_bunny = ObjectMgr::GetCreatureTemplate(60336))
                pPlayer->KilledMonster(dummy_bunny, ObjectGuid());

            pPlayer->SummonGameObject(2010804, ashan_stone->GetPositionX(), ashan_stone->GetPositionY(), ashan_stone->GetPositionZ() - 4.00F, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 4, true);
        }
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return false;
}

bool GossipHello_npc_lord_crukzogg(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(40264) == QUEST_STATUS_INCOMPLETE) // The Maul'ogg Crisis I
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Lord Cruk'Zogg, I come on behalf of Haz'gorg, he is asking you to end your foolhardy aggresion.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pPlayer->GetQuestStatus(40272) == QUEST_STATUS_INCOMPLETE && pPlayer->HasItemCount(60345, 1, false)) // The Maul'ogg Crisis IX
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Lord Cruk'zogg, Haz'gorg has asked me to deliver this potion of strength to help enhance your mighty power!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);

    pPlayer->SEND_GOSSIP_MENU(92184, pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_lord_crukzogg(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
        DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("Hah!", player);
            npc->HandleEmote(EMOTE_ONESHOT_LAUGH);
            });
        DoAfterTime(pPlayer, 4 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("Haz'gorg isn't strong enough to lead the Maul'ogg, I will do as I please, I am strongest, you are lucky to live after such words little $R.", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            if (CreatureInfo const* dummy_bunny = ObjectMgr::GetCreatureTemplate(60337))
                player->KilledMonster(dummy_bunny, ObjectGuid());
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            });
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
        DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->SendPlaySpellVisual(SPELL_VISUAL_KIT_DRINK);
            player->DestroyItemCount(60345, 1, true);
            player->SaveInventoryAndGoldToDB();
            });
        DoAfterTime(pPlayer, 4 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("A potion of strength?! Haz'gorg has learned his place, hah!", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 12 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("I can feel it, yes, through my body! I... Hmm... I feel funny, and good. Tell Haz'gorg that I thank him for the potion, I have thought over what he said earlier, maybe Maul'ogg rest and think about strategy to expand, rather then smash enemy.", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 14 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            if (CreatureInfo const* dummy_bunny = ObjectMgr::GetCreatureTemplate(60339))
                player->KilledMonster(dummy_bunny, ObjectGuid());
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            });
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_seer_bolukk(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(40266) == QUEST_STATUS_INCOMPLETE) // The Maul'ogg Crisis III
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "I was sent on behalf of Haz'gorg the Great Seer to remedy the situation with Lord Cruk'Zogg.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(91854, pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_seer_bolukk(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
        DoAfterTime(pPlayer, 3 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("I have not spoken with Haz'gorg in some time, but my people are also going through much the same as he, the Gor'dosh have fallen on dark times, and are ruled by a tyrant. I hold no power any longer, but if I can help the Maul'ogg then perhaps I have done something for the greater good.", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
        DoAfterTime(pPlayer, 23 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("Before the Tyrant King came into power, I had dabbled with the idea of making an elixir, a potion, or a spell to sway his mind into seeking less hostile means, perhaps this could work with Lord Cruk'Zogg, to pacify him from being engulfed into madness, bring this information back to Haz'gorg, perhaps he can figure out something that I could not.", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 33 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            if (CreatureInfo const* dummy_bunny = ObjectMgr::GetCreatureTemplate(60338))
                player->KilledMonster(dummy_bunny, ObjectGuid());
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            });
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool QuestAccept_npc_duke_nargelas(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    bool first_item_added = false;
    bool second_item_added = false;

    if (pQuest->GetQuestId() == 40280) // Ways of Magic
    {
        if (pPlayer->AddItem(60189)) first_item_added = true;
        if (pPlayer->AddItem(60190)) second_item_added = true;

        if (!first_item_added || !second_item_added)
        {
            pPlayer->RemoveQuest(40280);
            pPlayer->SetQuestStatus(40280, QUEST_STATUS_NONE);
            pPlayer->GetSession()->SendNotification("Your bags are full!");
            return false;
        }
    }
    return false;
}

bool QuestAccept_npc_pierce_shackleton(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    bool first_item_added = false;
    bool second_item_added = false;

    if (pQuest->GetQuestId() == 40282) // Darlthos Legacy
    {
        if (pPlayer->AddItem(60189)) first_item_added = true;
        if (pPlayer->AddItem(60391)) second_item_added = true;

        if (!first_item_added || !second_item_added)
        {
            pPlayer->RemoveQuest(40282);
            pPlayer->SetQuestStatus(40282, QUEST_STATUS_NONE);
            pPlayer->GetSession()->SendNotification("Your bags are full!");
            return false;
        }
    }
    return false;
}

bool GossipHello_npc_katokar_bladewind(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(40289) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Tak'gar Deephate.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(92196, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_katokar_bladewind(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("You have honored the dead, may his soul be guided safely to his fellow masters.", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            if (CreatureInfo const* dummy_bunny = ObjectMgr::GetCreatureTemplate(60341))
                player->KilledMonster(dummy_bunny, ObjectGuid());
            });
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool QuestAccept_npc_yhargosh(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 40293) // Ritual of the Farseer
    {
        pQuestGiver->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

        DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            {
                npc->SetWalk(true);
                npc->GetMotionMaster()->MovePoint(0, 4993.68F, -6042.01F, 89.09F, 0, 3.0F, 2.05F);
            }
            });
        DoAfterTime(pPlayer, 2.3 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            {
                npc->GetMotionMaster()->MovePoint(0, 4985.88F, -6026.60F, 88.69F, 0, 3.0F, 0.61F);
            }
            });
        DoAfterTime(pPlayer, 7 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            {
                npc->GetMotionMaster()->MovePoint(0, 4993.11F, -6020.67F, 89.27F, 0, 3.0F, 0.14F);
            }
            });
        DoAfterTime(pPlayer, 11 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            {
                npc->GetMotionMaster()->MovePoint(0, 5009.55F, -6018.99F, 86.59F, 0, 3.0F, 0.11F);
            }
            });
        DoAfterTime(pPlayer, 19 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            {
                npc->MonsterYell("Spirits of Azshara, heed my call. Tell me, what is happening to this land.");
                npc->HandleEmote(EMOTE_ONESHOT_SHOUT);
            }
            });
        DoAfterTime(pPlayer, 23 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            {
                npc->SummonGameObject(2000745, npc->GetPositionX(), npc->GetPositionY(), npc->GetPositionZ(), 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 36, true);
            }
            });
        DoAfterTime(pPlayer, 27 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            {
                npc->MonsterSay("I see... A radiant city... full of people�");
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
            }
            });
        DoAfterTime(pPlayer, 35 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            {
                npc->MonsterSay("They are dying... A great wave swallows them all.");
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
            }
            });
        DoAfterTime(pPlayer, 43 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            {
                npc->MonsterSay("Magical energies, waning, blue crystals... A roar.");
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
            }
            });
        DoAfterTime(pPlayer, 51 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            {
                npc->MonsterSay("A shadow... Of a dragon?");
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
            }
            });
        DoAfterTime(pPlayer, 59 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            {
                npc->MonsterSay("This is all... I need a rest.");
                npc->HandleEmote(EMOTE_STATE_KNEEL);
            }
            });
        DoAfterTime(pPlayer, 67 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            {
                npc->GetMotionMaster()->MovePoint(0, 4993.11F, -6020.67F, 89.27F, 0, 3.0F, 3.28F);
            }
            });
        DoAfterTime(pPlayer, 71.7 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            {
                npc->GetMotionMaster()->MovePoint(0, 4985.88F, -6026.60F, 88.69F, 0, 3.0F, 3.75F);
            }
            });
        DoAfterTime(pPlayer, 75.7 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            {
                npc->GetMotionMaster()->MovePoint(0, 4994.63F, -6041.35F, 89.09F, 0, 3.0F, 4.20F);
            }
            });
        DoAfterTime(pPlayer, 80 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            {
                npc->GetMotionMaster()->MovePoint(0, 4992.68F, -6045.22F, 89.02F, 0, 3.0F, 2.46F);
                if (CreatureInfo const* dummy_bunny = ObjectMgr::GetCreatureTemplate(60342))
                    player->KilledMonster(dummy_bunny, ObjectGuid());
                npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            }
            });
    }
    return false;
}

bool QuestRewarded_npc_colonel_hardinus(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40303) // The Tower of Lapidis X
    {
        pQuestGiver->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_CHEER);
        DoAfterTime(pPlayer, 1.75 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSayToPlayer("It is done, the tyranny of Lapidis has come to an end! Admiral Caelan's soul is put to rest, cheers to $N for their heroic actions!", player);
            npc->HandleEmote(EMOTE_ONESHOT_SHOUT);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            });

        Creature* NPC_cheer1 = pPlayer->FindNearestCreature(92004, 100.0F);
        Creature* NPC_cheer2 = pPlayer->FindNearestCreature(91882, 100.0F);
        Creature* NPC_cheer3 = pPlayer->FindNearestCreature(91889, 100.0F);
        Creature* NPC_cheer4 = pPlayer->FindNearestCreature(92025, 100.0F);

        if (NPC_cheer1)
        {
            DoAfterTime(pPlayer, 2.3 * IN_MILLISECONDS, [player = pPlayer, npc = NPC_cheer1]() {
                npc->HandleEmote(EMOTE_ONESHOT_CHEER);
                });
            DoAfterTime(pPlayer, 2.5 * IN_MILLISECONDS, [player = pPlayer, npc = NPC_cheer2]() {
                npc->HandleEmote(EMOTE_ONESHOT_CHEER);
                });
            DoAfterTime(pPlayer, 2.7 * IN_MILLISECONDS, [player = pPlayer, npc = NPC_cheer3]() {
                npc->HandleEmote(EMOTE_ONESHOT_CHEER);
                });
            DoAfterTime(pPlayer, 2.9 * IN_MILLISECONDS, [player = pPlayer, npc = NPC_cheer4]() {
                npc->HandleEmote(EMOTE_ONESHOT_CHEER);
                });
            return true;
        }
    }

    return false;
}

bool QuestAccept_npc_korgan(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 40309) // The Depths of Karazhan VI
    {
        pQuestGiver->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        pQuestGiver->CastSpell(pQuestGiver, 23017, false); // Arcane Channeling

        DoAfterTime(pPlayer, 14 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->HandleEmote(EMOTE_ONESHOT_YES);
            npc->CastSpell(npc, 1449, false);
            });
        DoAfterTime(pPlayer, 15 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            {
                npc->MonsterSayToPlayer("It is done! The power of the arcane flowed through my veins, and I was able to mimic the magic that once lingered upon the key. Now, the protection of the Horde can dominate our thought, and guide our next step.", player);
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
                if (CreatureInfo const* dummy_bunny = ObjectMgr::GetCreatureTemplate(60344))
                    player->KilledMonster(dummy_bunny, ObjectGuid());
                npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                return true;
            }
            });
    }

    return false;
}

bool QuestAccept_npc_magus_ariden_dusktower(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 40316) // The Mystery of Karazhan VI
    {
        pQuestGiver->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        pQuestGiver->CastSpell(pQuestGiver, 23017, false); // Arcane Channeling

        DoAfterTime(pPlayer, 14 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->HandleEmote(EMOTE_ONESHOT_YES);
            npc->CastSpell(npc, 1449, false);
            });
        DoAfterTime(pPlayer, 15 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            {
                npc->MonsterSayToPlayer("There! It took a considerable amount of focus, but I was able to mimic the magic upon the key, now we can turn our attention to the evil present beneath Karazhan.", player);
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
                if (CreatureInfo const* dummy_bunny = ObjectMgr::GetCreatureTemplate(60345))
                    player->KilledMonster(dummy_bunny, ObjectGuid());
                npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                return true;
            }
            });
    }

    return false;
}

bool GossipHello_npc_inunquaq(Player* pPlayer, Creature* pCreature)
{
    switch (pCreature->GetEntry())
    {
    case 81046: // Inunquaq in Darkshore
        if (!pPlayer->GetQuestStatus(40321) == QUEST_STATUS_NONE)
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I am ready to travel Inunquaq, let us head out!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        }
        if (pCreature->IsQuestGiver())
            pPlayer->PrepareQuestMenu(pCreature->GetGUID());

        pPlayer->SEND_GOSSIP_MENU(81046, pCreature->GetGUID());
        break;

    case 60611: // Inunquaq in The Northeast Passage
        if (pPlayer->GetQuestRewardStatus(40321) || pPlayer->GetQuestStatus(40321) == QUEST_STATUS_COMPLETE)
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Inunquaq, I wish to return to Darkshore", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        }
        if (pCreature->IsQuestGiver())
            pPlayer->PrepareQuestMenu(pCreature->GetGUID());

        pPlayer->SEND_GOSSIP_MENU(60611, pCreature->GetGUID());
        break;
    }

    return true;
}

bool GossipSelect_npc_inunquaq(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        static const WorldLocation m_the_northeast_passage(1, 13654.652344F, -6585.791504F, 0.609558F, 0);
        pPlayer->TeleportTo(1, 13654.652344F, -6585.791504F, 0.609558F, 0);

        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(91195))
            pPlayer->KilledMonster(cInfo, ObjectGuid());
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        static const WorldLocation m_darkshore(1, 7831.624630F, -776.579773F, 1.205446F, 0);
        pPlayer->TeleportTo(m_darkshore);
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GOHello_go_moo_rune(Player* pPlayer, GameObject* pGo)
{
    if (pGo->GetEntry() == 2010799)
    {
         pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Teleport me to Bessy", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
         pPlayer->SEND_GOSSIP_MENU(2010799, pGo->GetGUID());
    }
    return true;
}

bool GOSelect_go_moo_rune(Player* pPlayer, GameObject* pGo, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1)
    {
        if (pGo->GetEntry() == 2010799)
        {
            static const WorldLocation m_bessy(0, -9128.736328F, -1050.399170F, 70.611626f, 0.030956f);
            pPlayer->TeleportTo(m_bessy);
        }
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return false;
}

bool GossipHello_npc_tholdan_mountainheart(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(40338) == QUEST_STATUS_INCOMPLETE) // The Azurestone
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "I wish to hear the tale of the Azurestone.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(60629, pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_tholdan_mountainheart(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
        DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("Long, long ago, we first discovered the Azurestone when digging the very halls of Ironforge itself, at the beginning, it was simply seen as a beautiful blue jewel and held a natural value. Quite quickly thereafter, the power of the Azurestone was discovered by a dwarf naturally gifted with the arcana.", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 21 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("Huidgrar Azurebrow was the one who studied the stone, and taught others of its power, the name 'Azurestone' came from his name, and those that studied beneath him created 'The Azurestone Order'. The Order has been pivotol in many key points in history, from the War of the Three Hammers, to when the orcs were getting close to Ironforge itself!", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 41 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            npc->MonsterSayToPlayer("When Huidgrar died from his rather long and vibrant life, the Azurestone Order fell with him, falling into obscurity with time. It is up to us, the naturally gifted of our kind to reignite this ancient group, and to show the world our prowess with fire, frost, and the arcane!", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 48 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            if (CreatureInfo const* dummy_bunny = ObjectMgr::GetCreatureTemplate(60347))
                player->KilledMonster(dummy_bunny, ObjectGuid());
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            });
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool QuestAccept_npc_sage_palerunner(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 40346) // The Way of Spiritwalking III
    {
        pQuestGiver->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        pQuestGiver->CastSpell(pQuestGiver, 13236, false);

        DoAfterTime(pPlayer, 3 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSayToPlayer("Spirits, it is I, Sage Palerunner, I call from the mortal plane to bring another into the fold. They have already braved the harsh wilds to gather the Spiritleaf required, they show true bravery in the face of adversity.", player);
            });
        DoAfterTime(pPlayer, 13 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSayToPlayer("I ask of you to allow your magic to flow through into their body, and be blessed by the Earthmother's gift. They will be the bearer of our culture, and our traditions, from now until the end of time.", player);
            });
        DoAfterTime(pPlayer, 23 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->HandleEmote(EMOTE_ONESHOT_YES);
            npc->CastSpell(npc, 5906, false);
            });
        DoAfterTime(pPlayer, 26 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
                npc->MonsterSayToPlayer("The ritual is complete, they will see you, to see if you are truly worthy.", player);
                if (CreatureInfo const* dummy_bunny = ObjectMgr::GetCreatureTemplate(60348))
                    player->KilledMonster(dummy_bunny, ObjectGuid());
                npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                npc->InterruptNonMeleeSpells(true);
                return true;
            });
    }

    return false;
}

bool GossipHello_npc_ancestor_of_wisdom(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(40348) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I have come to learn your lesson.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(60863, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_ancestor_of_wisdom(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->SEND_GOSSIP_MENU(30012, pCreature->GetGUID());
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60349))
            pPlayer->KilledMonster(cInfo, ObjectGuid());
    }
    return true;
}

bool QuestRewarded_npc_ancestor_of_wisdom(Player* pPlayer, Creature* pCreature, Quest const* pQuest)
{
    enum spells
    {
        QUEST_WAY_OF_SPIRITWALKING_5 = 40348,
        SPELL_SPIRITWALKING = 47262
    };

    Quest const* quest = sObjectMgr.GetQuestTemplate(QUEST_WAY_OF_SPIRITWALKING_5);

    if (pQuest == quest)
        pPlayer->LearnSpell(SPELL_SPIRITWALKING, false);

    return true;
}

bool GossipHello_npc_ancestor_of_virtue(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(40348) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I have come to learn your lesson.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(60864, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_ancestor_of_virtue(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->SEND_GOSSIP_MENU(30013, pCreature->GetGUID());
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60350))
            pPlayer->KilledMonster(cInfo, ObjectGuid());
    }
    return true;
}

bool GossipHello_npc_ancestor_of_humility(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(40348) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I have come to learn your lesson.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(60865, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_ancestor_of_humility(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->SEND_GOSSIP_MENU(30014, pCreature->GetGUID());
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60351))
            pPlayer->KilledMonster(cInfo, ObjectGuid());
    }
    return true;
}

bool QuestAccept_npc_bombay(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 40351) // The Way Of The Witch Doctor III
    {
        pQuestGiver->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        pQuestGiver->CastSpell(pQuestGiver, 13236, false);

        DoAfterTime(pPlayer, 10 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->HandleEmote(EMOTE_ONESHOT_YES);
            npc->CastSpell(npc, 5906, false);
            npc->MonsterSayToPlayer("It be done, I have put the power of the mojo into this serum.", player);
            player->CompleteQuest(40351);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            return true;
            });
    }

    return false;
}

bool GossipHello_npc_nribbi(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(40352) == QUEST_STATUS_INCOMPLETE && pPlayer->HasItemCount(60509, 1, false))
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "N'ribbi, I have brought this serum for you as tribute.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(60631, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_nribbi(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60353))
            pPlayer->KilledMonster(cInfo, ObjectGuid());

        if (pPlayer->HasItemCount(60509, 1, false))
        {
            pPlayer->DestroyItemCount(60509, 1, true);
            pPlayer->SaveInventoryAndGoldToDB();
        }
    }
    return true;
}

bool QuestRewarded_npc_nribbi(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40353) // The Way Of The Witch Doctor V
    {
        pQuestGiver->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
        pPlayer->LearnSpell(45504, false);

        DoAfterTime(pPlayer, 7 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            });

        DoAfterTime(pPlayer, 30 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->RemoveAurasAtReset();
            });

        Creature* NPC_cheer1 = pPlayer->FindNearestCreature(60866, 40.0F);
        Creature* NPC_cheer2 = pPlayer->FindNearestCreature(60867, 40.0F);
        Creature* NPC_cheer3 = pPlayer->FindNearestCreature(60868, 40.0F);

        if (NPC_cheer1)
        {
            DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = NPC_cheer1]() {
                npc->MonsterSayToPlayer("Ribbit!", player);
                });
            DoAfterTime(pPlayer, 3 * IN_MILLISECONDS, [player = pPlayer, npc = NPC_cheer2]() {
                npc->MonsterSayToPlayer("Riiiibit", player);
                });
            DoAfterTime(pPlayer, 4 * IN_MILLISECONDS, [player = pPlayer, npc = NPC_cheer3]() {
                npc->MonsterSayToPlayer("Riibit", player);
                });
            DoAfterTime(pPlayer, 5 * IN_MILLISECONDS, [player = pPlayer, npc = NPC_cheer1]() {
                npc->MonsterSayToPlayer("Ribit", player);                });
            DoAfterTime(pPlayer, 7 * IN_MILLISECONDS, [player = pPlayer, npc = NPC_cheer2]() {
                npc->MonsterSayToPlayer("We are saved!", player);                });
            return true;
        }
    }

    return false;
}

bool GossipHello_npc_ironpatch(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(40355) == QUEST_STATUS_INCOMPLETE) // Sark's Grudge
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Let me show what how in shape I am.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(2547, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_ironpatch(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->MonsterSayToPlayer("Arrrgh!", pPlayer);
        pCreature->SetFactionTemporary(14, TEMPFACTION_RESTORE_COMBAT_STOP);
        pCreature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        pCreature->HandleEmote(EMOTE_ONESHOT_ATTACK1H);
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_vildo_onetusk(Player* pPlayer, Creature* pCreature)
{
    if (!pPlayer->GetQuestStatus(40358) == QUEST_STATUS_NONE)  // Golden Elves of Feralas
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Let's set sail for Feralas!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    }

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(60459, pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_vildo_onetusk(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "<Roll your eyes in disbelief and leave>.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        pPlayer->SEND_GOSSIP_MENU(30015, pCreature->GetGUID());
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        pPlayer->CLOSE_GOSSIP_MENU();
    }

    return true;
}

bool GossipHello_npc_fazgel_mechaflame(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(40360) == QUEST_STATUS_INCOMPLETE) // Highly Unexpected Event
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Let's do it!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(60643, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_fazgel_mechaflame(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->MonsterSayToPlayer("Yeah, I don't think so bub!", pPlayer);
        pCreature->SetFactionTemporary(14, TEMPFACTION_RESTORE_COMBAT_STOP);
        pCreature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        pCreature->HandleEmote(EMOTE_ONESHOT_ATTACK1H);
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_sovatir(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(40362) == QUEST_STATUS_INCOMPLETE)  // A Historian Finds You
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Arcanist Sovatir, how is this possible?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    }

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(60644, pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_sovatir(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->SEND_GOSSIP_MENU(30016, pCreature->GetGUID());
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60355))
            pPlayer->KilledMonster(cInfo, ObjectGuid());
    }

    return true;
}

enum BloodsailQuestItems
{
    ITEM_Highborne_Golden_Statue = 60510,
    ITEM_Arcanist_Sovatirs_Torn_Notes = 60512,
};

bool QuestAcceptGO_lyvdia_dawnbird(Player* player, GameObject* pGo, const Quest* pQuest)
{
    if (!player)
        return false;

    bool first_item_added = false;
    bool second_item_added = false;

    if (pQuest->GetQuestId() == 40361) // Taking the Booty Home
    {
        if (!player->HasItemCount(ITEM_Highborne_Golden_Statue, 1))
        {
            if (player->AddItem(ITEM_Highborne_Golden_Statue))
                first_item_added = true;
        }
        else
            first_item_added = true;

        if (!player->HasItemCount(ITEM_Arcanist_Sovatirs_Torn_Notes, 1))
        {
            if (player->AddItem(ITEM_Arcanist_Sovatirs_Torn_Notes))
                second_item_added = true;
        }
        else
            second_item_added = true;

        if (!first_item_added || !second_item_added)
        {
            player->RemoveQuest(40361);
            player->SetQuestStatus(40361, QUEST_STATUS_NONE);
            player->GetSession()->SendNotification("Your bags are full!");
            return false;
        }
    }
    return false;
}

bool GOHello_mournful_apparition_atack(Player* pPlayer, GameObject* pGo)
{
    if (pGo->GetEntry() == 2010878)
    {
        if (pPlayer->GetQuestStatus(40370) == QUEST_STATUS_INCOMPLETE && !pPlayer->HasItemCount(60517, 1, 1))
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Take Tattered Necklace.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            pPlayer->SEND_GOSSIP_MENU(30017, pGo->GetGUID());
        }
    }
    return true;
}

bool GOSelect_mournful_apparition_atack(Player* pPlayer, GameObject* pGo, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1)
    {
        if (!pPlayer->FindNearestCreature(60658, 40.0F))
        {
            pGo->SummonCreature(60658, pGo->GetPositionX(), pGo->GetPositionY(), pGo->GetPositionZ() + 2, pPlayer->GetOrientation() + 3.14, TEMPSUMMON_TIMED_DESPAWN, 2 * MINUTE * IN_MILLISECONDS);
        }
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return false;
}

bool QuestRewarded_npc_captain_grayson(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40396 && !pQuestGiver->FindNearestCreature(60709, 30.0F)) // Captain Grayson's Revenge
    {
        Creature* npc_cookie = pQuestGiver->SummonCreature(60709, -11410.70F, 1966.56F, 10.60F, 6.12F, TEMPSUMMON_TIMED_DESPAWN, 0.125 * MINUTE * IN_MILLISECONDS);

        DoAfterTime(pPlayer, 5 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            Creature* npc_cookie = npc->FindNearestCreature(60709, 30.0F);
            npc_cookie->PMonsterEmote("Cookie looks at Grayson with sadness in his eyes and waves him off.");
            npc_cookie->MonsterSay("Mrrgl?");
            });
        DoAfterTime(pPlayer, 9 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            Creature* npc_captain_grayson = npc->FindNearestCreature(392, 30.0F);
            npc_captain_grayson->MonsterSay("Cookie, I am sorry! I swear I will make it right. Farewell, my friend.");
            });
    }

    return false;
}

bool GossipHello_npc_captain_grayson(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestRewardStatus(40396))
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "What was Cookie to you, Grayson?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    }

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(392, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_captain_grayson(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->SEND_GOSSIP_MENU(30019, pCreature->GetGUID());
    }

    return true;
}

bool QuestRewarded_npc_niremius(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40399) // By Any Means Necessary III
    {
        DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSay("I must apologize for lying to you, and using you for power, you must understand, it was all for the greater good of the region.");
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
    }

    return false;
}

bool QuestAccept_npc_niremius(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40401) // By Any Means Necessary V
    {
        pQuestGiver->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        pQuestGiver->CastSpell(pQuestGiver, 17447, false);

        DoAfterTime(pPlayer, 10 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSayToPlayer("You have given me items of great power, and I will use them to defend this forest until my last breath. Deception can come from all forms, even friends, be wary within the future, and take this as a lesson.", player);
            });

        DoAfterTime(pPlayer, 25 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->HandleEmote(EMOTE_ONESHOT_BOW);
            npc->MonsterSayToPlayer("Carry my Glaive with conviction, and good luck.", player);
            player->CompleteQuest(40401);
            });

        pQuestGiver->m_Events.AddLambdaEventAtOffset([pQuestGiver]()
            {
                pQuestGiver->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            }, 26000);
        return true;
    }

    return false;
}

bool GossipHello_npc_jabbey(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pCreature->IsVendor())
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ACTION_TRADE, "I want to browse your goods.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pPlayer->GetQuestStatus(40411) == QUEST_STATUS_INCOMPLETE)
    {
        if (pCreature->GetEntry() == 8139 && !pPlayer->HasItemCount(60597, 1, false))
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "I am here to pick up a package for 'Groy'.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        }
    }

    if (pPlayer->GetQuestStatus(40466) == QUEST_STATUS_INCOMPLETE)
    {
        if (pCreature->GetEntry() == 8139 && !pPlayer->HasItemCount(60670, 1, false))
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "I was sent by Radgan Deepblaze to obtain something...", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
        }
    }

    pPlayer->SEND_GOSSIP_MENU(8139, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_jabbey(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
        pPlayer->GetSession()->SendListInventory(pCreature->GetGUID());

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        pPlayer->AddItem(60597);
        if (pPlayer->HasItemCount(60597, 1, false))
        {
            pCreature->MonsterSayToPlayer("Hey now, hush, I don't need everyone knowing my business. Here it is, if you ever need more, you know where to find me bub!", pPlayer);
            pCreature->HandleEmote(EMOTE_ONESHOT_TALK);
            pPlayer->CLOSE_GOSSIP_MENU();
            return true;
        }
        else
            pPlayer->GetSession()->SendNotification("Your bags are full!");
        return false;
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 3)
    {
        pPlayer->AddItem(60670);
        if (pPlayer->HasItemCount(60670, 1, false))
        {
            pCreature->MonsterSayToPlayer("Oh, that, I was wondering if he would ever pick it up, I put a lot of time in obtaining this information. Now, go on before someone notices us.", pPlayer);
            pCreature->HandleEmote(EMOTE_ONESHOT_TALK);
            pPlayer->CLOSE_GOSSIP_MENU();
            return true;
        }
        else
            pPlayer->GetSession()->SendNotification("Your bags are full!");
        return false;
    }

    return true;
}

bool GossipHello_npc_captain_wallace_cross(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(40415) == QUEST_STATUS_INCOMPLETE)
    {
        if (pCreature->GetEntry() == 60729 && !pPlayer->HasItemCount(60602, 1, false))
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "'I have been sent by Colonel Breen to collect your report.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        }
    }

    pPlayer->SEND_GOSSIP_MENU(60729, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_captain_wallace_cross(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->AddItem(60602);
        if (pPlayer->HasItemCount(60602, 1, false))
        {
            pCreature->MonsterSayToPlayer("Make sure that the Colonel gets it.", pPlayer);
            pCreature->HandleEmote(EMOTE_ONESHOT_TALK);
            pPlayer->CLOSE_GOSSIP_MENU();
            return true;
        }
        else
            pPlayer->GetSession()->SendNotification("Your bags are full!");
        return false;
    }

    return true;
}

bool GossipHello_npc_captain_harker(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(40415) == QUEST_STATUS_INCOMPLETE)
    {
        if (pCreature->GetEntry() == 60730 && !pPlayer->HasItemCount(60603, 1, false))
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "'I have been sent by Colonel Breen to collect your report.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        }
    }

    pPlayer->SEND_GOSSIP_MENU(60730, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_captain_harker(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->AddItem(60603);
        if (pPlayer->HasItemCount(60603, 1, false))
        {
            pCreature->MonsterSayToPlayer("The last one didn't make it back to Theramore, be quick.", pPlayer);
            pCreature->HandleEmote(EMOTE_ONESHOT_TALK);
            pPlayer->CLOSE_GOSSIP_MENU();
            return true;
        }
        else
            pPlayer->GetSession()->SendNotification("Your bags are full!");
        return false;
    }

    return true;
}

bool QuestRewarded_npc_koli_steamheart(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40426) // Recovering Vault Shackles
    {
        pQuestGiver->MonsterSayToPlayer("Thanks again for the help! I will make sure to study these so the same thing cannot happen again!", pPlayer);
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_TALK);
    }

    return false;
}

bool GossipHello_npc_sergeant_burnside(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(40433) == QUEST_STATUS_INCOMPLETE)
    {
        if (pCreature->GetEntry() == 60792 && !pPlayer->HasItemCount(60635, 1, false))
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Commander Baelos is looking for your report.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        }
    }

    pPlayer->SEND_GOSSIP_MENU(60792, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_sergeant_burnside(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->AddItem(60635);
        if (pPlayer->HasItemCount(60635, 1, false))
        {
            pCreature->MonsterSayToPlayer("Oh, here it is, I haven't had the time to deliver it yet, thanks.", pPlayer);
            pCreature->HandleEmote(EMOTE_ONESHOT_TALK);
            pPlayer->CLOSE_GOSSIP_MENU();
            return true;
        }
        else
            pPlayer->GetSession()->SendNotification("Your bags are full!");
        return false;
    }

    return true;
}

bool GossipHello_npc_engineer_wigglestip(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(40438) == QUEST_STATUS_INCOMPLETE)
    {
        if (pCreature->GetEntry() == 60794 && !pPlayer->HasItemCount(60640, 1, false))
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Adjutant Scheer sent me to get your report.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        }
    }

    pPlayer->SEND_GOSSIP_MENU(60794, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_engineer_wigglestip(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->AddItem(60640);
        if (pPlayer->HasItemCount(60640, 1, false))
        {
            pCreature->MonsterSayToPlayer("Oh, well here it is! My experiments have been running late all day, take this to him.", pPlayer);
            pCreature->HandleEmote(EMOTE_ONESHOT_TALK);
            pPlayer->CLOSE_GOSSIP_MENU();
            return true;
        }
        else
            pPlayer->GetSession()->SendNotification("Your bags are full!");
        return false;
    }

    return true;
}

bool QuestRewarded_npc_watcher_mahar_ba(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40440) // Fel Energy Irregularities III
    {
        pQuestGiver->MonsterSayToPlayer("It is time to pray that the worst has not come.", pPlayer);
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_TALK);
    }

    if (pQuest->GetQuestId() == 40441) // Fel Energy Irregularities IV
    {
        DoAfterTime(pPlayer, 10 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSayToPlayer("So, it is as we suspected, but I need to be sure, and completely sure before we take action.", player);
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });

        Creature* NPC_riftwatcher_say = pQuestGiver->FindNearestCreature(6002, 40.0F);

        if (NPC_riftwatcher_say)
        {
            DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = NPC_riftwatcher_say]() {
                npc->MonsterSayToPlayer("It would appear that these items are potent with fel energy, they cannot have been lingering for very long.", player);
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            return true;
        }
    }

    if (pQuest->GetQuestId() == 40444) // Fel Energy Irregularities VII
    {
        pQuestGiver->MonsterSayToPlayer("It is time to pray that the worst has not come.", pPlayer);
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_BOW);
    }

    return false;
}

bool QuestRewarded_npc_chaser(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40450) // Repowering Chaser
    {
        pQuestGiver->MonsterSayToPlayer("Initiating thank you protocols.... THANK YOU", pPlayer);
    }

    return false;
}

bool GossipHello_npc_orvak_sternrock(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(40460) == QUEST_STATUS_INCOMPLETE && !pPlayer->FindNearestCreature(10, 30.0F))
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Tell me your story Orvak.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    }

    pPlayer->SEND_GOSSIP_MENU(60833, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_orvak_sternrock(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
        if (!pPlayer->FindNearestCreature(10, 30.0F))
        {
            Creature* controller = pCreature->SummonCreature(10, pCreature->GetPositionX(), pCreature->GetPositionY(), pCreature->GetPositionZ(), pCreature->GetOrientation(), TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 50 * IN_MILLISECONDS);

            pCreature->m_Events.AddLambdaEventAtOffset([pCreature]()
                {
                    pCreature->MonsterSay("I was once the High Foreman of the Shadowforge Miners Union, me and my men helped build many of the halls of the city itself, and worked tirelessly to appease the Senators of their plots, and whims. We kept our loyalty, and we worked hard, given benefits for our work.");
                    pCreature->HandleEmote(EMOTE_ONESHOT_TALK);
                }, 1000);

            pCreature->m_Events.AddLambdaEventAtOffset([pCreature]()
                {
                    pCreature->MonsterSay("It was when the plans of the Senate failed, and the Master became upset did their wrath upon us only grow, the project at Hateforge Quarry put many to their limit, and pulled us away from our home to work in dangerous conditions without any regards for what we did in the past.");
                    pCreature->HandleEmote(EMOTE_ONESHOT_TALK);
                }, 15000);

            pCreature->m_Events.AddLambdaEventAtOffset([pCreature]()
                {
                    pCreature->MonsterSay("We were given impossible tasks, which we could not complete and I was placed to blame. Many of my fellow miners betrayed me, and a new High Foreman was put into my place, those that remained loyal were enslaved, and the rest of us, were exiled. We ended up travelling in exile for days, many of those that were once part of the Caraven died in those early days.");
                    pCreature->HandleEmote(EMOTE_ONESHOT_TALK);
                }, 30000);

            pCreature->m_Events.AddLambdaEventAtOffset([pCreature]()
                {
                    pCreature->MonsterSay("I was betrayed, backstabbed, and wronged, my heart burns hotter than the Blackrock Mountain, and I demand revenge. Do you see why I ask for help? No doubt you have your reasons to stop the Dark Iron, let me guide your hand, and we shall both be satisfied.");
                    pCreature->HandleEmote(EMOTE_ONESHOT_TALK);
                }, 50000);

            DoAfterTime(pPlayer, 58 * IN_MILLISECONDS, [player = pPlayer]() {
                if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60375))
                    player->KilledMonster(cInfo, ObjectGuid());
                });
        }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool QuestRewarded_npc_orvak_sternrock(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40463) // The True High Foreman
    {
        pQuestGiver->MonsterSay("Been an honor working with you.");
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_SALUTE);
    }

    return false;
}

bool QuestRewarded_npc_maltimor_gartside(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40474) // The Harvest Golem Mystery V
    {
        pQuestGiver->MonsterTextEmote("Maltimor Gartside looks into the blueprints.", pPlayer);
        pQuestGiver->MonsterSay("Weird... but clever.");
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_TALK);

        DoAfterTime(pPlayer, 5 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSay("Really? Goblins are insane.");
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 10 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSay("So it is possible...");
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 15 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->HandleEmote(EMOTE_ONESHOT_CHEER);
            });
    }

    return false;
}

bool QuestAccept_npc_maltimor_gartside(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40476) // The Harvest Golem Mystery VII
    {
        pQuestGiver->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        pQuestGiver->HandleEmote(EMOTE_STATE_WORK);

        pQuestGiver->m_Events.AddLambdaEventAtOffset([pQuestGiver]()
            {
                pQuestGiver->HandleEmote(EMOTE_STATE_NONE);
                pQuestGiver->SummonCreature(60871, -10279.18F, 1920.43F, 34.23F, 3.99F, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 30 * IN_MILLISECONDS);
            }, 5000);

        pQuestGiver->m_Events.AddLambdaEventAtOffset([pQuestGiver]()
            {
                pQuestGiver->MonsterSay("Get ready! I will now activate the golem! Draw its attention, and I will cast the Rewiring Spell. Don't damage it too much, it needs to remain intact!");
                pQuestGiver->HandleEmote(EMOTE_STATE_NONE);
                pQuestGiver->HandleEmote(EMOTE_ONESHOT_TALK);
            }, 9000);

        pQuestGiver->m_Events.AddLambdaEventAtOffset([pQuestGiver]()
            {
                pQuestGiver->CastSpell(pQuestGiver, 13540, false); // Green Channeling
                Creature* harvest_reaper = pQuestGiver->FindNearestCreature(60871, 30.0F);
                harvest_reaper->SetFactionTemporary(14, TEMPFACTION_RESTORE_COMBAT_STOP);
                harvest_reaper->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                harvest_reaper->HandleEmote(EMOTE_ONESHOT_ATTACK1H);
            }, 10000);

        pQuestGiver->m_Events.AddLambdaEventAtOffset([pQuestGiver]()
            {
                pQuestGiver->CastSpell(pQuestGiver, 24171, false);
                if (Creature* harvest_reaper = pQuestGiver->FindNearestCreature(60871, 30.0F))
                {
                    harvest_reaper->SetFactionTemporary(35, TEMPFACTION_RESTORE_COMBAT_STOP);
                    harvest_reaper->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                }

            }, 30000);

        pQuestGiver->m_Events.AddLambdaEventAtOffset([pQuestGiver]()
            {
                if (Creature* harvest_reaper = pQuestGiver->FindNearestCreature(60871, 30.0F))
                {
                    pQuestGiver->MonsterSay("It worked!");
                    pQuestGiver->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                pQuestGiver->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

            }, 31000);

        DoAfterTime(pPlayer, 31 * IN_MILLISECONDS, [player = pPlayer]() {
            if (Creature* harvest_reaper = player->FindNearestCreature(60871, 30.0F))
            {
                if (player->IsAlive())
                {
                    if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60375))
                        player->KilledMonster(cInfo, ObjectGuid());
                }
                else
                {
                    player->SetQuestStatus(40476, QUEST_STATUS_FAILED);
                }
            }
            });

    }
    return false;
}

bool GossipHello_npc_maltimor_gartside(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(40529) == QUEST_STATUS_INCOMPLETE && pPlayer->HasItemCount(60767, 1, 1))
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "<Hand him the letter.>", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    }

    pPlayer->SEND_GOSSIP_MENU(60858, pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_maltimor_gartside(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->MonsterSay("I... I should explain. Yes, I was lying to you all this time. I made the golems, with the help of Farad and some goblin machinery. We had lived here, in Moonbrook, many years ago. We just wanted to escape this shithole. So we made the Harvest Golems, to help the farmers and, also, to get their money. But we knew that it was too expensive for an average farmer to buy one. So we were selling them for a low, low price. We were losing a lot of money on it.");
        pCreature->HandleEmote(EMOTE_ONESHOT_TALK);

        pCreature->m_Events.AddLambdaEventAtOffset([pCreature]()
            {
                pCreature->MonsterSay("You probably already know where it is going. I'm not proud of this part. There was a catch. When everyone's fields were protected by golems, we would activate their true nature. They would become murderous machines. We would blame it on some vile warlock, or anyone else, it didn't matter. Only important thing was that we would be the only ones who could fix them, for a very high price.");
                pCreature->HandleEmote(EMOTE_ONESHOT_TALK);
            }, 15000);

        pCreature->m_Events.AddLambdaEventAtOffset([pCreature]()
            {
                pCreature->MonsterSay("At least, that was the idea. In my greed, I activated the murderous killswitch when Farad was working with some golems in a workshop. I wanted him to die, so all the money would go to me.I learned later that he survived, and only got blinded. He hated me for it. But regardless, I saw the destruction I caused. I wanted to make the golems docile again� but our spell didn't work.");
                pCreature->HandleEmote(EMOTE_ONESHOT_TALK);
            }, 30000);

        pCreature->m_Events.AddLambdaEventAtOffset([pCreature]()
            {
                pCreature->MonsterSay("Some mistake we made during construction, or just lack of skill, I will never know. I couldn't fix them. Westfall became a wasteland. And then, came the Defias, with Farad on their side. And you know the rest of this story. You may judge me, think of me as a monster. The truth is, that you are probably right. I was a monster. But I did everything I could to fix it. And by the Light, I can only hope that it is enough.");
                pCreature->HandleEmote(EMOTE_ONESHOT_TALK);
            }, 45000);
    }

    DoAfterTime(pPlayer, 45 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
        player->DestroyItemCount(60767, 1, true);
        player->SaveInventoryAndGoldToDB();

        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60381))
            player->KilledMonster(cInfo, ObjectGuid());
        });

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}


bool QuestRewarded_npc_franklin_hamar(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40482) // The Harvest Golem Mystery XIII
    {
        pQuestGiver->MonsterTextEmote("Franklin Hamar looks into the note.", pPlayer);
        pQuestGiver->MonsterSay("Awful handwriting, it's like the person writing this was blind. Alright, here it goes. Listen carefully.");
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_TALK);

        DoAfterTime(pPlayer, 8 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSay("Tell G. that the people in Darkshire are getting delicious. Sorry, suspicious.");
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 16 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSay("The Night Watch is eyeing my shack every day. I need to move out soon if the production of runes is to continue.");
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 24 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSay("Send someone. Stormwind shall fall, yadda yadda, F.W. The end.");
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 32 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSay("Interesting note, friend. You and Hewen might be in trouble. But that's none of my business.");
            npc->HandleEmote(EMOTE_ONESHOT_TALK);
            });
    }
    
    return false;
}

bool GossipHello_npc_farad_wrightsow(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(40485) == QUEST_STATUS_INCOMPLETE && !pPlayer->FindNearestCreature(10, 30.0F))
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Did you produce Animation Runes for the Defias?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    }

    pPlayer->SEND_GOSSIP_MENU(60854, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_farad_wrightsow(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
        {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "<Stare silently.>", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        pPlayer->SEND_GOSSIP_MENU(30024, pCreature->GetGUID());
        }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
        {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "<Attack.>", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
        pPlayer->SEND_GOSSIP_MENU(30025, pCreature->GetGUID());
        }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 3)
    {
        pPlayer->CLOSE_GOSSIP_MENU();

        Creature* gazzirik = pPlayer->FindNearestCreature(60859, 75.0F);
        if (gazzirik)
        {
            gazzirik->SetFactionTemporary(14, TEMPFACTION_RESTORE_COMBAT_STOP);
            gazzirik->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            gazzirik->HandleEmote(EMOTE_ONESHOT_ATTACK1H);
        }

        pCreature->SetFactionTemporary(14, TEMPFACTION_RESTORE_COMBAT_STOP);
        pCreature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        pCreature->HandleEmote(EMOTE_ONESHOT_ATTACK1H);
    }

    return true;
}

bool QuestRewarded_npc_darkseer_geshtol(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40492) // Fueling the Blood Fury
    {
        pQuestGiver->MonsterSay("The power within these hearts shall aid me, but it is weak, and faded, if I am to truly master my magic, than I need something much stronger.");
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_TALK);
    }

    if (pQuest->GetQuestId() == 40493) // Fueling the Blood Fury
    {
        pQuestGiver->CastSpell(pQuestGiver, 24318, false); // Enrage
        pQuestGiver->MonsterSay("The power flows through my veins! I feel stronger, and mighty! With this, we shall dominate our enemies!");
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_TALK);

        DoAfterTime(pPlayer, 5 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
        npc->HandleEmote(EMOTE_ONESHOT_LAUGH);
            });
    }

    return false;
}

bool GossipHello_npc_young_blackrock_worg(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(40497) == QUEST_STATUS_INCOMPLETE)
    {
        if (pCreature->GetEntry() == 60873 && pPlayer->HasItemCount(60720, 1, false))
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Capture the wolf into Worg Cage.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        }
    }

    pPlayer->SEND_GOSSIP_MENU(60873, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_young_blackrock_worg(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->AddItem(60731);
        if (pPlayer->HasItemCount(60720, 1, false))
        {
            pPlayer->DestroyItemCount(60720, 1, true);
            pPlayer->SaveInventoryAndGoldToDB();
            pCreature->DespawnOrUnsummon();
            pPlayer->CLOSE_GOSSIP_MENU();
            return true;
        }
        else
            pPlayer->GetSession()->SendNotification("Your bags are full!");
        return false;
    }

    return true;
}

bool QuestRewarded_npc_karfang(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40508) // Take No Chances
    {
        pQuestGiver->MonsterSay("In the name of Raz'gol, a warrior of the Horde, a soldier until his last breath. Go with honor friend, you will not be forgotten.");
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_TALK);

        DoAfterTime(pPlayer, 2 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->HandleEmote(EMOTE_ONESHOT_SALUTE);

            Creature* molk = npc->FindNearestCreature(60769, 15.0F);
            molk->HandleEmote(EMOTE_ONESHOT_SALUTE);
            Creature* councilor_vargek = npc->FindNearestCreature(60772, 15.0F);
            councilor_vargek->HandleEmote(EMOTE_ONESHOT_SALUTE);
            });
    }


    if (pQuest->GetQuestId() == 40509) // The Final Crack
    {
        pQuestGiver->MonsterSay("Without you, we surely would have had our plans discovered, for that I am grateful of your service.");
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_TALK);

        DoAfterTime(pPlayer, 6 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSay("Your name shall echo with honor for the actions you have taken, walk softly, noble soldier of the Horde.");
            });

        DoAfterTime(pPlayer, 8 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->HandleEmote(EMOTE_ONESHOT_BOW);
            });
    }

    return false;
}

bool QuestRewarded_npc_lashog(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40513) // Polymorph Enslavement!
    {
        pQuestGiver->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
        pQuestGiver->SetDisplayId(1653); // Orc
    }

    pQuestGiver->m_Events.AddLambdaEventAtOffset([pQuestGiver]()
        {
            pQuestGiver->MonsterSay("I AM FREE! AT LONG LAST FREE FROM THAT CURSED FORM!");
            pQuestGiver->HandleEmote(EMOTE_ONESHOT_ROAR);
        }, 1000);

    pQuestGiver->m_Events.AddLambdaEventAtOffset([pQuestGiver]()
        {
            pQuestGiver->MonsterSay("Take that ring, I cannot stand to look at it, thank you for everything, I will leave when I have collected myself.");
            pQuestGiver->HandleEmote(EMOTE_ONESHOT_TALK);
        }, 8000);

    pQuestGiver->m_Events.AddLambdaEventAtOffset([pQuestGiver]()
        {
            pQuestGiver->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            pQuestGiver->SetDisplayId(856); // Sheep
            pQuestGiver->CastSpell(pQuestGiver, 24085, false); // Transform Visual
            return true;
        }, 60000);

    return false;
}

bool QuestRewarded_npc_seer_mazek(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40521) // Desert Voodoo
    {
        pQuestGiver->MonsterSay("O, de powerful Loa! Smite ya enemies!");
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_CHEER);

        pQuestGiver->m_Events.AddLambdaEventAtOffset([pQuestGiver]()
            {
                pQuestGiver->MonsterSay("Da ogres of Dunemaul. Curse them!");
                pQuestGiver->HandleEmote(EMOTE_ONESHOT_CHEER);
            }, 5000);

        pQuestGiver->m_Events.AddLambdaEventAtOffset([pQuestGiver]()
            {
                pQuestGiver->MonsterSay("Let dem feel your fury...");
                pQuestGiver->HandleEmote(EMOTE_ONESHOT_CHEER);
            }, 10000);
    }

    return false;
}

bool GossipHello_npc_voljin(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(40524) == QUEST_STATUS_INCOMPLETE)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "I have been sent on behalf of the Sandfury, they have been driven from their home.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    }

    pPlayer->SEND_GOSSIP_MENU(10540, pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_voljin(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "The Sandfury in Sandmoon Village remind me of the Darkspear.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        pPlayer->SEND_GOSSIP_MENU(30028, pCreature->GetGUID());
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "I don't know them well, but they welcomed me in their village like a friend. They had to leave Zul'Farrak because of persecution and despotism of their leader. They ran away, because they saw what is happening there. They saw the darkness, the corruption.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
        pPlayer->SEND_GOSSIP_MENU(30029, pCreature->GetGUID());
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 3)
    {
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60377))
            pPlayer->KilledMonster(cInfo, ObjectGuid());
        pPlayer->SEND_GOSSIP_MENU(30030, pCreature->GetGUID());
    }

    return true;
}

bool QuestRewarded_npc_ekka(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer) return false;

    if (pQuest->GetQuestId() == 40528) // Meat for Viceclaw!
    {
        pQuestGiver->MonsterSay("Viceclaw my dear. Da feast today!");
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_TALK);

        pQuestGiver->m_Events.AddLambdaEventAtOffset([pQuestGiver]()
            {
                if (Creature* viceclaw = pQuestGiver->FindNearestCreature(60755, 15.0F))
                    viceclaw->MonsterTextEmote("Viceclaw: <cackles>");
            }, 3000);

        pQuestGiver->m_Events.AddLambdaEventAtOffset([pQuestGiver]()
            {
                pQuestGiver->MonsterSay("Good boy.");
                pQuestGiver->HandleEmote(EMOTE_ONESHOT_TALK);
            }, 5000);
    }

    return false;
}

bool GossipHello_npc_ancient_spirit_wolf(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(40532) == QUEST_STATUS_INCOMPLETE) // The Way Of The Spiritwolf III
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "<Pour the powder around the site of the Ancient Wolf Spirit.>", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    }

    if (pPlayer->GetQuestStatus(40533) == QUEST_STATUS_INCOMPLETE) // The Way Of The Spiritwolf IV
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "I am ready to listen to your tale.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
    }

    if (pPlayer->GetQuestStatus(40534) == QUEST_STATUS_INCOMPLETE) // The Way Of The Spiritwolf V
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, " I am ready to challenge you, let us fight.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
    }

    pPlayer->SEND_GOSSIP_MENU(66004, pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_ancient_spirit_wolf(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60378))
            pPlayer->KilledMonster(cInfo, ObjectGuid());
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        pCreature->m_Events.AddLambdaEventAtOffset([pCreature]()
            {
                pCreature->MonsterSay("When I first prowled these forests I had a pack that followed me, they were my kin, and were loyal. I grew restless of their imperfections, and figured I could do better alone. I hunted, and fought with great glory, but I abandoned those close.");
            }, 3000);

        pCreature->m_Events.AddLambdaEventAtOffset([pCreature]()
            {
                pCreature->MonsterSay("I was ambushed by a group of bear, and retreated to this very waterfall, where I was cornered, and alone, slain, only to now walk this world in a much different form. Had I kept my loyalties, and stayed with my pack, perhaps I would not have met an untimely fate. Do you understand what it is I teach you young one? You can be as powerful as the mountains, but if you are alone, you will eventually fall.");
            }, 18000);

        DoAfterTime(pPlayer, 28 * IN_MILLISECONDS, [player = pPlayer, npc = pCreature]() {
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60379))
                player->KilledMonster(cInfo, ObjectGuid());
            });
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 3)
    {
        pCreature->SetFactionTemporary(14, TEMPFACTION_RESTORE_COMBAT_STOP);
        pCreature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        pCreature->HandleEmote(EMOTE_ONESHOT_ATTACK1H);
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

struct npc_ancient_spirit_wolfAI : public ScriptedAI
{
    npc_ancient_spirit_wolfAI(Creature* c) : ScriptedAI(c) { Reset(); }

    void Reset() { }
    void UpdateAI(const uint32 diff)
    {
        if (m_creature->GetHealthPercent() < 10)
        {
            m_creature->CombatStop(true);
            m_creature->ClearInCombat();
            m_creature->SetFactionTemplateId(35);
        }
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim()) return;
        DoMeleeAttackIfReady();
    }
    void JustDied(Unit*) override { }
    void EnterCombat() { }

    void OnCombatStop()
    {
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

        ThreatList const& tList = m_creature->GetThreatManager().getThreatList();
        for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i)
        {
            Unit* pUnit = m_creature->GetMap()->GetUnit((*i)->getUnitGuid());
            if (pUnit && (pUnit->GetTypeId() == TYPEID_PLAYER))
            {
                if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60380))
                    pUnit->ToPlayer()->KilledMonster(cInfo, ObjectGuid());
            }
        }
    }

    void JustRespawned() { Reset(); }
};

CreatureAI* GetAI_npc_ancient_spirit_wolf(Creature* _Creature) { return new npc_ancient_spirit_wolfAI(_Creature); }

void AddSC_random_scripts_3()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_ancient_spirit_wolf";
    newscript->pGossipHello = &GossipHello_npc_ancient_spirit_wolf;
    newscript->pGossipSelect = &GossipSelect_npc_ancient_spirit_wolf;
    newscript->GetAI = &GetAI_npc_ancient_spirit_wolf;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_ekka";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_ekka;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_voljin";
    newscript->pGossipHello = &GossipHello_npc_voljin;
    newscript->pGossipSelect = &GossipSelect_npc_voljin;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_seer_mazek";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_seer_mazek;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_lashog";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_lashog;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_karfang";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_karfang;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_young_blackrock_worg";
    newscript->pGossipHello = &GossipHello_npc_young_blackrock_worg;
    newscript->pGossipSelect = &GossipSelect_npc_young_blackrock_worg;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_darkseer_geshtol";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_darkseer_geshtol;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_farad_wrightsow";
    newscript->pGossipHello = &GossipHello_npc_farad_wrightsow;
    newscript->pGossipSelect = &GossipSelect_npc_farad_wrightsow;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_franklin_hamar";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_franklin_hamar;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_maltimor_gartside";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_maltimor_gartside;
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_maltimor_gartside;
    newscript->pGossipHello = &GossipHello_npc_maltimor_gartside;
    newscript->pGossipSelect = &GossipSelect_npc_maltimor_gartside;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_orvak_sternrock";
    newscript->pGossipHello = &GossipHello_npc_orvak_sternrock;
    newscript->pGossipSelect = &GossipSelect_npc_orvak_sternrock;
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_orvak_sternrock;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_chaser";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_chaser;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_watcher_mahar_ba";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_watcher_mahar_ba;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_engineer_wigglestip";
    newscript->pGossipHello = &GossipHello_npc_engineer_wigglestip;
    newscript->pGossipSelect = &GossipSelect_npc_engineer_wigglestip;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_sergeant_burnside";
    newscript->pGossipHello = &GossipHello_npc_sergeant_burnside;
    newscript->pGossipSelect = &GossipSelect_npc_sergeant_burnside;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_koli_steamheart";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_koli_steamheart;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_captain_harker";
    newscript->pGossipHello = &GossipHello_npc_captain_harker;
    newscript->pGossipSelect = &GossipSelect_npc_captain_harker;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_captain_wallace_cross";
    newscript->pGossipHello = &GossipHello_npc_captain_wallace_cross;
    newscript->pGossipSelect = &GossipSelect_npc_captain_wallace_cross;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_jabbey";
    newscript->pGossipHello = &GossipHello_npc_jabbey;
    newscript->pGossipSelect = &GossipSelect_npc_jabbey;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_niremius";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_niremius;
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_niremius;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_captain_grayson";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_captain_grayson;
    newscript->pGossipHello = &GossipHello_npc_captain_grayson;
    newscript->pGossipSelect = &GossipSelect_npc_captain_grayson;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mournful_apparition_atack";
    newscript->pGOHello = &GOHello_mournful_apparition_atack;
    newscript->pGOGossipSelect = &GOSelect_mournful_apparition_atack;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "GO_lyvdia_dawnbird";
    newscript->pGOQuestAccept = &QuestAcceptGO_lyvdia_dawnbird;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_sovatir";
    newscript->pGossipHello = &GossipHello_npc_sovatir;
    newscript->pGossipSelect = &GossipSelect_npc_sovatir;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_fazgel_mechaflame";
    newscript->pGossipHello = &GossipHello_npc_fazgel_mechaflame;
    newscript->pGossipSelect = &GossipSelect_npc_fazgel_mechaflame;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_vildo_onetusk";
    newscript->pGossipHello = &GossipHello_npc_vildo_onetusk;
    newscript->pGossipSelect = &GossipSelect_npc_vildo_onetusk;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_ironpatch";
    newscript->pGossipHello = &GossipHello_npc_ironpatch;
    newscript->pGossipSelect = &GossipSelect_npc_ironpatch;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_nribbi";
    newscript->pGossipHello = &GossipHello_npc_nribbi;
    newscript->pGossipSelect = &GossipSelect_npc_nribbi;
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_nribbi;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_bombay";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_bombay;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_ancestor_of_humility";
    newscript->pGossipHello = &GossipHello_npc_ancestor_of_humility;
    newscript->pGossipSelect = &GossipSelect_npc_ancestor_of_humility;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_ancestor_of_virtue";
    newscript->pGossipHello = &GossipHello_npc_ancestor_of_virtue;
    newscript->pGossipSelect = &GossipSelect_npc_ancestor_of_virtue;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_ancestor_of_wisdom";
    newscript->pGossipHello = &GossipHello_npc_ancestor_of_wisdom;
    newscript->pGossipSelect = &GossipSelect_npc_ancestor_of_wisdom;
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_ancestor_of_wisdom;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_sage_palerunner";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_sage_palerunner;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_tholdan_mountainheart";
    newscript->pGossipHello = &GossipHello_npc_tholdan_mountainheart;
    newscript->pGossipSelect = &GossipSelect_npc_tholdan_mountainheart;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_moo_rune";
    newscript->pGOHello = &GOHello_go_moo_rune;
    newscript->pGOGossipSelect = &GOSelect_go_moo_rune;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_inunquaq";
    newscript->pGossipHello = &GossipHello_npc_inunquaq;
    newscript->pGossipSelect = &GossipSelect_npc_inunquaq;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_magus_ariden_dusktower";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_magus_ariden_dusktower;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_korgan";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_korgan;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_colonel_hardinus";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_colonel_hardinus;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_yhargosh";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_yhargosh;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_katokar_bladewind";
    newscript->pGossipHello = &GossipHello_npc_katokar_bladewind;
    newscript->pGossipSelect = &GossipSelect_npc_katokar_bladewind;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_pierce_shackleton";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_pierce_shackleton;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_duke_nargelas";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_duke_nargelas;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_seer_bolukk";
    newscript->pGossipHello = &GossipHello_npc_seer_bolukk;
    newscript->pGossipSelect = &GossipSelect_npc_seer_bolukk;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_lord_crukzogg";
    newscript->pGossipHello = &GossipHello_npc_lord_crukzogg;
    newscript->pGossipSelect = &GossipSelect_npc_lord_crukzogg;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_ashan_stone";
    newscript->pGOHello = &GOHello_go_ashan_stone;
    newscript->pGOGossipSelect = &GOSelect_go_ashan_stone;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_way_stone";
    newscript->pGOHello = &GOHello_go_way_stone;
    newscript->pGOGossipSelect = &GOSelect_go_way_stone;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_iselus";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_iselus;
    newscript->pGossipHello = &GossipHello_npc_iselus;
    newscript->pGossipSelect = &GossipSelect_npc_iselus;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "magically_sealed_door";
    newscript->pGOHello = &GOHello_magically_sealed_door;
    newscript->GOGetAI = &GetAI_magically_sealed_door;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_lorthiras";
    newscript->pGossipHello = &GossipHello_npc_lorthiras;
    newscript->pGossipSelect = &GossipSelect_npc_lorthiras;
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_lorthiras;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_lapidis";
    newscript->GetAI = &GetAI_npc_lapidis;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_fearoth";
    newscript->GetAI = &GetAI_npc_fearoth;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_insomni";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_insomni;
    newscript->pGossipHello = &GossipHello_npc_insomni;
    newscript->pGossipSelect = &GossipSelect_npc_insomni;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_daela_evermoon";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_daela_evermoon;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_old_greypaw";
    newscript->pGossipHello = &GossipHello_npc_old_greypaw;
    newscript->pGossipSelect = &GossipSelect_npc_old_greypaw;
    newscript->GetAI = &GetAI_npc_old_greypaw;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_blazno";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_blazno;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_thirael_ghost";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_thirael_ghost;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_thirael";
    newscript->pGossipHello = &GossipHello_npc_thirael;
    newscript->pGossipSelect = &GossipSelect_npc_thirael;
    newscript->GetAI = &GetAI_npc_thirael;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_garfield_sparkblast";
    newscript->pGossipHello = &GossipHello_npc_garfield_sparkblast;
    newscript->pGossipSelect = &GossipSelect_npc_garfield_sparkblast;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_morgan_the_storm";
    newscript->pGossipHello = &GossipHello_npc_morgan_the_storm;
    newscript->pGossipSelect = &GossipSelect_npc_morgan_the_storm;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_keg_of_rum";
    newscript->pGOHello = &GOHello_go_keg_of_rum;
    newscript->pGOGossipSelect = &GOSelect_go_keg_of_rum;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_blast_powder_keg";
    newscript->pGOHello = &GOHello_go_blast_powder_keg;
    newscript->pGOGossipSelect = &GOSelect_go_blast_powder_keg;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_captain_ironhoof";
    newscript->GetAI = &GetAI_npc_captain_ironhoof;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_captain_blackeye";
    newscript->GetAI = &GetAI_npc_captain_blackeye;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_captain_saltbeard";
    newscript->GetAI = &GetAI_npc_captain_saltbeard;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_marty_moonshine";
    newscript->pGossipHello = &GossipHello_npc_marty_moonshine;
    newscript->pGossipSelect = &GossipSelect_npc_marty_moonshine;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_chef_jenkel";
    newscript->pGossipHello = &GossipHello_npc_chef_jenkel;
    newscript->pGossipSelect = &GossipSelect_npc_chef_jenkel;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_samuel_boran";
    newscript->pGossipHello = &GossipHello_npc_samuel_boran;
    newscript->pGossipSelect = &GossipSelect_npc_samuel_boran;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_karl_boran";
    newscript->pGossipHello = &GossipHello_npc_karl_boran;
    newscript->pGossipSelect = &GossipSelect_npc_karl_boran;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_arnold_boran";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_arnold_boran;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_torble_and_kex";
    newscript->pGossipHello = &GossipHello_npc_torble_and_kex;
    newscript->pGossipSelect = &GossipSelect_npc_torble_and_kex;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_grain_sacks";
    newscript->pGOHello = &GOHello_go_grain_sacks;
    newscript->pGOGossipSelect = &GOSelect_go_grain_sacks;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_wendo_wobblefizz";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_wendo_wobblefizz;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_bessy";
    newscript->pGossipHello = &GossipHello_npc_bessy;
    newscript->pGossipSelect = &GossipSelect_npc_bessy;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "the_cow_king";
    newscript->pGossipHello = &GossipHello_the_cow_king;
    newscript->pGossipSelect = &GossipSelect_the_cow_king;
    newscript->GetAI = &GetAI_the_cow_king;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "analyzor_53";
    newscript->pGossipHello = &GossipHello_analyzor_53;
    newscript->pGossipSelect = &GossipSelect_analyzor_53;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "skeleton_thalo";
    newscript->pGOHello = &GOHello_skeleton_thalo;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "highborne_wraith";
    newscript->GetAI = &GetAI_highborne_wraith;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "runed_thalassian_tablet";
    newscript->pGOHello = &GOHello_runed_thalassian_tablet;
    newscript->RegisterSelf();
}
