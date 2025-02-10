local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 56)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, 1)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -0.1, 0, -0.1, 0)

local condition = Condition(CONDITION_IMMORTAL)
condition:setParameter(CONDITION_PARAM_TICKS, 10000)
combat:addCondition(condition)

function onCastSpell(creature, variant, isHotkey)
doSendAnimatedText("10s!", creature:getPosition(),TEXTCOLOR_WHITE_EXP)
	return combat:execute(creature, variant)
end
