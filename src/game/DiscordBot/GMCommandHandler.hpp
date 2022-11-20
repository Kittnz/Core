#pragma once
#include "BaseCommandHandler.hpp"

#include <unordered_map>



namespace DiscordBot
{
    class GMCommandHandler : public BaseCommandHandler
    {
    public:
        GMCommandHandler() = default;

        ~GMCommandHandler() noexcept = default;

        void RegisterCommands(dpp::commandhandler&) override;

        bool IsAuthorized(const dpp::user*) const override;

        static void CommandPrint(std::any callbackArg, const char* output);
        static void CommandFinished(std::any callbackArg, bool sucess);

    private:

        struct CommandOutputInfo
        {
            std::string output;
            bool selfOnly;
        };

        std::unordered_map<dpp::snowflake, CommandOutputInfo> _commandOutput;
        dpp::commandhandler* _commHandler;
    };
}