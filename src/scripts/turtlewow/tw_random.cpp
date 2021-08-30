#include "scriptPCH.h"
#include "Utilities/EventProcessor.h"

template <typename Functor>
void DoAfterTime(Player* player, uint32 p_time, Functor&& function)
{
    player->m_Events.AddEvent(new LambdaBasicEvent<Functor>(std::move(function)), player->m_Events.CalculateTime(p_time));
}

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

bool ItemUseSpell_character_rename(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
    if (!pPlayer) return false;

    pPlayer->SetAtLoginFlag(AT_LOGIN_RENAME);
    pPlayer->GetSession()->SendNotification("Please choose a new name.\nYou will be disconnected in 5 seconds.");
    pPlayer->SaveToDB();
    DoAfterTime(pPlayer, 5 * IN_MILLISECONDS, [player = pPlayer]() { player->GetSession()->KickPlayer(); });
    return true;
}

#define ALICE_GROW_LBOUNDARY 1.05f
#define ALICE_GROW_RBOUNDARY 1.15f
#define ALICE_BELITTLE_LBOUNDARY 0.85f
#define ALICE_BELITTLE_RBOUNDARY 0.95f
bool ItemUseSpell_alice_wonderland_scale(Player* pPlayer, Item* pItem, const SpellCastTargets&) {
    float scale;
    float taurenVariance = pPlayer->GetRace() == RACE_TAUREN ? (pPlayer->GetGender() == GENDER_MALE ? 0.35f : 0.25f) : 0;
    float currentNormalizedScale = pPlayer->GetObjectScale() - taurenVariance;

    if (pItem->GetEntry() == 50021) // Strange Bottle
    {
        if (currentNormalizedScale == ALICE_BELITTLE_LBOUNDARY)
        {
            ChatHandler(pPlayer).PSendSysMessage("|cffff8040You can't be smaller!|r");
            return true;
        }

        scale = frand(ALICE_BELITTLE_LBOUNDARY, currentNormalizedScale == 1 ? ALICE_BELITTLE_RBOUNDARY : currentNormalizedScale);
    }
    else
    {
        if (currentNormalizedScale == ALICE_GROW_RBOUNDARY)
        {
            ChatHandler(pPlayer).PSendSysMessage("|cffff8040You can't grow more!|r");
            return true;
        }

        scale = frand(currentNormalizedScale == 1 ? ALICE_GROW_LBOUNDARY : currentNormalizedScale, ALICE_GROW_RBOUNDARY);
    }

    pPlayer->SetObjectScale(static_cast<float>(floor((scale * 100) + 0.5) / 100) + taurenVariance);
    return false;
}

class DanceAfterTime : public BasicEvent
{
public:
    explicit DanceAfterTime(uint64 player_guid) : BasicEvent(), player_guid(player_guid) {}

    bool Execute(uint64 e_time, uint32 p_time) override
    {
        Player* player = ObjectAccessor::FindPlayer(player_guid);
        if (player)
            player->HandleEmoteCommand(EMOTE_ONESHOT_DANCE);

        return false;
    }

private:
    uint64 player_guid;
};

bool ItemUseSpell_summer_vestment(Player* pPlayer, Item* pItem, const SpellCastTargets&) 
{
    pPlayer->m_Events.AddEvent(new DanceAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(1500));
    return false;
}

bool ItemUseSpell_city_protector_scroll(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
    if (!pPlayer->IsCityProtector() || pPlayer->IsInCombat() || pPlayer->IsBeingTeleported() || (pPlayer->GetDeathState() == CORPSE))
    {
        ChatHandler(pPlayer).PSendSysMessage("|cffff8040You are not a City Protector anymore.|r");
        pPlayer->RemoveSpellCooldown(7794, true);
        return false;
    }
    else
    {
        switch (pPlayer->GetRace())
        {
        case RACE_HUMAN:
            // Stormwind City
            pPlayer->TeleportTo(0, -8828.231445f, 627.927490f, 94.055664f, 0.0f);
            break;
        case RACE_GNOME:
            // Ironforge
            pPlayer->TeleportTo(0, -4917.0f, -955.0f, 502.0f, 0.0f);
            break;
        case RACE_DWARF:
            // Ironforge
            pPlayer->TeleportTo(0, -4917.0f, -955.0f, 502.0f, 0.0f);
            break;
        case RACE_NIGHTELF:
            // Darnassus
            pPlayer->TeleportTo(1, 9962.712891f, 2280.142822f, 1341.394409f, 0.0f);
            break;
        case RACE_ORC:
            // Orgrimmar
            pPlayer->TeleportTo(1, 1437.0f, -4421.0f, 25.24f, 1.65f);
            break;
        case RACE_TAUREN:
            // Thunder Bluff
            pPlayer->TeleportTo(1, -1272.703735f, 116.886490f, 131.016861f, 0.0f);
            break;
        case RACE_TROLL:
            // Orgrimmar
            pPlayer->TeleportTo(1, 1437.0f, -4421.0f, 25.24f, 1.65f);
            break;
        case RACE_UNDEAD:
            //Undercity
            pPlayer->TeleportTo(0, 1822.0999f, 238.638855f, 60.694809f, 0.0f);
            break;
        case RACE_GOBLIN:
            // Mudsprocket
            pPlayer->TeleportTo(1, -4594.56f, -3208.2f, 34.9253f, 4.65f);
            break;
        case RACE_HIGH_ELF:
            // Alah'Thalas
            pPlayer->TeleportTo(0, 4226.82f, -2722.43f, 121.874f, 5.3f);
            break;
        default:
            break;
        }

        return true;
    }
}

bool ItemUseSpell_remote_mail_terminal(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
    if (!pPlayer) return false;

    GameObject* other_mailbox = pPlayer->FindNearestGameObject(144112, 50.0F);

    if (other_mailbox)
        other_mailbox->SetRespawnTime(1);

    float dis{2.0F};
    float x, y, z;
    pPlayer->GetSafePosition(x, y, z);
    x += dis * cos(pPlayer->GetOrientation());
    y += dis * sin(pPlayer->GetOrientation());

    pPlayer->HandleEmoteCommand(EMOTE_ONESHOT_CHEER);
    pPlayer->SummonGameObject(144112, x, y, z, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 300, true);
    return true;
}

bool ItemUseSpell_sword_of_truth(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
    ChatHandler(pPlayer).SendSysMessage(urand(50200, 50210));
    return false;
}

bool ItemUseSpell_hairdye(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
    uint8 color = 0;
    
    switch (pItem->GetEntry())
    {
    // Night Elves
    case 50107: color = 0; break; // Grass Green
    case 50108: color = 1; break; // Green
    case 50109: color = 2; break; // Dark Green
    case 50110: color = 3; break; // Aquamarine
    case 50111: color = 4; break; // White
    case 50112: color = 5; break; // Blue
    case 50113: color = 6; break; // Dark Blue
    case 50114: color = 7; break; // Purple
    case 81101: color = 8; break; // Black
    // Humans
    case 50115: color = 0; break; // Black
    case 50116: color = 1; break; // Crushed Garnet
    case 50117: color = 2; break; // Havana Brown
    case 50118: color = 3; break; // Copper Shimmer
    case 50119: color = 4; break; // Reddish Blonde
    case 50120: color = 5; break; // Sunflower Blonde
    case 50121: color = 6; break; // Beeline Honey
    case 50122: color = 7; break; // Pure Diamond
    case 50123: color = 8; break; // Dark Ash Grey
    case 50124: color = 9; break; // Light Ash Grey
    // Gnomes
    case 50125: color = 0; break; // Black
    case 50126: color = 1; break; // Chocolate Brown
    case 50127: color = 2; break; // Ash Blonde
    case 50128: color = 3; break; // Diamond Blonde
    case 50129: color = 4; break; // Dream Purple
    case 50130: color = 5; break; // Ruby Fusion
    case 50131: color = 6; break; // Steel Blue
    case 50132: color = 7; break; // Pure Green
    case 50133: color = 8; break; // Shining Pink
    // Dwarves
    case 50134: color = 0; break; // Copper Shimmer
    case 50135: color = 1; break; // Reddish Blonde
    case 50136: color = 2; break; // Dark Orange
    case 50137: color = 3; break; // Ash Blonde
    case 50138: color = 4; break; // Light Auburn
    case 50139: color = 5; break; // Black
    case 50140: color = 6; break; // Caramel
    case 50141: color = 7; break; // Light Ash Grey
    case 50142: color = 8; break; // Dark Ash Grey
    // Trolls
    case 50143: color = 0; break; // Purple
    case 50144: color = 1; break; // Red
    case 50145: color = 2; break; // Orange
    case 50146: color = 3; break; // Yellow
    case 50147: color = 4; break; // Grass Green
    case 50148: color = 5; break; // Mint Blue
    case 50149: color = 6; break; // Light Blue
    case 50150: color = 7; break; // Dark Blue
    case 50151: color = 8; break; // Ash Grey
    case 50152: color = 9; break; // Snow White
    // Orcs
    case 50153: color = 0; break; // Blue Black
    case 50154: color = 1; break; // Oak Brown
    case 50155: color = 2; break; // Dark Purple
    case 50156: color = 3; break; // Lilac Violet
    case 50157: color = 4; break; // Rich Purple
    case 50158: color = 5; break; // Black
    case 50159: color = 6; break; // Dark Ash Grey
    case 50160: color = 7; break; // Light Ash Grey
    // Undeads
    case 50161: color = 0; break; // Lime Green
    case 50162: color = 1; break; // Ash Rose
    case 50163: color = 2; break; // Mud Brown
    case 50164: color = 3; break; // Green Blonde
    case 50165: color = 4; break; // Ash Blonde
    case 50167: color = 5; break; // Mint Blue
    case 50168: color = 6; break; // Mud Green
    case 50169: color = 7; break; // Light Teal 
    case 50170: color = 8; break; // Dirty Purple
    case 50171: color = 9; break; // Ash Black
    // High Elves
    case 80650: color = 0; break; // Sunflower Blond
    case 80651: color = 1; break; // Ash Blond
    case 80652: color = 2; break; // Ruby Rush
    case 80653: color = 3; break; // Cinnamon
    case 80654: color = 4; break; // Wheat Brown
    case 80655: color = 5; break; // Sand Blond
    case 80656: color = 6; break; // Coral Red
    case 80657: color = 7; break; // Honey Blond
    case 80658: color = 8; break; // Starry Night
    case 80659: color = 9; break; // Crab Legs
    }

    pPlayer->SetByteValue(PLAYER_BYTES, 3, color);
    pPlayer->SetDisplayId(15435); // Invisible
    pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    return false;
}

bool ItemUseSpell_skin_changer(Player* pPlayer, Item* pItem, const SpellCastTargets&) 
{
    uint32 item_entry = pItem->GetEntry();
    int8 bytes = -1;

    bool male = pPlayer->GetGender() == GENDER_MALE;

    switch (pPlayer->GetRace()) 
    {
        case RACE_HUMAN:
            switch (item_entry)
            {
            case 50105: if (!male) bytes = 10; break; // Human: Scarlet Inquisitor
            case 50106:            bytes = 11; break; // Human: Scholomance Student
            case 81210:            bytes = 12; break; // Human: Death Knight
            }
            break;
        case RACE_DWARF:
            switch (item_entry)
            {
            case 50204: if (male) bytes = static_cast<uint8>(irand(9, 12)); else bytes = 9; break;  // Dwarf: Wildhammer Clan
            case 50205: if (male) bytes = 13; else bytes = 10; break;                               // Dwarf: Dark Iron
            case 50206: if (male) bytes = static_cast<uint8>(irand(16, 17)); break;                 // Dwarf: Earthen 
            case 81229: if (male) bytes = 23; break;                                                // Dwarf: Death Knight
            }
            break;
        case RACE_ORC:
            switch (item_entry)
            {
            case 50207: if (male) bytes = static_cast<uint8>(irand(0, 1) == 0 ? 9 : 11); else bytes = 9; break; // Orc: Blackrock Clan
            case 50208: if (male) bytes = 10; break;                                                            // Orc: Chaos
            case 50209: if (male) bytes = 12; break;                                                            // Orc: Mag'Har
            case 81255: if (male) bytes = 14; break;                                                            // Orc: Dreadskull Clan I
            case 81256: if (male) bytes = 16; break;                                                            // Orc: Dreadskull Clan II
            }
            break;
        case RACE_TROLL:
            switch (item_entry)
            {
            case 50210: if (male) bytes = 19; else bytes = 8;  break;                                                // Troll: Forest
            case 50211: if (male) bytes = 16; break;                                                                 // Troll: Sandfury Clan 
            case 51010: bytes = 12; break;                                                                           // Troll: Dark
            case 51011: if (male) bytes = 13; else bytes = 7;  break;                                                // Troll: Ice
            case 81208: if (male) bytes = 20; else bytes = 14; break;                                                // Troll: Zombie
            }
            break;
        case RACE_GNOME:
            switch (item_entry)
            {
            case 81230: if (male) bytes = 6; else bytes = 5; break; // Gnome: Scholomanc Student
            case 50212: if (male) bytes = 5; break;                 // Gnome: Leper
            }
            break;
        case RACE_HIGH_ELF:
            switch (item_entry)
            {
            case 81206: bytes = 16; break; // High Elf: Dark Ranger
            case 81209: bytes = 15; break; // High Elf: Blood Elf
            }
            break;
        case RACE_TAUREN:
            switch (item_entry)
            {
            case 81228: if (male) bytes = 19; break; // Tauren: Spirit Walker
            }
            break;
    }

    if (bytes > -1) 
    {
        pPlayer->SetByteValue(PLAYER_BYTES, 0, static_cast<uint8>(bytes));
        pPlayer->SetDisplayId(15435); 
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    } 
    else 
        ChatHandler(pPlayer).SendSysMessage("You can't use this item.");    
    return false;
}

bool ItemUseSpell_item_survival_outline(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
    switch (pItem->GetEntry())
    {
    case 50234: pPlayer->LearnSpell(46058, false); break; // Outline: Traveler's Tent 
    case 50235: pPlayer->LearnSpell(46060, false); break; // Outline: Fishing Boat
    }
    return true;
}

bool ItemUseSpell_bg_tabard(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
    if (!pItem)
        return false;

    // Some spell checks might be obsolete, check it later.
    if (pPlayer->IsInCombat() || pPlayer->InBattleGround() || pPlayer->IsBeingTeleported() || pPlayer->HasSpellCooldown(20939) || pPlayer->HasSpellCooldown(26013) || (pPlayer->GetDeathState() == CORPSE))
        ChatHandler(pPlayer).PSendSysMessage("You are not meeting the conditions to queue for BGs!");
    else
    {
        pPlayer->SetBattleGroundEntryPoint();

        static constexpr uint32 cui_BattleTabardDefilers = 20131;
        static constexpr uint32 cui_BattleTabardArathor = 20132;
        static constexpr uint32 cui_BattleTabardFrostworlf = 19031;
        static constexpr uint32 cui_BattleTabardSilverwing = 19506;
        static constexpr uint32 cui_BattleTabardStormpike = 19032;
        static constexpr uint32 cui_BattleTabardWarsong = 19505;

        switch (pItem->GetEntry())
        {
            case cui_BattleTabardWarsong:
            case cui_BattleTabardSilverwing:
            {
                pPlayer->GetSession()->SendBattlegGroundList(pPlayer->GetObjectGuid(), BATTLEGROUND_WS);
                pPlayer->SetBGQueueAllowed(true);
                break;
            }
            case cui_BattleTabardDefilers:
            case cui_BattleTabardArathor:
            {
                pPlayer->GetSession()->SendBattlegGroundList(pPlayer->GetObjectGuid(), BATTLEGROUND_AB);
                pPlayer->SetBGQueueAllowed(true);
                break;
            }
            case cui_BattleTabardFrostworlf:
            case cui_BattleTabardStormpike:
            {
                pPlayer->GetSession()->SendBattlegGroundList(pPlayer->GetObjectGuid(), BATTLEGROUND_AV);
                pPlayer->SetBGQueueAllowed(true);
                break;
            }
            default:
                sLog.outError("Player::IsAllowedToQueueBGDueToTabard(): Player %s [GUID: %u] is trying to queue BG with an unintentional item.", pPlayer->GetName(), pPlayer->GetGUIDLow());
        }
    }

    return false;
}

bool ItemUseSpell_item_radio(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
    if (!pPlayer) return false;
    float x, y, z;
    pPlayer->GetSafePosition(x, y, z);
    x += 2.0F * cos(pPlayer->GetOrientation());
    y += 2.0F * sin(pPlayer->GetOrientation());
    switch (pItem->GetEntry())
    {
    case 51021: pPlayer->SummonGameObject(1000055, x, y, z, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 600, true); break; // Speedy's Jukebox
    case 10585: pPlayer->SummonGameObject(1000077, x, y, z, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 600, true); break; // Goblin Radio KABOOM-Box X23B76
    case 70043: pPlayer->PlayDirectMusic(30218); break; // Delicate Music Box
    }
    return true;
}

bool ItemUseSpell_turtle_party(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
    pPlayer->AddAura(8067);
    return false;
}

bool ItemUseSpell_item_illusion(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
    if (!pPlayer) return false;

    if (pPlayer->GetNativeDisplayId() != pPlayer->GetDisplayId()) 
    {
        pPlayer->DeMorph();
        return false;
    }

    uint32 displayid{ 0 };
    bool male = pPlayer->GetGender() == GENDER_MALE;

    switch (pItem->GetEntry())
    {
    case 51246: displayid = 15458; break; // Sarah Sadwhistle 
    case 51247: displayid = 10008; break; // Chromie
    case 51055: displayid = 18356;  break; // Tree Form
    case 51065: displayid = 4629;  break; // Shadow
    case 51253: displayid = 6746;  break; // Furbolg
    case 51209: displayid = 2176;  break; // Rat
    case 81145: displayid = 18251; break; // Pandaren
    case 51066: displayid = 12030; break; // Flamewaker
    case 51067: displayid = 8053;  break; // Bone Serpent
    case 51205: displayid = 14368; break; // Ghost
    case 53008: displayid = (18065 + urand(0, 4)); break; // Ogre
    case 50408: displayid = ((male) ? 150 : 876);  break; // Dryad
    case 51836: displayid = (15393 + urand(0, 5)); break; // Murloc
    case 80694: // Scourge
    {
        int models[3] = { 158, 612, 733 };
        int modelid = rand() % 3;
        displayid = static_cast<uint32>(models[modelid]);
        break;
    }
    case 51200: // Goblin
    {
        int m_male[9] = { 7170, 7102, 8847, 7185, 7809, 15095, 15096, 15097, 7209 };
        int m_female[9] = { 9553, 15094, 10744, 15094, 11675, 15094, 7175, 11689, 10651 };
        int modelid = rand() % 9;
        displayid = static_cast<uint32>((male) ? m_male[modelid] : m_female[modelid]);
        break;
    }
    case 51201: // Worgen
    {
        int models[3] = { 522, 523, 524 };
        int modelid = rand() % 3;
        displayid = static_cast<uint32>(models[modelid]);
        break;
    }
    case 80648: // Gnoll
    {
        int models[4] = { 487, 383, 384, 491 };
        int modelid = rand() % 4;
        displayid = static_cast<uint32>(models[modelid]);
        break;
    }
    case 51206: // Banshee
    {
        int models[4] = { 8782, 10728, 10750, 10994 };
        int modelid = rand() % 4;
        displayid = static_cast<uint32>(models[modelid]);
        break;
    }
    case 51207: // Serpent Lord
    {
        int m_male[5] = { 4232, 4214, 4215, 4212, 4213 };
        int m_female[5] = { 4233, 4234, 4313, 4233, 4234 };
        int modelid = rand() % 5;
        displayid = static_cast<uint32>((male) ? m_male[modelid] : m_female[modelid]);
        break;
    }
    case 51208: // Succubus
    {
        int models[4] = { 10923, 10924, 10925, 10926 };
        int modelid = rand() % 4;
        displayid = static_cast<uint32>(models[modelid]);
        break;
    }
    case 50017: // Blood Elf
    case 51203: // High Elf
    {
        int m_male[6]   = { 10375, 4245, 6779, 14394, 11671, 6549 };
        int m_female[6] = { 4729,  4729, 3293, 4730,  1643, 10381 };
        int modelid = rand() % 6;
        displayid = static_cast<uint32>((male) ? m_male[modelid] : m_female[modelid]);
        break;
    }
    default: break;
    }
    pPlayer->SetDisplayId(displayid);
    return true;
}

bool ItemUseSpell_item_winter_tree(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
    GameObject* other_tree = pPlayer->FindNearestGameObject(1000070, 15.0F);

    if (other_tree)
        other_tree->SetRespawnTime(1);

    float dis{ 2.0F };
    float x, y, z;
    pPlayer->GetSafePosition(x, y, z);
    x += dis * cos(pPlayer->GetOrientation());
    y += dis * sin(pPlayer->GetOrientation());    

    pPlayer->SummonGameObject(1000070, x, y, z, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 300, true);
    return false;
}

