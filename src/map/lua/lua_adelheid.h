#pragma once

#include "luautils.h"

class Adelheid
{
public:
    static void verifyDiscord(CCharEntity* PChar, char* discordName)
    {
        uint32      charid = PChar->id;
        const char* Query  = "UPDATE bot_discord SET discord_display = %s WHERE charid = %u;";
        Sql_Query(SqlHandle, Query, discordName, charid);
    };
};