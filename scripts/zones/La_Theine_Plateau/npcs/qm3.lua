-----------------------------------
-- Area: La Theine Plateau
--  NPC:??? (qm3)
-- Involved in Quest: I Can Hear A Rainbow
-----------------------------------
local ID = require("scripts/zones/La_Theine_Plateau/IDs")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.I_CAN_HEAR_A_RAINBOW) == QUEST_ACCEPTED and
        npcUtil.tradeHas(trade, 1125) and
        utils.mask.isFull(player:getCharVar("I_CAN_HEAR_A_RAINBOW"), 7)
    then
        player:startEvent(124)
    end
end

entity.onTrigger = function(player, npc)
    if (player:getCurrentMission(COP) == xi.mission.id.cop.THREE_PATHS and player:getCharVar("COP_Tenzen_s_Path") == 0) then
        player:startEvent(203)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 124) then
        player:completeQuest(xi.quest.log_id.WINDURST, xi.quest.id.windurst.I_CAN_HEAR_A_RAINBOW)
        player:addTitle(xi.title.RAINBOW_WEAVER)
        player:unlockJob(xi.job.SMN)
        player:addSpell(296)
        player:messageSpecial(ID.text.UNLOCK_SUMMONER)
        player:messageSpecial(ID.text.UNLOCK_CARBUNCLE)
        player:setCharVar("I_CAN_HEAR_A_RAINBOW", 0)
        player:confirmTrade()
        player:changeContainerSize(xi.inv.WARDROBE2, player:getContainerSize(xi.inv.WARDROBE2)+5)
        player:PrintToPlayer(string.format("Your second Mog Wardrobe size has increased to %i.", player:getContainerSize(xi.inv.WARDROBE2)), xi.msg.channel.SYSTEM_3)

        local rainbow = GetNPCByID(ID.npc.RAINBOW)
        rainbow:setLocalVar('setRainbow', 1)
    elseif (csid == 203) then
        player:setCharVar("COP_Tenzen_s_Path", 1)
    end
end

return entity
