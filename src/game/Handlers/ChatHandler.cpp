﻿/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "Common.h"
#include "Log.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "World.h"
#include "Opcodes.h"
#include "ObjectMgr.h"
#include "Chat.h"
#include "Database/DatabaseEnv.h"
#include "ChannelMgr.h"
#include "Group.h"
#include "Guild.h"
#include "GuildMgr.h"
#include "Player.h"
#include "SpellAuras.h"
#include "Language.h"
#include "Util.h"
#include "Unit.h"
#include "GridNotifiersImpl.h"
#include "CellImpl.h"
#include "Anticheat.h"
#include "AccountMgr.h"
#include "Config/Config.h"
#include "Shop/ShopMgr.h"

#include <regex>

bool WorldSession::ProcessChatMessageAfterSecurityCheck(std::string& msg, uint32 lang, uint32 msgType)
{
    if (!IsLanguageAllowedForChatType(lang, msgType))
        return false;

    if (lang != LANG_ADDON)
    {
        // strip invisible characters for non-addon messages
        if (sWorld.getConfig(CONFIG_BOOL_CHAT_FAKE_MESSAGE_PREVENTING))
            stripLineInvisibleChars(msg);

        if (sWorld.getConfig(CONFIG_UINT32_CHAT_STRICT_LINK_CHECKING_SEVERITY) && GetSecurity() < SEC_GAMEMASTER
                && !ChatHandler(this).isValidChatMessage(msg.c_str()))
        {
            sLog.outError("Player %s (GUID: %u) sent a chatmessage with an invalid link: %s", GetPlayer()->GetName(),
                          GetPlayer()->GetGUIDLow(), msg.c_str());
            if (sWorld.getConfig(CONFIG_UINT32_CHAT_STRICT_LINK_CHECKING_KICK))
                KickPlayer();
            return false;
        }
    }

    ChatHandler handler(this);

    return !handler.ParseCommands(msg.c_str());
}

bool WorldSession::IsLanguageAllowedForChatType(uint32 lang, uint32 msgType)
{
    // Right now we'll just restrict addon language to the appropriate chat types
    // Anything else is OK (default previous behaviour)
    switch (lang)
    {
        case LANG_ADDON:
        {
            switch (msgType)
            {
                case CHAT_MSG_PARTY:
                case CHAT_MSG_GUILD:
                case CHAT_MSG_OFFICER:
                case CHAT_MSG_RAID:
                case CHAT_MSG_RAID_LEADER:
                case CHAT_MSG_RAID_WARNING:
                case CHAT_MSG_BATTLEGROUND:
                case CHAT_MSG_BATTLEGROUND_LEADER:
                case CHAT_MSG_CHANNEL:
                    return true;
                default:
                    return false;
            }
        }
        default:
            return true;
    }

    return true;
}

uint32_t WorldSession::ChatCooldown()
{
    ASSERT(GetPlayer());

    auto cooldown = sWorld.getConfig(CONFIG_UINT32_WORLD_CHAN_CD);
    const auto minLevel = sWorld.getConfig(CONFIG_UINT32_WORLD_CHAN_MIN_LEVEL);
    const auto cooldownMaxLvl = sWorld.getConfig(CONFIG_UINT32_WORLD_CHAN_CD_MAX_LEVEL);
    const auto cooldownScaling = sWorld.getConfig(CONFIG_UINT32_WORLD_CHAN_CD_SCALING);
    const auto cooldownUseAcctLvl = sWorld.getConfig(CONFIG_UINT32_WORLD_CHAN_CD_USE_ACCOUNT_MAX_LEVEL);
    const auto playerLevel = cooldownUseAcctLvl? GetAccountMaxLevel() : GetPlayer()->GetLevel();

    if (cooldown && cooldownMaxLvl > playerLevel)
    {
        const auto currTime = time(nullptr);
        const auto delta = currTime - GetLastPubChanMsgTime();

        if (cooldownScaling)
        {
            auto factor = static_cast<double>((cooldownMaxLvl - playerLevel)) / (cooldownMaxLvl - minLevel);
            cooldown *= factor;
        }

        if (delta < cooldown)
        {
            return cooldown - delta;
        }
    }

    return 0;
}

