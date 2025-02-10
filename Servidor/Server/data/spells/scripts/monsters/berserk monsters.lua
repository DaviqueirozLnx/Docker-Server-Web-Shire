local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, true)
combat:setFormula(COMBAT_FORMULA_SKILL, 1.0, 0, 1.3, 0) -- skill * weapon attack and maybe*level
combat:setArea(createCombatArea( { {1, 1, 1}, {1, 2, 1}, {1, 1, 1} } ))


function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end