bool ItemUseSpell_item_roleplay_effect(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{

    if (!pPlayer)
        return false;

    // summon runes to mark the ground, helpful for raid enocunters
    if (pPlayer->GetInstanceId())
    {
        float dis{ 20.0F };
        float x, y, z;
        pPlayer->GetSafePosition(x, y, z);
        //x += dis * cos(pPlayer->GetOrientation());
        //y += dis * sin(pPlayer->GetOrientation());

        switch (pItem->GetEntry())
        {
        case 51410:
            // purple Raid Management: Purple Mark
            pPlayer->SummonGameObject(2005013, x, y, z, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 120, true);
            break;
        case 51411:
            // red Raid Management: Red Mark
            pPlayer->SummonGameObject(2005012, x, y, z, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 120, true);
            break;
        case 51412:
            // blue Raid Management: Blue Mark
            pPlayer->SummonGameObject(2005011, x, y, z, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 120, true);
            break;
        default:
            break;
        }
        return false;
    }
    else
    {
        ChatHandler(pPlayer).SendSysMessage("Can't place rune here! You need to be in an instace or in a raid.");
        return false;
    }
}

bool ItemUseSpell_item_holy_strike_book(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
    if (pPlayer->IsMoving())
        return false;

    if (!pPlayer->GetClass() == CLASS_PALADIN)
        return false;

    switch (pItem->GetEntry())
    {
    case 51270:
        pPlayer->LearnSpell(678, false);
        break;
    case 51271:
        pPlayer->LearnSpell(1866, false);
        break;
    case 51272:
        pPlayer->LearnSpell(680, false);
        break;
    case 51273:
        pPlayer->LearnSpell(2495, false);
        break;
    case 51274:
        pPlayer->LearnSpell(5569, false);
        break;
    case 51275:
        pPlayer->LearnSpell(10332, false);
        break;
    case 51276:
        pPlayer->LearnSpell(10333, false);
        break;
    default: break;
    }
    return true;
}

bool ItemUseSpell_item_elwynn_coin(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
    if (pPlayer->HasItemCount(51425, 1, false))
    {
        if (GameObject* pObject = pPlayer->FindNearestGameObject(1000220, 3.0F))
        {
            pPlayer->HandleEmoteCommand(EMOTE_ONESHOT_KNEEL);
            pPlayer->PlayDirectSound(1204, pPlayer);

            CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(51301);

            if (cInfo != nullptr)
            {
                pPlayer->KilledMonster(cInfo, ObjectGuid());
                pPlayer->DestroyItemCount(51425, 1, true);
                return true;
            }
        }
        else
        {
            pPlayer->GetSession()->SendNotification("Requires Stormwind Fountain.");
            return false;
        }
    }

    return true;
}

bool ItemUseSpell_item_holy_wings(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{    
    float x, y, z;
    pPlayer->GetSafePosition(x, y, z);
    pPlayer->SummonCreature(51525, x, y, z, pPlayer->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN, 15000, true);
    float px, py, pz;
    float add = 0.5F;
    pPlayer->GetRelativePositions(add, 0.0F, 0.0F, px, py, pz);
    pPlayer->NearLandTo(px, py, pz, pPlayer->GetOrientation());
    pPlayer->PlayDirectMusic(3221);
    pPlayer->HandleEmote(EMOTE_ONESHOT_ROAR);
    pPlayer->SummonGameObject(1000330, px, py, pz - 1.06F, pPlayer->GetOrientation(), 0.0F, 0.0F, 0.0F, 0.0F, 15, true); // Golden Aura
    return false;
}

enum PlayerMounting
{
    STAG_MOUNT_DISPLAY = 17158,
    SPELL_CHARM = 530,
    SPELL_TAXI_INVISIBILITY = 16380
};

class StopUber : public BasicEvent
{
public:
    explicit StopUber(uint64 player_guid, uint64 passenger_guid) : BasicEvent(), player_guid(player_guid), passenger_guid(passenger_guid) {}

    bool Execute(uint64 e_time, uint32 p_time) override
    {
        Player* player = ObjectAccessor::FindPlayer(player_guid);
        Player* passenger = ObjectAccessor::FindPlayer(passenger_guid);
        if (player && passenger)
            player->CancelTaxiRide(passenger);
        return false;
    }
private:
    uint64 player_guid;
    uint64 passenger_guid;
};

bool GossipHello_npc_barber(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->HasItemCount(50600, 1) || pPlayer->GetRace() == RACE_GOBLIN)
    {
        switch (pPlayer->GetRace())
        {
        case RACE_TAUREN:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Horn Color Next", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Horn Color Previous", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Horn Style Next", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Horn Style Previous", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
            break;
        default:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Hair Color Next", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Hair Color Previous", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Hair Style Next", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Hair Style Previous", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
            break;
        }
    }
    pPlayer->SEND_GOSSIP_MENU(51670, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_barber(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        uint16 bytelimit_human = 9;
        uint16 bytelimit_elf = 8;
        uint16 bytelimit_gnome = 8;
        uint16 bytelimit_dwarf = 8;
        uint16 bytelimit_troll = 9;
        uint16 bytelimit_orc = 7;
        uint16 bytelimit_undead = 9;
        uint16 bytelimit_tauren = 9;
        uint16 bytelimit_goblin = 5;

        uint16 color = 0;
        uint16 curr_color = pPlayer->GetByteValue(PLAYER_BYTES, 3);

        switch (pPlayer->GetRace())
        {
        case RACE_HUMAN:    color = (curr_color == bytelimit_human) ? 0 : ++curr_color; break;
        case RACE_NIGHTELF: color = (curr_color == bytelimit_elf) ? 0 : ++curr_color; break;
        case RACE_GNOME:    color = (curr_color == bytelimit_gnome) ? 0 : ++curr_color; break;
        case RACE_DWARF:    color = (curr_color == bytelimit_dwarf) ? 0 : ++curr_color; break;
        case RACE_TROLL:    color = (curr_color == bytelimit_troll) ? 0 : ++curr_color; break;
        case RACE_ORC:      color = (curr_color == bytelimit_orc) ? 0 : ++curr_color; break;
        case RACE_UNDEAD:   color = (curr_color == bytelimit_undead) ? 0 : ++curr_color; break;
        case RACE_TAUREN:   color = (curr_color == bytelimit_tauren) ? 0 : ++curr_color; break;
        case RACE_GOBLIN:   color = (curr_color == bytelimit_goblin) ? 0 : ++curr_color; break;
        }
        pPlayer->SetByteValue(PLAYER_BYTES, 3, color);
        pPlayer->SetDisplayId(15435);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        uint16 bytelimit_human = 9;
        uint16 bytelimit_elf = 7;
        uint16 bytelimit_gnome = 8;
        uint16 bytelimit_dwarf = 8;
        uint16 bytelimit_troll = 9;
        uint16 bytelimit_orc = 7;
        uint16 bytelimit_undead = 9;
        uint16 bytelimit_tauren = 9;
        uint16 bytelimit_goblin = 5;

        uint16 color = 0;
        uint16 curr_color = pPlayer->GetByteValue(PLAYER_BYTES, 3);

        switch (pPlayer->GetRace())
        {
        case RACE_HUMAN:    color = (curr_color == 0) ? bytelimit_human : --curr_color; break;
        case RACE_NIGHTELF: color = (curr_color == 0) ? bytelimit_elf : --curr_color; break;
        case RACE_GNOME:    color = (curr_color == 0) ? bytelimit_gnome : --curr_color; break;
        case RACE_DWARF:    color = (curr_color == 0) ? bytelimit_dwarf : --curr_color; break;
        case RACE_TROLL:    color = (curr_color == 0) ? bytelimit_troll : --curr_color; break;
        case RACE_ORC:      color = (curr_color == 0) ? bytelimit_orc : --curr_color; break;
        case RACE_UNDEAD:   color = (curr_color == 0) ? bytelimit_undead : --curr_color; break;
        case RACE_TAUREN:   color = (curr_color == 0) ? bytelimit_tauren : --curr_color; break;
        case RACE_GOBLIN:   color = (curr_color == 0) ? bytelimit_goblin : --curr_color; break;
        }
        pPlayer->SetByteValue(PLAYER_BYTES, 3, color);
        pPlayer->SetDisplayId(15435);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 3)
    {
        uint16 bytelimit_human = (pPlayer->GetGender() == GENDER_FEMALE) ? 18 : 11;
        uint16 bytelimit_elf = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 6;
        uint16 bytelimit_gnome = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 6;
        uint16 bytelimit_dwarf = (pPlayer->GetGender() == GENDER_FEMALE) ? 13 : 10;
        uint16 bytelimit_troll = (pPlayer->GetGender() == GENDER_FEMALE) ? 4 : 5;
        uint16 bytelimit_orc = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 6;
        uint16 bytelimit_undead = (pPlayer->GetGender() == GENDER_FEMALE) ? 9 : 9;
        uint16 bytelimit_tauren = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 7;
        uint16 bytelimit_goblin = (pPlayer->GetGender() == GENDER_FEMALE) ? 5 : 5;

        uint16 style = 0;
        uint16 curr_style = pPlayer->GetByteValue(PLAYER_BYTES, 2);

        switch (pPlayer->GetRace())
        {
        case RACE_HUMAN:    style = (curr_style == bytelimit_human) ? 0 : ++curr_style; break;
        case RACE_NIGHTELF: style = (curr_style == bytelimit_elf) ? 0 : ++curr_style; break;
        case RACE_GNOME:    style = (curr_style == bytelimit_gnome) ? 0 : ++curr_style; break;
        case RACE_DWARF:    style = (curr_style == bytelimit_dwarf) ? 0 : ++curr_style; break;
        case RACE_TROLL:    style = (curr_style == bytelimit_troll) ? 0 : ++curr_style; break;
        case RACE_ORC:      style = (curr_style == bytelimit_orc) ? 0 : ++curr_style; break;
        case RACE_UNDEAD:   style = (curr_style == bytelimit_undead) ? 0 : ++curr_style; break;
        case RACE_TAUREN:   style = (curr_style == bytelimit_tauren) ? 0 : ++curr_style; break;
        case RACE_GOBLIN:   style = (curr_style == bytelimit_goblin) ? 0 : ++curr_style; break;
        }
        pPlayer->SetByteValue(PLAYER_BYTES, 2, style);
        pPlayer->SetDisplayId(15435);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 4)
    {
        uint16 bytelimit_human = (pPlayer->GetGender() == GENDER_FEMALE) ? 18 : 11;
        uint16 bytelimit_elf = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 6;
        uint16 bytelimit_gnome = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 6;
        uint16 bytelimit_dwarf = (pPlayer->GetGender() == GENDER_FEMALE) ? 13 : 10;
        uint16 bytelimit_troll = (pPlayer->GetGender() == GENDER_FEMALE) ? 4 : 5;
        uint16 bytelimit_orc = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 6;
        uint16 bytelimit_undead = (pPlayer->GetGender() == GENDER_FEMALE) ? 9 : 9;
        uint16 bytelimit_tauren = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 7;
        uint16 bytelimit_goblin = (pPlayer->GetGender() == GENDER_FEMALE) ? 5 : 5;

        uint16 style = 0;
        uint16 curr_style = pPlayer->GetByteValue(PLAYER_BYTES, 2);

        switch (pPlayer->GetRace())
        {
        case RACE_HUMAN:    style = (curr_style == 0) ? bytelimit_human : --curr_style; break;
        case RACE_NIGHTELF: style = (curr_style == 0) ? bytelimit_elf : --curr_style; break;
        case RACE_GNOME:    style = (curr_style == 0) ? bytelimit_gnome : --curr_style; break;
        case RACE_DWARF:    style = (curr_style == 0) ? bytelimit_dwarf : --curr_style; break;
        case RACE_TROLL:    style = (curr_style == 0) ? bytelimit_troll : --curr_style; break;
        case RACE_ORC:      style = (curr_style == 0) ? bytelimit_orc : --curr_style; break;
        case RACE_UNDEAD:   style = (curr_style == 0) ? bytelimit_undead : --curr_style; break;
        case RACE_TAUREN:   style = (curr_style == 0) ? bytelimit_tauren : --curr_style; break;
        case RACE_GOBLIN:   style = (curr_style == 0) ? bytelimit_tauren : --curr_style; break;
        }
        pPlayer->SetByteValue(PLAYER_BYTES, 2, style);
        pPlayer->SetDisplayId(15435);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    }
    pPlayer->SaveToDB();
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_surgeon(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->HasItemCount(50601, 1) || pPlayer->GetRace() == RACE_GOBLIN)
    {
        if (pPlayer->GetRace() == RACE_TAUREN)
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Fur Color Next ", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Fur Color Previous", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Features Next ", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Features Previous", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Face Next ", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Face Previous", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
        }
        else
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Skin Color Next ", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Skin Color Previous", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Features Next ", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Features Previous", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Face Next ", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Face Previous", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
        }
    }

    pPlayer->SEND_GOSSIP_MENU(51671, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_surgeon(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        uint16 bytelimit_human = (pPlayer->GetGender() == GENDER_FEMALE) ? 9 : 9;
        uint16 bytelimit_elf = (pPlayer->GetGender() == GENDER_FEMALE) ? 8 : 8;
        uint16 bytelimit_gnome = (pPlayer->GetGender() == GENDER_FEMALE) ? 4 : 3;
        uint16 bytelimit_dwarf = (pPlayer->GetGender() == GENDER_FEMALE) ? 8 : 8;
        uint16 bytelimit_troll = (pPlayer->GetGender() == GENDER_FEMALE) ? 5 : 5;
        uint16 bytelimit_orc = (pPlayer->GetGender() == GENDER_FEMALE) ? 8 : 8;
        uint16 bytelimit_undead = (pPlayer->GetGender() == GENDER_FEMALE) ? 5 : 7;
        uint16 bytelimit_tauren = (pPlayer->GetGender() == GENDER_FEMALE) ? 10 : 18;
        uint16 bytelimit_goblin = (pPlayer->GetGender() == GENDER_FEMALE) ? 5 : 5;

        uint16 skintone = 0;
        uint16 curr_skintone = pPlayer->GetByteValue(PLAYER_BYTES, 0);

        switch (pPlayer->GetRace())
        {
        case RACE_HUMAN:    skintone = (curr_skintone == bytelimit_human) ? 0 : ++curr_skintone; break;
        case RACE_NIGHTELF: skintone = (curr_skintone == bytelimit_elf) ? 0 : ++curr_skintone; break;
        case RACE_GNOME:    skintone = (curr_skintone == bytelimit_gnome) ? 0 : ++curr_skintone; break;
        case RACE_DWARF:    skintone = (curr_skintone == bytelimit_dwarf) ? 0 : ++curr_skintone; break;
        case RACE_TROLL:    skintone = (curr_skintone == bytelimit_troll) ? 0 : ++curr_skintone; break;
        case RACE_ORC:      skintone = (curr_skintone == bytelimit_orc) ? 0 : ++curr_skintone; break;
        case RACE_UNDEAD:   skintone = (curr_skintone == bytelimit_undead) ? 0 : ++curr_skintone; break;
        case RACE_TAUREN:   skintone = (curr_skintone == bytelimit_tauren) ? 0 : ++curr_skintone; break;
        case RACE_GOBLIN:   skintone = (curr_skintone == bytelimit_goblin) ? 0 : ++curr_skintone; break;
        }
        pPlayer->SetByteValue(PLAYER_BYTES, 0, skintone);
        pPlayer->SetDisplayId(15435);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        uint16 bytelimit_human = (pPlayer->GetGender() == GENDER_FEMALE) ? 9 : 9;
        uint16 bytelimit_elf = (pPlayer->GetGender() == GENDER_FEMALE) ? 8 : 8;
        uint16 bytelimit_gnome = (pPlayer->GetGender() == GENDER_FEMALE) ? 4 : 3;
        uint16 bytelimit_dwarf = (pPlayer->GetGender() == GENDER_FEMALE) ? 8 : 8;
        uint16 bytelimit_troll = (pPlayer->GetGender() == GENDER_FEMALE) ? 5 : 5;
        uint16 bytelimit_orc = (pPlayer->GetGender() == GENDER_FEMALE) ? 8 : 8;
        uint16 bytelimit_undead = (pPlayer->GetGender() == GENDER_FEMALE) ? 5 : 7;
        uint16 bytelimit_tauren = (pPlayer->GetGender() == GENDER_FEMALE) ? 10 : 18;
        uint16 bytelimit_goblin = (pPlayer->GetGender() == GENDER_FEMALE) ? 5 : 5;

        uint16 skintone = 0;
        uint16 curr_skintone = pPlayer->GetByteValue(PLAYER_BYTES, 0);

        switch (pPlayer->GetRace())
        {
        case RACE_HUMAN:    skintone = (curr_skintone == 0) ? bytelimit_human : --curr_skintone; break;
        case RACE_NIGHTELF: skintone = (curr_skintone == 0) ? bytelimit_elf : --curr_skintone; break;
        case RACE_GNOME:    skintone = (curr_skintone == 0) ? bytelimit_gnome : --curr_skintone; break;
        case RACE_DWARF:    skintone = (curr_skintone == 0) ? bytelimit_dwarf : --curr_skintone; break;
        case RACE_TROLL:    skintone = (curr_skintone == 0) ? bytelimit_troll : --curr_skintone; break;
        case RACE_ORC:      skintone = (curr_skintone == 0) ? bytelimit_orc : --curr_skintone; break;
        case RACE_UNDEAD:   skintone = (curr_skintone == 0) ? bytelimit_undead : --curr_skintone; break;
        case RACE_TAUREN:   skintone = (curr_skintone == 0) ? bytelimit_tauren : --curr_skintone; break;
        case RACE_GOBLIN:   skintone = (curr_skintone == 0) ? bytelimit_goblin : --curr_skintone; break;
        }
        pPlayer->SetByteValue(PLAYER_BYTES, 0, skintone);
        pPlayer->SetDisplayId(15435);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 3)
    {
        uint16 bytelimit_human = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 8;
        uint16 bytelimit_elf = (pPlayer->GetGender() == GENDER_FEMALE) ? 9 : 5;
        uint16 bytelimit_gnome = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 7;
        uint16 bytelimit_dwarf = (pPlayer->GetGender() == GENDER_FEMALE) ? 8 : 10;
        uint16 bytelimit_troll = (pPlayer->GetGender() == GENDER_FEMALE) ? 5 : 10;
        uint16 bytelimit_orc = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 10;
        uint16 bytelimit_undead = (pPlayer->GetGender() == GENDER_FEMALE) ? 7 : 16;
        uint16 bytelimit_tauren = (pPlayer->GetGender() == GENDER_FEMALE) ? 4 : 6;
        uint16 bytelimit_goblin = (pPlayer->GetGender() == GENDER_FEMALE) ? 5 : 5;

        uint16 feature = 0;
        uint16 curr_feature = pPlayer->GetByteValue(PLAYER_BYTES_2, 0);

        switch (pPlayer->GetRace())
        {
        case RACE_HUMAN:    feature = (curr_feature == bytelimit_human) ? 0 : ++curr_feature; break;
        case RACE_NIGHTELF: feature = (curr_feature == bytelimit_elf) ? 0 : ++curr_feature; break;
        case RACE_GNOME:    feature = (curr_feature == bytelimit_gnome) ? 0 : ++curr_feature; break;
        case RACE_DWARF:    feature = (curr_feature == bytelimit_dwarf) ? 0 : ++curr_feature; break;
        case RACE_TROLL:    feature = (curr_feature == bytelimit_troll) ? 0 : ++curr_feature; break;
        case RACE_ORC:      feature = (curr_feature == bytelimit_orc) ? 0 : ++curr_feature; break;
        case RACE_UNDEAD:   feature = (curr_feature == bytelimit_undead) ? 0 : ++curr_feature; break;
        case RACE_TAUREN:   feature = (curr_feature == bytelimit_tauren) ? 0 : ++curr_feature; break;
        case RACE_GOBLIN:   feature = (curr_feature == bytelimit_goblin) ? 0 : ++curr_feature; break;
        }
        pPlayer->SetByteValue(PLAYER_BYTES_2, 0, feature);
        pPlayer->SetDisplayId(15435);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 4)
    {
        uint16 bytelimit_human = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 8;
        uint16 bytelimit_elf = (pPlayer->GetGender() == GENDER_FEMALE) ? 9 : 5;
        uint16 bytelimit_gnome = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 7;
        uint16 bytelimit_dwarf = (pPlayer->GetGender() == GENDER_FEMALE) ? 8 : 10;
        uint16 bytelimit_troll = (pPlayer->GetGender() == GENDER_FEMALE) ? 5 : 10;
        uint16 bytelimit_orc = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 10;
        uint16 bytelimit_undead = (pPlayer->GetGender() == GENDER_FEMALE) ? 7 : 16;
        uint16 bytelimit_tauren = (pPlayer->GetGender() == GENDER_FEMALE) ? 4 : 6;
        uint16 bytelimit_goblin = (pPlayer->GetGender() == GENDER_FEMALE) ? 5 : 5;

        uint16 feature = 0;
        uint16 curr_feature = pPlayer->GetByteValue(PLAYER_BYTES_2, 0);

        switch (pPlayer->GetRace())
        {
        case RACE_HUMAN:    feature = (curr_feature == 0) ? bytelimit_human : --curr_feature; break;
        case RACE_NIGHTELF: feature = (curr_feature == 0) ? bytelimit_elf : --curr_feature; break;
        case RACE_GNOME:    feature = (curr_feature == 0) ? bytelimit_gnome : --curr_feature; break;
        case RACE_DWARF:    feature = (curr_feature == 0) ? bytelimit_dwarf : --curr_feature; break;
        case RACE_TROLL:    feature = (curr_feature == 0) ? bytelimit_troll : --curr_feature; break;
        case RACE_ORC:      feature = (curr_feature == 0) ? bytelimit_orc : --curr_feature; break;
        case RACE_UNDEAD:   feature = (curr_feature == 0) ? bytelimit_undead : --curr_feature; break;
        case RACE_TAUREN:   feature = (curr_feature == 0) ? bytelimit_tauren : --curr_feature; break;
        case RACE_GOBLIN:   feature = (curr_feature == 0) ? bytelimit_goblin : --curr_feature; break;
        }
        pPlayer->SetByteValue(PLAYER_BYTES_2, 0, feature);
        pPlayer->SetDisplayId(15435);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 5)
    {
        uint16 bytelimit_human = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 8;
        uint16 bytelimit_elf = (pPlayer->GetGender() == GENDER_FEMALE) ? 9 : 5;
        uint16 bytelimit_gnome = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 7;
        uint16 bytelimit_dwarf = (pPlayer->GetGender() == GENDER_FEMALE) ? 8 : 10;
        uint16 bytelimit_troll = (pPlayer->GetGender() == GENDER_FEMALE) ? 5 : 10;
        uint16 bytelimit_orc = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 10;
        uint16 bytelimit_undead = (pPlayer->GetGender() == GENDER_FEMALE) ? 7 : 16;
        uint16 bytelimit_tauren = (pPlayer->GetGender() == GENDER_FEMALE) ? 7 : 16;
        uint16 bytelimit_goblin = (pPlayer->GetGender() == GENDER_FEMALE) ? 5 : 5;

        uint16 face = 0;
        uint16 curr_face = pPlayer->GetByteValue(PLAYER_BYTES, 1);

        switch (pPlayer->GetRace())
        {
        case RACE_HUMAN:    face = (curr_face == bytelimit_human) ? 0 : ++curr_face; break;
        case RACE_NIGHTELF: face = (curr_face == bytelimit_elf) ? 0 : ++curr_face; break;
        case RACE_GNOME:    face = (curr_face == bytelimit_gnome) ? 0 : ++curr_face; break;
        case RACE_DWARF:    face = (curr_face == bytelimit_dwarf) ? 0 : ++curr_face; break;
        case RACE_TROLL:    face = (curr_face == bytelimit_troll) ? 0 : ++curr_face; break;
        case RACE_ORC:      face = (curr_face == bytelimit_orc) ? 0 : ++curr_face; break;
        case RACE_UNDEAD:   face = (curr_face == bytelimit_undead) ? 0 : ++curr_face; break;
        case RACE_TAUREN:   face = (curr_face == bytelimit_tauren) ? 0 : ++curr_face; break;
        case RACE_GOBLIN:   face = (curr_face == bytelimit_goblin) ? 0 : ++curr_face; break;
        }
        pPlayer->SetByteValue(PLAYER_BYTES, 1, face);
        pPlayer->SetDisplayId(15435);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 6)
    {
        uint16 bytelimit_human = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 8;
        uint16 bytelimit_elf = (pPlayer->GetGender() == GENDER_FEMALE) ? 9 : 5;
        uint16 bytelimit_gnome = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 7;
        uint16 bytelimit_dwarf = (pPlayer->GetGender() == GENDER_FEMALE) ? 8 : 10;
        uint16 bytelimit_troll = (pPlayer->GetGender() == GENDER_FEMALE) ? 5 : 10;
        uint16 bytelimit_orc = (pPlayer->GetGender() == GENDER_FEMALE) ? 6 : 10;
        uint16 bytelimit_undead = (pPlayer->GetGender() == GENDER_FEMALE) ? 7 : 16;
        uint16 bytelimit_tauren = (pPlayer->GetGender() == GENDER_FEMALE) ? 7 : 16;
        uint16 bytelimit_goblin = (pPlayer->GetGender() == GENDER_FEMALE) ? 5 : 5;

        uint16 face = 0;
        uint16 curr_face = pPlayer->GetByteValue(PLAYER_BYTES, 1);

        switch (pPlayer->GetRace())
        {
        case RACE_HUMAN:    face = (curr_face == 0) ? bytelimit_human : --curr_face; break;
        case RACE_NIGHTELF: face = (curr_face == 0) ? bytelimit_elf : --curr_face; break;
        case RACE_GNOME:    face = (curr_face == 0) ? bytelimit_gnome : --curr_face; break;
        case RACE_DWARF:    face = (curr_face == 0) ? bytelimit_dwarf : --curr_face; break;
        case RACE_TROLL:    face = (curr_face == 0) ? bytelimit_troll : --curr_face; break;
        case RACE_ORC:      face = (curr_face == 0) ? bytelimit_orc : --curr_face; break;
        case RACE_UNDEAD:   face = (curr_face == 0) ? bytelimit_undead : --curr_face; break;
        case RACE_TAUREN:   face = (curr_face == 0) ? bytelimit_tauren : --curr_face; break;
        case RACE_GOBLIN:   face = (curr_face == 0) ? bytelimit_goblin : --curr_face; break;
        }
        pPlayer->SetByteValue(PLAYER_BYTES, 1, face);
        pPlayer->SetDisplayId(15435);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool ItemUseSpell_shop_racechange(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
    if (pPlayer->IsInCombat() || pPlayer->IsBeingTeleported() || (pPlayer->GetDeathState() == CORPSE) || pPlayer->IsMoving())
    {
        pPlayer->GetSession()->SendNotification("Can't change race at this moment!");
        return false;
    }

    uint32 race = pPlayer->GetRace();
    uint32 bytes = pPlayer->GetUInt32Value(PLAYER_BYTES);
    uint32 bytes2 = pPlayer->GetUInt32Value(PLAYER_BYTES_2);
    uint8 player_class = pPlayer->GetClass();
    uint8 player_gender = pPlayer->GetGender();

    switch (pItem->GetEntry())
    {
    case 50603: // Human
        if (pPlayer->GetClass() == CLASS_DRUID || pPlayer->GetClass() == CLASS_HUNTER || pPlayer->GetClass() == CLASS_SHAMAN)
        {
            pPlayer->GetSession()->SendNotification("This race does not support your class.");
            return false;
        }
        bytes = pPlayer->GetGender() == GENDER_MALE ? 101058307 : 100730885;
        race = RACE_HUMAN;
        break;
    case 50604: // Gnome
        if (pPlayer->GetClass() == CLASS_DRUID || pPlayer->GetClass() == CLASS_PRIEST || pPlayer->GetClass() == CLASS_PALADIN || pPlayer->GetClass() == CLASS_SHAMAN)
        {
            pPlayer->GetSession()->SendNotification("This race does not support your class.");
            return false;
        }
        bytes = pPlayer->GetGender() == GENDER_MALE ? 67372546 : 131076;
        race = RACE_GNOME;
        break;
    case 50605: // Dwarf
        if (pPlayer->GetClass() == CLASS_DRUID || pPlayer->GetClass() == CLASS_MAGE || pPlayer->GetClass() == CLASS_WARLOCK || pPlayer->GetClass() == CLASS_SHAMAN)
        {
            pPlayer->GetSession()->SendNotification("This race does not support your class.");
            return false;
        }
        bytes = pPlayer->GetGender() == GENDER_MALE ? 50528773 : 34406912;
        race = RACE_DWARF;
        break;
    case 50606: // Night Elf
        if (pPlayer->GetClass() == CLASS_MAGE || pPlayer->GetClass() == CLASS_WARLOCK || pPlayer->GetClass() == CLASS_PALADIN || pPlayer->GetClass() == CLASS_SHAMAN)
        {
            pPlayer->GetSession()->SendNotification("This race does not support your class.");
            return false;
        }
        bytes = pPlayer->GetGender() == GENDER_MALE ? 132615 : 67503620;
        race = RACE_NIGHTELF;
        break;
    case 50607: // Orc
        if (pPlayer->GetClass() == CLASS_DRUID || pPlayer->GetClass() == CLASS_PRIEST || pPlayer->GetClass() == CLASS_PALADIN)
        {
            pPlayer->GetSession()->SendNotification("This race does not support your class.");
            return false;
        }
        bytes = pPlayer->GetGender() == GENDER_MALE ? 84214788 : 84214788;
        race = RACE_ORC;
        break;
    case 50608: // Troll
        if (pPlayer->GetClass() == CLASS_DRUID || pPlayer->GetClass() == CLASS_WARLOCK || pPlayer->GetClass() == CLASS_PALADIN)
        {
            pPlayer->GetSession()->SendNotification("This race does not support your class.");
            return false;
        }
        bytes = pPlayer->GetGender() == GENDER_MALE ? 33751041 : 131587;
        race = RACE_TROLL;
        break;
    case 50609: // Tauren
        if (pPlayer->GetClass() == CLASS_PRIEST || pPlayer->GetClass() == CLASS_MAGE || pPlayer->GetClass() == CLASS_ROGUE || pPlayer->GetClass() == CLASS_PALADIN)
        {
            pPlayer->GetSession()->SendNotification("This race does not support your class.");
            return false;
        }
        bytes = pPlayer->GetGender() == GENDER_MALE ? 17105153 : 393736;
        race = RACE_TAUREN;
        break;
    case 50610: // Undead
        if (pPlayer->GetClass() == CLASS_PALADIN || pPlayer->GetClass() == CLASS_DRUID || pPlayer->GetClass() == CLASS_SHAMAN || pPlayer->GetClass() == CLASS_HUNTER)
        {
            pPlayer->GetSession()->SendNotification("This race does not support your class.");
            return false;
        }
        bytes = pPlayer->GetGender() == GENDER_MALE ? 117703426 : 151126786;
        race = RACE_UNDEAD;
        break;
    case 50612: // High Elf
        if (pPlayer->GetClass() == CLASS_WARLOCK || pPlayer->GetClass() == CLASS_SHAMAN || pPlayer->GetClass() == CLASS_DRUID)
        {
            pPlayer->GetSession()->SendNotification("This race does not support your class.");
            return false;
        }
        bytes = pPlayer->GetGender() == GENDER_MALE ? 132873 : 117768707;
        race = RACE_HIGH_ELF;
        break;
    case 50613: // Goblin
        if (pPlayer->GetClass() == CLASS_PRIEST || pPlayer->GetClass() == CLASS_SHAMAN || pPlayer->GetClass() == CLASS_DRUID || pPlayer->GetClass() == CLASS_PALADIN)
        {
            pPlayer->GetSession()->SendNotification("This race does not support your class.");
            return false;
        }
        bytes = pPlayer->GetGender() == GENDER_MALE ? 16843522 : 2;
        race = RACE_GOBLIN;
        break;
    }

    bytes2 |= (pPlayer->GetUInt32Value(PLAYER_BYTES_2) & 0xFFFFFF00);
    pPlayer->SetUInt32Value(PLAYER_BYTES, bytes);
    pPlayer->SetUInt32Value(PLAYER_BYTES_2, bytes2);
    pPlayer->SetByteValue(UNIT_FIELD_BYTES_0, 2, player_gender);
	if (pPlayer->ChangeRace(race, player_gender, bytes, bytes2))
	{
		uint32 Count = 1;
		pPlayer->DestroyItemCount(pItem, Count, false);
		pPlayer->SaveInventoryAndGoldToDB();
		pPlayer->GetSession()->LogoutPlayer(false);
		return true;
	}
    return false;
}

bool ItemUseSpell_shop_changegender(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
    if (!pPlayer) return false;

    uint8 player_gender = (pPlayer->GetGender() == GENDER_MALE) ? 1 : 0;
    pPlayer->SetByteValue(UNIT_FIELD_BYTES_0, 2, player_gender);
    pPlayer->InitPlayerDisplayIds();
    pPlayer->SaveToDB();
    return true;
}

bool GossipHello_npc_barber_go(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetRace() == RACE_GOBLIN)
    {
        switch (pPlayer->GetGender())
        {
        case GENDER_FEMALE:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "I'd like to change my hair color.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            break;
        case GENDER_MALE:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "I'd like to change my hair color.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "I'd like to change my hair style.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "I'd like to trim my beard.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
            break;
        }
    }
    pPlayer->SEND_GOSSIP_MENU(51670, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_barber_go(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1) // goblin females | hair color
    {
        uint16 color = 0;
        uint16 curr_color = pPlayer->GetByteValue(PLAYER_BYTES, 3);
        color = (curr_color == 5) ? 0 : ++curr_color; // byte limit should match the last available option

        pPlayer->SetByteValue(PLAYER_BYTES, 3, color);
        pPlayer->SetDisplayId(15435);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2) // goblin males | hair color
    {
        uint16 color = 0;
        uint16 curr_color = pPlayer->GetByteValue(PLAYER_BYTES, 3);
        color = (curr_color == 2) ? 0 : ++curr_color; // byte limit should match the last available option

        pPlayer->SetByteValue(PLAYER_BYTES, 3, color);
        pPlayer->SetDisplayId(15435);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 3) // goblin males | hair style
    {
        uint16 style = 0;
        uint16 curr_style = pPlayer->GetByteValue(PLAYER_BYTES, 2);
        style = (curr_style == 1) ? 0 : ++curr_style; // byte limit should match the last available option

        pPlayer->SetByteValue(PLAYER_BYTES, 2, style);
        pPlayer->SetDisplayId(15435);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 4) // goblin males | beards
    {
        uint16 feature = 0;
        uint16 curr_feature = pPlayer->GetByteValue(PLAYER_BYTES_2, 0);
        feature = (curr_feature == 3) ? 0 : ++curr_feature;

        pPlayer->SetByteValue(PLAYER_BYTES_2, 0, feature);
        pPlayer->SetDisplayId(15435);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    }

    pPlayer->SaveToDB();
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_surgeon_go(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetRace() == RACE_GOBLIN)
    {
        switch (pPlayer->GetGender())
        {
        case GENDER_FEMALE:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "I'd like to change my face.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1); 
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "I'd like to change my skin tone.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2); 
            break;
        case GENDER_MALE:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "I'd like to change my face.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "I'd like to change my skin tone.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
            break;
        }
    }
    pPlayer->SEND_GOSSIP_MENU(51670, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_surgeon_go(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1) // goblin females | face
    {
        uint16 face = 0;
        uint16 curr_face = pPlayer->GetByteValue(PLAYER_BYTES, 1);
        face = (curr_face == 0) ? 2 : --curr_face;

        pPlayer->SetByteValue(PLAYER_BYTES, 1, face);
        pPlayer->SetDisplayId(15435);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)  // goblin females | skin
    {
        uint16 skintone = 0;
        uint16 curr_skintone = pPlayer->GetByteValue(PLAYER_BYTES, 0);
        skintone = (curr_skintone == 2) ? 0 : ++curr_skintone;

        pPlayer->SetByteValue(PLAYER_BYTES, 0, skintone);
        pPlayer->SetDisplayId(15435);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 3) // goblin males | face
    {
        uint16 face = 0;
        uint16 curr_face = pPlayer->GetByteValue(PLAYER_BYTES, 1);
        face = (curr_face == 0) ? 3 : --curr_face;

        pPlayer->SetByteValue(PLAYER_BYTES, 1, face);
        pPlayer->SetDisplayId(15435);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 4) // goblin males | skin
    {
        uint16 skintone = 0;
        uint16 curr_skintone = pPlayer->GetByteValue(PLAYER_BYTES, 0);
        skintone = (curr_skintone == 2) ? 0 : ++curr_skintone;

        pPlayer->SetByteValue(PLAYER_BYTES, 0, skintone);
        pPlayer->SetDisplayId(15435);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(250));
    }

    pPlayer->SaveToDB();
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool ItemUseSpell_item_supercharged_chronoboon_displacer(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
	if (!pPlayer) return false;	

	if (!pPlayer->RestoreSuspendedWorldBuffs())
	{ 
		if (SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(pItem->GetProto()->Spells[0].SpellId))
		{
			DoAfterTime(pPlayer, 1500, [player = pPlayer, spellId = spellInfo->Id]()
			{
				player->RemoveSpellCooldown(spellId, true);
			}
			);
		}
	}
	
	return true;
}

bool ItemUseSpell_item_chronoboon_displacer(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
	if (!pPlayer) return false;

	if (!pPlayer->SuspendWorldBuffs())
	{
		if (SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(pItem->GetProto()->Spells[0].SpellId))
		{
			DoAfterTime(pPlayer, 1500, [player = pPlayer, spellId = spellInfo->Id]()
			{
				player->RemoveSpellCooldown(spellId, true);
			}
			);
		}
	}

	return true;
}


bool ItemUseSpell_item_mage_refreshment_table(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{

	SpellCastResult castResult = SPELL_CAST_OK;

	if (pPlayer->IsMoving() || pPlayer->IsBeingTeleported())
		castResult = SPELL_FAILED_MOVING;
	else if (pPlayer->IsInCombat())
		castResult = SPELL_FAILED_AFFECTING_COMBAT;
	else if (pPlayer->GetDeathState() == CORPSE)
		castResult = SPELL_FAILED_CASTER_DEAD;

	if (castResult == SPELL_CAST_OK)
	{
		// reagent Arcane Powder 2
		uint32 tableReagent = 17020;
		uint32 reagentCount = 2;
		if (!pPlayer->HasItemCount(tableReagent, reagentCount, false))
		{
			pPlayer->GetSession()->SendNotification("Missing reagent: Arcane Powder(%u)", reagentCount);
			castResult = SPELL_CAST_OK; // to should remove accidental cooldown
		}
		else
		{
			float dis{ 2.0F };
			float x, y, z;
			pPlayer->GetSafePosition(x, y, z);
			x += dis * cos(pPlayer->GetOrientation());
			y += dis * sin(pPlayer->GetOrientation());
			pPlayer->PMonsterEmote("%s begins to conjure a refreshment table.", nullptr, false, pPlayer->GetName());
			pPlayer->SummonGameObject(1000083, x, y, z + 0.5F, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0, true);
			pPlayer->RemoveItemCurrency(tableReagent, reagentCount);
			pPlayer->SaveInventoryAndGoldToDB();

			return true;
		}
	}

	ItemPrototype const* proto = pItem->GetProto();

	if (SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(proto->Spells[0].SpellId))
	{
		if (castResult != SPELL_CAST_OK)
			Spell::SendCastResult(pPlayer, spellInfo, castResult);

		DoAfterTime(pPlayer, 1500, [player = pPlayer, spellId = spellInfo->Id]()
		{
			player->RemoveSpellCooldown(spellId, true);
		}
		);
	}
	return true;
}


bool ItemUseSpell_item_warlock_soulwell_ritual(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{

	SpellCastResult castResult = SPELL_CAST_OK;

	if (pPlayer->IsMoving() || pPlayer->IsBeingTeleported())
		castResult = SPELL_FAILED_MOVING;
	else if (pPlayer->IsInCombat())
		castResult = SPELL_FAILED_AFFECTING_COMBAT;
	else if (pPlayer->GetDeathState() == CORPSE)
		castResult = SPELL_FAILED_CASTER_DEAD;

	if (castResult == SPELL_CAST_OK)
	{
		// reagent soul shard 5
		uint32 ritualReagent = 6265;
		uint32 reagentCount  = 5;
		if (!pPlayer->HasItemCount(ritualReagent, reagentCount, false))
		{
			pPlayer->GetSession()->SendNotification("Missing reagent: Soul Shard(%u)", reagentCount);
			castResult = SPELL_CAST_OK;  // to remove accidental cooldown
		}
		else
		{
			float dis{ 2.0F };
			float x, y, z;
			pPlayer->GetSafePosition(x, y, z);
			x += dis * cos(pPlayer->GetOrientation());
			y += dis * sin(pPlayer->GetOrientation());
			pPlayer->PMonsterEmote("%s begins a Soulwell ritual.", nullptr, false, pPlayer->GetName());
			pPlayer->SummonGameObject(1000087, x, y, z + 0.5F, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0, true);
			pPlayer->RemoveItemCurrency(ritualReagent, reagentCount);
			pPlayer->SaveInventoryAndGoldToDB();

			return true;
		}
	}

	ItemPrototype const* proto = pItem->GetProto();

	if (SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(proto->Spells[0].SpellId))
	{
		if (castResult != SPELL_CAST_OK)
			Spell::SendCastResult(pPlayer, spellInfo, castResult);

		DoAfterTime(pPlayer, 1500, [player = pPlayer, spellId = spellInfo->Id]()
		{
			player->RemoveSpellCooldown(spellId, true);
		}
		);
	}
	return true;
}


bool GOHello_go_orb_of_the_bronze_dragonflight(Player* pPlayer, GameObject* pGo)
{
    pPlayer->TeleportTo(1, -8156.288086f, -4809.846191f, 35.879276f, 5.267656f);

    return true;
}

bool GOHello_go_portable_wormhole(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->IsInCombat() || pPlayer->IsBeingTeleported() || (pPlayer->GetDeathState() == CORPSE) || pPlayer->IsMoving())
        ChatHandler(pPlayer).PSendSysMessage("The wormhole is currently unstable.");
    else
    {
        pPlayer->TeleportTo((pPlayer->GetTeam() == ALLIANCE) ? WorldLocation(0, -8828.231445f, 627.927490f, 94.055664f, 0.0f) : WorldLocation(1, 1653.7f, -4416.6f, 16.8f, 0.65f));

        if (pPlayer->GetQuestStatus(60104) == QUEST_STATUS_INCOMPLETE)
        {
            CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(51573);

            if (cInfo != nullptr)
                pPlayer->KilledMonster(cInfo, ObjectGuid());
        }
    }
    return true;
}

struct go_survival_tent : public GameObjectAI
{
    explicit go_survival_tent(GameObject* pGo) : GameObjectAI(pGo)
    {
        m_bUsed = false;
        m_uiJustUsedTimer = 1;
        m_uiUpdateTimer = 1000;
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
                MaNGOS::AnyPlayerInObjectRangeCheck check(me, 15.0f);
                MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(players, check);

                Cell::VisitWorldObjects(me, searcher, 15.0f);

                for (Player* pPlayer : players)
                {
                    pPlayer->SetFlag(PLAYER_FLAGS, PLAYER_FLAGS_RESTING);
                    if (pPlayer->isTurtle())
                        pPlayer->SetRestBonus(static_cast<float>(pPlayer->GetRestBonus() + (sObjectMgr.GetXPForLevel(pPlayer->GetLevel()) * 0.000060)));
                    else
                        pPlayer->SetRestBonus(static_cast<float>(pPlayer->GetRestBonus() + (sObjectMgr.GetXPForLevel(pPlayer->GetLevel()) * 0.000125)));
                }
                m_uiUpdateTimer = 1000;
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

GameObjectAI* GetAI_go_survival_tent(GameObject* gameobject)
{
    return new go_survival_tent(gameobject);
}

struct go_custom_rested : public GameObjectAI
{
    explicit go_custom_rested(GameObject* pGo) : GameObjectAI(pGo)
    {
        m_bUsed = false;
        m_uiJustUsedTimer = 1;
        m_uiUpdateTimer = 1000;
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
                MaNGOS::AnyPlayerInObjectRangeCheck check(me, 22.0f);
                MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(players, check);

                if (me->GetEntry() == 1000465) // Large distance for Alah'Thalas.
                    Cell::VisitWorldObjects(me, searcher, 100.0f);
                else
                    Cell::VisitWorldObjects(me, searcher, 22.0f);

                for (Player* pPlayer : players)
                {
                    pPlayer->SetFlag(PLAYER_FLAGS, PLAYER_FLAGS_RESTING);
                    pPlayer->SetRestType(REST_TYPE_IN_TAVERN);
                }
                m_uiUpdateTimer = 2500;
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

GameObjectAI* GetAI_go_custom_rested(GameObject* gameobject)
{
    return new go_custom_rested(gameobject);
}


struct go_campfire_rested : public GameObjectAI
{
    explicit go_campfire_rested(GameObject* pGo) : GameObjectAI(pGo)
    {
        m_bUsed = false;
        m_uiJustUsedTimer = 1;
        m_uiUpdateTimer = 1000;
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

                for (Player* pPlayer : players)
                {
                    pPlayer->SetFlag(PLAYER_FLAGS, PLAYER_FLAGS_RESTING);
                    pPlayer->SetRestBonus(static_cast<float>(pPlayer->GetRestBonus() + (sObjectMgr.GetXPForLevel(pPlayer->GetLevel()) * 0.000125)));
                }
                m_uiUpdateTimer = 2500;
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

GameObjectAI* GetAI_go_campfire_rested(GameObject* gameobject)
{
    return new go_campfire_rested(gameobject);
}

struct go_cot_enter_trigger : public GameObjectAI
{
    explicit go_cot_enter_trigger(GameObject* pGo) : GameObjectAI(pGo)
    {
        m_uiUpdateTimer = 1000;
    }

    uint32 m_uiUpdateTimer;

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_uiUpdateTimer < uiDiff)
        {
            std::list<Player*> players;
            MaNGOS::AnyPlayerInObjectRangeCheck check(me, 8.0f, true, false);
            MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(players, check);

            Cell::VisitWorldObjects(me, searcher, 8.0f);

            for (Player* pPlayer : players)
            {
                if (!pPlayer->IsAlive()) {
                    pPlayer->ResurrectPlayer(0.5f);
                    pPlayer->SpawnCorpseBones();
                }
                pPlayer->TeleportTo(269, -2002.51f, 6575.36f, -154.93f, 5.76f);
            }
            m_uiUpdateTimer = 1000;
        }
        else
        {
            m_uiUpdateTimer -= uiDiff;
        }
    }
};

GameObjectAI* GetAI_go_cot_enter_trigger(GameObject* gameobject)
{
    return new go_cot_enter_trigger(gameobject);
}

struct go_cot_exit_trigger : public GameObjectAI
{
    explicit go_cot_exit_trigger(GameObject* pGo) : GameObjectAI(pGo)
    {
        m_uiUpdateTimer = 1000;
    }

    uint32 m_uiUpdateTimer;

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_uiUpdateTimer < uiDiff)
        {
            std::list<Player*> players;
            MaNGOS::AnyPlayerInObjectRangeCheck check(me, 8.0f, true, false);
            MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(players, check);

            Cell::VisitWorldObjects(me, searcher, 8.0f);

            for (Player* pPlayer : players)
            {
                //pPlayer->TeleportTo(1, -8349.90f, -4060.05f, -208.06f, 3.48f);
                pPlayer->TeleportTo(1, -8756.86f, -4191.39f, -209.49f, 5.57f);
            }
            m_uiUpdateTimer = 1000;
        }
        else
        {
            m_uiUpdateTimer -= uiDiff;
        }
    }
};

bool GOHello_go_radio(Player* pPlayer, GameObject* pGo)
{
    switch (pGo->GetEntry())
    {
    case 1000055: // Speedy's Jukebox
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Teldrassil'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Brill's Tavern'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Ashenvale'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Darkmoon Faire'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Thunderbluff'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Goldshire Inn'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Magic'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 7);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Baby Murloc Song'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 8);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Barrens'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 9);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Tinker Town'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 10);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Dark Forest'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 11);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Maexxna'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 12);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Orgrimmar'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 13);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Soggy Night'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 14);
        break;
    case 1000078: // Frosty's Jukebox
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "<Switch: 100.3 FM>", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "<Switch: 101.5 FM>", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        break;
    case 3000105: // Zeppelin's Shortwave Radio
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Mudsprocket'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Emerald Forest'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Pandaria'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Wilderness'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Play 'Cozy Tavern'", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
        break;
    case 1000077: // Goblin Radio KABOOM-Box X23B76
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "<Switch: 204.3 FM>", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "<Switch: 204.5 FM>", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        break;
    }
    pPlayer->SEND_GOSSIP_MENU(90300, pGo->GetGUID());
    return true;
}

bool GOSelect_go_radio(Player* pPlayer, GameObject* pGo, uint32 sender, uint32 action)
{
    int sound = 0;
    switch (pGo->GetEntry())
    {
    case 1000055: // Speedy's Jukebox
        switch (action)
        {
        case GOSSIP_ACTION_INFO_DEF + 1: sound = 4536; break;
        case GOSSIP_ACTION_INFO_DEF + 2: sound = 5355; break;
        case GOSSIP_ACTION_INFO_DEF + 3: sound = 5532; break;
        case GOSSIP_ACTION_INFO_DEF + 4: sound = 8440; break;
        case GOSSIP_ACTION_INFO_DEF + 5: sound = 7077; break;
        case GOSSIP_ACTION_INFO_DEF + 6: sound = 4516; break;
        case GOSSIP_ACTION_INFO_DEF + 7: sound = 6669; break;
        case GOSSIP_ACTION_INFO_DEF + 8: sound = 8485; break;
        case GOSSIP_ACTION_INFO_DEF + 9: sound = 2536; break;
        case GOSSIP_ACTION_INFO_DEF + 10: sound = 7196; break;
        case GOSSIP_ACTION_INFO_DEF + 11: sound = 5376; break;
        case GOSSIP_ACTION_INFO_DEF + 12: sound = 8887; break;
        case GOSSIP_ACTION_INFO_DEF + 13: sound = 5055; break;
        case GOSSIP_ACTION_INFO_DEF + 14: sound = 6836; break;
        }
        break;
    case 1000078: // Frosty's Jukebox
        switch (action)
        {
        case GOSSIP_ACTION_INFO_DEF + 1: sound = 4516; break;
        case GOSSIP_ACTION_INFO_DEF + 2: sound = 8440; break;
        }
        break;
    case 3000105: // Zeppelin's Shortwave Radio
        switch (action)
        {
        case GOSSIP_ACTION_INFO_DEF + 1: sound = 30221; break;
        case GOSSIP_ACTION_INFO_DEF + 2: sound = 30220; break;
        case GOSSIP_ACTION_INFO_DEF + 3: sound = 30218; break;
        case GOSSIP_ACTION_INFO_DEF + 4: sound = 30217; break;
        case GOSSIP_ACTION_INFO_DEF + 5: sound = 30216; break;
        }
        break;
    case 1000077: // Goblin Radio KABOOM-Box X23B76
        switch (action)
        {
        case GOSSIP_ACTION_INFO_DEF + 1: sound = 30221; break;
        case GOSSIP_ACTION_INFO_DEF + 2: sound = 30215; break;
        }
        break;
    }
    pPlayer->PlayDirectMusic(sound);
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

GameObjectAI* GetAI_go_cot_exit_trigger(GameObject* gameobject)
{
    return new go_cot_exit_trigger(gameobject);
}

bool GOHello_go_portal_to_stormwind(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetTeam() == ALLIANCE)
        pPlayer->TeleportTo(0, -8828.231445f, 627.927490f, 94.055664f, 0.0f);

    return true;
}

bool GOHello_go_portal_to_darnassus(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetTeam() == ALLIANCE)
        pPlayer->TeleportTo(1, 9962.712891f, 2280.142822f, 1341.394409f, 0.0f);

    return true;
}

bool GOHello_go_portal_to_ironforge(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetTeam() == ALLIANCE)
        pPlayer->TeleportTo(0, -4917.0f, -955.0f, 502.0f, 0.0f);

    return true;
}

bool GOHello_go_portal_to_orgrimmar(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetTeam() == HORDE)
        pPlayer->TeleportTo(1, 1437.0f, -4421.0f, 25.24f, 1.65f);

    return true;
}

