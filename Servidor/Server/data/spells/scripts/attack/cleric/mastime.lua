local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, true)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))

local condition = Condition(CONDITION_EXHAUST)
condition:setParameter(CONDITION_PARAM_TICKS, 2000)
combat:addCondition(condition)

local paralyze = Condition(CONDITION_PARALYZE)
paralyze:setParameter(CONDITION_PARAM_TICKS, 2000)
paralyze:setFormula(-1, 80, -1, 80)
combat:addCondition(paralyze)

function onCastSpell(creature, variant)
doSendAnimatedText("Silence!", creature:getPosition(),TEXTCOLOR_WHITE_EXP)
	return combat:execute(creature, variant)
end
