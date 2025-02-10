local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 37)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 11)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -4.0, 0, -4.5, 0)

local paralyze = Condition(CONDITION_FEAR)
paralyze:setParameter(CONDITION_PARAM_TICKS, 5000)
combat:addCondition(paralyze)

local condition = Condition(CONDITION_CURSED)
condition:setParameter(CONDITION_PARAM_TICKS, 5000)
condition:addDamage(5, 2000, -2000)
combat:addCondition(condition)


function onCastSpell(creature, variant)
    if getPlayerStorageValue(creature, 113) > os.time() then
        doPlayerSendCancel(creature, "Espere " .. getPlayerStorageValue(creature, 113) - os.time() .. " segundos para usar a Sussuro das Sombras novamente.")
        return false
    end
    setPlayerStorageValue(creature, 113, os.time() + 25)
	
	addEvent(function()
        doPlayerSendTextMessage(creature, MESSAGE_STATUS_WARNING, "CD Pronto: Sussuro das Sombras.")
    end, 25000)

    local target = creature:getTarget()

    local pos = getThingPos(creature)
    doSendMagicEffect(pos, 60)
    doSendAnimatedText("Darkness!", target:getPosition(), TEXTCOLOR_WHITE_EXP)
	
    for i = 1, 1 do
        addEvent(function(c, t)
            local creature = Creature(c)
            local target = Creature(t)
            if not creature or not target then
                return false
            end
            combat:execute(creature, variant)
        end, i * 1, creature:getId(), target:getId())
    end
    return true
end