local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, true)

local condition = Condition(CONDITION_EXHAUST)
condition:setParameter(CONDITION_PARAM_TICKS, 3000)
combat:addCondition(condition)

function onCastSpell(creature, variant)

if getPlayerStorageValue(creature, 6999) > os.time() then
doPlayerSendCancel(creature, "Espere "..getPlayerStorageValue(creature, 6999) - os.time().." segundos para usar o Power Up novamente.")
return false
end
setPlayerStorageValue(creature, 6999, os.time() + 10)

function tempo(creature)
doPlayerSendTextMessage(creature,MESSAGE_STATUS_WARNING,"Seu tempo de 'Power Up' acabou.")
end
local exhausted_storagevalue = 7000
local exhausted_seconds = 10
doSendAnimatedText("Power Up!", creature:getPosition(),TEXTCOLOR_WHITE_EXP)
doAddCondition(creature, condition)
setPlayerStorageValue(creature, exhausted_storagevalue, os.time() + exhausted_seconds)
addEvent(tempo, 10 * 1000, creature:getId())
	return combat:execute(creature, variant)
end


