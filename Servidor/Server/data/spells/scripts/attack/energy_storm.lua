local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_TELEPORT)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1.5, 0, -1.5, 0)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_TELEPORT)
combat2:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1.0, 0, -1.0, 0)
combat2:setArea(createCombatArea(AREA_CIRCLE5X5))

function onCastSpell(creature, variant)
function energycombo(creature)
return combat:execute(creature, variant)
end
function energycombo2(creature)
return combat2:execute(creature, variant)
end
if getPlayerStorageValue(creature, 7000) > os.time() and getPlayerVocation(creature) > 8 then
doSendAnimatedText("Combo!", creature:getPosition(),TEXTCOLOR_WHITE_EXP)
for i = 1, 5 do
addEvent(energycombo, i * 500, creature:getId())
setPlayerStorageValue(creature, 7000, -1)
end
elseif getPlayerStorageValue(creature, 7000) > os.time() and getPlayerVocation(creature) < 8 then
doSendAnimatedText("Combo!", creature:getPosition(),TEXTCOLOR_WHITE_EXP)
for i = 1, 3 do
addEvent(energycombo2, i * 500, creature:getId())
setPlayerStorageValue(creature, 7000, -1)
end
end
if getPlayerVocation(creature) > 8 then
	return combat:execute(creature, variant)
elseif getPlayerVocation(creature) < 8 then
	return combat2:execute(creature, variant)
end
end