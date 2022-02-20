#pragma once

#include "luautils.h"

class Adelheid
{
public:
    static void verifyDiscord(CCharEntity* PChar, std::string const& discordName)
    {
        uint32      charid = PChar->id;
        const char* Query  = "INSERT INTO bot_discord SET discord_name = '%s', charid = %u ON DUPLICATE KEY UPDATE discord_name = '%s';";
        Sql_Query(SqlHandle, Query, discordName, charid, discordName);
    };
};