enum BountyQuests
{
    QUEST_HORDE_PLAYER = 50322,
    QUEST_ALLIANCE_PLAYER = 50323
};

bool GOHello_go_bounty(Player* pPlayer, GameObject* pGo)
{
    std::string HordePlayerName{ "H_Empty" };
    std::string AlliancePlayerName{ "A_Empty" };

    QueryResult* result_h = CharacterDatabase.PQuery("SELECT characters.name FROM characters JOIN bounty_quest_targets ON characters.guid = bounty_quest_targets.horde_player WHERE bounty_quest_targets.id = 1");
    QueryResult* result_a = CharacterDatabase.PQuery("SELECT characters.name FROM characters JOIN bounty_quest_targets ON characters.guid = bounty_quest_targets.alliance_player WHERE bounty_quest_targets.id = 1");

    switch (pPlayer->GetTeam())
    {
    case ALLIANCE:

        if (result_h)
        {
            Field* fields = result_h->Fetch();
            HordePlayerName = fields[0].GetString();
        }
        delete result_h;

        if (pPlayer->GetQuestStatus(QUEST_HORDE_PLAYER) == QUEST_STATUS_NONE)
        {
            std::stringstream WantedHordePlayerName;
            WantedHordePlayerName << "WANTED: " << HordePlayerName;
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, WantedHordePlayerName.str().c_str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        }

        if (pPlayer->GetQuestStatus(70059) == QUEST_STATUS_NONE || !pPlayer->GetQuestRewardStatus(70059)) // WANTED: Redridgeboss!
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "WANTED: Redridgeboss!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
        }
        break;

    case HORDE:

        if (result_a)
        {
            Field* fields = result_a->Fetch();
            AlliancePlayerName = fields[0].GetString();
        }
        delete result_a;

        if (pPlayer->GetQuestStatus(QUEST_ALLIANCE_PLAYER) == QUEST_STATUS_NONE)
        {
            std::stringstream WantedAlliancePlayerName;
            WantedAlliancePlayerName << "WANTED: " << AlliancePlayerName;
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, WantedAlliancePlayerName.str().c_str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        }
        break;
    case TEAM_NONE:
    case TEAM_CROSSFACTION:
        break;
    default:
        break;
    }
    pPlayer->SEND_GOSSIP_MENU(90325, pGo->GetGUID());
    return true;
}

bool GOSelect_go_bounty(Player* pPlayer, GameObject* pGo, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1) 
    {
        Quest const* pQuest = sObjectMgr.GetQuestTemplate(QUEST_HORDE_PLAYER);
        pPlayer->AddQuest(pQuest, nullptr);
    }

    if (action == GOSSIP_ACTION_INFO_DEF + 2) 
    {
        Quest const* pQuest = sObjectMgr.GetQuestTemplate(QUEST_ALLIANCE_PLAYER);
        pPlayer->AddQuest(pQuest, nullptr);
    }

    if (action == GOSSIP_ACTION_INFO_DEF + 3)
    {
        Quest const* pQuest = sObjectMgr.GetQuestTemplate(70059); // WANTED: Redridgeboss!
        pPlayer->AddQuest(pQuest, nullptr);
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GOHello_go_airplane(Player* pPlayer, GameObject* pGo)
{
    switch (pGo->GetEntry())
    {
    case 1000295: // Argent Vanguard's Flying Machine
        if (pPlayer->GetLevel() >= 25)
        {
            if (pPlayer->GetZoneId() == 139)
            {
                if (pPlayer->GetTeam() == ALLIANCE)
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "Set a course back to the Stormwind City.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                else
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "Set a course back to the Orgrimmar.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            }
            else
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "Up to the Plaguelands!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        }
        pPlayer->SEND_GOSSIP_MENU(90342, pGo->GetGUID());
        return true;
    case 1000050: // Mirage Raceway's Outstanding Flying Machine BNX-92
        if (pPlayer->GetQuestRewardStatus(50315))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "Buy a flight to the Shimmering Flats in Thousand Needles to visit the Mirage Raceway.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        pPlayer->SEND_GOSSIP_MENU(90254, pGo->GetGUID());
        return true;
    }    
    return false;
}

bool GOSelect_go_airplane(Player* pPlayer, GameObject* pGo, uint32 sender, uint32 action)
{
    uint32 mapid = 0;
    float x, y, z, o = 0.0F;

    switch (pGo->GetEntry())
    {
    case 1000295: // Argent Vanguard's Flying Machine
        if (action == GOSSIP_ACTION_INFO_DEF + 1)
        {
            if (pPlayer->GetMoney() >= 5000)
            {
                switch (pPlayer->GetTeam())
                {
                case ALLIANCE:
                    mapid = 0;
                    x = -9046.90F;
                    y = 343.26F;
                    z = 160.00F;
                    o = 2.97F;
                    break;
                case HORDE:
                    mapid = 1;
                    x = 1271.40F;
                    y = -4271.94F;
                    z = 80.00F;
                    o = 2.37F;
                    break;
                }
            }
            else
            {
                pPlayer->GetSession()->SendNotification("You don't have enough money!");
                pPlayer->CLOSE_GOSSIP_MENU();
                return false;
            }
        }
        if (action == GOSSIP_ACTION_INFO_DEF + 2)
        {
            if (pPlayer->GetMoney() >= 5000)
            {
                mapid = 0;
                x = 1645.70F;
                y = -3044.90F;
                z = 160.00F;
                o = 2.07F;
            }
            else
            {
                pPlayer->GetSession()->SendNotification("You don't have enough money!");
                pPlayer->CLOSE_GOSSIP_MENU();
                return false;
            }
        }
        pPlayer->ModifyMoney(-5000);
        pPlayer->CastSpell(pPlayer, 130, true); // Snow Fall
        pPlayer->SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID, 18510);
        pPlayer->m_Events.AddEvent(new DismountAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(15 * IN_MILLISECONDS));
        pPlayer->TeleportTo(mapid, x, y, z, o);
        return true;
    case 1000050: // Mirage Raceway's Outstanding Flying Machine BNX-92
        uint32 cost = pPlayer->GetLevel() * 100;
        if (pPlayer->GetMoney() >= cost)
        {
            pPlayer->ModifyMoney(-cost);
            pPlayer->CastSpell(pPlayer, 130, true);
            pPlayer->SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID, 18510);
            pPlayer->m_Events.AddEvent(new DismountAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(18 * IN_MILLISECONDS));
            pPlayer->TeleportTo(1, -6103.89f, -3872.74f, 55.00f, 3.57f);
            return true;
        }
        else
        {
            pPlayer->GetSession()->SendNotification("Not enough money. This flight will cost %u silver.", pPlayer->GetLevel());
            return false;
        }
    } 
    return false;
}

bool GOHello_go_stormwind_fountain(Player* pPlayer, GameObject* pGo)
{
    int32 coin = 51600 + urand(0, 44);
    pPlayer->AddItem(coin);
    pPlayer->PlayDirectSound(1204, pPlayer);
    pPlayer->HandleEmote(EMOTE_ONESHOT_KNEEL);

    int32 timer = 30 + urand(0, 70);

    pGo->SetRespawnTime(timer * MINUTE);
    pGo->Despawn();
    pGo->UpdateObjectVisibility();
    return true;
}

bool GOHello_go_brainwashing_device(Player* pPlayer, GameObject* pGo)
{
	if (pPlayer->GetLevel() >= 10 && pPlayer->HasItemCount(51715, 1))
	{
		std::string activateText;

		pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Reset my talents.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

		if (sWorld.getConfig(CONFIG_BOOL_DUAL_SPEC)) {
			// primary
			if (pPlayer->HasSavedTalentSpec(1))
			{
				activateText = "Activate Primary Specialization " + pPlayer->SpecTalentPoints(1);
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, activateText.c_str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
			}
			pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Save Primary Specialization.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);

			// secondary
			if (pPlayer->HasSavedTalentSpec(2))
			{
				activateText = "Activate Secondary Specialization " + pPlayer->SpecTalentPoints(2);
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, activateText.c_str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
			}
			pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Save Secondary Specialization.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);

            if (!pPlayer->GetQuestRewardStatus(70010))
			    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Unlock Free Specialization Switch (500g).", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
		}
	}
    pPlayer->SEND_GOSSIP_MENU(90350, pGo->GetGUID());
    return true;
}

bool GOSelect_go_brainwashing_device(Player* pPlayer, GameObject* pGo, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1)
    {
        if (pPlayer->ResetTalents())
            pPlayer->AddAura(27880);
    }
	else if (action == GOSSIP_ACTION_INFO_DEF + 2)
		pPlayer->ActivateTalentSpec(1);
	else if (action == GOSSIP_ACTION_INFO_DEF + 4)
		pPlayer->ActivateTalentSpec(2);
	else if (action == GOSSIP_ACTION_INFO_DEF + 3)
		pPlayer->SaveTalentSpec(1);
	else if (action == GOSSIP_ACTION_INFO_DEF + 5)
		pPlayer->SaveTalentSpec(2);
    else if (action == GOSSIP_ACTION_INFO_DEF + 6)
    {
        if (pPlayer->GetMoney() < 5000000)
            pPlayer->SendBuyError(BUY_ERR_NOT_ENOUGHT_MONEY, 0, 0, 0);
        else
        {
            pPlayer->ModifyMoney(-(int32)5000000);
            CharacterDatabase.DirectPExecute("REPLACE INTO character_queststatus (guid,quest,status,rewarded) VALUES ('%u', 70010, 1, 1)", pPlayer->GetGUIDLow());
        }
    }

	pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

struct stormwind_vault_portal : public GameObjectAI
{
    explicit stormwind_vault_portal(GameObject* pGo) : GameObjectAI(pGo)
    {
        m_uiUpdateTimer = 1000;
    }

    uint32 m_uiUpdateTimer;

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_uiUpdateTimer < uiDiff)
        {
            std::list<Player*> players;
            MaNGOS::AnyPlayerInObjectRangeCheck check(me, 1.0f, true, false);
            MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(players, check);

            Cell::VisitWorldObjects(me, searcher, 1.0f);

            for (Player* pPlayer : players)
            {
                pPlayer->GetSession()->SendNotification("This dungeon is currently not available.");
                //if (!pPlayer->IsAlive()) 
                //{
                //    pPlayer->ResurrectPlayer(0.5f);
                //    pPlayer->SpawnCorpseBones();
                //}
                //if (me->GetEntry() == 3000281)
                //    pPlayer->TeleportTo(0, -8677.60F, 637.04F, 96.90F, 5.3F);
                //else
                //    pPlayer->TeleportTo(35, -1.15F, 44.4F, -25.58F, 1.6F);
            }
            m_uiUpdateTimer = 1000;
        }
        else
        {
            m_uiUpdateTimer -= uiDiff;
        }
    }
};

GameObjectAI* GetAI_stormwind_vault_portal(GameObject* gameobject)
{
    return new stormwind_vault_portal(gameobject);
}

// Refreshment Portal GO

struct refreshment_portal_clicks : public GameObjectAI
{
    explicit refreshment_portal_clicks(GameObject* pGo) : GameObjectAI(pGo)
    {
        m_uiUpdateTimer = 1000;
        portal_life = 25 * IN_MILLISECONDS;
        clickers = 0;
        needed_clickers = 3;
        hold = 0;
        needed_hold = 3 * IN_MILLISECONDS;
        portal_timed_out = false;
    }

    uint32 m_uiUpdateTimer;
    uint32 portal_life;
    int clickers;
    int needed_clickers;
    int hold;
    int needed_hold;

    bool portal_timed_out;

    void UpdateAI(uint32 const uiDiff) override
    {

        if (portal_life < uiDiff)
            portal_timed_out = true;
        else
            portal_life -= uiDiff;

        if (m_uiUpdateTimer < uiDiff)
        {
            std::list<Player*> players;
            MaNGOS::AnyPlayerInObjectRangeCheck check(me, 5.0f, true, false);
            MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(players, check);

            Cell::VisitWorldObjects(me, searcher, 1.0f);

            if (portal_timed_out)
            {
                // stop players channeling in case nobody clicks
                for (auto clicker : players)
                    if (clicker->HasAura(29423))
                        clicker->RemoveAurasDueToSpell(29423);
                me->Delete();
                return;
            }

            clickers = 0;

            for (auto clicker : players)
                if (clicker->HasAura(29423))
                    clickers++;

            if (clickers >= needed_clickers)
            {
                if (hold >= needed_hold)
                {
                    for (auto clicker : players)
                        if (clicker->HasAura(29423))
                        {
                            // stop players channeling
                            clicker->RemoveAurasDueToSpell(29423);
                            // cast visual arcane explosion
                            clicker->CastSpell(clicker, 16510, false);
                        }

                    float x = me->GetPositionX();
                    float y = me->GetPositionY();
                    float z = me->GetPositionZ();

                    // summon orange basket clickable object
                    me->SummonGameObject(1000084, x, y, z + 0.375f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0, true);

                    // despawn portal
                    me->Delete();
                    return;
                }
                else
                    hold += IN_MILLISECONDS;
            }
            m_uiUpdateTimer = 1000;
        }
        else
            m_uiUpdateTimer -= uiDiff;
    }

    bool OnUse(Unit* Unit) override
    {

        if (!Unit->ToPlayer())
            return false;

        if (!Unit->ToPlayer()->IsInCombat() && !Unit->ToPlayer()->IsBeingTeleported()
            && Unit->ToPlayer()->GetDeathState() != CORPSE && !Unit->ToPlayer()->IsMoving())
        {
            Unit->ToPlayer()->CastSpell(Unit->ToPlayer(), 29423, false);
        }

        return true;
    }

};

GameObjectAI* GetAI_refreshment_portal_clicks(GameObject* gameobject)
{
    return new refreshment_portal_clicks(gameobject);
}

// Refreshment table GO

struct refreshment_table_clicks : public GameObjectAI
{

    explicit refreshment_table_clicks(GameObject* pGo) : GameObjectAI(pGo)
    {
        max_stacks = 40 * 4;                       // 40 players, 4 stacks per player
        stacks_handed_out = 0;
        table_life = 3 * MINUTE * IN_MILLISECONDS;
        stand = nullptr;
    }

    int max_stacks;
    int stacks_handed_out;
    int table_life;
    GameObject* stand;

    void UpdateAI(uint32 const uiDiff) override
    {

        if (!stand)
        {
            // summon table under the food
            float x = me->GetPositionX();
            float y = me->GetPositionY();
            float z = me->GetPositionZ();

            stand = me->SummonGameObject(2008758, x, y, z - 0.88f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0, true);
        }

        if (table_life < uiDiff || stacks_handed_out >= max_stacks)
        {
            stand->Delete();
            me->Delete();
        }
        else
            table_life -= uiDiff;
    }

    bool OnUse(Unit* Unit) override
    {

        if (!Unit->ToPlayer())
            return false;

        if (stacks_handed_out < max_stacks && Unit->ToPlayer()->GetItemCount(83004, true) < 80)
            if (Unit->ToPlayer()->AddItem(83004, 20))
                stacks_handed_out++;

        return true;
    }

};

GameObjectAI* GetAI_refreshment_table_clicks(GameObject* gameobject)
{
    return new refreshment_table_clicks(gameobject);
}


// Soulwell Portal GO

struct soulwell_portal_clicks : public GameObjectAI
{

    explicit soulwell_portal_clicks(GameObject* pGo) : GameObjectAI(pGo)
    {
        m_uiUpdateTimer = 1000;
        clickers = 0;
        needed_clickers = 3;
        hold = 0;
        needed_hold = 3 * IN_MILLISECONDS;
        portal_life = 25 * IN_MILLISECONDS;
        rune_time = 0;
        rune_summoned = false;
        portal_timed_out = false;
    }

    uint32 m_uiUpdateTimer;
    int clickers;
    int needed_clickers;
    int hold;
    int needed_hold;
    int portal_life;
    int rune_time;

    bool rune_summoned;
    bool portal_timed_out;

    GameObject* purple_rune_big;

