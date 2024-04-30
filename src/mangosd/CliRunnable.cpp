/*
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

// \addtogroup mangosd
// @{
// \file

#include "Common.h"
#include "World.h"
#include "Config/Config.h"
#include "Util.h"
#include "CliRunnable.h"
#include "Database/DatabaseEnv.h"
#include "readline/readline.h"
#include "readline/history.h"

void utf8print(void* /*arg*/, const char* str)
{
#if PLATFORM == PLATFORM_WINDOWS
    std::wstring wtemp_buf;
    std::string temp_buf(str);

    if (!Utf8toWStr(temp_buf, wtemp_buf, 6000))
        return;

    // Guarantee null termination
    if (!temp_buf.empty())
    {
        wtemp_buf.push_back('\0');
        temp_buf.resize(wtemp_buf.size());
        CharToOemBuffW(&wtemp_buf[0], &temp_buf[0], wtemp_buf.size());
    }

    printf("%s", temp_buf.c_str());
#else
    printf("%s", str);
#endif
}

static bool s_canReadLine = true;

void commandFinished(void*, bool /*sucess*/)
{
    fflush(stdout);
    rl_on_new_line();
    s_canReadLine = true;
}

// @}

int checkStopped()
{
    if (World::IsStopped())
    {
        rl_clear_message();
        rl_done = 1;
        rl_free_line_state();
        rl_cleanup_after_signal();
    }
    return 0;
}

// %Thread start
void CliRunnable::operator()()
{
    // Init new SQL thread for the world database (one connection call enough)
    WorldDatabase.ThreadStart(); // let thread do safe mySQL requests

    // Display the list of available CLI functions then beep
    if (sConfig.GetBoolDefault("BeepAtStart", true))
        printf("\a"); // \a = Alert

    rl_event_hook = &checkStopped;
    // TODO: tab completion
    rl_bind_key('\t', rl_insert);

    // As long as the World is running (no World::m_stopEvent), get the command line and handle it
    while (!World::IsStopped())
    {
        fflush(stdout);

        if (s_canReadLine)
        {
            char *command_str = readline("vmangos>");
            // don't save empty commands
            if (command_str && *command_str)
                add_history(command_str);

            if (command_str != nullptr)
            {
                for (int x = 0;command_str[x];x++)
                    if (command_str[x] == '\r' || command_str[x] == '\n')
                    {
                        command_str[x] = 0;
                        break;
                    }

                if (!*command_str)
                    continue;

                std::string command;
                if (!consoleToUtf8(command_str, command))         // convert from console encoding to utf8
                    continue;

                s_canReadLine = false;
                sWorld.QueueCliCommand(new CliCommandHolder(0, SEC_CONSOLE, nullptr, command.c_str(), &utf8print, &commandFinished));
            }
        }
        #ifndef WIN32
        free(command_str);
        #endif
    }
}
