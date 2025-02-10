local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 35)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 50)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, 1)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1.3, 0, -1.7, 0)

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end