    void UpdateAI(uint32 const uiDiff) override
    {

        if (portal_life < uiDiff)
            portal_timed_out = true;
        else
            portal_life -= uiDiff;

        if (m_uiUpdateTimer < uiDiff)
        {
            std::list<Player*> players;
            MaNGOS::AnyPlayerInObjectRangeCheck check(me, 5.0f, true, false);
            MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(players, check);

            Cell::VisitWorldObjects(me, searcher, 1.0f);

            if (portal_timed_out)
            {
                // stop players channeling in case nobody clicks
                for (auto clicker : players)
                    if (clicker->HasAura(23642))
                        clicker->RemoveAura(23642, EFFECT_INDEX_0);
                me->Delete();
                return;
            }

            clickers = 0;

            for (auto clicker : players)
                if (clicker->HasAura(23642))
                    clickers++;

            if (rune_summoned)
                rune_time++;

            if (rune_time > 2)
            {
                float x = me->GetPositionX();
                float y = me->GetPositionY();
                float z = me->GetPositionZ();

                //soulwell
                if (GameObject* soulwell = me->SummonGameObject(1000089, x, y, z, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0, true))
                {
                    soulwell->SetOwnerGuid(me->GetOwnerGuid());
                    purple_rune_big->Delete();
                    me->Delete();
                    return;
                }
            }

            if (clickers >= needed_clickers)
            {
                if (hold >= needed_hold)
                {
                    // stop players channeling
                    for (auto clicker : players)
                        if (clicker->HasAura(23642))
                            clicker->RemoveAura(23642, EFFECT_INDEX_0);

                    float x = me->GetPositionX();
                    float y = me->GetPositionY();
                    float z = me->GetPositionZ();

                    // purple rune on the ground
                    if (purple_rune_big = me->SummonGameObject(2005014, x, y, z, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0, true))
                        rune_summoned = true;

                    me->SetVisible(false);

                }
                else
                    hold += IN_MILLISECONDS;
            }
            m_uiUpdateTimer = 1000;
        }
        else
            m_uiUpdateTimer -= uiDiff;
    }

    bool OnUse(Unit* Unit) override
    {

        if (!Unit->ToPlayer())
            return false;

        if (!Unit->ToPlayer()->IsInCombat() && !Unit->ToPlayer()->IsBeingTeleported()
            && Unit->ToPlayer()->GetDeathState() != CORPSE && !Unit->ToPlayer()->IsMoving())
        {
            Unit->ToPlayer()->AddAura(23642);
            Unit->ToPlayer()->HandleEmoteCommand(EMOTE_STATE_POINT);
        }

        return true;
    }

};

GameObjectAI* GetAI_soulwell_portal_clicks(GameObject* gameobject)
{
    return new soulwell_portal_clicks(gameobject);
}

// soulwell GO

struct soulwell_clicks : public GameObjectAI
{

    explicit soulwell_clicks(GameObject* pGo) : GameObjectAI(pGo)
    {
        max_healthstones = 40;
        healthstones_handed_out = 0;
        soulwell_life = 3 * MINUTE * IN_MILLISECONDS;
        itemSoulStone = 9421; // untalented
    }

    int max_healthstones;
    int healthstones_handed_out;
    int soulwell_life;
    int itemSoulStone;

    void UpdateAI(uint32 const uiDiff) override
    {

        if (soulwell_life < uiDiff || healthstones_handed_out >= max_healthstones)
            me->Delete();
        else
            soulwell_life -= uiDiff;
    }

    bool OnUse(Unit* Unit) override
    {

        if (!Unit->ToPlayer())
            return false;

        if (me->GetOwner() && me->GetOwner()->ToPlayer())
        {
            if (me->GetOwner()->ToPlayer()->HasSpell(18692))        // 1/2 improved healthstone talent
                itemSoulStone = 19012;
            if (me->GetOwner()->ToPlayer()->HasSpell(18693))        // 2/2 improved healthstone talent
                itemSoulStone = 19013;
        }

        if (healthstones_handed_out < max_healthstones && Unit->ToPlayer()->GetItemCount(itemSoulStone, true) == 0)
        {
            Unit->ToPlayer()->AddItem(itemSoulStone, 1);
            healthstones_handed_out++;
        }

        return true;
    }

};

GameObjectAI* GetAI_soulwell_clicks(GameObject* gameobject)
{
    return new soulwell_clicks(gameobject);
}

bool ItemUseSpell_item_picnic_umbrella(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
    float dis{ 2.0F };
    float x, y, z;
    pPlayer->GetSafePosition(x, y, z);
    x += dis * cos(pPlayer->GetOrientation());
    y += dis * sin(pPlayer->GetOrientation());

    pPlayer->SummonGameObject(2004896, x, y, z, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 300, true);
    pPlayer->SummonGameObject(2004895, x + 0.5, y + 0.5, z, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 300, true);
    return false;
}

bool GossipHello_npc_dirge_the_bouncer(Player* p_Player, Creature* p_Creature)
{
    p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "What is this place?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Why do they call you Dirge?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
    p_Player->SEND_GOSSIP_MENU(90200, p_Creature->GetGUID());
    return true;
}

bool GossipSelect_npc_dirge_the_bouncer(Player* p_Player, Creature* p_Creature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
        p_Creature->MonsterSay("This be tha Grey Raven lad. Ye better have coin ta pay for yer drinks. There's no handouts here.", 7, 0);
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 3)
        p_Creature->MonsterSay("They call me Dirge, 'cause I'm tha last thing ye hear before they put ye in tha ground.", 7, 0);
    p_Player->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_aspirant_shadewalker(Player* p_Player, Creature* p_Creature)
{
    p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "What is Ardent Watch?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Who is allowed in Ardent Watch?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
    p_Player->SEND_GOSSIP_MENU(90343, p_Creature->GetGUID());
    return true;
}

bool GossipSelect_npc_aspirant_shadewalker(Player* p_Player, Creature* p_Creature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
        p_Creature->MonsterSay("Ardent Watch is the central most base of operations for the Argent Dawn and its foreign operations battalion, The Argent Vanguard. Besides Light's Hope itself, it is one of the most well fortified bastions in the fight against the Scourge within the former Eastweald.", 7, 0);
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
        p_Creature->MonsterSay("Being members of the Argent Dawn, they hold no affiliations to the Horde and Alliance short of co-operation in our fight against the Scourge. Due to necessity, the Argent Dawn and Scarlet Crusade have signed a pact making them non-hostile for the moment, yet tensions exist. Members of the Scourge or other shadowy organizations will likely not be welcomed.", 7, 0);
    p_Player->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_joshua_westfield(Player* p_Player, Creature* p_Creature)
{
    p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "What is Redwater Syndicate?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    p_Player->SEND_GOSSIP_MENU(90341, p_Creature->GetGUID());
    return true;
}

bool GossipSelect_npc_joshua_westfield(Player* p_Player, Creature* p_Creature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        p_Creature->MonsterSay("We are a syndicate, we make profit, we work for ourselves and we fight like brothers in arms. Do you think you have what it takes to join a syndicate? Talk to Grohkan!", 7, 0);
        p_Creature->HandleEmote(EMOTE_ONESHOT_EXCLAMATION);
    }

    p_Player->CLOSE_GOSSIP_MENU();
    return true;
}


bool GossipHello_npc_terry_palin(Player* pPlayer, Creature* pCreature)
{

    CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(51299);

    if (cInfo != nullptr)
        pPlayer->KilledMonster(cInfo, ObjectGuid());


    pPlayer->PrepareQuestMenu(pCreature->GetGUID());
    pPlayer->SEND_GOSSIP_MENU(90338, pCreature->GetGUID());
    return true;
}

bool GossipHello_npc_lordaeron_alice(Player* p_Player, Creature* p_Creature)
{
    p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "<Choose blue stone>", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "<Choose red stone>", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
    p_Player->SEND_GOSSIP_MENU(90201, p_Creature->GetGUID());
    return true;
}

bool GossipSelect_npc_lordaeron_alice(Player* p_Player, Creature* p_Creature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        p_Creature->MonsterTextEmote("Alice waves her hand in front of your face. Your reason for coming is no longer clear to you, and you forget what you know about the Ghosts of Lordaeron.");
        p_Creature->MonsterSay("Go! Take the ferry back, and begone! Never return to this place if you value your life!", 33, 0);
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
        p_Creature->MonsterSay("Ah, so the truth is too enticing for you to look away. Very well. Go on ahead, and speak with whoever is here, or wait until someone arrives. It will be a difficult road for you, but I assure you it is the correct one.", 33, 0);

    p_Player->CLOSE_GOSSIP_MENU();
    return true;
}

#define ELUNE_WINTER_QUEST 50318     
#define EGGNOG_ITEM        17198      
#define MOONKIN_FED        19705      

bool GossipHello_npc_shivering_moonkin(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->HasAura(MOONKIN_FED))
    {
        pCreature->MonsterSay("Hoot!");
        pCreature->SendPlaySpellVisual(SPELL_VISUAL_KIT_DRINK);
    }
    else
    {
        if (pPlayer->GetQuestStatus(ELUNE_WINTER_QUEST) == QUEST_STATUS_INCOMPLETE)
        {
            if (pPlayer->HasItemCount(EGGNOG_ITEM, 1, 0))
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "<Give moonkin a hot cup of Egg Nog>", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        }
        pPlayer->SEND_GOSSIP_MENU(90318, pCreature->GetGUID());
    }
    return true;
}

bool GossipSelect_npc_shivering_moonkin(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (!pCreature)
        return true;

    if (!pPlayer)
        return true;

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->MonsterSay("Hoot!");
        pCreature->MonsterTextEmote(90319);
        pCreature->SendPlaySpellVisual(SPELL_VISUAL_KIT_DRINK);
        pPlayer->AddItem(51248); // Add Snow Covered Feather
        pPlayer->RemoveItemCurrency(EGGNOG_ITEM, 1);
        pCreature->AddAura(MOONKIN_FED);

        SpellAuraHolder* holder = pCreature->GetSpellAuraHolder(MOONKIN_FED);
        holder->SetAuraDuration(300000); // 5 minutes
        holder->UpdateAuraDuration();
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_tinsel(Player* pPlayer, Creature* pCreature)
{
    pPlayer->PrepareQuestMenu(pCreature->GetGUID());
    pPlayer->SEND_GOSSIP_MENU(90335, pCreature->GetGUID());
    return true;
}


bool GossipHello_npc_misletoe(Player* pPlayer, Creature* pCreature)
{
    pPlayer->PrepareQuestMenu(pCreature->GetGUID());
    pPlayer->SEND_GOSSIP_MENU(90336, pCreature->GetGUID());
    return true;
}

bool GossipHello_npc_frosty(Player* pPlayer, Creature* pCreature)
{
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Happy Winter Veil, Frosty!\nTeleport me to the Winter Veil Vale!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    pPlayer->SEND_GOSSIP_MENU(90326, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_frosty(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        static const WorldLocation m_WinterVeilVale(0, -4746.845F, 622.921F, 401.9f, 2.49F);
        pPlayer->TeleportTo(m_WinterVeilVale);
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_save_shark(Player* pPlayer, Creature* pCreature)
{
    if (!pPlayer->GetQuestRewardStatus(80383))
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Shark seems friendly and you are lured to it's soft skin to touch and pet it.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        pPlayer->SEND_GOSSIP_MENU(90670, pCreature->GetGUID());
        return true;
    }
    return false;
}

bool GossipSelect_npc_save_shark(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(81002);
        pPlayer->KilledMonster(cInfo, ObjectGuid());
        pCreature->MonsterTextEmote("Shark seems eager to touch and you'd swear it could send out a satisfied purring were it a cat. Shark's skin is soft to the touch and seems to be irritating it a bit. You could tell from that fast tail swing on it's way off.");
        pCreature->GetMotionMaster()->MoveConfused();
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_vip_invite(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(80382) == QUEST_STATUS_INCOMPLETE)
    {
        switch (pCreature->GetEntry())
        {
        case 3391: // Gazlowe
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Sandrocket is hosting a beach party, please, pay her a visit!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            break;
        case 2496: // Baron Revilgaz
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Risa Sandrocket is hosting a beach party, please, pay her a visit!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            break;
        }
    }
    pPlayer->PrepareQuestMenu(pCreature->GetGUID());
    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_vip_invite(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->MonsterSay("Ah, so Risa is now the one who throw out these parties nowadays, eh? That's very nice to know, thank for that, my friend! Knowledge is power and power can bring you a lot of gold, right? Exactly. I'll see you around, partner.");
        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(81000);
        pPlayer->KilledMonster(cInfo, ObjectGuid());
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        pCreature->MonsterSay("You're telling me there's a beach party?! I get the feelin' that if I'm being invited this is no small get-together. Normally I'd say I'm too busy but I'm sensing an opportunity here - rest, relaxation, and revenue! I'll be there for sure, ya can bet on that.");
        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(81001);
        pPlayer->KilledMonster(cInfo, ObjectGuid());
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

struct npc_chihkoaAI : public ScriptedPetAI
{
    npc_chihkoaAI(Creature* pCreature) : ScriptedPetAI(pCreature)
    {
    }

    void ReceiveEmote(Player* pPlayer, uint32 uiEmote)
    {
        if (m_creature && m_creature->IsAlive())
        {
            if (uiEmote == TEXTEMOTE_DANCE)
                m_creature->MonsterSay("Yeee-ha!");

            if (pPlayer->ToPlayer()->GetQuestStatus(50328) == QUEST_STATUS_INCOMPLETE)
            {
                if (pPlayer->ToPlayer()->GetDrunkValue() > 0)
                {
                    int32 dummy_player{ 70011 };
                    CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(dummy_player);

                    if (cInfo != nullptr)
                        pPlayer->ToPlayer()->KilledMonster(cInfo, ObjectGuid());
                }

            }
        }
    }
};

CreatureAI* GetAI_npc_chihkoa(Creature* pCreature)
{
    return new npc_chihkoaAI(pCreature);
}

struct npc_scripted_companionAI : public ScriptedPetAI
{
    bool init = false;

    npc_scripted_companionAI(Creature* pCreature) : ScriptedPetAI(pCreature)
    {
        init = false;
    }

    void UpdatePetOOCAI(const uint32 uiDiff)
    {
        if (!init && m_creature && m_creature->IsAlive() && m_creature->IsPet())
        {
            init = true;
            m_creature->GetMotionMaster()->MoveFollow(m_creature->GetCharmerOrOwnerPlayerOrPlayerItself(),
                PET_FOLLOW_DIST,
                270.0f * (M_PI_F / 180.0f));
        }
    }

    void ReceiveEmote(Player* pPlayer, uint32 uiEmote)
    {
        if (m_creature && m_creature->IsAlive() && m_creature->IsPet())
        {
            if (uiEmote == TEXTEMOTE_DANCE)
                m_creature->HandleEmoteCommand(EMOTE_ONESHOT_DANCE);
        }
    }
};

CreatureAI* GetAI_npc_scripted_companion(Creature* pCreature)
{
    return new npc_scripted_companionAI(pCreature);
}

struct lil_foot_petAI : public ScriptedPetAI
{
    bool init = false;

    lil_foot_petAI(Creature* pCreature) : ScriptedPetAI(pCreature)
    {
        init = false;
    }

    void UpdatePetOOCAI(const uint32 uiDiff)
    {
        if (!init && m_creature && m_creature->IsAlive() && m_creature->IsPet())
        {
            init = true;
            m_creature->PMonsterSay("Aww! I hate being little!");
            m_creature->GetMotionMaster()->MoveFollow(m_creature->GetCharmerOrOwnerPlayerOrPlayerItself(),
                PET_FOLLOW_DIST,
                270.0f * (M_PI_F / 180.0f));
        }
    }

};

CreatureAI* GetAI_lil_foot_pet(Creature* pCreature)
{
    return new lil_foot_petAI(pCreature);
}

#define ONCE_UPON_A_SHEEP        60005
#define LOST_FARM_SHEEP_ITEM     51220
#define DELICIOUS_ELWYNN_TRUFFLE 51218
#define WOOL_WILL_WORL           60008
#define FLOCK_OF_WOOL            51223

bool GossipHello_npc_lost_farm_sheep(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(ONCE_UPON_A_SHEEP) == QUEST_STATUS_INCOMPLETE)
    {
        if (pPlayer->HasItemCount(DELICIOUS_ELWYNN_TRUFFLE, 0))
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Come with me, if you want to live!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        }
        else
        {
            pCreature->MonsterSay("Ba-a-a-h! Ba-a-a-h!");
            pCreature->GetMotionMaster()->MoveConfused();
        }
    }
    if (pPlayer->GetQuestStatus(WOOL_WILL_WORL) == QUEST_STATUS_INCOMPLETE)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Attempt to gather some wool.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
    }

    pPlayer->SEND_GOSSIP_MENU(90310, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_lost_farm_sheep(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        if (!pPlayer)
            return false;

        pCreature->MonsterSay("Ba-a-a-h!");
        pCreature->MonsterTextEmote("The sheep scarfs down the truffle, and then it jumps into your bags to rifle around for more!");
        pCreature->ForcedDespawn();
        pPlayer->AddItem(LOST_FARM_SHEEP_ITEM);
        pPlayer->RemoveItemCurrency(DELICIOUS_ELWYNN_TRUFFLE, 1);
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        if (!pPlayer)
            return false;

        int chance_array[100];

        for (int i = 0; i < 100; i++)
        {
            int chance_array = i;
        }

        int chance_rand = rand() % 100;

        if (chance_rand[chance_array] >= 80)
        {
            pCreature->MonsterSay("Ba-a-a-h?");
            pPlayer->AddItem(FLOCK_OF_WOOL, 1);
        }
        else
        {
            pCreature->MonsterSay("Ba-a-a-h! Ba-a-a-h!");
            pCreature->GetMotionMaster()->MoveFleeing(pPlayer, 100);
            pPlayer->KnockBack(2.0F, 3.0F, 3.0F);
        }
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}


bool GossipHello_daenerys(Player* pPlayer, Creature* pCreature)
{
    if (!pPlayer->HasItemCount(50236, 1, true))
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Do... do you want me to hold that cloak for you?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
    pPlayer->SEND_GOSSIP_MENU(90002, pCreature->GetGUID());
    return true;
}

bool GossipSelect_daenerys(Player* player, Creature* creature, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF) {
        creature->PMonsterSay("Thanks, a good friend of mine crafted this cloak using one of Drogon's scales. You can have it, I don't need it anymore.");
        player->AddItem(50236, 1);
    }
    player->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_title_masker(Player* pPlayer, Creature* pCreature)
{
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I'm not interested, goodbye.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
    if (pPlayer->IsIgnoringTitles())
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I'm ready to show my rank again!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    else if (pPlayer->GetMoney() >= 50000)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Yes... I want some privacy, can you hide my rank? I'll give you the gold.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
    pPlayer->SEND_GOSSIP_MENU(90003, pCreature->GetGUID());
    return true;
}

bool GossipSelect_title_masker(Player* player, Creature* creature, uint32 sender, uint32 action) {
    if (action > GOSSIP_ACTION_INFO_DEF) {
        bool hideRank = action == GOSSIP_ACTION_INFO_DEF + 2;
        player->SetIgnoringTitles(hideRank);
        if (hideRank) {
            player->ModifyMoney(-50000);
            ChatHandler(player).PSendSysMessage("|cffff8040You carefully place 5 gold coins in the dealer's hand.|r");
        }
        ChatHandler(player).SendSysMessage("Please logout and login again!");
    }
    player->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_birthday_dragon(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(60000) == QUEST_STATUS_INCOMPLETE)
        if (!pPlayer->GetQuestRewardStatus(60000))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Speedy is having a Birthday Party today!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
    pPlayer->SEND_GOSSIP_MENU(90301, pCreature->GetGUID());
    return true;
}

bool GossipSelect_birthday_dragon(Player* player, Creature* creature, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF) {
        creature->PMonsterSay("A birthday party? Why would HE need such a ... Nevermind. Since it's Speedy, I'm going to bring some joy to old friend no matter the reason.");
        player->AddItem(51022, 1);
    }
    player->CLOSE_GOSSIP_MENU();
    return true;
}

enum DressingBoxes
{
    FESTIVALE_GARMENTS = 50022,
    DEMON_HUNTER = 50023,
    CRIMSON_INQUISITOR = 50025,
    KULTIRAS_GUARD = 50382,
    THERAMORE_GUARD = 50383,
    DWARF_MOUNTAINEER = 50386,
    NIGHTWATCHMAN = 50388,
    STROMGARDE_GURAD = 50384,
    SCHOLOMANCE_STUDENT = 50101,
    DARKMASTER = 50509,
    GOLDWEAVE_RAINMENT = 50511,
    NECROMANCER = 50513,
    STORMWIND_GUARD = 50381,
    DARNASSUS_SENTINEL = 50385,
    ORGRIMMAR_GUARD = 50389,
    THUNDER_BLUFF_GUARD = 50390,
    SENJIN_GUARD = 50416,
    DEATHGUARD = 50387,
    HIDDEN_SET = 50024,

    FASHION_COIN = 51217
};

bool GossipHello_npc_riding_horse(Player* p_Player, Creature* p_Creature)
{
    p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Hire this horse for 50 copper.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    p_Player->SEND_GOSSIP_MENU(90365, p_Creature->GetGUID());
    return true;
}

bool GossipSelect_npc_riding_horse(Player* p_Player, Creature* p_Creature, uint32 /*uiSender*/, uint32 uiAction)
{
    uint32 spell{ 0 };

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        if (p_Player->GetMoney() >= 50)
        {
            switch (p_Creature->GetEntry())
            {
            case 51560: spell = 468; break;
            case 51561: spell = 471; break;
            default:
                break;
            }
            p_Player->CastSpell(p_Player, spell, true);
            p_Player->ModifyMoney(-50);
        }
        else
            p_Player->GetSession()->SendNotification("You don't have enough money!");
    }
    p_Player->CLOSE_GOSSIP_MENU();
    return true;
}

class  StopFlyingAfterTime : public BasicEvent
{
public:
    explicit StopFlyingAfterTime(uint64 player_guid) : BasicEvent(), player_guid(player_guid) {}

    bool Execute(uint64 e_time, uint32 p_time) override
    {
        Player* player = ObjectAccessor::FindPlayer(player_guid);
        if (player)
        {
            player->Unmount();

            player->SetFlying(false);
            player->UpdateSpeed(MOVE_SWIM, false, 1.0F);

            player->m_movementInfo.UpdateTime(WorldTimer::getMSTime());
            WorldPacket stop_swim(MSG_MOVE_STOP_SWIM, 31);
            stop_swim << player->GetPackGUID();
            stop_swim << player->m_movementInfo;
            player->SendMovementMessageToSet(std::move(stop_swim), true);
        }
        return false;
    }
private:
    uint64 player_guid;
};

bool GossipHello_npc_flying_mount(Player* pPlayer, Creature* pCreature)
{
    switch (pCreature->GetEntry())
    {
    case 51562: // Goldshire Gryphon
        if (pPlayer->GetQuestRewardStatus(60070))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Feed the gryphon and see what will happen.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());
        pPlayer->SEND_GOSSIP_MENU(90366, pCreature->GetGUID());
        return true;
    case 51685: // Darkshore Wyvern
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Take me out of here.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2); 
        pPlayer->SEND_GOSSIP_MENU(1, pCreature->GetGUID());
        return true;
    case 51686: // Feralas Gryphon
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Take me out of here.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3); 
        pPlayer->SEND_GOSSIP_MENU(90366, pCreature->GetGUID());
        return true;
    case 65018: // Alormion (Bronze Drake)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Please guide me through Caverns of Time.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4); 
        pPlayer->SEND_GOSSIP_MENU(51674, pCreature->GetGUID());
        return true;
    }
    return false;
}

bool GossipSelect_npc_flying_mount(Player* p_Player, Creature* p_Creature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        if (p_Player->HasItemCount(422, 1)) // Goldshire Quest Gryphon
        {
            p_Player->GetSession()->SendNotification("You will be dismounted in 30 seconds.");
            p_Player->SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID, 18274);
            p_Player->m_Events.AddEvent(new StopFlyingAfterTime(p_Player->GetGUID()), p_Player->m_Events.CalculateTime(30 * IN_MILLISECONDS));
            p_Player->SetFlying(true);
            p_Player->RemoveItemCurrency(422, 1);
            p_Player->UpdateSpeed(MOVE_SWIM, false, 6.0F);
        }
        else
            p_Player->PMonsterEmote("Gryphon clearly looks hungry and frustrated. Perhaps a handful of famous Dwarven Mild could do some good?", nullptr, false);
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2 || uiAction == GOSSIP_ACTION_INFO_DEF + 3 || uiAction == GOSSIP_ACTION_INFO_DEF + 4)
    {
        p_Player->GetSession()->SendNotification("Your flight will last 45 seconds.");
        switch (uiAction)
        {
        case GOSSIP_ACTION_INFO_DEF + 2: p_Player->SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID, 295);   break; // Gryphon
        case GOSSIP_ACTION_INFO_DEF + 3: p_Player->SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID, 18274); break; // Wywern
        case GOSSIP_ACTION_INFO_DEF + 4: p_Player->SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID, 18279); break; // Bronze Drake
        }
        p_Player->m_Events.AddEvent(new StopFlyingAfterTime(p_Player->GetGUID()), p_Player->m_Events.CalculateTime(45000));
        p_Player->SetFlying(true);
        p_Player->UpdateSpeed(MOVE_SWIM, false, 6.0F);
    }
    p_Player->CLOSE_GOSSIP_MENU();
    return true;
}
#define KODO_CALFLING 51599

enum palkeoteEvents
{
    EVENT_WEAKNESS = 1,
    EVENT_FEAR
};

enum palkeoteSpells
{
    SPELL_CURSE_OF_WEAKNESS = 11708,
    SPELL_FEAR = 26580
};

struct palkeoteAI : public ScriptedAI
{
    palkeoteAI(Creature* c) : ScriptedAI(c)
    {
        Reset();
    }

    EventMap m_events;
    bool calfActive = false;

    void Reset()
    {
        m_events.Reset();
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PASSIVE);
        m_creature->SetFactionTemplateId(m_creature->GetCreatureInfo()->faction);
        calfActive = false;
    }

    void Aggro()
    {
        m_events.ScheduleEvent(EVENT_WEAKNESS, Seconds(urand(4, 8)));
        m_events.ScheduleEvent(SPELL_FEAR, Seconds(urand(8, 12)));
    }

    void JustRespawned()
    {
        Reset();
    }

    void UpdateAI(const uint32 diff)
    {
        if (calfActive)
            return;

        if (m_creature->GetHealthPercent() < 20)
        {
            calfActive = true;

            m_creature->CombatStop(true);
            m_creature->ClearInCombat();
            m_creature->SetFactionTemplateId(35);
            m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PASSIVE);


            ThreatList const& tList = m_creature->GetThreatManager().getThreatList();
            for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i)
            {
                Unit* pUnit = m_creature->GetMap()->GetUnit((*i)->getUnitGuid());
                if (pUnit && (pUnit->GetTypeId() == TYPEID_PLAYER))
                {
                    CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(51598);
                    pUnit->ToPlayer()->KilledMonster(cInfo, ObjectGuid());
                }
            }

            m_creature->ForcedDespawn(10 * 1000);

            float fX, fY, fZ;
            m_creature->GetRandomPoint(m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), 60.0f, fX, fY, fZ);
            m_creature->SummonCreature(KODO_CALFLING, fX, fY, fZ, 0.0F, TEMPSUMMON_TIMED_DESPAWN, 10 * 1000);
            m_creature->SetWalk(true);
            m_creature->GetMotionMaster()->MovePoint(0, fX, fY, fZ + 1.0F);
            return;
        }

        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        m_events.Update(diff);
        while (uint32 eventId = m_events.ExecuteEvent())
        {
            switch (eventId)
            {
            case EVENT_WEAKNESS:
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_CURSE_OF_WEAKNESS);
                m_events.Repeat(Seconds(urand(4, 8)));
                break;
            case EVENT_FEAR:
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_FEAR);
                m_events.Repeat(Seconds(urand(8, 12)));
                break;
            }
        }

        DoMeleeAttackIfReady();
    }

};

CreatureAI* GetAI_palkeote(Creature* _Creature)
{
    return new palkeoteAI(_Creature);
}

bool GossipHello_npc_ropaw(Player* p_Player, Creature* p_Creature)
{
    p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Tell me my fortune.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    p_Player->SEND_GOSSIP_MENU(urand(90650, 90667), p_Creature->GetGUID());
    return true;
}

bool GossipSelect_npc_ropaw(Player* p_Player, Creature* p_Creature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        p_Creature->MonsterSay(urand(90560, 90628));
    }
    p_Player->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_ArenaMaster(Player* player, Creature* creature)
{
    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Battle in the Blood Ring (2v2 Solo).", GOSSIP_SENDER_MAIN, 1);
    if (player->GetGroup())
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Battle in the Blood Ring (2v2 Group).", GOSSIP_SENDER_MAIN, 2);
    player->PlayerTalkClass->SendGossipMenu(195007, creature->GetGUID());

    return true;
}

bool GossipSelect_ArenaMaster(Player* player, Creature* creature, uint32 sender, uint32 action)
{
    switch (action)
    {
    case 1:
    case 2:
        player->AddToArenaQueue(action == 2);
        break;
    }

    player->CLOSE_GOSSIP_MENU();
    return true;
}

#define MINING_PICK 2901
#define ORNATE_SPLYGLASS 5507
#define LIGHT_LEATHER 2318

#define FACTION_RATCHET 470

#define MINING_ENCHANT_5 906
#define SPELL_VISUAL 14867

#define DEFAULT_TEXT 70000
#define UNAVAILABLE_TEXT 70001
#define ALREADY_INSTALLED_TEXT 70002

bool GossipHello_MiningEnchanter(Player* player, Creature* creature)
{
    if (player->GetReputationRank(FACTION_RATCHET) >= REP_FRIENDLY)
    {
        Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);
        if (item && item->GetEnchantmentId(PERM_ENCHANTMENT_SLOT) == MINING_ENCHANT_5)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I don't think I want it anymore...", GOSSIP_SENDER_MAIN,
                GOSSIP_ACTION_INFO_DEF + 1);
            player->SEND_GOSSIP_MENU(ALREADY_INSTALLED_TEXT, creature->GetGUID());
        }
        else
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Please, install the telescopic lens!", GOSSIP_SENDER_MAIN,
                GOSSIP_ACTION_INFO_DEF + 2);
            player->SEND_GOSSIP_MENU(DEFAULT_TEXT, creature->GetGUID());
        }

        return true;
    }

    player->SEND_GOSSIP_MENU(UNAVAILABLE_TEXT, creature->GetGUID());
    return true;
}