void WorldSession::HandleMessagechatOpcode(WorldPacket & recv_data)
{
    uint32 type;
    uint32 lang;

    recv_data >> type;
    recv_data >> lang;

    if (type >= MAX_CHAT_MSG_TYPE)
    {
        sLog.outError("CHAT: Wrong message type received: %u", type);
        return;
    }

    DEBUG_LOG("CHAT: packet received. type %u, lang %u", type, lang);

    // prevent talking at unknown language (cheating)
    LanguageDesc const* langDesc = GetLanguageDescByID(lang);
    if (!langDesc)
    {
        SendNotification(LANG_UNKNOWN_LANGUAGE);
        return;
    }
    if (_player && langDesc->skill_id != 0 && !_player->HasSkill(langDesc->skill_id))
    {
        SendNotification(LANG_NOT_LEARNED_LANGUAGE);
        return;
    }

    if (lang == LANG_ADDON)
    {
        // Disabled addon channel?
        if (!sWorld.getConfig(CONFIG_BOOL_ADDON_CHANNEL))
            return;
    }
    // LANG_ADDON should not be changed nor be affected by flood control
    else
    {

        // send in universal language if player in .gmon mode (ignore spell effects)
        if (_player && _player->IsGameMaster())
            lang = LANG_UNIVERSAL;
        else
        {
            // Send message in universal language if crossfaction chat is enabled and player is using default faction
            // languages.
            if ((sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_CHAT) || (_player &&_player->IsDiplomat())) && (lang == LANG_COMMON || lang == LANG_ORCISH))
                lang = LANG_UNIVERSAL;
            else
            {
                switch (type)
                {
                    case CHAT_MSG_PARTY:
                    case CHAT_MSG_RAID:
                    case CHAT_MSG_RAID_LEADER:
                    case CHAT_MSG_RAID_WARNING:
                        // allow two side chat at group channel if two side group allowed
                        if (sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GROUP) || (_player &&_player->IsDiplomat()))
                            lang = LANG_UNIVERSAL;
                        break;
                    case CHAT_MSG_GUILD:
                    case CHAT_MSG_OFFICER:
                        // allow two side chat at guild channel if two side guild allowed
                        if (sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GUILD) || (_player &&_player->IsDiplomat()))
                            lang = LANG_UNIVERSAL;
                        break;
                }
            }

            // but overwrite it by SPELL_AURA_MOD_LANGUAGE auras (only single case used)
            if (_player)
            {
                Unit::AuraList const& ModLangAuras = _player->GetAurasByType(SPELL_AURA_MOD_LANGUAGE);
                if (!ModLangAuras.empty())
                    lang = ModLangAuras.front()->GetModifier()->m_miscvalue;
            }
        }

        if (type != CHAT_MSG_AFK && type != CHAT_MSG_DND)
        {
            auto currTime = time(nullptr);

            if (m_muteTime > currTime) // Muted
            {
                std::string timeStr = secsToTimeString(m_muteTime - currTime);
                SendNotification(GetMangosString(LANG_WAIT_BEFORE_SPEAKING), timeStr.c_str());
                return;
            }
            if (lang != LANG_ADDON && GetMasterPlayer())
                GetMasterPlayer()->UpdateSpeakTime(); // Anti chat flood
        }
    }

    std::string msg, channel, to;
    // Message parsing
    switch (type)
    {
        case CHAT_MSG_CHANNEL:
            recv_data >> channel;
            recv_data >> msg;

            if (!ProcessChatMessageAfterSecurityCheck(msg, lang, type))
                return;

            if (msg.empty())
                return;
            break;
        case CHAT_MSG_WHISPER:
            recv_data >> to;
            // no break
        case CHAT_MSG_SAY:
        case CHAT_MSG_EMOTE:
        case CHAT_MSG_YELL:
        case CHAT_MSG_PARTY:
        case CHAT_MSG_GUILD:
        case CHAT_MSG_OFFICER:
        case CHAT_MSG_RAID:
        case CHAT_MSG_RAID_LEADER:
        case CHAT_MSG_RAID_WARNING:
        case CHAT_MSG_BATTLEGROUND:
        case CHAT_MSG_BATTLEGROUND_LEADER:
            recv_data >> msg;
            if (!ProcessChatMessageAfterSecurityCheck(msg, lang, type))
                return;
            if (msg.empty())
                return;
        break;

        case CHAT_MSG_AFK:
        case CHAT_MSG_DND:
            recv_data >> msg;
        break;

        default:
            sLog.outError("CHAT: unknown message type %u, lang: %u", type, lang);
            return;
    }

    /** Enable various spam chat detections */
    if (lang != LANG_ADDON)
    {
        if (AntispamInterface *a = sAnticheatMgr->GetAntispam())
            if (a->isMuted(GetAccountId(), true, type))
                return;
    }

	// Shop Addon Coms
	if (lang == LANG_ADDON && type == CHAT_MSG_GUILD && !msg.empty())
	{
		if (strstr(msg.c_str(), "TW_SHOP"))
		{
			std::string prefix = "TW_SHOP";

			if (strstr(msg.c_str(), "Balance"))
			{

				uint32 balance = ShopMgr(_player).GetBalance();
				_player->SendAddonMessage(prefix, "Balance:" + std::to_string(balance));
			}

			if (strstr(msg.c_str(), "Categories"))
			{

				std::string categories = "Categories:";

				for (auto &itr : sObjectMgr.GetShopCategoriesList())
					categories += std::to_string(itr.first) + "=" + itr.second.Name + "="+itr.second.Icon+";";

				_player->SendAddonMessage(prefix, categories);

			}

			if (strstr(msg.c_str(), "Entries:"))
			{

				std::string categoryIDString = std::regex_replace(msg.c_str(), std::regex("[^0-9]*([0-9]+).*"), std::string("$1"));
				uint8 categoryID = 0;

				if (categoryIDString.empty() || categoryIDString.length() > 3)
					return;

				try
				{
					categoryID = std::stoi(categoryIDString);
				}
				catch (...)
				{
					return;
				}

				_player->SendAddonMessage(prefix, "Entries:" + categoryIDString + "=start");

				for (auto &itr : sObjectMgr.GetShopEntriesList())
				{
					if (itr.second.Category != categoryID)
						continue;


					_player->SendAddonMessage(prefix, "Entries:" + categoryIDString + "=" 
						+ itr.second.Description + "=" 
						+ std::to_string(itr.second.Price) + "=" 
						+ itr.second.DescriptionLong + "=" 
						+ std::to_string(itr.second.Item));

				}

				_player->SendAddonMessage(prefix, "Entries:" + categoryIDString + "=end");

			}

			if (strstr(msg.c_str(), "Buy:"))
			{

				std::string itemIDString = std::regex_replace(msg.c_str(), std::regex("[^0-9]*([0-9]+).*"), std::string("$1"));
				uint32 itemID = 0;

				if (itemIDString.empty() || itemIDString.length() > 6)
					return;

				try
				{
					itemID = std::stoi(itemIDString);
				}
				catch (...)
				{
					return;
				}

				std::string result = "BuyResult:" + ShopMgr(_player).BuyItem(itemID);

				_player->SendAddonMessage(prefix, result);

			}

			return;

		}
	}

    // Minimap Battleground Queue System
    if (lang == LANG_ADDON && type == CHAT_MSG_GUILD && !msg.empty())
    {
        if (strstr(msg.c_str(), "TW_BGQueue")) // prefix
        {
            if (_player->IsInCombat() || _player->InBattleGround() || _player->IsBeingTeleported() || _player->GetDeathState() == CORPSE)
            {
                ChatHandler(_player).PSendSysMessage("You do not meet the conditions to queue for BGs!");
                return;
            }
            if (strstr(msg.c_str(), "Warsong") || strstr(msg.c_str(), "Arathi") || strstr(msg.c_str(), "Alterac"))
            if (strstr(msg.c_str(), "Warsong") || strstr(msg.c_str(), "Arathi") || strstr(msg.c_str(), "Alterac") || strstr(msg.c_str(), "Sunnyglade") || strstr(msg.c_str(), "Arena"))
            {
                _player->SetBattleGroundEntryPoint();

                if (strstr(msg.c_str(), "Warsong"))
                    _player->GetSession()->SendBattlegGroundList(_player->GetObjectGuid(), BATTLEGROUND_WS);
                if (strstr(msg.c_str(), "Arathi"))
                    _player->GetSession()->SendBattlegGroundList(_player->GetObjectGuid(), BATTLEGROUND_AB);
                if (strstr(msg.c_str(), "Alterac"))
                    _player->GetSession()->SendBattlegGroundList(_player->GetObjectGuid(), BATTLEGROUND_AV);
                if (strstr(msg.c_str(), "Sunnyglade"))
                    _player->GetSession()->SendBattlegGroundList(_player->GetObjectGuid(), BATTLEGROUND_SV);
                if (strstr(msg.c_str(), "Arena"))
                    _player->GetSession()->SendBattlegGroundList(_player->GetObjectGuid(), BATTLEGROUND_BR);

                _player->SetBGQueueAllowed(true);
            }
            return;
        }
    }

    // Title System Comms
    if (lang == LANG_ADDON && type == CHAT_MSG_GUILD && !msg.empty())
    {
        if (strstr(msg.c_str(), "TW_TITLES")) // prefix
        {
            // syntax: ChangeTitle:#
            if (strstr(msg.c_str(), "ChangeTitle:"))
            {
                std::string titleIDstring = std::regex_replace(msg.c_str(), std::regex("[^0-9]*([0-9]+).*"), std::string("$1"));
                int titleID = 0;

                if (titleIDstring.empty() || titleIDstring.length() > 3)
                    return;

                try
                {
                    titleID = std::stoi(titleIDstring);
                }
                catch (...)
                {
                    return;
                }

                _player->ChangeTitle(titleID);
                return;
            }

            // syntax: ChangeTitle:#
            if (strstr(msg.c_str(), "Titles:List"))
            {
                _player->SendEarnedTitles();
                return;
            }
        }
    }

	// TWT Threat: Guid and UnitDetailedThreatSituation Request
	if (lang == LANG_ADDON && (type == CHAT_MSG_PARTY || type == CHAT_MSG_RAID) && !msg.empty())
	{
		// UnitDetailedThreatSituation
		if (strstr(msg.c_str(), "TWT_UDTSv4"))
		{
            if (!_player)
				return;

			if (_player->IsGameMaster())
				return;

			if (!_player->GetSelectedCreature())
				return;

			// CanHaveThreatList checks IsAlive too.
			if (!_player->GetSelectedCreature()->CanHaveThreatList())
				return;

			int limit     = 4;                                 // default low limit
			bool tankMode = strstr(msg.c_str(), "_TM" );       // tank mode

            if (msg.find("limit=") != std::string::npos)       // limit= key found
            {
                msg = msg.substr(msg.find("limit=") + 6, 2);   // 6 = "limit=".length(), 2 = read only 2 digits

                std::string limitString = std::regex_replace(msg.c_str(), std::regex("[^0-9]*([0-9]+).*"), std::string("$1"));

                if (limitString.empty() || limitString.length() > 2)
                    return;

                try
                {
                    limit = std::stoi(limitString);
                }
                catch (...)
                {
                    return;
                }
            }
			

			if (limit <= 0 || limit > 20) // 1-99, in practice 4-11
				return;

			ThreatManager::UnitDetailedThreatSituation(
				_player->GetSelectedCreature(),
				_player, 
				limit,
				tankMode);

			return;
		}

	}

    // Transmog System Comms
    if (lang == LANG_ADDON && type == CHAT_MSG_GUILD && !msg.empty())
    {
        if (strstr(msg.c_str(), "TW_TRANSMOG")) // prefix
        {

			std::string prefix = "TW_TRANSMOG";

            if (strstr(msg.c_str(), "DoTransmog:"))
            {

                std::string result;
				result = "TransmogResult:";

                std::string delimiter = ":";
                std::string command = msg.substr(0, msg.find(delimiter));

                msg = msg.substr(command.length() + 1, msg.length());
                std::string slotStr = msg.substr(0, msg.find(delimiter));

                msg = msg.substr(slotStr.length() + 1, msg.length());
                std::string itemIDStr = msg.substr(0, msg.find(delimiter));

                msg = msg.substr(itemIDStr.length() + 1, msg.length());
                std::string slotIdStr = msg.substr(0, msg.find(delimiter));

                try
                {
                    uint8 slot = std::stoi(slotStr);
                    uint32 itemID = std::stoi(itemIDStr);
                    uint32 slotId = std::stoi(slotIdStr);

					result += slotStr + ":" + slotIdStr + ":" + std::to_string(_player->ApplyTransmogrifications(slot, itemID, slotId));
                }
                catch (...)
                {
					result += slotStr + ":" + slotIdStr + ":10"; // stoi failed
                }

				_player->SendAddonMessage(prefix, result.c_str());

                return;
            }
            if (strstr(msg.c_str(), "ResetTransmog:"))
            {

                std::string result;
                result = "ResetResult:";

                std::string delimiter = ":";
                std::string command = msg.substr(0, msg.find(delimiter));

                msg = msg.substr(command.length() + 1, msg.length());
                std::string slotStr = msg.substr(0, msg.find(delimiter));

                msg = msg.substr(slotStr.length() + 1, msg.length());
                std::string slotId = msg.substr(0, msg.find(delimiter));

                try
                {
                    uint8 slot = std::stoi(slotStr);
					result += slotStr + ":"+ slotId + ":" + std::to_string(_player->ApplyTransmogrifications(slot, 0, 0));
                }
                catch (...)
                {
					result += slotStr + ":" + slotId + ":10"; // stoi failed
                }

				_player->SendAddonMessage(prefix, result.c_str());

                return;
            }
            if (strstr(msg.c_str(), "GetAvailableTransmogsItemIDs:"))
            {
                std::string delimiter = ":";
                std::string command = msg.substr(0, msg.find(delimiter));

                msg = msg.substr(command.length() + 1, msg.length());
                std::string InventorySlotIdStr = msg.substr(0, msg.find(delimiter));

                msg = msg.substr(InventorySlotIdStr.length() + 1, msg.length());
                std::string invTypeStr = msg.substr(0, msg.find(delimiter));

                msg = msg.substr(invTypeStr.length() + 1, msg.length());
                std::string destItemIdStr = msg.substr(0, msg.find(delimiter));

                try
                {
                    uint8 InventorySlotId = std::stoi(InventorySlotIdStr);
                    uint8 invType = std::stoi(invTypeStr);
                    uint32 destItemId = std::stoi(destItemIdStr);

                    std::string available = "AvailableTransmogs:" + InventorySlotIdStr + ":" + _player->GetAvailableTransmogs(InventorySlotId, invType, destItemId);

					_player->SendAddonMessage(prefix, available.c_str());

                }
                catch (...)
                {
                    return;
                }
            }
            if (strstr(msg.c_str(), "GetTransmogStatus"))
            {
                std::string status = "TransmogStatus:" + _player->GetTransmogStatus();

				_player->SendAddonMessage(prefix, status.c_str());
            }
            if (strstr(msg.c_str(), "DoChangeGlow:"))
            {
                std::string aText;
                aText = "TW_TRANSMOG ChangeGlowResult:";

                std::string delimiter = ":";
                std::string command = msg.substr(0, msg.find(delimiter));

                msg = msg.substr(command.length() + 1, msg.length());
                std::string slotStr = msg.substr(0, msg.find(delimiter));

                msg = msg.substr(slotStr.length() + 1, msg.length());
                std::string glowIdStr = msg.substr(0, msg.find(delimiter));

                // 803 fiery
                // 1900 crusader
                // 2505 - white healing power
                // 2504 - purple spellpower
                // 1898 - lifestealing
                // 912 - demonslay
                // 1894 - icy
                // 1897 - striking 5
                // 853 - beastslaying
                // 1899 - unholy
                // 2564 - agility green
                // 2568 - intelect yellow ?
                // 2567 - spirit yellow ?
                // 2563 - str

                /*mangos > item->GetSlot() 15
                    VisibleBase 440
                    slot 0
                    item->GetEnchantmentId(slot) 803*/
                // GetSlot - mh 15, oh 16

                try
                {
                    uint32 slot = std::stoi(slotStr);
                    uint32 glowId = std::stoi(glowIdStr);
                    int VisibleBase = PLAYER_VISIBLE_ITEM_1_0 + (slot * MAX_VISIBLE_ITEM_OFFSET);
                    _player->SetUInt32Value(VisibleBase + 1 + 0, glowId);
                    sLog.outInfo("slot = %u, glowId = %u", slot, glowId);
                    //aText += slotStr + ":" + slotId + ":" + std::to_string(_player->ApplyTransmogrifications(slot, 0, 0));
                }
                catch (...)
                {
                    //aText += slotStr + ":" + slotId + ":10"; // stoi failed
                }

                return;
            }
        }

        return;
    }

    // Message handling
    switch (type)
    {
        case CHAT_MSG_CHANNEL:
        {
            PlayerPointer playerPointer(GetPlayerPointer());
            ASSERT(playerPointer);
            static std::string crossFactionChannel = sConfig.GetStringDefault("CrossfactionChannel", "Diplomacy");
            ChannelMgr* cMgr = channelMgr(playerPointer->GetTeam());
            if (iequals(channel, crossFactionChannel)) {
                if (GetSecurity() == SEC_PLAYER && playerPointer->ToPlayer() && !playerPointer->ToPlayer()->IsDiplomat()) {
                    ChatHandler(this).SendSysMessage("|cffff8040You are not a diplomat!|r");
                    return;
                } else {
                    cMgr = channelMgr(ALLIANCE);
                }
            }

            if (cMgr)
            {
                if (Channel *chn = cMgr->GetChannel(channel, playerPointer))
                {
                    // Level channels restrictions
                    if (chn->IsLevelRestricted() && playerPointer->GetLevel() < sWorld.getConfig(CONFIG_UINT32_WORLD_CHAN_MIN_LEVEL)
                        && GetAccountMaxLevel() < sWorld.getConfig(CONFIG_UINT32_PUB_CHANS_MUTE_VANISH_LEVEL))
                    {
                        ChatHandler(this).SendSysMessage("You cannot use this channel yet.");
                        return;
                    }

                    // Public channels restrictions
                    if (!chn->HasFlag(Channel::CHANNEL_FLAG_CUSTOM))
                    {
                        // GMs should not be able to use public channels
                        if (GetSecurity() > SEC_PLAYER && !sWorld.getConfig(CONFIG_BOOL_GMS_ALLOW_PUBLIC_CHANNELS))
                        {
                            ChatHandler(this).SendSysMessage("GMs can't use public channels.");
                            return;
                        }

                        // Check strict Latin for general chat channels
                        if (sWorld.getConfig(CONFIG_BOOL_STRICT_LATIN_IN_GENERAL_CHANNELS))
                        {
                            // remove color, punct, ctrl, space
                            if (AntispamInterface *a = sAnticheatMgr->GetAntispam())
                            {
                                std::string normMsg = a->normalizeMessage(msg, 0x1D);
                                std::wstring w_normMsg;
                                if (Utf8toWStr(normMsg, w_normMsg))
                                {
                                    if (!isBasicLatinString(w_normMsg, true))
                                    {
                                        ChatHandler(this).SendSysMessage("Sorry, only Latin characters are allowed in this channel.");
                                        return;
                                    }
                                }
                            }
                        }

                        if (auto cooldown = ChatCooldown())
                        {
                            ChatHandler(this).PSendSysMessage(
                                "Please wait %u seconds before sending another message.", cooldown
                            );
                            return;
                        }
                    }

                    chn->Say(playerPointer->GetObjectGuid(), msg.c_str(), lang);
                    SetLastPubChanMsgTime(time(nullptr));

                    if (lang != LANG_ADDON && chn->HasFlag(Channel::ChannelFlags::CHANNEL_FLAG_GENERAL))
                        if (AntispamInterface *a = sAnticheatMgr->GetAntispam())
                            a->addMessage(msg, type, GetPlayerPointer(), nullptr);
                }
            }

            if (lang != LANG_ADDON)
            {
                normalizePlayerName(channel);
                sWorld.LogChat(this, "Chan", msg, nullptr, 0, channel.c_str());
            }
        }
        break;

        case CHAT_MSG_SAY:
            if (GetPlayer()->GetLevel() < sWorld.getConfig(CONFIG_UINT32_SAY_MIN_LEVEL)
                && GetAccountMaxLevel() < sWorld.getConfig(CONFIG_UINT32_PUB_CHANS_MUTE_VANISH_LEVEL))
            {
                ChatHandler(this).SendSysMessage("You cannot speak yet (too low level).");
                return;
            }

            if (!GetPlayer()->IsAlive())
                return;

            GetPlayer()->Say(msg, lang);

            if (lang != LANG_ADDON)
            {
                sWorld.LogChat(this, "Say", msg);
                if (AntispamInterface *a = sAnticheatMgr->GetAntispam())
                    a->addMessage(msg, type, GetPlayerPointer(), nullptr);
            }

            break;
        case CHAT_MSG_EMOTE:
            if (GetPlayer()->GetLevel() < sWorld.getConfig(CONFIG_UINT32_SAY_EMOTE_MIN_LEVEL)
                && GetAccountMaxLevel() < sWorld.getConfig(CONFIG_UINT32_PUB_CHANS_MUTE_VANISH_LEVEL))
            {
                ChatHandler(this).SendSysMessage("You cannot use emotes yet (too low level).");
                return;
            }

            if (!GetPlayer()->IsAlive())
                return;

            GetPlayer()->TextEmote(msg);

            if (lang != LANG_ADDON)
            {
                sWorld.LogChat(this, "Emote", msg);
                if (AntispamInterface *a = sAnticheatMgr->GetAntispam())
                    a->addMessage(msg, type, GetPlayerPointer(), nullptr);
            }

            break;
        case CHAT_MSG_YELL:
        {
            if (GetPlayer()->GetLevel() < sWorld.getConfig(CONFIG_UINT32_YELL_MIN_LEVEL)
                && GetAccountMaxLevel() < sWorld.getConfig(CONFIG_UINT32_PUB_CHANS_MUTE_VANISH_LEVEL))
            {
                ChatHandler(this).SendSysMessage("You cannot yell yet (too low level).");
                return;
            }

            if (!GetPlayer()->IsAlive())
                return;

            GetPlayer()->Yell(msg, lang);

            if (lang != LANG_ADDON)
            {
                sWorld.LogChat(this, "Yell", msg);
                if (AntispamInterface *a = sAnticheatMgr->GetAntispam())
                    a->addMessage(msg, type, GetPlayerPointer(), nullptr);
            }
        }
        break;

        case CHAT_MSG_WHISPER: // Master Side
        {
            if (!normalizePlayerName(to))
            {
                SendPlayerNotFoundNotice(to);
                break;
            }
            MasterPlayer* masterPlr = GetMasterPlayer();
            ASSERT(masterPlr);

            MasterPlayer *player = ObjectAccessor::FindMasterPlayer(to.c_str());
            uint32 tSecurity = GetSecurity();
            uint32 pSecurity = player ? player->GetSession()->GetSecurity() : SEC_PLAYER;
            if (!player || (tSecurity == SEC_PLAYER && pSecurity > SEC_PLAYER && !player->AcceptsWhispersFrom(masterPlr->GetObjectGuid())))
            {
                SendPlayerNotFoundNotice(to);
                return;
            }

            if (tSecurity == SEC_PLAYER && pSecurity == SEC_PLAYER)
            {
                if (!sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_CHAT) && !GetPlayer()->IsDiplomat() && GetPlayer()->GetTeam() != player->GetTeam())
                {
                    SendWrongFactionNotice();
                    ChatHandler(this).PSendSysMessage(
                            "|cffff8040You need to be a diplomat in order to talk with the other faction.|r");
                    return;
                }
                if (/*player->GetZoneId() != masterPlr->GetZoneId() && */masterPlr->GetLevel() < sWorld.getConfig(CONFIG_UINT32_WHISP_DIFF_ZONE_MIN_LEVEL))
                {
                    ChatHandler(this).SendSysMessage("You cannot whisper yet.");
                    return;
                }
            }

            if (Player* toPlayer = player->GetSession()->GetPlayer())
            {
                bool allowIgnoreAntispam = toPlayer->IsAllowedWhisperFrom(masterPlr->GetObjectGuid());
                bool allowSendWhisper = allowIgnoreAntispam;
                if (!sWorld.getConfig(CONFIG_BOOL_WHISPER_RESTRICTION) || !toPlayer->IsEnabledWhisperRestriction())
                    allowSendWhisper = true;

                if (toPlayer->GetTeam() != masterPlr->GetTeam())
                {
                    if (!toPlayer->IsDiplomat() && !masterPlr->IsGameMaster())
                    {
                        ChatHandler(this).PSendSysMessage(
                                "|cffff8040The other adventurer is not interested in diplomacy at this moment.|r");
                        allowSendWhisper = false;
                    }
                }

                if (masterPlr->IsGameMaster() || allowSendWhisper)
                    masterPlr->Whisper(msg, lang, player);

                if (lang != LANG_ADDON)
                {
                    sWorld.LogChat(this, "Whisp", msg, PlayerPointer(new PlayerWrapper<MasterPlayer>(player)));
                    if (!allowIgnoreAntispam)
                        if (AntispamInterface *a = sAnticheatMgr->GetAntispam())
                            a->addMessage(msg, type, GetPlayerPointer(), PlayerPointer(new PlayerWrapper<MasterPlayer>(player)));
                }
            }
        }
        break;

        case CHAT_MSG_PARTY: // Master Side: TODO
        {
            // if player is in battleground, he cannot say to battleground members by /p
            Group *group = GetPlayer()->GetOriginalGroup();
            if (!group)
            {
                group = _player->GetGroup();
                if (!group || group->isBGGroup())
                    return;
            }

            WorldPacket data;
            ChatHandler::BuildChatPacket(data, ChatMsg(type), msg.c_str(), Language(lang), _player->GetChatTag(), _player->GetObjectGuid(), _player->GetName());

            if (lang != LANG_ADDON)
                sWorld.LogChat(this, "Group", msg, nullptr, group->GetId());

            group->BroadcastPacket(&data, false, group->GetMemberGroup(GetPlayer()->GetObjectGuid()));
        }
        break;
        case CHAT_MSG_GUILD: // Master side
        {
            if (GetMasterPlayer()->GetGuildId())
                if (Guild* guild = sGuildMgr.GetGuildById(GetMasterPlayer()->GetGuildId()))
                    guild->BroadcastToGuild(this, msg, lang == LANG_ADDON ? LANG_ADDON : LANG_UNIVERSAL);

            if (lang != LANG_ADDON)
                sWorld.LogChat(this, "Guild", msg, nullptr, GetMasterPlayer()->GetGuildId());

            break;
        }
        case CHAT_MSG_OFFICER: // Master side
        {
            if (GetMasterPlayer()->GetGuildId())
                if (Guild* guild = sGuildMgr.GetGuildById(GetMasterPlayer()->GetGuildId()))
                    guild->BroadcastToOfficers(this, msg, lang == LANG_ADDON ? LANG_ADDON : LANG_UNIVERSAL);

            if (lang != LANG_ADDON)
                sWorld.LogChat(this, "Officer", msg, nullptr, GetMasterPlayer()->GetGuildId());

            break;
        }
        case CHAT_MSG_RAID: // Master side: TODO
        {
            // if player is in battleground, he cannot say to battleground members by /ra
            Group *group = GetPlayer()->GetOriginalGroup();
            if (!group)
            {
                group = GetPlayer()->GetGroup();
                if (!group || group->isBGGroup() || !group->isRaidGroup())
                    return;
            }

            WorldPacket data;
            ChatHandler::BuildChatPacket(data, CHAT_MSG_RAID, msg.c_str(), Language(lang), _player->GetChatTag(), _player->GetObjectGuid(), _player->GetName());
            group->BroadcastPacket(&data, false);

            if (lang != LANG_ADDON)
                sWorld.LogChat(this, "Raid", msg, nullptr, group->GetId());

        }
        break;
        case CHAT_MSG_RAID_LEADER: // Master side: TODO
        {
            // if player is in battleground, he cannot say to battleground members by /ra
            Group *group = GetPlayer()->GetOriginalGroup();
            if (!group)
            {
                group = GetPlayer()->GetGroup();
                if (!group || group->isBGGroup() || !group->isRaidGroup() || !group->IsLeader(_player->GetObjectGuid()))
                    return;
            }

            WorldPacket data;
            ChatHandler::BuildChatPacket(data, CHAT_MSG_RAID_LEADER, msg.c_str(), Language(lang), _player->GetChatTag(), _player->GetObjectGuid(), _player->GetName());
            group->BroadcastPacket(&data, false);

            if (lang != LANG_ADDON)
                sWorld.LogChat(this, "Raid", msg, nullptr, group->GetId());
        }
        break;

        case CHAT_MSG_RAID_WARNING: // Master side: TODO
        {
            Group *group = GetPlayer()->GetGroup();
            if (!group || !group->isRaidGroup() ||
                    !(group->IsLeader(GetPlayer()->GetObjectGuid()) || group->IsAssistant(GetPlayer()->GetObjectGuid())))
                return;

            WorldPacket data;
            //in battleground, raid warning is sent only to players in battleground - code is ok
            ChatHandler::BuildChatPacket(data, CHAT_MSG_RAID_WARNING, msg.c_str(), Language(lang), _player->GetChatTag(), _player->GetObjectGuid(), _player->GetName());
            group->BroadcastPacket(&data, false);

            if (lang != LANG_ADDON)
                sWorld.LogChat(this, "Raid", msg, nullptr, group->GetId());
        }
        break;

        case CHAT_MSG_BATTLEGROUND: // Node side
        {
            // battleground raid is always in Player->GetGroup(), never in GetOriginalGroup()
            Group *group = GetPlayer()->GetGroup();
            if (!group || !group->isBGGroup())
                return;

            WorldPacket data;
            ChatHandler::BuildChatPacket(data, CHAT_MSG_BATTLEGROUND, msg.c_str(), Language(lang), _player->GetChatTag(), _player->GetObjectGuid(), _player->GetName());
            group->BroadcastPacket(&data, false);

            if (lang != LANG_ADDON)
                sWorld.LogChat(this, "BG", msg, nullptr, group->GetId());
        }
        break;

        case CHAT_MSG_BATTLEGROUND_LEADER: // Node side
        {
            // battleground raid is always in Player->GetGroup(), never in GetOriginalGroup()
            Group *group = GetPlayer()->GetGroup();
            if (!group || !group->isBGGroup() || !group->IsLeader(GetPlayer()->GetObjectGuid()))
                return;

            WorldPacket data;
            ChatHandler::BuildChatPacket(data, CHAT_MSG_BATTLEGROUND_LEADER, msg.c_str(), Language(lang), _player->GetChatTag(), _player->GetObjectGuid(), _player->GetName());
            group->BroadcastPacket(&data, false);

            if (lang != LANG_ADDON)
                sWorld.LogChat(this, "BG", msg, nullptr, group->GetId());
        }
        break;

        case CHAT_MSG_AFK: // Node side (for combat Check)
        {
            if(_player && _player->IsInCombat())
                break;

            if(!msg.empty() || !_player->IsAFK())
            {
                if (MasterPlayer* masterPlr = GetMasterPlayer())
                    masterPlr->afkMsg = msg;
            }

            if(msg.empty() || !_player->IsAFK())
            {
                _player->ToggleAFK();

                if(_player->IsAFK() && _player->IsDND())
                    _player->ToggleDND();
            }
        }

        break;

        case CHAT_MSG_DND:
        {
            if(!msg.empty() || !_player->IsDND())
            {
                if (MasterPlayer* masterPlr = GetMasterPlayer())
                    masterPlr->dndMsg = msg;
            }

            if(msg.empty() || !_player->IsDND())
            {
                _player->ToggleDND();

                if(_player->IsDND() && _player->IsAFK())
                    _player->ToggleAFK();
            }
        }

        break;
    }

}

