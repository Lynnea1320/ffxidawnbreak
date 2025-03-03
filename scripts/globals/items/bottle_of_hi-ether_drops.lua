-----------------------------------
-- ID: 5358
-- Item: Hi-Ether Drop
-- Item Effect: Restores 45 MP
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    if (target:hasStatusEffect(xi.effect.MEDICINE)) then
        return xi.msg.basic.ITEM_NO_USE_MEDICATED
    end
    return 0
end

item_object.onItemUse = function(target)
    target:addMP(45*xi.settings.ITEM_POWER)
    target:addStatusEffect(xi.effect.MEDICINE, 0, 0, 300)
end

return item_object
