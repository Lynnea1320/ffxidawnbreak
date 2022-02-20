-----------------------------------
-- func: discord
-- desc: Links your discord to your character
-----------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
}

function onTrigger(player, discordName)
    player:verifyDiscord(player, discordName)
end