void WorldSession::HandleEmoteOpcode(WorldPacket & recv_data)
{
    if (!GetPlayer()->IsAlive() || GetPlayer()->HasUnitState(UNIT_STAT_DIED))
        return;

    if (!GetPlayer()->CanSpeak())
    {
        std::string timeStr = secsToTimeString(m_muteTime - time(nullptr));
        SendNotification(GetMangosString(LANG_WAIT_BEFORE_SPEAKING), timeStr.c_str());
        return;
    }

    uint32 emote;
    recv_data >> emote;

    // Restrict to the only emotes hardcoded in client
    if (emote != EMOTE_ONESHOT_NONE && emote != EMOTE_ONESHOT_WAVE)
        return;

    GetPlayer()->HandleEmoteCommand(emote);
}

namespace MaNGOS
{
class EmoteChatBuilder
{
public:
    EmoteChatBuilder(Player const& pl, uint32 text_emote, uint32 emote_num, Unit const* target)
        : i_player(pl), i_text_emote(text_emote), i_emote_num(emote_num), i_target(target) {}

    void operator()(WorldPacket& data, int32 loc_idx)
    {
        char const* nam = i_target ? i_target->GetNameForLocaleIdx(loc_idx) : nullptr;
        uint32 namlen = (nam ? strlen(nam) : 0) + 1;

        data.Initialize(SMSG_TEXT_EMOTE, (20 + namlen));
        data << ObjectGuid(i_player.GetObjectGuid());
        data << uint32(i_text_emote);
        data << uint32(i_emote_num);
        data << uint32(namlen);
        if (namlen > 1)
            data.append(nam, namlen);
        else
            data << uint8(0x00);
    }

private:
    Player const& i_player;
    uint32        i_text_emote;
    uint32        i_emote_num;
    Unit const*   i_target;
};
}                                                           // namespace MaNGOS

