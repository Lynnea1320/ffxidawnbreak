#pragma once            // We don't want this header being loaded in multiple places otherwise it will look like we have a bunch of the same function.

#include "luautils.h"   // We're gonna need some stuff from the luautils for this to work.

class Adelheid // We're encompassing these function in an Adelheid class so the bot can keep its functions organized and they are called with her class name.
{
public:
    static bool verifyDiscord(std::string const& discordName) // Here we're going to verify the input from the user.
    {
        const std::size_t signFound = discordName.rfind("#");   /* We're gonna use a size_t to use a var the same size as a max string. (rfind finds the final token in the string)
                                                                   If a # is found, it will store its position and if not, it returns max string value. */
        if (signFound > discordName.length() || signFound == 0) // A Discord can't start with a # so if it's at the beginning it's wrong. If it didn't find #, the value will be the max string.
        {
            return false;                                       // Obviously that means this is not valid input.
        }
        int howManyDigits = 0;                                                   // Next we'll count the digits. We'll store it here because the loop's i will be our position not our digit counter.
        for (auto i = discordName.rfind("#") + 1; i < discordName.length(); i++) // We'll start with the character after the # and run the loop while that position is less
        {                                                                        // than the end (not equal because it seems there's trailing whitespace.)
            if (!std::isdigit(discordName[i])) // If the character we're checking is not a digit...
            {
                return false;                  // ...then the input isn't correct.
            }
            howManyDigits++;                   // We'll increase our digit counter so we can see if it is too many.
            if (howManyDigits > 4)             // If it's more than discord's 4 digits then the input is bad.
            {
                return false;                  // :(
            }
        }
        return true;                           // If we made it here without a break, then the input seems to be good. Let's tell the function that called verifyDiscord that it checks out.
    }

    static void setDiscord(CCharEntity* PChar, std::string const& discordName)            // This is where we link the character and their discord after validation.
    {
        uint32      charid = PChar->id;                                                   // We wanna know who this person is and store it in an easier format for typing.
        const char* Query  = "INSERT INTO bot_discord SET discord_name = '%s',"
                             "charid = %u ON DUPLICATE KEY UPDATE discord_name = '%s';";  //We're storing our query here rather than jamming this into the function.
        Sql_Query(SqlHandle, Query, discordName, charid, discordName);                    //This processes the query while filling in our placeholders with data.
    }
};