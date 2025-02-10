local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, 1)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1.3, 0, -1.7, 0)

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end
