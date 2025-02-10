local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 68)
combat:setFormula(COMBAT_FORMULA_SKILL, 1.5, 0, 1.7, 0)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 2500)
condition:setFormula(-1, 80, -1, 80)
combat:addCondition(condition)

function onCastSpell(creature, variant)

    if getPlayerStorageValue(creature, 100) > os.time() then
        doPlayerSendCancel(creature, "Espere " .. getPlayerStorageValue(creature, 100) - os.time() .. " segundos para usar a Lâminas Incisivas novamente.")
        return false
    end
    setPlayerStorageValue(creature, 100, os.time() + 25)
	
	addEvent(function()
        doPlayerSendTextMessage(creature, MESSAGE_STATUS_WARNING, "CD Pronto: Lâminas Incisivas.")
    end, 25000)

    local target = creature:getTarget()
    if not target or getDistanceBetween(creature:getPosition(), target:getPosition()) > 1 then
        doPlayerSendCancel(creature, "Você está muito longe do alvo.")
        return false
    end

    local pos = getThingPos(creature)
    doSendMagicEffect(pos, 60)
    doSendAnimatedText("Fury!", creature:getPosition(), TEXTCOLOR_RED)

    for i = 1, 5 do
        addEvent(function(c, t)
            local creature = Creature(c)
            local target = Creature(t)
            if not creature or not target then
                return false
            end
            
            -- Verifica se a distância entre o conjurador e o alvo é maior que 1
            if getDistanceBetween(creature:getPosition(), target:getPosition()) > 1 then
                doPlayerSendCancel(creature, "A magia foi cancelada porque você se afastou do alvo.")
                return false
            end

            combat:execute(creature, variant)
            doCreatureAddHealth(creature, (getCreatureMaxHealth(creature) / 10))
        end, i * 500, creature:getId(), target:getId())
    end
    return true
end