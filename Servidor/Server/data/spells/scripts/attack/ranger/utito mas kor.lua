local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_HASTEGA)
condition:setParameter(CONDITION_PARAM_TICKS, 10000)
combat:addCondition(condition)

function onCastSpell(creature, variant)
if getPlayerStorageValue(creature, 115) > os.time() then
doPlayerSendCancel(creature, "Espere "..getPlayerStorageValue(creature, 115) - os.time().." segundos para usar a Instinto Voraz novamente.")
return false
end

setPlayerStorageValue(creature, 115, os.time() + 25)

	addEvent(function()
        doPlayerSendTextMessage(creature, MESSAGE_STATUS_WARNING, "CD Pronto: Instinto Voraz.")
    end, 25000)


doSendAnimatedText("Drain!", creature:getPosition(),TEXTCOLOR_WHITE_EXP)


setPlayerStorageValue(creature, 123124, os.time() + 10)

	return combat:execute(creature, variant)
end