bool GossipSelect_MiningEnchanter(Player* player, Creature* creature, uint32 sender, uint32 action)
{
    bool error = false;
    const char* text;

    if (action == GOSSIP_ACTION_INFO_DEF + 1)
    {
        text = "Sorry, no refunds.";
        error = true;
    }

    Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);
    if (!error && (!item || item->GetEntry() != MINING_PICK))
    {
        text = "I can't inspect your pick if you don't equip it!";
        error = true;
    }

    if (!error && (!player->HasItemCount(ORNATE_SPLYGLASS) || !player->HasItemCount(LIGHT_LEATHER, 10)))
    {
        text = "Either bring me the materials or quit wasting my time!";
        error = true;
    }

    if (!error)
    {
        player->RemoveItemCurrency(ORNATE_SPLYGLASS, 1);
        player->RemoveItemCurrency(LIGHT_LEATHER, 10);

        creature->SendSpellGo(creature, SPELL_VISUAL);

        item->ClearEnchantment(PERM_ENCHANTMENT_SLOT);
        item->SetEnchantment(PERM_ENCHANTMENT_SLOT, MINING_ENCHANT_5, 0, 0);
    }
    else
        creature->MonsterSay(text);

    player->CLOSE_GOSSIP_MENU();
    return true;
}

bool QuestAccept_npc_mysterious_stranger(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 80388) // Stay awhile and listen...
    {
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_LAUGH);
        pQuestGiver->MonsterSayToPlayer("What would misery, frustration, and pain bring you? Fame? Glory?", pPlayer);
        ChatHandler(pPlayer).PSendSysMessage("If you complete this quest you will become mortal. In this mode you only have one life and can only trade and group up with other mortal players. Your bag, bank and mail items will be destroyed.");
    }
    return false;
}

bool QuestRewarded_npc_mysterious_stranger(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 80388) // Stay awhile and listen...
    {
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_TALK);
        pQuestGiver->MonsterSayToPlayer("You are aware this won't be easy, now go and stay safe on your journey.", pPlayer);
        if (pPlayer->SetupHardcoreMode())
            return true;
    }
    return false;
}

#define OK_TEXT 70003
#define NOT_GUILD_TEXT 70004
#define ON_CAST_TEXT 70005
#define TRAVELER_GUILD_ID 172

bool GossipHello_DinkaDinker(Player* player, Creature* creature)
{
    if (player->GetGuildId() == TRAVELER_GUILD_ID)
    {
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Please, use your magic on me!", GOSSIP_SENDER_MAIN,
            GOSSIP_ACTION_INFO_DEF + 1);
        player->SEND_GOSSIP_MENU(OK_TEXT, creature->GetGUID());
        return true;
    }

    player->SEND_GOSSIP_MENU(NOT_GUILD_TEXT, creature->GetGUID());
    return true;
}

bool GossipSelect_DinkaDinker(Player* player, Creature* creature, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1)
    {
        creature->CastSpell(player, SPELL_VISUAL, true);
        player->AddAura(130); // Slow Fall
        creature->MonsterSay(ON_CAST_TEXT);
    }
    player->CLOSE_GOSSIP_MENU();
    return true;
}


enum AlahthalasQuests
{
    ASSISTING_CHILDREN_OF_THE_SUN = 80250,
    NPC_CUSTOM_OBJECTIVE_ASSISTING_CHILDREN_OF_THE_SUN = 80229,
    TO_ALAHTHALAS = 80251,
    CRYSTAL_CLEAR_TASK = 80002,
    RELICS_IN_FERALAS = 80003,
    WELCOME_TO_ALAHTHALAS = 80256
};

bool GossipHello_npc_caledra(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(ASSISTING_CHILDREN_OF_THE_SUN) == QUEST_STATUS_INCOMPLETE)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Greetings! I'm here to help.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    }

    pPlayer->PrepareQuestMenu(pCreature->GetGUID());
    pPlayer->SEND_GOSSIP_MENU(90372, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_caledra(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        DoAfterTime(pPlayer, 5 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("I'm glad that you wish to assist us. I will do my best to recap where we stand.", player);
        });

        DoAfterTime(pPlayer, 10 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("I will explain the situation. I am Caledra Dawnbreeze, formerly a Ranger-Captain of the Farstriders during the Second War, but now merely a citizen of Stormwind. After the loss of Quel\'Thalas, our people suffered deeply due to our addiction to magic. Some of us, led by our former prince, Kael\'thas, were seduced by dark magic, and, from what I\'ve heard, they betrayed the Alliance by siding with the creatures known as the Naga.", player);
        });

        DoAfterTime(pPlayer, 20 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("I've heard other... more troubling accounts, but regardless, they are lost to us. We should focus on those who have chosen to remain in the Alliance. A few months ago, I managed to gather representatives of our people from all outlying settlements such as the Farstrider lodges.", player);
        });


        DoAfterTime(pPlayer, 30 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("There was a meeting where it was agreed upon that the time has come for our people to join their efforts so that we may create a home for ourselves. One where we could rebuild our people in time. Living in a military lodge or cities belonging to other races simply isn't the way to make progress in reforming our culture.", player);
        });


        DoAfterTime(pPlayer, 40 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("Thankfully Dalaran's surviving archives provided an opportunity. Roughly a century ago, an outpost was built on a peninsula near Quel'Thalas. The outpost is powered by an arcane crystal infused with the energies of the Sunwell itself.", player);
        });

        DoAfterTime(pPlayer, 50 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("In other words, it's a way for us to cope with the addiction to magic that we've been suffering from. The crystal will not last forever, but it will buy us time to find a cure. Our scouts have managed to find the site, and they've confirmed that it is inhabitable. Our people have begun to settle the outpost, and they have named it Alah'Thalas, the Land of Light in our tongue.", player);
        });

        DoAfterTime(pPlayer, 60 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(NPC_CUSTOM_OBJECTIVE_ASSISTING_CHILDREN_OF_THE_SUN);
            if (cInfo != nullptr)
                player->KilledMonster(cInfo, ObjectGuid());

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("However, the buildings are old and have not been maintained properly. We lack the reagents and materials to sustain the enchantments that protect the outpost. Likewise, the local mine has been infested with creatures. In other words, any help you provide would be greatly appreciated!", player);
        });
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_elsharin(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestRewardStatus(TO_ALAHTHALAS))
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Please open a portal to Alah'Thalas.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    }
    pPlayer->PrepareQuestMenu(pCreature->GetGUID());
    pPlayer->SEND_GOSSIP_MENU(90371, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_elsharin(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->MonsterSay("Safe travels!");
        //float dis{ 1.0F };
        //float x, y, z;
        //pPlayer->GetSafePosition(x, y, z);
        //x += dis * cos(pPlayer->GetOrientation());
        //y += dis * sin(pPlayer->GetOrientation());
        pPlayer->SummonGameObject(3000220, -9002.817F, 883.549F, 29.58F, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 30, true);
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_sunkiss(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestRewardStatus(TO_ALAHTHALAS))
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Please open a portal to Stormwind.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    }

    pPlayer->PrepareQuestMenu(pCreature->GetGUID());
    pPlayer->SEND_GOSSIP_MENU(90371, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_sunkiss(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->MonsterSay("Al diel shala!", 10);
        pPlayer->TeleportTo(0, -9009.26F, 883.30F, 29.62F, 0.57F);
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GOHello_go_portal_alahthalas(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestRewardStatus(TO_ALAHTHALAS))
        pPlayer->TeleportTo(0, 4225.31F, -2723.46F, 121.87F, 0.70F);
    return true;
}

// Goblin starting zone

enum GoblinStartingZone
{
    QUEST_ME_NOT_ANY_KIND_OF_ORC = 80108,
    QUEST_GREEN_GOES_RED = 80110,
    QUEST_SHADOW_ON_THE_PLATEAU = 80107,
    ZONE_STONETALON_MOUNTAINS = 406,
    ZONE_DUROTAR = 14,
    NPC_TOMB_SHADOW = 80120
};

bool GOHello_go_fm_acquisition(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetZoneId() != ZONE_DUROTAR && pPlayer->GetQuestStatus(QUEST_ME_NOT_ANY_KIND_OF_ORC) == QUEST_STATUS_COMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "Set a course to Durotar! Full speed!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(100100, pGo->GetGUID());
    return true;
}

bool GOSelect_go_fm_acquisition(Player* pPlayer, GameObject* pGo, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->SetDisplayId(8011);
        pPlayer->TeleportTo(1, 560.20F, -4576.21F, 142.0F, 4.08F);
        pPlayer->m_Events.AddEvent(new DemorphAfterTime(pPlayer->GetGUID()), pPlayer->m_Events.CalculateTime(15000));
        pPlayer->CastSpell(pPlayer, 130, true);

        if (pPlayer->HasItemCount(6948, 1, 0))
            pPlayer->RemoveItemCurrency(6948, 1);
    }
    return true;
}

enum RefugeeNPCs
{
    NPC_NERT_STONETALON = 80100,
    NPC_NERT_BLASTENTOM = 80121,
    NPC_GRIZZLE_THE_ENFORCER = 80124,
    NPC_MAYTEN_BOOMRIFLE = 80125,
    NPC_LEYTI_QUICKTONGUEM = 80126,
    NPC_WIZETTE_ICEWHISTLE = 80128,
    NPC_AMRI_DEMONDEAL = 80127,
    NPC_SPRAT_NOZZLETON = 80122
};

bool GossipHello_npc_nert_blastentom(Player* pPlayer, Creature* pCreature)
{
    pPlayer->PrepareQuestMenu(pCreature->GetGUID());
    pPlayer->SEND_GOSSIP_MENU(80100, pCreature->GetGUID());
    return true;
}

bool QuestComplete_npc_garthok(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == QUEST_GREEN_GOES_RED)
    {
        Creature* NertBlastenton = pQuestGiver->SummonCreature(NPC_NERT_BLASTENTOM, 286.33F, -4717.00F, 13.78F, 2.68F, TEMPSUMMON_TIMED_DESPAWN, 1 * MINUTE * IN_MILLISECONDS);
        Creature* GrizzleEnforcer = pQuestGiver->SummonCreature(NPC_GRIZZLE_THE_ENFORCER, 288.25F, -4721.18F, 13.34F, 2.50F, TEMPSUMMON_TIMED_DESPAWN, 1 * MINUTE * IN_MILLISECONDS);
        Creature* MaytenBoomfire = pQuestGiver->SummonCreature(NPC_MAYTEN_BOOMRIFLE, 290.45F, -4717.65F, 13.34F, 2.59F, TEMPSUMMON_TIMED_DESPAWN, 1 * MINUTE * IN_MILLISECONDS);
        Creature* LeytiQuicktongue = pQuestGiver->SummonCreature(NPC_LEYTI_QUICKTONGUEM, 293.18F, -4716.50F, 13.09F, 2.59F, TEMPSUMMON_TIMED_DESPAWN, 1 * MINUTE * IN_MILLISECONDS);
        Creature* WizetteIcewhistle = pQuestGiver->SummonCreature(NPC_WIZETTE_ICEWHISTLE, 290.78F, -4720.42F, 13.08F, 2.29F, TEMPSUMMON_TIMED_DESPAWN, 1 * MINUTE * IN_MILLISECONDS);
        Creature* AmriDemondeal = pQuestGiver->SummonCreature(NPC_AMRI_DEMONDEAL, 289.36F, -4723.89F, 12.91F, 2.80F, TEMPSUMMON_TIMED_DESPAWN, 1 * MINUTE * IN_MILLISECONDS);
        Creature* SpratNozzleton = pQuestGiver->SummonCreature(NPC_SPRAT_NOZZLETON, 293.27F, -4719.20F, 12.74F, 2.87F, TEMPSUMMON_TIMED_DESPAWN, 1 * MINUTE * IN_MILLISECONDS);

        DoAfterTime(pPlayer, 5 * IN_MILLISECONDS,
            [CreatureGuid = NertBlastenton->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(1);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("Mister Gar'thok, may I introduce ya to my crew? We've all got nowhere else to go, and we hear that's as good a reason as any to join the Horde.", player);
        });

        DoAfterTime(pPlayer, 13 * IN_MILLISECONDS,
            [CreatureGuid = GrizzleEnforcer->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(1);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("Barely any different for me! I hear you orcs like bashin' skills, I like bashin' skulls, we're gonna get along just fine.", player);
        });

        DoAfterTime(pPlayer, 21 * IN_MILLISECONDS,
            [CreatureGuid = MaytenBoomfire->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(1);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("Is what I hear true? You guys use bows? Buddy, buddy. Get with the century! I'll show you some real weapons.", player);
        });

        DoAfterTime(pPlayer, 23 * IN_MILLISECONDS,
            [CreatureGuid = LeytiQuicktongue->GetObjectGuid()]()
        {
            Map* map = sMapMgr.FindMap(1);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_BOW);
            creature->MonsterTextEmote("Leyti Quicktongue bows silently.");
        });

        DoAfterTime(pPlayer, 31 * IN_MILLISECONDS,
            [CreatureGuid = WizetteIcewhistle->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(1);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("Do ya even have a mage to help out around here? Well, I guess I can set up shop, conjure up some water. For a price, of course, but also for the Horde!", player);
        });

        DoAfterTime(pPlayer, 39 * IN_MILLISECONDS,
            [CreatureGuid = AmriDemondeal->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(1);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("I've made some bad deals with demons, and I know you orcs have too. Thanks for takin' us in.", player);
        });

        DoAfterTime(pPlayer, 48 * IN_MILLISECONDS,
            [CreatureGuid = SpratNozzleton->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(1);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("Who cares about honor? Where's the food!?", player);
        });

        DoAfterTime(pPlayer, 53 * IN_MILLISECONDS,
            [CreatureGuid = pQuestGiver->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(1);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_LAUGH);
            creature->MonsterTextEmote("Gar'thok laughs.");
            creature->MonsterSayToPlayer("Very well, goblins. I am giving you a chance to prove yourself worthy of the Horde. There is work for you here and further up the road in Orgrimmar. Earn the respect of your new allies. Go now all around Durotar and honor the Horde.", player);
        });
    }
    return false;
}

bool QuestAccept_npc_nert_blastentom(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == QUEST_ME_NOT_ANY_KIND_OF_ORC)
    {
        DoAfterTime(pPlayer, 2 * IN_MILLISECONDS,
            [CreatureGuid = pQuestGiver->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(1);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_NO);
            creature->MonsterSayToPlayer("Alright, I'll be honest with you. The boss isn't gonna be happy we're not bringing him back his treasure. But I've seen enough, and I think you have too, right?", player);
        });

        DoAfterTime(pPlayer, 10 * IN_MILLISECONDS,
            [CreatureGuid = pQuestGiver->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(1);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_QUESTION);
            creature->MonsterSayToPlayer("We can't go back to the Venture Co, or the boss'll find us. And there's no way the Steamwheedle Cartel will trust us, not after the Venture Co puts out the word that we took off with their loot, right?", player);
        });


        DoAfterTime(pPlayer, 17 * IN_MILLISECONDS,
            [CreatureGuid = pQuestGiver->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(1);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_LAUGH);
            creature->MonsterSayToPlayer("So here we are. A bunch of smelly, grimy refugees without a single coin to our name. Who in the world would take us in?", player);
        });


        DoAfterTime(pPlayer, 20 * IN_MILLISECONDS,
            [CreatureGuid = pQuestGiver->GetObjectGuid()]()
        {
            Map* map = sMapMgr.FindMap(1);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->MonsterTextEmote("Nert Blastentom smiles.");
        });

        DoAfterTime(pPlayer, 23 * IN_MILLISECONDS,
            [CreatureGuid = pQuestGiver->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(1);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->MonsterSayToPlayer("I think I have just the place... Get the team and hop in the plane.", player);
        });

        DoAfterTime(pPlayer, 21 * IN_MILLISECONDS,
            [CreatureGuid = pQuestGiver->GetObjectGuid()]()
        {
            Map* map = sMapMgr.FindMap(1);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->SetWalk(true);
            creature->GetMotionMaster()->MovePoint(0, 1799.06F, 1349.06F, 144.95F, 4.04F, 1.7F);
        });

        DoAfterTime(pPlayer, 50 * IN_MILLISECONDS,
            [CreatureGuid = pQuestGiver->GetObjectGuid()]()
        {
            Map* map = sMapMgr.FindMap(1);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->DespawnOrUnsummon();
        });
    }
    return false;
}

struct npc_tomb_shadowAI : public ScriptedAI
{
    npc_tomb_shadowAI(Creature* c) : ScriptedAI(c)
    {
        Reset();
    }

    void Aggro(Unit* who)
    {
        m_creature->MonsterSay("You will not disturb what lays here!");
    }

    void Reset() {}

    void KilledUnit(Unit* victim) {}

    void JustDied(Unit*)
    {
        m_creature->MonsterSay("There is only death for your people here! I am only one... of many...");
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;
        DoMeleeAttackIfReady();
    }

};

CreatureAI* GetAI_npc_tomb_shadow(Creature* _Creature)
{
    return new npc_tomb_shadowAI(_Creature);
}

enum HighElfStartingZone
{
    QUEST_CLEARING_OUT_VERMINS = 80203,
    QUEST_GATHERING_INTEL = 80204,
    NPC_CUSTOM_OBJECTIVE_GATHERING_INTEL = 80203,
    NPC_CUSTOM_OBJECTIVE_BURNT_WHEELS = 80204,
    QUEST_SLAKING_THEIR_THIRST = 80205,
    QUEST_BURNT_WHEELS = 80206,
    NPC_CUSTOM_OBJECTIVE_ITEM_SCRAPPING = 80206,
    NPC_ALISHA_SUNBLADE = 80210,
    NPC_CUSTOM_OBJECTIVE_SUNBLADE_RENUNION = 80211,
    QUEST_SUNBLADE_RENUNION = 80208,
    QUEST_PORTING_TO_GOLDSHIRE = 80209,
    NPC_CUSTOM_OBJECTIVE_PORTING_TO_GOLDSHIRE = 80212
};

bool QuestAccept_npc_kathy_wake(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == QUEST_CLEARING_OUT_VERMINS)
    {
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_NO);
        pQuestGiver->MonsterSayToPlayer("Do not be frightened, these troggs are small and weak. They're easy to take out alone. However, if they swarm the caravans, people could get hurt, and we cannot spare more men to deal with them while keeping the other threats out there away from the lodge.", pPlayer);
    }
    return false;
}

struct go_exploration_trigger : public GameObjectAI
{
    explicit go_exploration_trigger(GameObject* pGo) : GameObjectAI(pGo)
    {
        m_bUsed = false;
        m_uiJustUsedTimer = 1;
        m_uiUpdateTimer = 1000;
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
                MaNGOS::AnyPlayerInObjectRangeCheck check(me, 30.0f);
                MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(players, check);

                Cell::VisitWorldObjects(me, searcher, 30.0f);

                for (Player* pPlayer : players)
                {
                    if (pPlayer->GetQuestStatus(QUEST_GATHERING_INTEL) == QUEST_STATUS_INCOMPLETE)
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(NPC_CUSTOM_OBJECTIVE_GATHERING_INTEL);
                        if (cInfo != nullptr)
                            pPlayer->KilledMonster(cInfo, ObjectGuid());
                    }
                    if (pPlayer->GetQuestStatus(70029) == QUEST_STATUS_INCOMPLETE) // What We Know (Ashenvale)
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(70028);
                        if (cInfo != nullptr)
                            pPlayer->KilledMonster(cInfo, ObjectGuid());
                    }
                }
                m_uiUpdateTimer = 2500;
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

GameObjectAI* GetAI_go_exploration_trigger(GameObject* gameobject)
{
    return new go_exploration_trigger(gameobject);
}

#define EMPTY_BARREL  80209
#define FILLED_BARREL 80210

bool GOHello_go_farstrider_well(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->HasItemCount(EMPTY_BARREL, 1))
    {
        pPlayer->RemoveItemCurrency(EMPTY_BARREL, 1);
        pPlayer->AddItem(FILLED_BARREL);
        pPlayer->HandleEmote(EMOTE_ONESHOT_KNEEL);
    }
    else
        pPlayer->GetSession()->SendNotification("Requires Empty Barrel.");

    return true;
}

bool GossipHello_npc_malvinah_sunblade(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(QUEST_BURNT_WHEELS) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Malvinah, we need to talk.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pPlayer->GetQuestStatus(QUEST_SUNBLADE_RENUNION) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I'm glad that your sister is safe and sound!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);

    pPlayer->PrepareQuestMenu(pCreature->GetGUID());
    pPlayer->SEND_GOSSIP_MENU(100200, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_malvinah_sunblade(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        DoAfterTime(pPlayer, 1 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_CRY);
            creature->MonsterSayToPlayer("My sister was on that wagon!", player);
        });

        DoAfterTime(pPlayer, 5 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("We all knew there was a risk, but... she was practically here already! It could have been any of us!", player);
        });

        DoAfterTime(pPlayer, 10 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_CRY);
            creature->MonsterSayToPlayer("How could this have happened?! We survived the Scourge, the Wetlands, and the Horde only to have our possessions burned to a cinder while being kidnapped?! It's not fair!", player);
        });

        DoAfterTime(pPlayer, 15 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("I'm sorry. I shouldn't burden you with this. We've all struggled ever since we lost Quel'Thalas, but you've provided so much support for us.", player);
        });

        DoAfterTime(pPlayer, 20 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("The wood, the water, you've even defeated those vile trogg creatures. You're right, I must be calm. Perhaps my sister is still out there. She is the only family I have left, and if anyone can save her, it's you.", player);
        });

        DoAfterTime(pPlayer, 25 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_EXCLAMATION);
            creature->MonsterSayToPlayer("Go speak to that rogueish human woman who led the caravan escorts. Perhaps she can help!", player);
            CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(NPC_CUSTOM_OBJECTIVE_BURNT_WHEELS);
            if (cInfo != nullptr)
                player->KilledMonster(cInfo, ObjectGuid());
        });
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        DoAfterTime(pPlayer, 2 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->SetCastingTarget(player);
            creature->HandleEmote(EMOTE_ONESHOT_CRY);
            creature->MonsterSayToPlayer("You've saved my sister!", player);
            creature->SummonCreature(NPC_ALISHA_SUNBLADE, -5628.99F, -4319.46F, 401.18F, 4.4F, TEMPSUMMON_TIMED_DESPAWN, 25 * 1000);
        });


        DoAfterTime(pPlayer, 8 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("I can't overstate how honored I am to be able to call you my friend. Thanks to you, little Arisha is safe. We're all so overwhelmed by your heroism.", player);
        });


        DoAfterTime(pPlayer, 14 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("Several wagons have moved on to Stormwind while you were away, but a lot of us have decided to stay here for the time being. Perhaps even forever.", player);
        });


        DoAfterTime(pPlayer, 19 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_APPLAUD);
            creature->MonsterSayToPlayer("I believe Kathy wishes to speak with you. Here is a present from me. Take care, okay? Wherever you may end up, remember that we'll always remain friends!", player);
            CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(NPC_CUSTOM_OBJECTIVE_SUNBLADE_RENUNION);
            if (cInfo != nullptr)
                player->KilledMonster(cInfo, ObjectGuid());
        });
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

#define DARK_KEY 80216

#define ID_GOBJECT_SHADOWFORGECAGE_RESET 1

bool GOHello_go_shadowforge_cage(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->HasItemCount(DARK_KEY, 1))
    {
        pGo->UseDoorOrButton();
        pPlayer->HandleEmote(EMOTE_ONESHOT_KNEEL);

        if (GameObjectAI* gAI = pGo->AI())
        {
            gAI->SetData(ID_GOBJECT_SHADOWFORGECAGE_RESET, 1);
        }

        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(NPC_CUSTOM_OBJECTIVE_ITEM_SCRAPPING);
        if (cInfo != nullptr)
            pPlayer->KilledMonster(cInfo, ObjectGuid());

        Creature* Alisha = pPlayer->FindNearestCreature(NPC_ALISHA_SUNBLADE, 5.0F);

        if (Alisha)
        {
            Alisha->MonsterSayToPlayer("I thought I'd never see my sister again. Thank you, hero!", pPlayer);
            // Change it later to real coords.
            float fX, fY, fZ;
            Alisha->GetRandomPoint(Alisha->GetPositionX(), Alisha->GetPositionY(), Alisha->GetPositionZ(), 15.0f, fX, fY, fZ);
            Alisha->GetMotionMaster()->MovePoint(0, -5831.14F, -4119.65F, 387.77F, 0, 3.0F);
            Alisha->SetWalk(false);

            DoAfterTime(pPlayer, 25 * IN_MILLISECONDS,
                [CreatureGuid = Alisha->GetObjectGuid()]()
            {
                Map* map = sMapMgr.FindMap(0);
                Creature* creature = map->GetCreature(CreatureGuid);

                if (!creature)
                    return;

                creature->DespawnOrUnsummon();
            });
        }
    }
    else
        pPlayer->GetSession()->SendNotification("Requires Dark Key.");

    return true;
}

struct go_shadowforge_cage : public GameObjectAI
{
    explicit go_shadowforge_cage(GameObject* pGo) : GameObjectAI(pGo)
    {}

    uint32 BackTimer = 0;
    char DebugInfo[32];

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
        if (id == ID_GOBJECT_SHADOWFORGECAGE_RESET)
        {
            BackTimer = 25 * IN_MILLISECONDS;
        }
        GameObjectAI::SetData(id, value);
    }

    virtual const char* GetDebugInfo() override
    {
        sprintf(DebugInfo, "BackTimer %u", BackTimer);
        return DebugInfo;
    }

};

GameObjectAI* GetAI_shadoforge_cage(GameObject* Obj)
{
    return new go_shadowforge_cage(Obj);
}


bool GossipHello_npc_magistrix_ishalah(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(QUEST_PORTING_TO_GOLDSHIRE) == QUEST_STATUS_INCOMPLETE)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I'm ready, Ishalah. Teleport me to Goldshire!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        pPlayer->SEND_GOSSIP_MENU(100201, pCreature->GetGUID());
        return true;
    }
    pPlayer->SEND_GOSSIP_MENU(100202, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_magistrix_ishalah(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->HandleEmote(EMOTE_ONESHOT_SPELLPRECAST);
        pCreature->MonsterSay("Safe travels, friend!");
        pPlayer->SummonGameObject(3000204, -5660.109F, -4258.419F, 407.899F, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 30, true);
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GOHello_go_portal_goldshire(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestStatus(QUEST_PORTING_TO_GOLDSHIRE) == QUEST_STATUS_INCOMPLETE)
    {
        pPlayer->TeleportTo(0, -9464.0f, 62.0f, 56.0f, 0.0f);
        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(NPC_CUSTOM_OBJECTIVE_PORTING_TO_GOLDSHIRE);
        if (cInfo != nullptr)
            pPlayer->KilledMonster(cInfo, ObjectGuid());
        // Remove Hearthstone:
        if (pPlayer->HasItemCount(6948, 1, 0))
            pPlayer->RemoveItemCurrency(6948, 1);
    }

    return true;
}

#define WHIZZBOT_MIN_AGGRO_TEXT 80000
#define WHIZZBOT_MAX_AGGRO_TEXT 80005
#define WHIZZBOT_MIN_DIE_TEXT   80011
#define WHIZZBOT_MAX_DIE_TEXT   80016

struct npc_whizzbotAI : public ScriptedAI
{
    npc_whizzbotAI(Creature* c) : ScriptedAI(c)
    {
        Reset();
    }

    void Aggro(Unit* who)
    {
        m_creature->MonsterSay(irand(WHIZZBOT_MIN_AGGRO_TEXT, WHIZZBOT_MAX_AGGRO_TEXT));
    }

    void Reset() {}

    void KilledUnit(Unit* victim) {}

    void JustDied(Unit*)
    {
        m_creature->MonsterSay(irand(WHIZZBOT_MIN_DIE_TEXT, WHIZZBOT_MAX_DIE_TEXT));
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;
        DoMeleeAttackIfReady();
    }

};

CreatureAI* GetAI_npc_whizzbot(Creature* _Creature)
{
    return new npc_whizzbotAI(_Creature);
}

bool GOHello_go_crypt_door(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestStatus(QUEST_SHADOW_ON_THE_PLATEAU) == QUEST_STATUS_INCOMPLETE)
    {
        pGo->UseDoorOrButton();
        pGo->SummonCreature(NPC_TOMB_SHADOW, 1626.74F, 1698.38F, 146.65F, 5.708F, TEMPSUMMON_TIMED_DESPAWN, 60 * 1000);

        DoAfterTime(pPlayer, 20 * IN_MILLISECONDS,
            [GObjectGuid = pGo->GetObjectGuid()]()
        {
            Map* map = sMapMgr.FindMap(1);
            GameObject* object = map->GetGameObject(GObjectGuid);
            object->ResetDoorOrButton();
        });
    }
    return false;
}

bool GOHello_go_translocation_orb(Player* pPlayer, GameObject* pGo)
{
    switch (pGo->GetEntry())
    {
    case 3000224: pPlayer->TeleportTo(0, 4235.40F, -2778.20F, 20.65F, 6.25F); break;
    case 3000225: pPlayer->TeleportTo(0, 4225.31F, -2723.46F, 121.87F, 0.70F); break;
    default: break;
    }

    return true;
}

#define GAMBLING_TEXT 80602
#define OPT1 "10 silver coins."
#define OPT2 "1 gold coin."
#define OPT3 "10 gold coins."
#define OPT4 "50 gold coins."

#define COIN_SOUND 1204

#define SPELL_FIREWORK 11543

#define FIVE_MINUTES 5 * 60

#define GAMBLING_QUEST 80306
#define DUMMY_GAMBLING_OBJECTIVE 80600

struct GamblerInfo
{
    uint32 betCount;
    uint32 lastBet;
    time_t timestamp;
};

std::unordered_map<uint64, GamblerInfo> gamblingRecords;

uint32 handleRecords(Player* pPlayer, uint32 amount, int result)
{
    GamblerInfo currentInfo{};
    uint32 newAmount = 0;
    time_t currentTime = time(nullptr);

    if (!gamblingRecords.count(pPlayer->GetGUID()))
    {
        currentInfo =
        {
            0,
            amount,
            currentTime
        };
    }
    else
        currentInfo = gamblingRecords[pPlayer->GetGUID()];

    // Reset count if amount is different or last bet is older than 5 minutes.
    if (currentInfo.lastBet != amount || currentInfo.timestamp < currentTime - FIVE_MINUTES)
        currentInfo.betCount = 0;
    currentInfo.betCount++;

    if (currentInfo.betCount == 3 && currentInfo.lastBet == amount)
    {
        if (result > 75)
            newAmount = amount * 3;

        currentInfo.betCount = 0;
    }
    else if (result > 50)
        newAmount = amount * 2;
    else
        currentInfo.betCount = 0;

    currentInfo.lastBet = amount;
    currentInfo.timestamp = currentTime;
    gamblingRecords[pPlayer->GetGUID()] = currentInfo;

    return newAmount;
}

