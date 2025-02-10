local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 79)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, true)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 45)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -2.5, 0, -2.8, 0)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))

local paralyze = Condition(CONDITION_EXHAUST)
paralyze:setParameter(CONDITION_PARAM_TICKS, 500)
combat:addCondition(paralyze)

local condition = Condition(CONDITION_ROOTS)
condition:setParameter(CONDITION_PARAM_TICKS, 500)
combat:addCondition(condition)

function onCastSpell(creature, variant)
local target = creature:getTarget()
if getPlayerStorageValue(creature, 1114) > os.time() then
doPlayerSendCancel(creature, "Espere "..getPlayerStorageValue(creature, 1114) - os.time().." segundos para usar o Aperto Ínfero novamente.")
return false
end
setPlayerStorageValue(creature, 1114, os.time() + 40)

	addEvent(function()
        doPlayerSendTextMessage(creature, MESSAGE_STATUS_WARNING, "CD Pronto: Aperto Ínfero.")
    end, 40000)

doSendAnimatedText("Supressed!", target:getPosition(),TEXTCOLOR_WHITE_EXP)

for i = 1, 6 do
addEvent(function(c, t)
local creature = Creature(c)
 local target = Creature(t)
 if(creature:getTarget() == nil) then
  return false
 end
combat:execute(creature, variant)
end, i * 500, creature:getId(), target:getId())
end
	return true
end
