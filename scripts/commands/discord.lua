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
    if discordName ~=nil then
        player:verifyDiscord(discordName)
    else
        player:PrintToPlayer("You need to insert your discord display name as well as the numbers afterwards. (CASE SENSITIVE)")
        player:PrintToPlayer("Exampple: !discord MyDiscordName#1250")
    end
end