void WorldSession::HandleTextEmoteOpcode(WorldPacket & recv_data)
{
    if (!GetPlayer()->IsAlive())
        return;

    if (!GetPlayer()->CanSpeak())
    {
        std::string timeStr = secsToTimeString(m_muteTime - time(nullptr));
        SendNotification(GetMangosString(LANG_WAIT_BEFORE_SPEAKING), timeStr.c_str());
        return;
    }

    uint32 text_emote, emoteNum;
    ObjectGuid guid;

    recv_data >> text_emote;
    recv_data >> emoteNum;
    recv_data >> guid;

    EmotesTextEntry const *em = sEmotesTextStore.LookupEntry(text_emote);
    if (!em)
        return;

    uint32 emote_id = em->textid;

    switch (emote_id)
    {
        case EMOTE_STATE_SLEEP:
        case EMOTE_STATE_SIT:
        case EMOTE_STATE_KNEEL:
        case EMOTE_ONESHOT_NONE:
            break;
        default:
        {
            // in feign death state allowed only text emotes.
            if (GetPlayer()->HasUnitState(UNIT_STAT_DIED))
                break;

            GetPlayer()->HandleEmoteCommand(emote_id);
            break;
        }
    }

    Unit* unit = GetPlayer()->GetMap()->GetUnit(guid);

    MaNGOS::EmoteChatBuilder emote_builder(*GetPlayer(), text_emote, emoteNum, unit);
    MaNGOS::LocalizedPacketDo<MaNGOS::EmoteChatBuilder > emote_do(emote_builder);
    MaNGOS::CameraDistWorker<MaNGOS::LocalizedPacketDo<MaNGOS::EmoteChatBuilder > > emote_worker(GetPlayer(), sWorld.getConfig(CONFIG_FLOAT_LISTEN_RANGE_TEXTEMOTE), emote_do);
    Cell::VisitWorldObjects(GetPlayer(), emote_worker,  sWorld.getConfig(CONFIG_FLOAT_LISTEN_RANGE_TEXTEMOTE));

    //Send scripted event call
    if (unit && unit->GetTypeId() == TYPEID_UNIT && ((Creature*)unit)->AI())
        ((Creature*)unit)->AI()->ReceiveEmote(GetPlayer(), text_emote);
}

void WorldSession::HandleChatIgnoredOpcode(WorldPacket& recv_data)
{
    ObjectGuid iguid;
    //DEBUG_LOG("WORLD: Received CMSG_CHAT_IGNORED");

    recv_data >> iguid;

    Player *player = sObjectMgr.GetPlayer(iguid);
    if (!player || !player->GetSession())
        return;

    WorldPacket data;
    ChatHandler::BuildChatPacket(data, CHAT_MSG_IGNORED, _player->GetName(), LANG_UNIVERSAL, CHAT_TAG_NONE, _player->GetObjectGuid());
    player->GetSession()->SendPacket(&data);
}

void WorldSession::SendPlayerNotFoundNotice(std::string const& name)
{
    WorldPacket data(SMSG_CHAT_PLAYER_NOT_FOUND, name.size() + 1);
    data << name;
    SendPacket(&data);
}

void WorldSession::SendWrongFactionNotice()
{
    WorldPacket data(SMSG_CHAT_WRONG_FACTION, 0);
    SendPacket(&data);
}

void WorldSession::SendChatRestrictedNotice()
{
    WorldPacket data(SMSG_CHAT_RESTRICTED, 0);
    SendPacket(&data);
}
