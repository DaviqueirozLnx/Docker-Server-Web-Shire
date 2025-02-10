local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -2.15, 0, -2.9, 0)

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)
combat2:setFormula(COMBAT_FORMULA_LEVELMAGIC, -2.9, 0, -3.1, 0)

local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
combat3:setParameter(COMBAT_PARAM_EFFECT, 51)
combat3:setFormula(COMBAT_FORMULA_LEVELMAGIC, 0.5, 0, 0.7, 0)

local combat4 = Combat()
combat4:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat4:setParameter(COMBAT_PARAM_EFFECT, 51)
combat4:setFormula(COMBAT_FORMULA_LEVELMAGIC, 0.5, 0, 0.7, 0)

local combat5 = Combat()
combat5:setParameter(COMBAT_PARAM_EFFECT, 92)

local condition = Condition(CONDITION_EXHAUST)
condition:setParameter(CONDITION_PARAM_TICKS, 2000)
combat5:addCondition(condition)


function onCastSpell(creature, variant, isHotkey)
local target = creature:getTarget()
if isPlayer(target) ~= nil and isPlayer(creature) ~= nil and target:getOutfit().lookType == 194 then
doSendAnimatedText("Reflect!", target:getPosition(),TEXTCOLOR_WHITE_EXP)
combat:execute(creature, variant)
return combat:execute(target, positionToVariant(getCreaturePosition(creature)))
elseif isPlayer(target) ~= nil and isPlayer(creature) ~= nil and target:getOutfit().lookType == 251 then
doSendAnimatedText("Heal!", target:getPosition(),TEXTCOLOR_WHITE_EXP)
combat:execute(creature, variant)
combat3:execute(creatue, positionToVariant(getCreaturePosition(target)))
return combat4:execute(creature, positionToVariant(getCreaturePosition(target)))
elseif isPlayer(target) ~= nil and isPlayer(creature) ~= nil and target:getOutfit().lookType == 262 then
doSendAnimatedText("Silence!", creature:getPosition(),TEXTCOLOR_WHITE_EXP)
combat:execute(creature, variant)
return combat5:execute(target, positionToVariant(getCreaturePosition(creature)))
end


rand = math.random(1,20)
if rand == 10 then
doCreatureSay(creature, "Ex.SD!", TALKTYPE_ORANGE_1)
return combat2:execute(creature, variant)
end
	return combat:execute(creature, variant)
end