bool GossipHello_npc_agne_gambler(Player* pPlayer, Creature* pCreature)
{
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, OPT1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, OPT2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, OPT3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, OPT4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);

    pPlayer->SEND_GOSSIP_MENU(GAMBLING_TEXT, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_agne_gambler(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    uint32 amount;
    uint32 amountToAward;
    uint8 result = 0;

    switch (uiAction)
    {
    case GOSSIP_ACTION_INFO_DEF + 1:
        amount = 1000;
        break;
    case GOSSIP_ACTION_INFO_DEF + 2:
        amount = 10000;
        break;
    case GOSSIP_ACTION_INFO_DEF + 3:
        amount = 100000;
        break;
    case GOSSIP_ACTION_INFO_DEF + 4:
        amount = 500000;
        break;
    default:
        return true;
    }

    if (pPlayer->GetMoney() < amount)
    {
        pPlayer->GetSession()->SendNotification("You don't have enough money!");
        pPlayer->PlayerTalkClass->CloseGossip();
        return true;
    }

    pPlayer->ModifyMoney(amount * -1);

    pCreature->HandleEmote(EMOTE_ONESHOT_ATTACK1H);
    pCreature->PlayDirectSound(COIN_SOUND, pPlayer); // Coin sound

    result = urand(1, 100);

    pCreature->PMonsterEmote("Agne rolls a dice for %s... %u!", nullptr, false, pPlayer->GetName(),
        result);

    amountToAward = handleRecords(pPlayer, amount, result);
    if (amountToAward > 0)
    {
        pPlayer->ModifyMoney(amountToAward);

        if (amountToAward >= amount * 3)
        {
            pCreature->PMonsterEmote("STREAK!");
            pPlayer->SendSpellGo(pPlayer, SPELL_FIREWORK);
        }
        else
            pPlayer->HandleEmote(EMOTE_ONESHOT_CHEER);
    }
    else
        pPlayer->HandleEmote(EMOTE_ONESHOT_CRY);

    pPlayer->CLOSE_GOSSIP_MENU();

    // Complete quest if it's active and incomplete
    if (pPlayer->GetQuestStatus(GAMBLING_QUEST) == QUEST_STATUS_INCOMPLETE) // What's Yours is Ours
    {
        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(DUMMY_GAMBLING_OBJECTIVE);
        if (cInfo != nullptr)
            pPlayer->KilledMonster(cInfo, ObjectGuid());
    }

    return true;
}

bool GossipHello_npc_rov(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(80310) == QUEST_STATUS_INCOMPLETE) // Quark's Justice
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "I hear Sturk owes The Rov a punching debt.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(80603, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_rov(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        Creature* sturk = pPlayer->FindNearestCreature(80604, 20.0F); // Sturk

        if (!sturk)
        {
            pCreature->MonsterSay("Geeh, looks like this sneaky bastard is gone.");
            return false;
        }

        pCreature->MonsterSay("About time The Rov gets to shut that idiot down, The Rov will beat him up.");
        pCreature->GetMotionMaster()->MovePoint(1, 2025.37, -4633.34, 29.55, 0, 2.0F);
        pCreature->SetWalk(true);

        DoAfterTime(pPlayer, 7 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer, sturkGuid = sturk->GetObjectGuid()]()
        {
            Map* map = sMapMgr.FindMap(1);
            Creature* creature = map->GetCreature(CreatureGuid);
            Creature* sturk_mob = map->GetCreature(sturkGuid);

            if (!creature || !sturkGuid)
                return;

            creature->Attack(sturk_mob, true);

            CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80606);
            if (cInfo != nullptr)
                player->KilledMonster(cInfo, ObjectGuid());
        });

        DoAfterTime(pPlayer, 6 * IN_MILLISECONDS,
            [player = pPlayer, sturkGuid = sturk->GetObjectGuid()]()
        {
            Map* map = sMapMgr.FindMap(1);
            Creature* sturk_mob = map->GetCreature(sturkGuid);

            sturk_mob->MonsterSay("Hey, hey, not the face man!");
            sturk_mob->GetMotionMaster()->MovePoint(1, 2026.39, -4645.33, 29.66, 0, 5.0F);
            sturk_mob->SetWalk(false);
        });

        DoAfterTime(pPlayer, 11 * IN_MILLISECONDS,
            [CreatureGuid = pCreature->GetObjectGuid(), player = pPlayer, sturkGuid = sturk->GetObjectGuid()]()
        {
            Map* map = sMapMgr.FindMap(1);
            Creature* creature = map->GetCreature(CreatureGuid);
            Creature* sturk_mob = map->GetCreature(sturkGuid);

            creature->ForcedDespawn(300);
            sturk_mob->ForcedDespawn(300);
        });
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_deino(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestRewardStatus(80300)) // A Tusken Affair
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Open a portal to Amani'Alor.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    }

    pPlayer->PrepareQuestMenu(pCreature->GetGUID());
    pPlayer->SEND_GOSSIP_MENU(pCreature->GetDefaultGossipMenuId(), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_deino(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->MonsterSayToPlayer("May the spirits be with ya and the Loa guide ya steps.", pPlayer);

        float dis{ -3.0F };
        float x, y, z;
        pPlayer->GetSafePosition(x, y, z);
        x += dis * cos(pPlayer->GetOrientation());
        y += dis * sin(pPlayer->GetOrientation());
        pPlayer->SummonGameObject(3000240, x, y, z + 0.5F, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 30, true);
        pPlayer->SummonGameObject(3000241, x, y, z - 1.5F, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 30, true);

        pCreature->HandleEmote(EMOTE_STATE_SUBMERGED);
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GOHello_go_portal_amanialor(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestRewardStatus(80300)) // A Tusken Affair
        pPlayer->TeleportTo(1, 2862.1F, 2450.4F, 148.33F, 0.33F);
    return true;
}

bool GOHello_go_spirit_pyre(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestStatus(80301) == QUEST_STATUS_INCOMPLETE) // Lighting the Pyres
    {
        pGo->UseDoorOrButton(60);

        if (GameObjectAI* GoAI = pGo->AI())
        {
            // reset gameobject after 25 sec.
            GoAI->SetData(1, 1);
        }

        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80803);
        if (cInfo != nullptr)
            pPlayer->KilledMonster(cInfo, ObjectGuid());
    }
    return false;
}

struct go_spirit_pyre : public GameObjectAI
{
    explicit go_spirit_pyre(GameObject* pGo) : GameObjectAI(pGo)
    {}

    uint32 BackTimer = 0;
    char DebugInfo[32];

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
        if (id == ID_GOBJECT_SHADOWFORGECAGE_RESET)
        {
            BackTimer = 25 * IN_MILLISECONDS;
        }
        GameObjectAI::SetData(id, value);
    }

    virtual const char* GetDebugInfo() override
    {
        sprintf(DebugInfo, "BackTimer %u", BackTimer);
        return DebugInfo;
    }

};

GameObjectAI* GetAI_go_spirit_pyre(GameObject* Obj)
{
    return new go_spirit_pyre(Obj);
}

bool QuestAccept_npc_teslinah(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 80261) // Teslinah's Search I
    {
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_CRY);
        pQuestGiver->MonsterSayToPlayer("Thank you, thank you, thank you! I am so happy! We should go to Stormwind. Let\'s find someone important who can help! I believe miss Tanilaeh in the Golden Dawn Institute can take us back!", pPlayer);
    }
    return false;
}

bool QuestRewarded_npc_teslinah(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 80261) // Teslinah's Search I
    {
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_CHEER);
        pQuestGiver->MonsterSayToPlayer("Mommy is gone, but we will definitely find her! I am sure of it! Until then, I am happy and excited to adventure with you! We\'re the bestest friends now! We\'re going to have a lot of fun seeing the world! Hehe!", pPlayer);
    }
    return false;
}

struct go_teslinah_search : public GameObjectAI
{
    explicit go_teslinah_search(GameObject* pGo) : GameObjectAI(pGo)
    {
        m_uiUpdateTimer = 10000;
    }

    uint32 m_uiUpdateTimer;

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_uiUpdateTimer < uiDiff)
        {
            std::list<Player*> players;
            MaNGOS::AnyPlayerInObjectRangeCheck check(me, 15.0f, true, false);
            MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(players, check);

            Cell::VisitWorldObjects(me, searcher, 15.0f);

            for (Player* pPlayer : players)
            {
                if (pPlayer->GetQuestStatus(80261) == QUEST_STATUS_INCOMPLETE) // Teslinah's Search I
                {
                    Creature* teslinah = pPlayer->GetMiniPet();

                    if (!teslinah)
                        break;

                    switch (me->GetEntry())
                    {
                    case 3000250:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80270);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("Oooh, this place is huge! Where do we go now? Let's start in the Mage District! We can also look at that weird-smelling place. The pub? I heard people drink special drinks there when they're sad! My mom is definitely sad without me.", pPlayer);
                        break;
                    }
                    case 3000251:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80271);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("I feel the magic in the air! This place is nice, but not as pretty or magical as Silvermoon!", pPlayer);
                        break;
                    }
                    case 3000252:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80272);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("Mommy isn't here... Let's keep moving!", pPlayer);
                        break;
                    }
                    case 3000253:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80273);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("This place is scary. There's bad magic here, and it smells horrible! Can we leave?! Please?", pPlayer);
                        break;
                    }
                    }
                }
                if (pPlayer->GetQuestStatus(80262) == QUEST_STATUS_INCOMPLETE) // Teslinah's Search II
                {
                    Creature* teslinah = pPlayer->GetMiniPet();

                    if (!teslinah)
                        break;

                    switch (me->GetEntry())
                    {
                    case 3000254:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80274);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("Look, it's a night elf priestess! And a moonwell! I love all the grass and glowing plants. This place is really nice. I bet Mommy would like it! Let's keep searching so that we can show it to her.", pPlayer);
                        break;
                    }
                    case 3000255:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80275);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("Yuck! This place smells. Would Mommy really be here?", pPlayer);
                        break;
                    }
                    case 3000256:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80276);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("Oooh, this place looks much kinder than the other one. But I'm sure my mom didn't go to the dwarf lands.", pPlayer);
                        break;
                    }
                    case 3000257:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80277);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("This is the place where our people settled! It's pretty. Not as pretty as Silvermoon, but pretty. This place isn't large though, and Mommy isn't here. Let's keep looking!", pPlayer);
                        break;
                    }
                    }
                }
                if (pPlayer->GetQuestStatus(80263) == QUEST_STATUS_INCOMPLETE) // Teslinah's Search III
                {
                    Creature* teslinah = pPlayer->GetMiniPet();

                    if (!teslinah)
                        break;

                    switch (me->GetEntry())
                    {
                    case 3000258:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80278);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("That looks so weird. The gnomes made this, right? I'm sure Mommy isn't here. That tram leads to the dwarf city, I think. It's cold there, and Mommy hates the cold.", pPlayer);
                        break;
                    }
                    case 3000259:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80279);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("The king lives there! We shouldn't disturb him, though, even if finding my mommy is super important. I know she isn't there either because they wouldn't allow her in. We don't have much. Mommy is very pretty, but we lost everything when Quel'Thalas fell.", pPlayer);
                        break;
                    }
                    case 3000260:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80280);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("I heard that this place existed before the new town was built! There's so many shops, but the streets are all so crammed that it's a little bit scary.", pPlayer);
                        break;
                    }
                    case 3000261:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80281);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("This place is smelly. Mommy isn't here either. I am really worried. Where else could she be?", pPlayer);
                        break;
                    }
                    }
                }
                if (pPlayer->GetQuestStatus(80264) == QUEST_STATUS_INCOMPLETE) // Teslinah's Search IV
                {
                    Creature* teslinah = pPlayer->GetMiniPet();

                    if (!teslinah)
                        break;

                    switch (me->GetEntry())
                    {
                    case 3000262:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80282);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("The army is there. Could my mom have been arrested? But she didn't commit any crimes. I don't think this is the place, but we can come back here if we don't find her anywhere else.", pPlayer);
                        break;
                    }
                    case 3000263:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80283);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("It's the Cathedral! Wow, it's so huge! That's amazing!", pPlayer);
                        break;
                    }
                    case 3000264:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80284);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("If Mommy is really gone, then I could end up in that place. I don't even want to think about that. It makes me so sad that I could cry.", pPlayer);
                        teslinah->HandleEmote(EMOTE_ONESHOT_CRY);
                    }
                    break;
                    case 3000265:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80285);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("Look at this place! It's amazing! Wow, it's breathtaking!", pPlayer);
                        break;
                    }
                    }
                }
                if (pPlayer->GetQuestStatus(80265) == QUEST_STATUS_INCOMPLETE) // Teslinah's Search V
                {
                    Creature* teslinah = pPlayer->GetMiniPet();

                    if (!teslinah)
                        break;

                    switch (me->GetEntry())
                    {
                    case 3000266:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80286);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("This looks awful, and it's gross and scary. Can we leave, please? I don't like the way that man in red is looking at me.", pPlayer);
                        break;
                    }
                    case 3000267:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80287);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("This is bad. This is really bad. I don't like it here. Let's go, please? I'm scared.", pPlayer);
                        break;
                    }
                    case 3000268:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80288);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("Oh, there's so many people here! I remember when we first arrived after flying on gryphon's back! Their feathers were really fluffy and soft. Could Mom be here?", pPlayer);
                        break;
                    }
                    case 3000269:
                    {
                        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80289);
                        pPlayer->KilledMonster(cInfo, ObjectGuid());
                        teslinah->MonsterSayToPlayer("Oh, in there! That's the Visitor's Center where we first checked in when we arrived. Maybe they might know something!", pPlayer);
                        break;
                    }
                    }
                }
            }
            m_uiUpdateTimer = 10000;
        }
        else
        {
            m_uiUpdateTimer -= uiDiff;
        }
    }
};

GameObjectAI* GetAI_go_teslinah_search(GameObject* gameobject)
{
    return new go_teslinah_search(gameobject);
}

bool GossipHello_npc_iluria(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(80315) == QUEST_STATUS_INCOMPLETE) // Apple a Day...
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "A young tree with few rings named Applebough came to us for guidance and expertise with his leaves. Will you offer your time to help us find a cure for his ailment?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    }
    pPlayer->SEND_GOSSIP_MENU(1, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_iluria(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->AddItem(80865, 1);
        pCreature->MonsterSayToPlayer("Ahh! Applebough. Of course. Here's the balm that will help.", pPlayer);
        pCreature->HandleEmote(EMOTE_ONESHOT_TALK);
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool QuestAccept_npc_applebough(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 80315) // Apple a Day
    {
        pQuestGiver->CastSpell(pQuestGiver, 5570, true); // Insects
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_CRY);

        if (pQuestGiver->GetDisplayId() == 18356) // Green
        {
            pQuestGiver->SetDisplayId(18029); // Yellow
            pQuestGiver->MonsterSayToPlayer("My leaves. They fall. Big sad.", pPlayer);
        }
        else
            pQuestGiver->MonsterSayToPlayer("Was green. Had fruits. Was happy...", pPlayer);
    }
    return false;
}

bool QuestRewarded_npc_applebough(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 80315) // Apple a Day
    {
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_CHEER);
        // I don't understand why he's not cheering? Model has /cheer animation.
        pQuestGiver->SetDisplayId(18356); // Green
        pQuestGiver->MonsterSayToPlayer("I feel revitalized! The life is flowing back into my branches. Thank you, $N. This is a kindness that I won't soon forget!", pPlayer);
        return true;
    }

    return false;
}

bool GossipHello_npc_vanira_unicorn_vendor(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetRace() == RACE_HIGH_ELF || pPlayer->GetReputationRank(269) == 7)
    {
        pPlayer->SEND_VENDORLIST(pCreature->GetGUID());
        return true;
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    pCreature->MonsterSayToPlayer("My unicorns are for sale only to the elves of the Silvermoon Remnants and to their exalted allies.", pPlayer);
    return true;
}

bool QuestComplete_npc_voldana(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 80393)
    {

        DoAfterTime(pPlayer, 3 * IN_MILLISECONDS,
            [CreatureGuid = pQuestGiver->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("Loania and her sister Lieren are the daughters of a Human paladin named Dougan. I have known Dougan since the Second war when we fought the Horde together.", player);
        });

        DoAfterTime(pPlayer, 9 * IN_MILLISECONDS,
            [CreatureGuid = pQuestGiver->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("During the Second war, Dougan, myself, and a dwarf of the Wildhammer clan known as Kardan were close companions. After the war, Dougan and his wife Adena settled down in Grand Hamlet. ", player);
        });

        DoAfterTime(pPlayer, 15 * IN_MILLISECONDS,
            [CreatureGuid = pQuestGiver->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("Grand Hamlet later fell under a curse and became known as Darkshire, but I digress. One day, Dougan heard reports of villagers disappearing in the nearby cursed tower known as Karazhan. He summoned Kardan and I, and together we entered the tower to attempt a rescue.", player);
        });

        DoAfterTime(pPlayer, 23 * IN_MILLISECONDS,
            [CreatureGuid = pQuestGiver->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_CRY);
            creature->MonsterSayToPlayer("It didn't go well, Karazhan was far more treacherous than we could have anticipated... Dougan didn't make it, and his wife subsequently lost the will to live. Kardan and I each adopted one of his infant twin daughters and raised them as our own.", player);
        });

        DoAfterTime(pPlayer, 30 * IN_MILLISECONDS,
            [CreatureGuid = pQuestGiver->GetObjectGuid(), player = pPlayer]()
        {
            Map* map = sMapMgr.FindMap(0);
            Creature* creature = map->GetCreature(CreatureGuid);

            if (!creature)
                return;

            creature->HandleEmote(EMOTE_ONESHOT_TALK);
            creature->MonsterSayToPlayer("I believe the girls have a destiny before them, perhaps you will play a part in it too. For now, take this as your reward with my blessing.", player);
        });

    }
    return false;
}

bool GOHello_go_kheyna_wormhole(Player* pPlayer, GameObject* pGo)
{
    if (pGo->GetEntry() == 3000246)
    {
        if (pPlayer->GetQuestStatus(80407) == QUEST_STATUS_INCOMPLETE)
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(81252))
                pPlayer->KilledMonster(cInfo, ObjectGuid());

        if (pPlayer->GetQuestStatus(80407) == QUEST_STATUS_COMPLETE)
            if (pPlayer->FindNearestCreature(81041, 15.0F))
                return true;
        if (pPlayer->GetQuestStatus(80409) == QUEST_STATUS_COMPLETE)
        {
            if (pPlayer->FindNearestCreature(10667, 15.0F))
                return true;

            Creature* chromie = pGo->SummonCreature(10667, pGo->GetPositionX() + 1.0F, pGo->GetPositionY() + 1.0F, pGo->GetPositionZ(), pGo->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN, 60 * 1000);

            DoAfterTime(pPlayer, 2 * IN_MILLISECONDS,
                [CreatureGuid = chromie->GetObjectGuid(), player = pPlayer]()
            {
                Map* map = sMapMgr.FindMap(1);
                Creature* creature = map->GetCreature(CreatureGuid);
                if (!creature)
                    return;
                creature->HandleEmote(EMOTE_ONESHOT_TALK);
                creature->MonsterSay("We need to talk!");
            });
        }
        else
            pGo->SummonCreature(81041, pGo->GetPositionX() + 1.0F, pGo->GetPositionY() + 1.0F, pGo->GetPositionZ(), pGo->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN, 60 * 1000);
        return true;
    }
    else
    {
        if (pPlayer->GetQuestStatus(80395) == QUEST_STATUS_INCOMPLETE)
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(80007))
                pPlayer->KilledMonster(cInfo, ObjectGuid());

        if (pPlayer->FindNearestCreature(81041, 15.0F))
            return true;

        if (pPlayer->GetQuestStatus(80395) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(80395) == QUEST_STATUS_COMPLETE || pPlayer->GetQuestStatus(80396) == QUEST_STATUS_COMPLETE) // A Glittering Opportunity
            pGo->SummonCreature(81041, pGo->GetPositionX() + 1.0F, pGo->GetPositionY() + 1.0F, pGo->GetPositionZ(), pGo->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN, 60 * 1000);
        return true;
    }
}

bool QuestRewarded_npc_norvok(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 70022)
    {
        pQuestGiver->MonsterSay("I will go find my spear right this momen- <argh> -nt!");

        Creature* Taupo = pPlayer->FindNearestCreature(70020, 10.0F);

        if (Taupo && Taupo->IsAlive())
        {
            DoAfterTime(pPlayer, 3 * IN_MILLISECONDS,
                [CreatureGuid = Taupo->GetObjectGuid(), player = pPlayer]()
            {
                Map* map = sMapMgr.FindMap(1);
                Creature* creature = map->GetCreature(CreatureGuid);

                if (!creature)
                    return;

                creature->HandleEmote(EMOTE_ONESHOT_TALK);
                creature->MonsterSay("You're not going anywhere until fully healed Norvok, I am more than certain our friend will keep an eye out for your spear.");
            });
        }

        return true;
    }

    return false;
}

bool ItemUseSpell_item_gnome_enlargement(Player* pPlayer, Item* pItem, const SpellCastTargets&) 
{
    if (pPlayer->GetRace() == RACE_GNOME)
    {
        if (pPlayer->GetObjectScale() == 1.6F)
        {
            pPlayer->GetSession()->SendNotification("You can't grow more!");
            return false;
        }
        pPlayer->SetObjectScale(1.6F);
        return true;
    }
    else
    {
        pPlayer->GetSession()->SendNotification("GREAT NEWS!!! YOU ARE JELLY NOW!");
        pPlayer->SetObjectScale(0.6F);
        pPlayer->SetDisplayId(12349);
        return true;
    }

}
bool ItemUseSpell_item_item_thunder_ale_drink(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
    pPlayer->SetDrunkValue(10000);

    DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer]() {
        player->AddAura(17743);
        player->SetDrunkValue(23000);
    });

    DoAfterTime(pPlayer, 5 * IN_MILLISECONDS, [player = pPlayer]() { 
        player->TeleportTo(0, -1852.873535f, -4091.622314f, 9.815960f, 4.762068f);
    });

    DoAfterTime(pPlayer, 10 * IN_MILLISECONDS, [player = pPlayer]() {
        player->RemoveAurasDueToSpell(17743);
        player->CastSpell(player, 12533, true);
        player->SetDrunkValue(10000);

        std::list<Creature *> sleeper;
        player->GetCreatureListWithEntryInGrid(sleeper, 12998, 10.0f);

        for (const auto& bedDude : sleeper)
        {
            bedDude->SetStandState(UNIT_STAND_STATE_SIT);
            bedDude->PMonsterSay("Hey you, you're finally awake. You just tried the thunder ale reserve right? Blacked out and ended up here same as us and that dwarf over there. We're all brothers and sisters with brews now.");
        }

    });

    DoAfterTime(pPlayer, 20 * IN_MILLISECONDS, [player = pPlayer]() {

        player->SetDrunkValue(256);

        std::list<Creature *> sleeper;
        player->GetCreatureListWithEntryInGrid(sleeper, 12998, 15.0f);

        for (const auto& bedDude : sleeper)
            bedDude->SetStandState(UNIT_STAND_STATE_SLEEP);

    });

    return true;
}

bool GOHello_go_shagu_shisha(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestStatus(40003) == QUEST_STATUS_INCOMPLETE) // Puffing Peace
    {
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(60301))
        {
            pPlayer->KilledMonster(cInfo, ObjectGuid());
            pPlayer->CastSpell(pPlayer, 26389, false);
            return true;
        }
    }
    return false;
}

bool GossipHello_npc_custodian_of_time(Player* pPlayer, Creature* pCreature)
{
    switch (pCreature->GetEntry())
    {
    case 65000: pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I wish to enter Caverns of Time.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1); break;
    case 65015: pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I am leaving.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2); break;
    }
    
    pPlayer->PrepareQuestMenu(pCreature->GetGUID());
    pPlayer->SEND_GOSSIP_MENU(51673, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_custodian_of_time(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->MonsterSayToPlayer("I would wish you luck, if such a thing existed.");
        pPlayer->TeleportTo(1, -8170.67F, -4758.11F, 33.33F, 4.8F);
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        pCreature->MonsterSayToPlayer("Farewell.");
        pPlayer->TeleportTo(1, -8174.74F, -4734.51F, 33.25F, 1.8F);
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool QuestRewarded_npc_malanys_cloudpiercer(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 40010) // Antler�s Guidance
    {
        pQuestGiver->SetDisplayId(12034); // Nigth Elf
        pQuestGiver->CastSpell(pQuestGiver, 21178, false);
        return true;
    }

    if (pQuest->GetQuestId() == 40012) // The White Stag and the Moon (A)
    {
        pQuestGiver->SetDisplayId(1991); // Deer(A)
        pQuestGiver->MonsterSayToPlayer("May Elune bless you with a firm step, $N!", pPlayer);
        return true;
    }

    return false;
}

bool QuestRewarded_npc_ilyara_skyvault(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 40011) // Antler�s Guidance
    {
        pQuestGiver->SetDisplayId(2121); // Tauren
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_WAVE);
        return true;
    }

    if (pQuest->GetQuestId() == 40013) // The White Stag and the Moon (H)
    {
        pQuestGiver->SetDisplayId(2161); // Deer(H)
        pQuestGiver->MonsterSayToPlayer("Let the Earth Mother be your foothold, $N!", pPlayer);
        return true;
    }

    return false;
}


bool GOHello_go_uldum_pedestal(Player* pPlayer, GameObject* pGo)
{
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_SENDER_INFO, "Place Platinum Discs on the pedestal.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);   

    pPlayer->SEND_GOSSIP_MENU(1, pGo->GetGUID());
    return true;
}

bool GOSelect_go_uldum_pedestal(Player* pPlayer, GameObject* pGo, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1)
    {
        if (sGameEventMgr.IsActiveEvent(162) || (!sGameEventMgr.IsEnabled(162)))
            return false;
        else
        {
            sGameEventMgr.StartEvent(162, true);
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(50663))
                pPlayer->KilledMonster(cInfo, ObjectGuid());
        }
    }
    return true;
}

// Scarlet Monastery raid attunement quest scripts:

bool GossipHello_npc_questions_and_answers(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(80702) == QUEST_STATUS_INCOMPLETE) // Young and Foolish
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Anything strange happen recently?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pPlayer->GetQuestStatus(80721) == QUEST_STATUS_INCOMPLETE) // Grim News
        switch (pCreature->GetEntry())
        {
        case 1515: 
            if (pPlayer->GetQuestStatusData(80721)->m_creatureOrGOcount[0] == 0)
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "You're missing a few guards.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1); 
            break;
        case 1952: 
            if (pPlayer->GetQuestStatusData(80721)->m_creatureOrGOcount[1] == 0)
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Rumors say you've lost a couple of men, is that true?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1); 
            break;
        case 2215:
            if (pPlayer->GetQuestStatusData(80721)->m_creatureOrGOcount[2] == 0)
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Two other encampments have lost a few of their guards, did this also happen here?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            break;
        }

    if (pCreature->IsVendor())
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ACTION_TRADE, "Buy somethin', will ya?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_questions_and_answers(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        switch (pCreature->GetEntry())
        {
        case 341: // Foreman Oslow
            pCreature->HandleEmote(EMOTE_ONESHOT_POINT);
            pCreature->MonsterSayToPlayer("Yes. A caravan with men and women dressed in scarlet passed through here. Many of our young ones followed them.", pPlayer);
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(50665))
                pPlayer->KilledMonster(cInfo, ObjectGuid());
            break;
        case 956: // Dorin Songblade
            pCreature->MonsterSayToPlayer("Aye, our young ones left with them. Can you blame them? Look at this place.", pPlayer);
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(50666))
                pPlayer->KilledMonster(cInfo, ObjectGuid());
            break;
        case 344: // Magistrate Solomon
            pCreature->MonsterSayToPlayer("It\'s regrettable that our children left with those foolish zealots of the crusade in the middle of the night! Please, don\'t harm them. Send them back home to us.", pPlayer);
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(50667))
                pPlayer->KilledMonster(cInfo, ObjectGuid());
            break;
        case 1515: // Executor Zygand
            pCreature->MonsterSayToPlayer("I don't know how you obtained that information but yes, some Scarlet Remnants attacked one of my Deathguard patrols, some never made it back and the others are in a deep sleep. Before falling into this weird slumber one of the guards said they were heading for the Monastery.", pPlayer);
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(50665))
                pPlayer->KilledMonster(cInfo, ObjectGuid());
            break;
        case 1952: // High Executor Hadrec
            pCreature->MonsterSayToPlayer("A small force of the Scarlet Crusade has reached far enough into the forest to attack one of the patrols, we found only one lying about who had this strange ichor drooling out of his mouth. One of the other Deathguards touched it and soon fell into a deep slumber, one whose relative may be Death itself.", pPlayer);
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(50666))
                pPlayer->KilledMonster(cInfo, ObjectGuid());
            break;
        case 2215: // High Executor Darthalia
            pCreature->HandleEmote(EMOTE_ONESHOT_POINT);
            pCreature->MonsterSayToPlayer("Right on point, yes, our short numbers grew even shorter, we found no trail of their corpses yet we have found their weapons covered in mud yet no blood. It seems they didn't put up a fight.", pPlayer);
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(50667))
                pPlayer->KilledMonster(cInfo, ObjectGuid());
            break;
        }
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
        pPlayer->SEND_VENDORLIST(pCreature->GetGUID());
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_search_for_clues(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(80730) == QUEST_STATUS_INCOMPLETE && pPlayer->GetQuestStatusData(80730)->m_creatureOrGOcount[0] == 0)
    {
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(50668))
            pPlayer->KilledMonster(cInfo, ObjectGuid());
    }
    pPlayer->SEND_GOSSIP_MENU(51680, pCreature->GetGUID());
    return true;
}

