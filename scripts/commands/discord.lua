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
        if not player:verifyDiscord(discordName) then
            player:PrintToPlayer("You need to insert your discord display name as well as the numbers afterwards. (CASE SENSITIVE)")
            player:PrintToPlayer("Example: !discord MyDiscordName#1250")
        end
    else
        player:PrintToPlayer("You need to insert your discord display name as well as the numbers afterwards. (CASE SENSITIVE)")
        player:PrintToPlayer("Example: !discord MyDiscordName#1250")
    end
end