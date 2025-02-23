-----------------------------------
-- Prishe Item 1
-----------------------------------
local ID = require("scripts/zones/Empyreal_Paradox/IDs")
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 1
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(xi.msg.basic.NONE)
    if (mob:getTarget() and mob:getTarget():getFamily() == 478) then
        -- using Ambrosia!
        target:addStatusEffect(xi.effect.FOOD, 0, 0, 14400, 4511)
        mob:messageText(mob, ID.text.PRISHE_TEXT + 8, false)
    else
        -- using Daedalus Wing!
        mob:addTP(1000)
        mob:messageText(mob, ID.text.PRISHE_TEXT + 9, false)
    end
    return 0
end

return mobskill_object
