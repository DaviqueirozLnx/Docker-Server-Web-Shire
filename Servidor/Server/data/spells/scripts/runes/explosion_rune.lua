local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -0.8, 0, -1.1, 0)
combat:setArea(createCombatArea(AREA_CROSS1X1))

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONAREA)
combat2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
combat2:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1.1, 0, -1.3, 0)
combat2:setArea(createCombatArea(AREA_CROSS1X1))


function onCastSpell(creature, variant, isHotkey)
rand = math.random(1,20)
if rand == 10 then
doCreatureSay(creature, "Explo!", TALKTYPE_ORANGE_1)
return combat2:execute(creature, variant)
end
	return combat:execute(creature, variant)
end
