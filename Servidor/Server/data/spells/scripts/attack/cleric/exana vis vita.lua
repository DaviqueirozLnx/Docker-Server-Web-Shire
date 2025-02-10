local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 60)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, true)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1.5, 0, -1.8, 0)


function onCastSpell(creature, variant)
local target = creature:getTarget()
if getPlayerStorageValue(creature, 114) > os.time() then
doPlayerSendCancel(creature, "Espere "..getPlayerStorageValue(creature, 114) - os.time().." segundos para usar o Visões Maléficas novamente.")
return false
end
setPlayerStorageValue(creature, 114, os.time() + 25)

	addEvent(function()
        doPlayerSendTextMessage(creature, MESSAGE_STATUS_WARNING, "CD Pronto: Visões Maléficas.")
    end, 25000)
	
	doSendAnimatedText("Evil!", target:getPosition(),TEXTCOLOR_WHITE_EXP)

for i = 1, 12 do
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
