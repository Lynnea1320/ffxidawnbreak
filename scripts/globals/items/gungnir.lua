-----------------------------------
-- ID: 18300, 18301, 18643, 18657, 18671, 19752, 19845, 20925, 20926, 21857
-- Item: Gungnir
-- Additional Effect: Weakens Defense
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------
local item_object = {}

item_object.onAdditionalEffect = function(player, target, damage)
    local chance = 10

    if math.random(100) <= chance and applyResistanceAddEffect(player, target, xi.magic.ele.WIND, 0) > 0.5 then
        target:delStatusEffect(xi.effect.DEFENSE_BOOST)
        target:addStatusEffect(xi.effect.DEFENSE_DOWN, 17, 0, 60) -- Power and duration needs verification
        return xi.subEffect.DEFENSE_DOWN, xi.msg.basic.ADD_EFFECT_STATUS, xi.effect.DEFENSE_DOWN
    end

    return 0, 0, 0
end

return item_object
