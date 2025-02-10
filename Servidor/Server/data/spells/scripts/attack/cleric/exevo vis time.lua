local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 43)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, true)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 33)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -3.0, 0, -3.3, 0)
combat:setArea(createCombatArea( { {1, 1, 1}, {1, 3, 1}, {1, 1, 1} } ))

local paralyze = Condition(CONDITION_EXHAUST)
paralyze:setParameter(CONDITION_PARAM_TICKS, 2500)
combat:addCondition(paralyze)


function onCastSpell(creature, variant)
local target = creature:getTarget()
if getPlayerStorageValue(creature, 14) > os.time() then
doPlayerSendCancel(creature, "Espere "..getPlayerStorageValue(creature, 14) - os.time().." segundos para usar o Chamado do Vazio novamente.")
return false
end
setPlayerStorageValue(creature, 14, os.time() + 25)

	addEvent(function()
        doPlayerSendTextMessage(creature, MESSAGE_STATUS_WARNING, "CD Pronto: Chamado do Vazio.")
    end, 25000)


doSendAnimatedText("Silence!", target:getPosition(),TEXTCOLOR_WHITE_EXP)
combat:execute(creature, variant)
	return true
end
