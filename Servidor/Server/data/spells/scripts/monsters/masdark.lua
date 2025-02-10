local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -4.7, 0, -6.25, 0)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
