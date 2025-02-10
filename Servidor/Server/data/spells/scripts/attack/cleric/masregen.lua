local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

local condition = Condition(CONDITION_REGENERATION)
condition:setParameter(CONDITION_PARAM_TICKS, 6000)
condition:setParameter(CONDITION_PARAM_STAT_MAXHITPOINT, 670)
condition:setParameter(CONDITION_PARAM_HEALTHTICKS, 1000)
condition:setParameter(CONDITION_PARAM_MANAGAIN, 500)
condition:setParameter(CONDITION_PARAM_MANATICKS, 1000)
combat:addCondition(condition)

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 1) + (magicLevel * 1.3)
	local max = (level / 1) + (magicLevel * 1.5)
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
doSendAnimatedText("Regen!", creature:getPosition(),TEXTCOLOR_LIGHTGREEN)
	return combat:execute(creature, variant)
end
