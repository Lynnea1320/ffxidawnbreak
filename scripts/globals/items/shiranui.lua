-----------------------------------
-- ID: 17774
-- Item: Shiranui
-- Additional Effect: Light Damage (night time only)
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onAdditionalEffect = function(player, target, damage)
    if (VanadielHour() >= 18 or VanadielHour() <= 6) then
        local chance = 15
        if (math.random(0, 99) >= chance) then
            return 0, 0, 0
        else
            local dmg = math.random(9, 11)
            local params = {}
            params.bonusmab = 0
            params.includemab = false
            dmg = addBonusesAbility(player, xi.magic.ele.LIGHT, target, dmg, params)
            dmg = dmg * applyResistanceAddEffect(player, target, xi.magic.ele.LIGHT, 0)
            dmg = adjustForTarget(target, dmg, xi.magic.ele.LIGHT)
            dmg = finalMagicNonSpellAdjustments(player, target, xi.magic.ele.LIGHT, dmg)

            local message = xi.msg.basic.ADD_EFFECT_DMG
            if (dmg < 0) then
                message = xi.msg.basic.ADD_EFFECT_HEAL
            end

            return xi.subEffect.LIGHT_DAMAGE, message, dmg
        end
    else
        return 0, 0, 0
    end
end

return item_object
