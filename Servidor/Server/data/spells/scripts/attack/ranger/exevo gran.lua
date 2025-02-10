local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 15000)
condition:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 30)
combat:addCondition(condition)

function onCastSpell(creature, variant)
if getPlayerStorageValue(creature, 15) > os.time() then
doPlayerSendCancel(creature, "Espere "..getPlayerStorageValue(creature, 15) - os.time().." segundos para usar a Infusão Versátil novamente.")
return false
end
setPlayerStorageValue(creature, 15, os.time() + 25)

	addEvent(function()
        doPlayerSendTextMessage(creature, MESSAGE_STATUS_WARNING, "CD Pronto: Infusão Versátil.")
    end, 25000)

doSendAnimatedText("Skill Up!", creature:getPosition(),TEXTCOLOR_LIGHTBLUE)
	return combat:execute(creature, variant)
end
