-----------------------------------
-- Area: Mhaura
--  NPC: Ekokoko
-- Gouvernor of Mhaura
-- Involved in Quest: Riding on the Clouds
-- !pos -78 -24 28 249
-----------------------------------
require("scripts/globals/items")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
local ID = require("scripts/zones/Mhaura/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and
        player:getCharVar("ridingOnTheClouds_3") == 6
    then
        if trade:hasItemQty(xi.items.KINDREDS_SEAL, 1) and trade:getItemCount() == 1 then -- Trade Kindred seal
            player:setCharVar("ridingOnTheClouds_3", 0)
            player:tradeComplete()
            player:addKeyItem(xi.ki.SOMBER_STONE)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.SOMBER_STONE)
        end
    elseif
        player:getCurrentMission(ROV) == xi.mission.id.rov.SET_FREE and
        npcUtil.tradeHas(trade, {{xi.items.MANDRAGORA_DEWDROP, 3}}) and
        player:getCharVar("RhapsodiesStatus") == 2
    then
        player:startEvent(370)
    end
end

entity.onTrigger = function(player, npc)
    if math.random() > 0.5 then
        player:startEvent(51)
    else
        player:startEvent(52)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    -- RoV: Set Free
    if csid == 370 then
        player:confirmTrade()
        if player:hasJob(0) == false then -- Is Subjob Unlocked
            npcUtil.giveKeyItem(player, xi.ki.GILGAMESHS_INTRODUCTORY_LETTER)
        else
            if not npcUtil.giveItem(player, xi.items.COPPER_AMAN_VOUCHER) then return end
        end
        player:completeMission(xi.mission.log_id.ROV, xi.mission.id.rov.SET_FREE)
        player:addMission(xi.mission.log_id.ROV, xi.mission.id.rov.THE_BEGINNING)
    end
end

return entity