bool GOHello_search_for_clues(Player* pPlayer, GameObject* pGo)
{
    if (pGo->GetEntry() == 1000167 && pPlayer->GetQuestStatus(80730) == QUEST_STATUS_INCOMPLETE && pPlayer->GetQuestStatusData(80730)->m_creatureOrGOcount[0] == 1)
    {
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(50668))
            pPlayer->KilledMonster(cInfo, ObjectGuid());
        pPlayer->SEND_GOSSIP_MENU(51681, pGo->GetGUID());
        return true;
    }
    if (pGo->GetEntry() == 1000168)
    {
        if (pPlayer->GetQuestStatus(80730) == QUEST_STATUS_INCOMPLETE && pPlayer->GetQuestStatusData(80730)->m_creatureOrGOcount[0] >= 2)
        {
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(50668))
                pPlayer->KilledMonster(cInfo, ObjectGuid());
            if (!pPlayer->HasItemCount(53002, 1, 1))
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT_12, "Take Scarlet Recruit\'s Insignia Ring.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            pPlayer->SEND_GOSSIP_MENU(51682, pGo->GetGUID());
            return true;
        }
        return false;
    }
    return true;
}

bool GOSelect_search_for_clues(Player* pPlayer, GameObject* pGo, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1)
    {
        if (pPlayer->AddItem(53002))
        {
            pPlayer->CLOSE_GOSSIP_MENU();
            return true;
        }
    }
    return false;
}

bool GossipHello_npc_kixxle(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(80730) == QUEST_STATUS_INCOMPLETE && pPlayer->GetQuestStatusData(80730)->m_creatureOrGOcount[1] == 0 && pPlayer->GetQuestStatusData(80730)->m_creatureOrGOcount[0] == 3)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Were you the one to sell an oil canister to to a group of men dressed in scarlet?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    }
    if (pCreature->IsVendor())
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ACTION_TRADE, "I want to browse your goods.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 10);

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_kixxle(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->MonsterSayToPlayer("Yea boss, I sure did. I\'m a merchant, you know. If I got it, I sell it.", pPlayer);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Where did they go?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        pCreature->MonsterSayToPlayer("They went North I guess, following in the footsteps of that dwarven caravan. One of them said they\'d wait by the bridge for an ambush or something. He didn\'t look like the sharpest tool in the shed, you get me?", pPlayer);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Why didn\'t you stop them?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 3)
    {
        pCreature->HandleEmote(EMOTE_ONESHOT_NO);
        pCreature->MonsterSayToPlayer("You\'re joking, right, bub? There were like at least five of them!", pPlayer);
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(50669))
            pPlayer->KilledMonster(cInfo, ObjectGuid());
        pPlayer->CLOSE_GOSSIP_MENU();
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 10)
        pPlayer->SEND_VENDORLIST(pCreature->GetGUID());
    return true;
}

struct npc_vladeus_springriverAI : public ScriptedAI
{
    npc_vladeus_springriverAI(Creature* c) : ScriptedAI(c) { Reset(); }

    void Reset()
    {
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        m_creature->SetFactionTemplateId(m_creature->GetCreatureInfo()->faction);
    }
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
    void EnterCombat()
    {
        m_creature->MonsterSay("For the Scarlet Crusade!");
    }
    void OnCombatStop()
    {
        m_creature->MonsterSay("Stop, I give up! Spare me, I will submit to imprisonment.");
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

        ThreatList const& tList = m_creature->GetThreatManager().getThreatList();
        for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i)
        {
            Unit* pUnit = m_creature->GetMap()->GetUnit((*i)->getUnitGuid());
            if (pUnit && (pUnit->GetTypeId() == TYPEID_PLAYER))
            {
                if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(50670))
                    pUnit->ToPlayer()->KilledMonster(cInfo, ObjectGuid());
            }
        }
    }
    void JustRespawned() { Reset(); }
};

CreatureAI* GetAI_npc_vladeus_springriver(Creature* _Creature) { return new npc_vladeus_springriverAI(_Creature); }

bool GossipHello_npc_vladeus_springriver(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(80703) == QUEST_STATUS_INCOMPLETE && pPlayer->GetQuestStatusData(80703)->m_creatureOrGOcount[0] == 1)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I\'m taking you to the local law enforcement.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(51683, pCreature->GetGUID());
    return true;
}

static std::vector<ObjectGuid> followed_units;

bool GossipSelect_npc_vladeus_springriver(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->CombatStop();
        pCreature->MonsterSay("I understand.");
        pCreature->GetMotionMaster()->MoveFollow(pPlayer, PET_FOLLOW_DIST, PET_FOLLOW_ANGLE);
        pCreature->UpdateSpeed(MOVE_RUN, false, pCreature->GetSpeedRate(MOVE_RUN) * 1.5);
        followed_units.push_back(pPlayer->GetObjectGuid());
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_captain_stoutfist(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(80703) == QUEST_STATUS_INCOMPLETE && (std::find(followed_units.begin(), followed_units.end(), pPlayer->GetObjectGuid()) != followed_units.end()))
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "This guy here is the only survivor of those who attacked the caravan that was ment to reach Aerie Peak, he yielded and I have spared his life.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_captain_stoutfist(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(50671))
            pPlayer->KilledMonster(cInfo, ObjectGuid());

        pCreature->MonsterSay("Great find. My boys and I will put him up in chains. Go get yourself an ale while we handle this.");        
        if (Creature* prisoner = pPlayer->FindNearestCreature(50674, 30.0F))
        {
            prisoner->GetMotionMaster()->Clear();
            prisoner->ForcedDespawn();
        }
        auto itr = std::find(followed_units.begin(), followed_units.end(), pPlayer->GetObjectGuid());
        if (itr != followed_units.end())
            followed_units.erase(itr);
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

struct go_scarlet_attack_trigger : public GameObjectAI
{
    explicit go_scarlet_attack_trigger(GameObject* pGo) : GameObjectAI(pGo) { m_uiUpdateTimer = 1000; }

    uint32 m_uiUpdateTimer;

    void UpdateAI(uint32 const uiDiff) override
    {     
        if (m_uiUpdateTimer < uiDiff)
        {
            std::list<Player*> players;
            MaNGOS::AnyPlayerInObjectRangeCheck check(me, 10.0f, true, false);
            MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(players, check);
            Cell::VisitWorldObjects(me, searcher, 10.0f);
            for (Player* pPlayer : players)
            {
                if (pPlayer->GetQuestStatus(80703) == QUEST_STATUS_INCOMPLETE && 
                    pPlayer->GetQuestStatusData(80703)->m_creatureOrGOcount[0] == 0 || 
                    pPlayer->GetQuestStatusData(80703)->m_creatureOrGOcount[1] == 0)
                {
                    GameObject* event_running = pPlayer->FindNearestGameObject(1000170, 30.0F);
                    if (!event_running)
                    {
                        pPlayer->SummonGameObject(1000170, pPlayer->GetPositionX(), pPlayer->GetPositionY(), pPlayer->GetPositionZ(), 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 180, true);

                        DoAfterTime(pPlayer, 2 * IN_MILLISECONDS, [player = pPlayer]() {
                            Map* map = sMapMgr.FindMap(0);
                            player->SummonCreature(50673, -2458.82F, -2494.24F, 78.5F, 4.0F, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 5 * IN_MILLISECONDS);
                            player->SummonCreature(50673, -2458.19F, -2512.90F, 78.5F, 1.9F, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 5 * IN_MILLISECONDS);
                            });
                        DoAfterTime(pPlayer, 20 * IN_MILLISECONDS, [player = pPlayer]() {
                            Map* map = sMapMgr.FindMap(0);
                            player->SummonCreature(50673, -2458.82F, -2494.24F, 78.5F, 4.0F, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 5 * IN_MILLISECONDS);
                            player->SummonCreature(50673, -2458.19F, -2512.90F, 78.5F, 1.9F, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 5 * IN_MILLISECONDS);
                            });
                        DoAfterTime(pPlayer, 40 * IN_MILLISECONDS, [player = pPlayer]() {
                            Map* map = sMapMgr.FindMap(0);
                            player->SummonCreature(50673, -2458.82F, -2494.24F, 78.5F, 4.0F, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 5 * IN_MILLISECONDS);
                            Creature* vladeus_spawned = player->FindNearestCreature(50674, 30.0F);
                            if (!vladeus_spawned)
                                player->SummonCreature(50674, -2458.19F, -2512.90F, 78.5F, 1.9F, TEMPSUMMON_TIMED_DESPAWN, 60 * MINUTE * IN_MILLISECONDS);
                            });
                    }
                    else return;                    
                }
            }
            m_uiUpdateTimer = 1000;
        }
        else m_uiUpdateTimer -= uiDiff;
    }
}; 

GameObjectAI* GetAI_go_scarlet_attack_trigger(GameObject* gameobject) { return new go_scarlet_attack_trigger(gameobject); } 


bool GossipHello_npc_vladeus_interrogation(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(80705) == QUEST_STATUS_INCOMPLETE && pPlayer->GetQuestStatusData(80705)->m_creatureOrGOcount[0] == 0)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Vladeus Springriver, from Lakeshire, is it?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        pPlayer->SEND_GOSSIP_MENU(51684, pCreature->GetGUID());
    }
    if (pPlayer->GetQuestStatus(80706) == QUEST_STATUS_INCOMPLETE && pPlayer->GetQuestStatusData(80706)->m_creatureOrGOcount[0] == 0)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "You smash your right fist into his sides.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 7);
        pPlayer->SEND_GOSSIP_MENU(51685, pCreature->GetGUID());
    }
    return true;
}

bool GossipSelect_npc_vladeus_interrogation(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    // The Means of Persuading:
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->MonsterTextEmote("Vladeus remains silent while slightly nodding his head, the nod is followed by a cough. You assume his throat was parched after being in chains for so long.");
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Offer water to Vladeus.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        pPlayer->SEND_GOSSIP_MENU(51684, pCreature->GetGUID());
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        pCreature->MonsterSayToPlayer("Thank you, you're the one that captured me, right? I am grateful you spared my life but there's nothing I can tell you.", pPlayer);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Please Vladeus, make this easier for both of us. You look like a decent man, the people of Lakeshire wanted me to bring all of you back.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
        pPlayer->SEND_GOSSIP_MENU(51684, pCreature->GetGUID());
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 3)
    {
        pCreature->HandleEmote(EMOTE_ONESHOT_CRY);
        pCreature->MonsterSayToPlayer("A bit late for that don't you think? Since you took the life of the rest, I have nothing to tell you, the man in the red hood would return home and ki... I have said too much.", pPlayer);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "There is nothing to fear with me at your side, the Alliance will protect your family. The Scarlet Crusade already failed so many times.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
        pPlayer->SEND_GOSSIP_MENU(51684, pCreature->GetGUID());
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 4)
    {
        pCreature->MonsterSayToPlayer("Perhaps you are right. I didn't really want it to end this way, we were promised a better life, we... I... I didn't expect they'd make me kill innocents, you have to believe me!", pPlayer);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I do, take my word for it. Who recruited you and why?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
        pPlayer->SEND_GOSSIP_MENU(51684, pCreature->GetGUID());
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 5)
    {
        pCreature->MonsterSayToPlayer("I didn't see his face clearly, he was wearing a red hood and was simply laughing every few minutes. Looking back, it was the stupidest choice I have ever made. As to why they recruited us, I am not really sure. He said we would be taken to a hidden place of the Crusade to be trained, he was complaining that their number was low and since the death of two of their leaders they became broken. I think he mentioned a name, Aventis or Adentis?", pPlayer);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Abbendis?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
        pPlayer->SEND_GOSSIP_MENU(51684, pCreature->GetGUID());
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 6)
    {
        pCreature->HandleEmote(EMOTE_ONESHOT_CRY);
        pCreature->MonsterSayToPlayer("Yes, that's the one! Please I don't know anything else, I wish to return home.", pPlayer);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Abbendis?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(50675))
            pPlayer->KilledMonster(cInfo, ObjectGuid());
        pPlayer->CLOSE_GOSSIP_MENU();
    }
    // Seeking Justice or Vengeance:
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 7)
    {
        pCreature->MonsterSayToPlayer("Ugh, bastard! What was that for?", pPlayer);
        pCreature->MonsterTextEmote("Vladeus grits his teeth.");
        pCreature->HandleEmote(EMOTE_ONESHOT_CRY);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Silence mongrel, you will start talking before I do more than that.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 8);
        pPlayer->SEND_GOSSIP_MENU(51685, pCreature->GetGUID());
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 8)
    {
        pCreature->MonsterSayToPlayer("I won't te... tell you anything!", pPlayer);
        pCreature->MonsterTextEmote("Vladeus short speech is followed by a cough. You assume he must be thirsty after being chained for so long.");
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Last time I visited the Monastery I remember your people using this tool.\n\n<You grab a hot poker and place it one Vladeus' neck.>\n\nNow talk!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 9);
        pPlayer->SEND_GOSSIP_MENU(51685, pCreature->GetGUID());
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 9)
    {
        pCreature->MonsterSayToPlayer("I will say nothing to the one that murdered my companions!", pPlayer);
        pCreature->HandleEmote(EMOTE_ONESHOT_CRY);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Your COMPANIONS murdered innocents.\n\n<You reach for the prongs.>", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 10);
        pPlayer->SEND_GOSSIP_MENU(51685, pCreature->GetGUID());
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 10)
    {
        pCreature->MonsterSayToPlayer("Stop! Please stop, I will talk. I didn't want it to end up this way, I swear! The Red Hooded man said if we don't comply he'd kill my family, please, you have to understand!", pPlayer);
        pCreature->HandleEmote(EMOTE_ONESHOT_BEG);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "He's not the one holding your life in his hands at this very moment.\n\n<You push the prongs close to his face.>", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 11);
        pPlayer->SEND_GOSSIP_MENU(51685, pCreature->GetGUID());
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 11)
    {
        pCreature->MonsterSayToPlayer("He... he said we were going to be taken to a hidden place to train. They were lacking numbers an- and since two of their leaders were dead they weren't doing very well. He also mentioned a name, Aventis or Adentis?", pPlayer);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Abbendis?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 12);
        pPlayer->SEND_GOSSIP_MENU(51685, pCreature->GetGUID());
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 12)
    {
        pCreature->MonsterSayToPlayer("Yes, please, please. I don't know anything else.", pPlayer);
        pCreature->MonsterTextEmote("Vladeus is utterly terrified.");
        pCreature->HandleEmote(EMOTE_ONESHOT_CRY);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Kick him in his knee.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 13);
        pPlayer->SEND_GOSSIP_MENU(51685, pCreature->GetGUID());
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 13)
    {
        pCreature->MonsterTextEmote("Vladeus squeals in pain, so harshly it'd be heard outside.");
        pCreature->HandleEmote(EMOTE_ONESHOT_CRY);
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(50675))
            pPlayer->KilledMonster(cInfo, ObjectGuid());
        pPlayer->CLOSE_GOSSIP_MENU();
    }
    return true;
}

bool QuestRewarded_npc_brother_crowley(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || ! pPlayer) return false;

    if (pQuest->GetQuestId() == 80708) // Scarlet Aid
    {
        DoAfterTime(pPlayer, 2 * IN_MILLISECONDS, [player = pPlayer, crowley = pQuestGiver]() {
            Map* map = sMapMgr.FindMap(0);
            crowley->MonsterSayToPlayer("Brigitte Abbendis is the daughter of the former High General Abbendis and utterly hates the undead, which is not a surprise when it comes to the Scarlet Crusade, I know.", player);});
        DoAfterTime(pPlayer, 10 * IN_MILLISECONDS, [player = pPlayer, crowley = pQuestGiver]() {
            Map* map = sMapMgr.FindMap(0);
            crowley->MonsterSayToPlayer("The issue is she�d go to any length and I mean any to achieve this purpose, given what you told me and the fate of the other leaders she probably broke and went insane by now.", player); });
        DoAfterTime(pPlayer, 18 * IN_MILLISECONDS, [player = pPlayer, crowley = pQuestGiver]() {
            Map* map = sMapMgr.FindMap(0);
            crowley->MonsterSayToPlayer("Last I heard she was in Tyr�s Hand, but if there�s a secret training place or whatever that prisoner called it the only one to know about it would be her, an information passed down from the Ashbringer to her father and from her father to her.", player); });
        DoAfterTime(pPlayer, 28 * IN_MILLISECONDS, [player = pPlayer, crowley = pQuestGiver]() {
            Map* map = sMapMgr.FindMap(0);
            crowley->MonsterSayToPlayer("I am telling you, the Scarlet Crusade is indeed broken and we have seen better days but Abbendis will not stop at anything to take on the undead, be they Scourge or not.", player);
            crowley->HandleEmote(EMOTE_ONESHOT_QUESTION); });
    }
    return false;
}

bool GossipHello_npc_maverick(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(80722) == QUEST_STATUS_INCOMPLETE && pPlayer->GetQuestStatusData(80722)->m_creatureOrGOcount[0] == 0)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Are you ready, Maverick?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    if (pPlayer->GetQuestStatus(80722) == QUEST_STATUS_INCOMPLETE && pPlayer->GetQuestStatusData(80722)->m_creatureOrGOcount[1] == 2)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Inspect Maverick's condition.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        pPlayer->SEND_GOSSIP_MENU(51691, pCreature->GetGUID());
        return true;
    }

    pPlayer->SEND_GOSSIP_MENU(51690, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_maverick(Player* pPlayer, Creature* maverick, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        maverick->MonsterSayToPlayer("Let's bring demise upon these foolish zealots!", pPlayer);
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(50668))
            pPlayer->KilledMonster(cInfo, ObjectGuid());

        maverick->SetWalk(true);
        maverick->GetMotionMaster()->MovePoint(0, 2545.8F, -651.11F, 78.8F);
        maverick->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PASSIVE);

        DoAfterTime(pPlayer, 40 * IN_MILLISECONDS, [player = pPlayer, summoner = maverick]() {
            Map* map = sMapMgr.FindMap(0);
            summoner->SummonCreature(50680, 2552.95F, -650.62F, 80.09F, 3.20F, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 60 * IN_MILLISECONDS);
            summoner->SummonGameObject(2005011, 2545.8F, -651.11F, 78.8F, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 100, true);
            });
        DoAfterTime(pPlayer, 41 * IN_MILLISECONDS, [player = pPlayer, summoner = maverick]() {
            Map* map = sMapMgr.FindMap(0);
            summoner->MonsterSayToPlayer("A trap! It's a trap!", player);
            summoner->SummonCreature(50680, 2544.84F, -658.78F, 79.53F, 1.5F, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 60 * IN_MILLISECONDS);
            });
        DoAfterTime(pPlayer, 44 * IN_MILLISECONDS, [player = pPlayer, summoner = maverick]() {
            Map* map = sMapMgr.FindMap(0);
            summoner->MonsterSayToPlayer("I feel... weird.", player);
            summoner->CastSpell(summoner, 25148, true);
            summoner->HandleEmote(EMOTE_STATE_SLEEP);
            summoner->SetStandState(UNIT_STAND_STATE_SLEEP);
            summoner->SummonCreature(50682, 2558.14F, -663.63F, 88.68F, 2.19F, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 120 * IN_MILLISECONDS);
            });
        DoAfterTime(pPlayer, 53 * IN_MILLISECONDS, [player = pPlayer, summoner = maverick]() {
            Map* map = sMapMgr.FindMap(0);
            summoner->SummonCreature(50681, 2544.84F, -658.78F, 79.53F, 1.5F, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 60 * IN_MILLISECONDS);
            });
        DoAfterTime(pPlayer, 54 * IN_MILLISECONDS, [player = pPlayer, summoner = maverick]() {
            Map* map = sMapMgr.FindMap(0);
            summoner->SummonCreature(50681, 2546.42F, -643.44F, 80.20F, 4.6F, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 60 * IN_MILLISECONDS);
            summoner->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            summoner->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            });
    }
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        Creature* varimathras_spawned = pPlayer->FindNearestCreature(2425, 30.0F);

        if (!varimathras_spawned)
        {
            Creature* varimathras = pPlayer->SummonCreature(2425, 2552.95F, -650.62F, 80.09F, 3.20F, TEMPSUMMON_TIMED_DESPAWN, 180 * IN_MILLISECONDS);
            varimathras->MonsterSayToPlayer("He really is just unconscious, how strange...", pPlayer);
        }

        if (pPlayer->GetQuestStatusData(80722)->m_itemcount[0] == 0)
        {
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(50670))
            {
                pPlayer->HandleEmote(EMOTE_ONESHOT_KNEEL);
                pPlayer->KilledMonster(cInfo, ObjectGuid());
                pPlayer->AddItem(53010, 1);
            }
        }
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

struct npc_scarlet_magicianAI : public ScriptedAI
{
    npc_scarlet_magicianAI(Creature* c) : ScriptedAI(c) { Reset(); }

    void Reset(){}

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->IsInCombat())
        {
            if (m_creature->GetEntry() == 50680)
                m_creature->CastSpell((Unit*)nullptr, 23017, true);
            else           
                m_creature->CastSpell((Unit*)nullptr, 13540, true);
        }
        DoMeleeAttackIfReady();
    }
    void EnterCombat()
    {
        m_creature->MonsterSay("For the Scarlet Crusade!");
    }
    void JustRespawned(){}
};

CreatureAI* GetAI_npc_scarlet_magician(Creature* _Creature) { return new npc_scarlet_magicianAI(_Creature); }

bool GOHello_go_gunthers_favor(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestStatus(80725) == QUEST_STATUS_INCOMPLETE && pPlayer->HasItemCount(53011, 1, false))
    {
        pGo->UseDoorOrButton();
        pPlayer->HandleEmote(EMOTE_ONESHOT_KNEEL);

        if (GameObjectAI* gAI = pGo->AI())
        {
            gAI->SetData(1, 1);
        }

        pGo->SummonCreature(50683, pGo->GetPositionX(), pGo->GetPositionY(), pGo->GetPositionZ(), pGo->GetOrientation(), 
                            TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60 * IN_MILLISECONDS);
    }
    return true;
}

struct go_gunthers_favor : public GameObjectAI
{
    explicit go_gunthers_favor(GameObject* pGo) : GameObjectAI(pGo) {}

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
        if (id == 1)
            BackTimer = 60 * IN_MILLISECONDS;
        GameObjectAI::SetData(id, value);
    }
};

GameObjectAI* GetAI_go_gunthers_favor(GameObject* Obj) { return new go_gunthers_favor(Obj); }

struct npc_alphus_wordwillAI : public ScriptedAI
{
    npc_alphus_wordwillAI(Creature* c) : ScriptedAI(c) { Reset(); }

    bool speech_1 = false;
    bool speech_2 = false;
    bool speech_3 = false;
    bool speech_4 = false;

    void Reset() {}

    void Aggro(Unit* pWho) override
    {
        m_creature->MonsterSay("I sensed magic! What are you doing here?");
    }

    void UpdateAI(const uint32 diff)
    {
        std::list<Player*> players;
        GetPlayersWithinRange(players, 20);

        if (m_creature->GetHealthPercent() < 80 && m_creature->GetHealthPercent() > 70)
        {
            if (!speech_1)
            {
                speech_1 = true;
                m_creature->MonsterSay("Is this all you can muster?");
            }
        }
        if (m_creature->GetHealthPercent() < 60 && m_creature->GetHealthPercent() > 50)
        {
            if (!speech_2)
            {
                speech_2 = true;
                m_creature->MonsterSay("Young folk these days are disappointing.");
            }
        }
        if (m_creature->GetHealthPercent() < 30 && m_creature->GetHealthPercent() > 20)
        {
            if (!speech_3)
            {
                speech_3 = true;
                m_creature->MonsterSay("Hardly a challenge!");
            }
        }
        if (m_creature->GetHealthPercent() < 10)
        {
            if (!speech_4)
            {
                speech_4 = true;
                m_creature->MonsterSay("Hmph, I will admit you have some skills, I will let you flee this day!");
            }
            m_creature->CombatStop(true);
            m_creature->ClearInCombat();
            m_creature->SetFactionTemplateId(35);
            m_creature->CastSpell((Unit*)nullptr, 11426, true);
            m_creature->SummonGameObject(1000177, m_creature->GetPositionX() + 1.0F, m_creature->GetPositionY() + 1.0F, m_creature->GetPositionZ(), 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 150, true);
        }
        DoMeleeAttackIfReady();
    }
    void EnterCombat() {}
    void JustRespawned() {}
};

CreatureAI* GetAI_npc_alphus_wordwill(Creature* _Creature) { return new npc_alphus_wordwillAI(_Creature); }



bool GossipHello_npc_bloodsail_traitor(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(55030) == QUEST_STATUS_INCOMPLETE && pPlayer->GetQuestStatusData(55030)->m_creatureOrGOcount[0] == 0)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Revilgaz sent me to look for information about the group hunting the Brightwater crew.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    }
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_bloodsail_traitor(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->HandleEmote(EMOTE_ONESHOT_TALK);
        pCreature->MonsterSayToPlayer("Oh, he did , did he? Well, I might know a thing or two about that, the only crew that would be wanting the head of those goblins would be Captain Salt Tooth, he\'s got a camp to the north near the arena, and that\'s all I know, I swear!", pPlayer);
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(91294))
            pPlayer->KilledMonster(cInfo, ObjectGuid());
        pPlayer->CLOSE_GOSSIP_MENU();
    }
    return true;
}

bool QuestAccept_npc_shalgrig(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 55051) // Return to Port!
    {
        Creature* spanessa = pPlayer->FindNearestCreature(91281, 30.0F);
        Creature* brizclang = pPlayer->FindNearestCreature(91280, 30.0F);

        if (spanessa && brizclang)
        {
            DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = spanessa]() {
                Map* map = sMapMgr.FindMap(0);
                npc->HandleEmote(EMOTE_ONESHOT_TALK);
                npc->MonsterSayToPlayer("Finally, I can sleep in a real bed!", player);
                });
            DoAfterTime(pPlayer, 3 * IN_MILLISECONDS, [player = pPlayer, npc = brizclang]() {
                Map* map = sMapMgr.FindMap(0);
                npc->HandleEmote(EMOTE_ONESHOT_CHEER);
                npc->MonsterSayToPlayer("Well, maybe we can get back to sailing soon, after a nice break! Thanks!", player);
                });
            DoAfterTime(pPlayer, 5 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
                Map* map = sMapMgr.FindMap(0);
                npc->HandleEmote(EMOTE_ONESHOT_WAVE);
                npc->MonsterSayToPlayer("Goodluck out there, and may you have the sailors luck!", player);
                });
            return true;
        }
        else
        {
            pQuestGiver->HandleEmote(EMOTE_ONESHOT_WAVE);
            pQuestGiver->MonsterSayToPlayer("Goodluck out there, and may you have the sailors luck!", pPlayer);
            return true;
        }
    }
    return false;
}


bool QuestRewarded_npc_ansirem(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 55040) // Returning Property
    {
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_BOW);
        pQuestGiver->SummonGameObject(2005011, pPlayer->GetPositionX(), pPlayer->GetPositionY(), pPlayer->GetPositionZ(), pPlayer->GetOrientation(), 0.0f, 0.0f, 0.0f, 0.0f, 5, true);
        pQuestGiver->CastSpell(pPlayer, 10157, false);
        pQuestGiver->MonsterSayToPlayer("Travel safely, friend!", pPlayer);
        return true;
    }
    return true;
}

bool QuestRewarded_npc_pazzle_brightwrench(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 55043) // The Brightwater Logs
    {
        DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->HandleEmote(EMOTE_ONESHOT_EAT_NOSHEATHE);
            npc->MonsterSayToPlayer("Bottoms up!", player);
            });
        DoAfterTime(pPlayer, 3 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->HandleEmote(EMOTE_ONESHOT_LAUGH);
            npc->MonsterSayToPlayer("Ack- that hits the spot!", player);
            });
        return true;
    }
    return true;
}

struct npc_baxxilAI : public ScriptedAI
{
    npc_baxxilAI(Creature* c) : ScriptedAI(c) { Reset(); }

    void Reset()
    {
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        m_creature->SetFactionTemplateId(m_creature->GetCreatureInfo()->faction);
    }
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
    void EnterCombat()
    {
        m_creature->MonsterSay("You think I'm going to go back down there?! You're nuts!");
    }
    void OnCombatStop()
    {
        m_creature->MonsterSay("Fine, FINE! Take me back to the hole, just don't kill me!");
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
    }
    void JustRespawned() { Reset(); }
};

CreatureAI* GetAI_npc_baxxil(Creature* _Creature) { return new npc_baxxilAI(_Creature); }

bool GossipHello_npc_baxxil(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(55048) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "You're coming back to Sparkwater to serve your sentence.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(91297, pCreature->GetGUID());
    return true;
}

static std::vector<ObjectGuid> baxxil_following;

bool GossipSelect_npc_baxxil(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->CombatStop();
        pCreature->MonsterSay("Okay, okay! Just whatever you say boss!");
        pCreature->GetMotionMaster()->MoveFollow(pPlayer, PET_FOLLOW_DIST, PET_FOLLOW_ANGLE);
        pCreature->UpdateSpeed(MOVE_RUN, false, pCreature->GetSpeedRate(MOVE_RUN) * 1.5);
        baxxil_following.push_back(pPlayer->GetObjectGuid());
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_hizzle(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(55048) == QUEST_STATUS_INCOMPLETE && (std::find(baxxil_following.begin(), baxxil_following.end(), pPlayer->GetObjectGuid()) != baxxil_following.end()))
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Here you are Hizzle, I got your prisoner red handed.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_hizzle(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(91296))
            pPlayer->KilledMonster(cInfo, ObjectGuid());

        pCreature->MonsterSay("Good! All the damage he caused and now he's finally going to pay for it!");
        if (Creature* prisoner = pPlayer->FindNearestCreature(91297, 30.0F))
        {
            prisoner->GetMotionMaster()->Clear();
            prisoner->ForcedDespawn();
        }
        auto itr = std::find(baxxil_following.begin(), baxxil_following.end(), pPlayer->GetObjectGuid());
        if (itr != baxxil_following.end())
            baxxil_following.erase(itr);
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool QuestAccept_npc_barthos(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver || !pPlayer)
        return false;

    if (pQuest->GetQuestId() == 55211) // Occelation Inhibited Disk!
    {
        pQuestGiver->HandleEmote(69);
        pQuestGiver->MonsterSayToPlayer("First, we put this here, and then this... here...", pPlayer);
        pQuestGiver->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PASSIVE);

        DoAfterTime(pPlayer, 6 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSayToPlayer("Then all it takes is, Ah! Damn thing!", player);
            });
        DoAfterTime(pPlayer, 12 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->MonsterSayToPlayer("There it is, I've done it, here you are, my work is complete!", player);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            npc->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(91301))
                player->KilledMonster(cInfo, ObjectGuid());
            });
        DoAfterTime(pPlayer, 14 * IN_MILLISECONDS, [player = pPlayer, npc = pQuestGiver]() {
            npc->HandleEmote(EMOTE_ONESHOT_NONE);
            });
    }
    return false;
}

