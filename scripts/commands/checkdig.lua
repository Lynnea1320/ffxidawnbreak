-----------------------------------
-- func: checkdig
-- desc: Checks your chocobo digging skill level.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
--------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:PrintToPlayer(string.format("Your chocobo digging skill is %i.", player:getCharSkillLevel(xi.skill.DIG)/10), xi.msg.SYSTEM_3)
end