bool GossipHello_npc_faction_leader(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(80750) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(80800) == QUEST_STATUS_INCOMPLETE)
    {
        if (pPlayer->HasItemCount(83015, 1, false))
        {
            switch (pCreature->GetEntry())
            {
            case 1748:
                if (!pPlayer->HasItemCount(83016, 1, false)) // Stormwind
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Hail, Lord Bolvar. I am delivering an important missive on behalf of the high elves.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                break;
            case 7999:
                if (!pPlayer->HasItemCount(83018, 1, false)) // Darnassus
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Tyrande, the high elves have sent me with a letter for your reading.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                break;
            }
        }
        if (pPlayer->HasItemCount(83020, 1, false))
        {
            switch (pCreature->GetEntry())
            {
            case 4949:
                if (!pPlayer->HasItemCount(83021, 1, false)) // Orgrimmar
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Thrall, the Revantusk Tribe have sent me with a letter for your reading.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                break;
            case 10540:
                if (!pPlayer->HasItemCount(83023, 1, false)) // Darkspear Tribe
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Vol'jin, the Revantusk Tribe have sent me with a letter for your reading.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                break;
            }
        }
    }

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_faction_leader(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        switch (pCreature->GetEntry())
        {
        case 1748:
            pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PASSIVE);
            pCreature->MonsterSayToPlayer("So the Quel'dorei wish to formally join the Alliance?", pPlayer);
            if (pPlayer->HasItemCount(83015, 1, false)) 
                pPlayer->RemoveItemCurrency(83015, 1);
            DoAfterTime(pPlayer, 3 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
                c->MonsterSayToPlayer("I have no objections. During the Second war the high elves were instrumental in beating back the Orcish Horde.", player);
                c->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 6 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
                c->MonsterSayToPlayer("Also the refugees have done a lot for the Alliance, it would be remiss of me to reject their aid.", player);
                c->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 10 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
                c->MonsterSayToPlayer("After all, Lady Prestor has lobbied hard for military aid being sent abroad to help them.", player);
                c->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 15 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
                c->MonsterSayToPlayer("Please take my reply to Alah'thalas.", player);
                c->HandleEmote(EMOTE_ONESHOT_YES);
                player->AddItem(83016, 1);
                c->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                c->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                });
            break;
        case 7999:
            pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PASSIVE);
            pCreature->MonsterSayToPlayer("Ten thousand years ago, the Highborne first summoned the Legion to this world.", pPlayer);
            if (pPlayer->HasItemCount(83015, 1, false))
                pPlayer->RemoveItemCurrency(83015, 1);
            DoAfterTime(pPlayer, 3 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
                c->MonsterSayToPlayer("Some defected long after their atrocities, we took pity and welcome them in our fold, only for them to betray us and unleashing a magical storm on Ashenvale itself.", player);
                c->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 6 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
                c->MonsterSayToPlayer("Then they spread their blatant use of magic to the humans, and were responsible for attracting the attention of the Legion once more. ", player);
                c->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 10 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
                c->MonsterSayToPlayer("We night elves firmly reject the Quel'dorei from the Alliance. Their actions would only doom us once more.", player);
                c->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 15 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
                c->MonsterSayToPlayer("The answer of the Kaldorei stands firm. You may deliver this reply to your masters.", player);
                c->HandleEmote(EMOTE_ONESHOT_NO);
                player->AddItem(83018, 1);
                c->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                c->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                });
            break;
        case 4949:
            pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PASSIVE);
            pCreature->MonsterSayToPlayer("Ogrim told me stories about the Forest Trolls, how he trampled on Khaz Modan with them and brought fear to the Alliance.", pPlayer);
            if (pPlayer->HasItemCount(83020, 1, false))
                pPlayer->RemoveItemCurrency(83020, 1);
            DoAfterTime(pPlayer, 6 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
                c->MonsterSayToPlayer("I wasn�t always on the same page with the old orc but in truth from what I know these trolls will be an asset to the Horde and our redemption for the betrayal they faced at the borders of Quel�thalas.", player);
                c->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 12 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
                c->MonsterSayToPlayer("Take my respond to Amani�Alor and tell them they are welcomed in our ranks with Lok�tar Ogar.", player);
                c->HandleEmote(EMOTE_ONESHOT_YES);
                player->AddItem(83021, 1);
                c->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                c->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                });
            break;
        case 10540:
            pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PASSIVE);
            pCreature->MonsterSayToPlayer("Da trolls were at one time just one people, no matter da tribe they cared and respected each other.", pPlayer);
            if (pPlayer->HasItemCount(83020, 1, false))
                pPlayer->RemoveItemCurrency(83020, 1);
            DoAfterTime(pPlayer, 3 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
                c->MonsterSayToPlayer("We are not dat close anymore, not as we used to.", player);
                c->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 6 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
                c->MonsterSayToPlayer("Da Darkspear holds no remorse to old Zul�jin�s people. We welcome them as brothers in arms and wish they will find a home under our banner.", player);
                c->HandleEmote(EMOTE_ONESHOT_TALK);
                });
            DoAfterTime(pPlayer, 10 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
                c->MonsterSayToPlayer("May da Loa be with us in war and peace.", player);
                c->HandleEmote(EMOTE_ONESHOT_YES);
                player->AddItem(83023, 1);
                c->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                c->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                });
            break;
        }
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_zuljin(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(80801) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "What happened to you, Zul'jin?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    pPlayer->SEND_GOSSIP_MENU(80867, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_zuljin(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PASSIVE);
        pCreature->MonsterSayToPlayer("After da combined forces of da Amani and da Horde failed da attack on de Elven Lands we didn�t back down and me people and I paid da price.", pPlayer);
        DoAfterTime(pPlayer, 5 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
            c->MonsterSayToPlayer("Dey cornered me close to dat lake and been captured by a bashful elf named Brightwing.", player);
            c->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 10 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
            c->MonsterSayToPlayer("Dey tormented me and even took me eye, dey wanted to take me back to dey settlement and probably end me life in front of every other elf to boost morality.", player);
            c->HandleEmote(EMOTE_ONESHOT_NO);
            });
        DoAfterTime(pPlayer, 15 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
            c->MonsterSayToPlayer("It was den that ol� Zul�jin took a gamble with fate, with da help of me people who laid a small siege on da encampment I cut off me arm with a spear and ran into da forest.", player);
            c->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 20 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
            c->MonsterSayToPlayer("I healed and organised me army once again, not long before da Scourge claimed Silvermoon it was time to act, but even with the Loa�s blessings we couldn�t hold against the dead and failed.", player);
            c->HandleEmote(EMOTE_ONESHOT_YES);
            });
        DoAfterTime(pPlayer, 25 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
            c->MonsterSayToPlayer("Me lands lay in shambles, lost to da living dead and I will do anything to take our lands back, and no high elf or Scourge would stand against da powers of da Amani and da Horde.", player);
            c->HandleEmote(EMOTE_ONESHOT_TALK);
            });
        DoAfterTime(pPlayer, 30 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
            c->MonsterSayToPlayer("Dose were our lands, mon, troll lands, de Amani was there before anyone else and no Alliance, Scourge or Demons will stop us from getting it back.", player);
            c->HandleEmote(EMOTE_ONESHOT_YES);
            });
        DoAfterTime(pPlayer, 35 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
            c->MonsterSayToPlayer("Hear dis!", player);
            c->HandleEmote(EMOTE_ONESHOT_EXCLAMATION);
            });
        DoAfterTime(pPlayer, 40 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
            c->MonsterYell("WE ARE DE AMANI, WE FEAR NOBODY!");
            c->HandleEmote(EMOTE_ONESHOT_BATTLEROAR);
            });
        DoAfterTime(pPlayer, 45 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
            c->MonsterYell("WE WILL NEVER GIVE UP BECAUSE WE NEVER DIE!");
            c->HandleEmote(EMOTE_ONESHOT_EXCLAMATION);
            if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(91320))
                player->KilledMonster(cInfo, ObjectGuid());
            c->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            c->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            }); 
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_harlus(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(55225) == QUEST_STATUS_INCOMPLETE) // The Hawk's Vigil
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Martin Corinth, you are to be executed for crimes against the Alliance.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(52119, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_harlus(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {

        DoAfterTime(pPlayer, 1 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
            c->MonsterSayToPlayer("Executed?! Do you know who it is you speak to?", player);
            c->HandleEmote(EMOTE_ONESHOT_LAUGH);
            });
        DoAfterTime(pPlayer, 5 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
            c->MonsterSayToPlayer("Do you know who it is you're threatening?!", player);
            c->HandleEmote(EMOTE_ONESHOT_NO);
            });
        DoAfterTime(pPlayer, 9 * IN_MILLISECONDS, [player = pPlayer, c = pCreature]() {
            c->MonsterSayToPlayer("I shall destroy you and all others who try to stop me!", player);
            c->SetFactionTemporary(14, TEMPFACTION_RESTORE_COMBAT_STOP);
            c->HandleEmote(EMOTE_ONESHOT_ATTACK1H);
            });
    }
    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}


struct npc_lazokoAI : public ScriptedAI
{
    npc_lazokoAI(Creature* c) : ScriptedAI(c) { Reset(); }

    void Reset() {}

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->IsInCombat())
        {
                m_creature->CastSpell((Unit*)nullptr, 13236, true);
        }
        DoMeleeAttackIfReady();
    }
    void JustRespawned() {}
};

CreatureAI* GetAI_npc_lazoko(Creature* _Creature) { return new npc_lazokoAI(_Creature); }

bool QuestRewarded_npc_ardaen_evermoon(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == 40121) // Alpha Aggresion
    {
        pQuestGiver->MonsterSayToPlayer("May my family staff serve you well $N.", pPlayer);
        return true;
    }

    return false;
}

struct npc_bannorAI : public ScriptedAI
{
    npc_bannorAI(Creature* c) : ScriptedAI(c) { Reset(); }

    void Reset()
    {
    }
    void UpdateAI(const uint32 diff)
    {
        DoMeleeAttackIfReady();
    }
    void EnterCombat()
    {
        m_creature->MonsterSay("FOR THE HORDE!");
    }
    void JustRespawned() { Reset(); }
};

CreatureAI* GetAI_npc_bannor(Creature* _Creature) { return new npc_bannorAI(_Creature); }

bool QuestAccept_npc_truthseeker_magellas(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    bool first_item_added = false;
    bool second_item_added = false;

    if (pQuest->GetQuestId() == 40106 || pQuest->GetQuestId() == 40114) //Gates of Uldum  //Uldum Awaits
    {
        if (pPlayer->AddItem(60102)) first_item_added = true;
        if (pPlayer->AddItem(60103)) second_item_added = true;

        if (!first_item_added || !second_item_added)
        {
            pPlayer->RemoveQuest(40106);
            pPlayer->RemoveQuest(40114);
            pPlayer->SetQuestStatus(40107, QUEST_STATUS_NONE);
            pPlayer->SetQuestStatus(40115, QUEST_STATUS_NONE);
            pPlayer->GetSession()->SendNotification("Your bags are full!");
            return false;
        }
    }
    return false;
}

bool QuestAcceptGO_pedestal_of_uldum(Player* player, GameObject* pGo, const Quest* pQuest)
{
    if (!player)
        return false;

    bool first_item_added = false;
    bool second_item_added = false;

    if (pQuest->GetQuestId() == 40107 || pQuest->GetQuestId() == 40115) //Gate Keeper  //Guardian of the Gate
    {
        if (player->AddItem(60102)) first_item_added = true;
        if (player->AddItem(60103)) second_item_added = true;

        if (!first_item_added || !second_item_added)
        {
            player->RemoveQuest(40107);
            player->RemoveQuest(40115);
            player->SetQuestStatus(40107, QUEST_STATUS_NONE);
            player->SetQuestStatus(40115, QUEST_STATUS_NONE);
            player->GetSession()->SendNotification("Your bags are full!");
            return false;
        }
    }
    return false;
}

void AddSC_tw_random()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "GO_pedestal_of_uldum";
    newscript->pGOQuestAccept = &QuestAcceptGO_pedestal_of_uldum;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_truthseeker_magellas";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_truthseeker_magellas;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_bannor";
    newscript->GetAI = &GetAI_npc_bannor;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_ardaen_evermoon";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_ardaen_evermoon;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_lazoko";
    newscript->GetAI = &GetAI_npc_lazoko;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_harlus";
    newscript->pGossipHello = &GossipHello_npc_harlus;
    newscript->pGossipSelect = &GossipSelect_npc_harlus;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_zuljin";
    newscript->pGossipHello = &GossipHello_npc_zuljin;
    newscript->pGossipSelect = &GossipSelect_npc_zuljin;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_faction_leader";
    newscript->pGossipHello = &GossipHello_npc_faction_leader;
    newscript->pGossipSelect = &GossipSelect_npc_faction_leader;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_barthos";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_barthos;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_hizzle";
    newscript->pGossipHello = &GossipHello_npc_hizzle;
    newscript->pGossipSelect = &GossipSelect_npc_hizzle;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_baxxil";
    newscript->pGossipHello = &GossipHello_npc_baxxil;
    newscript->pGossipSelect = &GossipSelect_npc_baxxil;
    newscript->GetAI = &GetAI_npc_baxxil;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_pazzle_brightwrench";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_pazzle_brightwrench;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_ansirem";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_ansirem;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_shalgrig";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_shalgrig;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_bloodsail_traitor";
    newscript->pGossipHello = &GossipHello_npc_bloodsail_traitor;
    newscript->pGossipSelect = &GossipSelect_npc_bloodsail_traitor;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_alphus_wordwill";
    newscript->GetAI = &GetAI_npc_alphus_wordwill;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_gunthers_favor";
    newscript->pGOHello = &GOHello_go_gunthers_favor;
    newscript->GOGetAI = &GetAI_go_gunthers_favor;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_scarlet_magician";
    newscript->GetAI = &GetAI_npc_scarlet_magician;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_maverick";
    newscript->pGossipHello = &GossipHello_npc_maverick;
    newscript->pGossipSelect = &GossipSelect_npc_maverick;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_brother_crowley";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_brother_crowley;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_vladeus_interrogation";
    newscript->pGossipHello = &GossipHello_npc_vladeus_interrogation;
    newscript->pGossipSelect = &GossipSelect_npc_vladeus_interrogation;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_scarlet_attack_trigger";
    newscript->GOGetAI = &GetAI_go_scarlet_attack_trigger;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_captain_stoutfist";
    newscript->pGossipHello = &GossipHello_npc_captain_stoutfist;
    newscript->pGossipSelect = &GossipSelect_npc_captain_stoutfist;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_vladeus_springriver";
    newscript->pGossipHello = &GossipHello_npc_vladeus_springriver;
    newscript->pGossipSelect = &GossipSelect_npc_vladeus_springriver;
    newscript->GetAI = &GetAI_npc_vladeus_springriver;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_kixxle";
    newscript->pGossipHello = &GossipHello_npc_kixxle;
    newscript->pGossipSelect = &GossipSelect_npc_kixxle;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "search_for_clues";
    newscript->pGossipHello = &GossipHello_search_for_clues;
    newscript->pGOHello = &GOHello_search_for_clues;
    newscript->pGOGossipSelect = &GOSelect_search_for_clues;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_questions_and_answers";
    newscript->pGossipHello = &GossipHello_npc_questions_and_answers;
    newscript->pGossipSelect = &GossipSelect_npc_questions_and_answers;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_uldum_pedestal";
    newscript->pGOHello = &GOHello_go_uldum_pedestal;
    newscript->pGOGossipSelect = &GOSelect_go_uldum_pedestal;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_ilyara_skyvault";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_ilyara_skyvault;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_malanys_cloudpiercer";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_malanys_cloudpiercer;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_custodian_of_time";
    newscript->pGossipHello = &GossipHello_npc_custodian_of_time;
    newscript->pGossipSelect = &GossipSelect_npc_custodian_of_time;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_shagu_shisha";
    newscript->pGOHello = &GOHello_go_shagu_shisha;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_flying_mount";
    newscript->pGossipHello = &GossipHello_npc_flying_mount;
    newscript->pGossipSelect = &GossipSelect_npc_flying_mount;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_gnome_enlargement";
    newscript->pItemUseSpell = &ItemUseSpell_item_gnome_enlargement;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_norvok";
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_norvok;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_kheyna_wormhole";
    newscript->pGOHello = &GOHello_go_kheyna_wormhole;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_vanira_unicorn_vendor";
    newscript->pGossipHello = &GossipHello_npc_vanira_unicorn_vendor;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_sunkiss";
    newscript->pGossipHello = &GossipHello_npc_sunkiss;
    newscript->pGossipSelect = &GossipSelect_npc_sunkiss;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_applebough";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_applebough;
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_applebough;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_iluria";
    newscript->pGossipHello = &GossipHello_npc_iluria;
    newscript->pGossipSelect = &GossipSelect_npc_iluria;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_teslinah_search";
    newscript->GOGetAI = &GetAI_go_teslinah_search;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_teslinah";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_teslinah;
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_teslinah;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_spirit_pyre";
    newscript->pGOHello = &GOHello_go_spirit_pyre;
    newscript->GOGetAI = &GetAI_go_spirit_pyre;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_portal_amanialor";
    newscript->pGOHello = &GOHello_go_portal_amanialor;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_deino";
    newscript->pGossipHello = &GossipHello_npc_deino;
    newscript->pGossipSelect = &GossipSelect_npc_deino;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_rov";
    newscript->pGossipHello = &GossipHello_npc_rov;
    newscript->pGossipSelect = &GossipSelect_npc_rov;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_agne_gambler";
    newscript->pGossipHello = &GossipHello_npc_agne_gambler;
    newscript->pGossipSelect = &GossipSelect_npc_agne_gambler;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_translocation_orb";
    newscript->pGOHello = &GOHello_go_translocation_orb;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_crypt_door";
    newscript->pGOHello = &GOHello_go_crypt_door;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_whizzbot";
    newscript->GetAI = &GetAI_npc_whizzbot;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_portal_goldshire";
    newscript->pGOHello = &GOHello_go_portal_goldshire;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_magistrix_ishalah";
    newscript->pGossipHello = &GossipHello_npc_magistrix_ishalah;
    newscript->pGossipSelect = &GossipSelect_npc_magistrix_ishalah;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_shadowforge_cage";
    newscript->pGOHello = &GOHello_go_shadowforge_cage;
    newscript->GOGetAI = &GetAI_shadoforge_cage;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_malvinah_sunblade";
    newscript->pGossipHello = &GossipHello_npc_malvinah_sunblade;
    newscript->pGossipSelect = &GossipSelect_npc_malvinah_sunblade;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_farstrider_well";
    newscript->pGOHello = &GOHello_go_farstrider_well;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_exploration_trigger";
    newscript->GOGetAI = &GetAI_go_exploration_trigger;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_kathy_wake";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_kathy_wake;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_tomb_shadow";
    newscript->GetAI = &GetAI_npc_tomb_shadow;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_nert_blastentom";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_nert_blastentom;
    newscript->pGossipHello = &GossipHello_npc_nert_blastentom;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_garthok";
    newscript->pQuestRewardedNPC = &QuestComplete_npc_garthok;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_voldana";
    newscript->pQuestRewardedNPC = &QuestComplete_npc_voldana;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_fm_acquisition";
    newscript->pGOHello = &GOHello_go_fm_acquisition;
    newscript->pGOGossipSelect = &GOSelect_go_fm_acquisition;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_portal_alahthalas";
    newscript->pGOHello = &GOHello_go_portal_alahthalas;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_elsharin";
    newscript->pGossipHello = &GossipHello_npc_elsharin;
    newscript->pGossipSelect = &GossipSelect_npc_elsharin;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_caledra";
    newscript->pGossipHello = &GossipHello_npc_caledra;
    newscript->pGossipSelect = &GossipSelect_npc_caledra;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_mysterious_stranger";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_mysterious_stranger;
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_mysterious_stranger;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "arena_master";
    newscript->pGossipHello = &GossipHello_ArenaMaster;
    newscript->pGossipSelect = &GossipSelect_ArenaMaster;
    newscript->RegisterSelf(false);

    newscript = new Script;
    newscript->Name = "npc_ropaw";
    newscript->pGossipHello = &GossipHello_npc_ropaw;
    newscript->pGossipSelect = &GossipSelect_npc_ropaw;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "palkeote";
    newscript->GetAI = &GetAI_palkeote;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_riding_horse";
    newscript->pGossipHello = &GossipHello_npc_riding_horse;
    newscript->pGossipSelect = &GossipSelect_npc_riding_horse;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_aspirant_shadewalker";
    newscript->pGossipHello = &GossipHello_npc_aspirant_shadewalker;
    newscript->pGossipSelect = &GossipSelect_npc_aspirant_shadewalker;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_joshua_westfield";
    newscript->pGossipHello = &GossipHello_npc_joshua_westfield;
    newscript->pGossipSelect = &GossipSelect_npc_joshua_westfield;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_lost_farm_sheep";
    newscript->pGossipHello = &GossipHello_npc_lost_farm_sheep;
    newscript->pGossipSelect = &GossipSelect_npc_lost_farm_sheep;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_dirge_the_bouncer";
    newscript->pGossipHello = &GossipHello_npc_dirge_the_bouncer;
    newscript->pGossipSelect = &GossipSelect_npc_dirge_the_bouncer;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_lordaeron_alice";
    newscript->pGossipHello = &GossipHello_npc_lordaeron_alice;
    newscript->pGossipSelect = &GossipSelect_npc_lordaeron_alice;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_terry_palin";
    newscript->pGossipHello = &GossipHello_npc_terry_palin;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_shivering_moonkin";
    newscript->pGossipHello = &GossipHello_npc_shivering_moonkin;
    newscript->pGossipSelect = &GossipSelect_npc_shivering_moonkin;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_frosty";
    newscript->pGossipHello = &GossipHello_npc_frosty;
    newscript->pGossipSelect = &GossipSelect_npc_frosty;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_save_shark";
    newscript->pGossipHello = &GossipHello_npc_save_shark;
    newscript->pGossipSelect = &GossipSelect_npc_save_shark;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_vip_invite";
    newscript->pGossipHello = &GossipHello_npc_vip_invite;
    newscript->pGossipSelect = &GossipSelect_npc_vip_invite;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_tinsel";
    newscript->pGossipHello = &GossipHello_npc_tinsel;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_misletoe";
    newscript->pGossipHello = &GossipHello_npc_misletoe;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_chihkoa";
    newscript->GetAI = &GetAI_npc_chihkoa;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_scripted_companion";
    newscript->GetAI = &GetAI_npc_scripted_companion;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "lil_foot_pet";
    newscript->GetAI = &GetAI_lil_foot_pet;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "daenerys";
    newscript->pGossipHello = &GossipHello_daenerys;
    newscript->pGossipSelect = &GossipSelect_daenerys;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "title_masker";
    newscript->pGossipHello = &GossipHello_title_masker;
    newscript->pGossipSelect = &GossipSelect_title_masker;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "birthday_dragon";
    newscript->pGossipHello = &GossipHello_birthday_dragon;
    newscript->pGossipSelect = &GossipSelect_birthday_dragon;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mining_enchanter";
    newscript->pGossipHello = &GossipHello_MiningEnchanter;
    newscript->pGossipSelect = &GossipSelect_MiningEnchanter;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "dinka_dinker";
    newscript->pGossipHello = &GossipHello_DinkaDinker;
    newscript->pGossipSelect = &GossipSelect_DinkaDinker;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_picnic_umbrella";
    newscript->pItemUseSpell = &ItemUseSpell_item_picnic_umbrella;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "stormwind_vault_portal";
    newscript->GOGetAI = &GetAI_stormwind_vault_portal;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_campfire_rested";
    newscript->GOGetAI = &GetAI_go_campfire_rested;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_brainwashing_device";
    newscript->pGOHello = &GOHello_go_brainwashing_device;
    newscript->pGOGossipSelect = &GOSelect_go_brainwashing_device;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_stormwind_fountain";
    newscript->pGOHello = &GOHello_go_stormwind_fountain;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_airplane";
    newscript->pGOHello = &GOHello_go_airplane;
    newscript->pGOGossipSelect = &GOSelect_go_airplane;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_portable_wormhole";
    newscript->pGOHello = &GOHello_go_portable_wormhole;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_orb_of_the_bronze_dragonflight";
    newscript->pGOHello = &GOHello_go_orb_of_the_bronze_dragonflight;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_survival_tent";
    newscript->GOGetAI = &GetAI_go_survival_tent;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_custom_rested";
    newscript->GOGetAI = &GetAI_go_custom_rested;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_cot_enter_trigger";
    newscript->GOGetAI = &GetAI_go_cot_enter_trigger;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_cot_exit_trigger";
    newscript->GOGetAI = &GetAI_go_cot_exit_trigger;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_radio";
    newscript->pGOHello = &GOHello_go_radio;
    newscript->pGOGossipSelect = &GOSelect_go_radio;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_portal_to_darnassus";
    newscript->pGOHello = &GOHello_go_portal_to_darnassus;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_portal_to_ironforge";
    newscript->pGOHello = &GOHello_go_portal_to_darnassus;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_portal_to_stormwind";
    newscript->pGOHello = &GOHello_go_portal_to_stormwind;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_portal_to_orgrimmar";
    newscript->pGOHello = &GOHello_go_portal_to_orgrimmar;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_bounty";
    newscript->pGOHello = &GOHello_go_bounty;
    newscript->pGOGossipSelect = &GOSelect_go_bounty;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_refreshment_portal";
    newscript->GOGetAI = &GetAI_refreshment_portal_clicks;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_refreshment_table";
    newscript->GOGetAI = &GetAI_refreshment_table_clicks;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_soulwell_portal";
    newscript->GOGetAI = &GetAI_soulwell_portal_clicks;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_soulwell";
    newscript->GOGetAI = &GetAI_soulwell_clicks;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_barber";
    newscript->pGossipHello = &GossipHello_npc_barber;
    newscript->pGossipSelect = &GossipSelect_npc_barber;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_surgeon";
    newscript->pGossipHello = &GossipHello_npc_surgeon;
    newscript->pGossipSelect = &GossipSelect_npc_surgeon;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_barber_go";
    newscript->pGossipHello = &GossipHello_npc_barber_go;
    newscript->pGossipSelect = &GossipSelect_npc_barber_go;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_surgeon_go";
    newscript->pGossipHello = &GossipHello_npc_surgeon_go;
    newscript->pGossipSelect = &GossipSelect_npc_surgeon_go;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "shop_changegender";
    newscript->pItemUseSpell = &ItemUseSpell_shop_changegender;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "shop_racechange";
    newscript->pItemUseSpell = &ItemUseSpell_shop_racechange;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_holy_wings";
    newscript->pItemUseSpell = &ItemUseSpell_item_holy_wings;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_elwynn_coin";
    newscript->pItemUseSpell = &ItemUseSpell_item_elwynn_coin;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_character_rename";
    newscript->pItemUseSpell = &ItemUseSpell_character_rename;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_scaler";
    newscript->pItemUseSpell = &ItemUseSpell_alice_wonderland_scale;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_summer_vestment";
    newscript->pItemUseSpell = &ItemUseSpell_summer_vestment;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_city_portal";
    newscript->pItemUseSpell = &ItemUseSpell_city_protector_scroll;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_portable_mailbox";
    newscript->pItemUseSpell = &ItemUseSpell_remote_mail_terminal;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_sword_of_truth";
    newscript->pItemUseSpell = &ItemUseSpell_sword_of_truth;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_hairdye";
    newscript->pItemUseSpell = &ItemUseSpell_hairdye;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_skin_change";
    newscript->pItemUseSpell = &ItemUseSpell_skin_changer;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_survival_outline";
    newscript->pItemUseSpell = &ItemUseSpell_item_survival_outline;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_bg_tabard";
    newscript->pItemUseSpell = &ItemUseSpell_bg_tabard;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_radio";
    newscript->pItemUseSpell = &ItemUseSpell_item_radio;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_schnapps";
    newscript->pItemUseSpell = &ItemUseSpell_turtle_party;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_illusion";
    newscript->pItemUseSpell = &ItemUseSpell_item_illusion;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_winter_tree";
    newscript->pItemUseSpell = &ItemUseSpell_item_winter_tree;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_roleplay_effect";
    newscript->pItemUseSpell = &ItemUseSpell_item_roleplay_effect;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_holystrike_libram";
    newscript->pItemUseSpell = &ItemUseSpell_item_holy_strike_book;
    newscript->RegisterSelf();

	newscript = new Script;
	newscript->Name = "item_supercharged_chronoboon_displacer";
	newscript->pItemUseSpell = &ItemUseSpell_item_supercharged_chronoboon_displacer;
	newscript->RegisterSelf();

	newscript = new Script;
	newscript->Name = "item_chronoboon_displacer";
	newscript->pItemUseSpell = &ItemUseSpell_item_chronoboon_displacer;
	newscript->RegisterSelf();

	newscript = new Script;
	newscript->Name = "item_mage_refreshment_table";
	newscript->pItemUseSpell = &ItemUseSpell_item_mage_refreshment_table;
	newscript->RegisterSelf();

	newscript = new Script;
	newscript->Name = "item_warlock_soulwell_ritual";
	newscript->pItemUseSpell = &ItemUseSpell_item_warlock_soulwell_ritual;
	newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_thunder_ale_drink";
    newscript->pItemUseSpell = &ItemUseSpell_item_item_thunder_ale_drink;
    newscript->RegisterSelf();

    
}
