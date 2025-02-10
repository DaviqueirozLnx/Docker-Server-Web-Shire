local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 50)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -0.8, 0, -1.3, 0)

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 50)
combat2:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1.3, 0, -1.5, 0)

local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
combat3:setParameter(COMBAT_PARAM_EFFECT, 51)
combat3:setFormula(COMBAT_FORMULA_LEVELMAGIC, 0.3, 0, 0.5, 0)

local combat4 = Combat()
combat4:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat4:setParameter(COMBAT_PARAM_EFFECT, 51)
combat4:setFormula(COMBAT_FORMULA_LEVELMAGIC, 0.3, 0, 0.5, 0)

local combat5 = Combat()
combat5:setParameter(COMBAT_PARAM_EFFECT, 92)

local condition = Condition(CONDITION_EXHAUST)
condition:setParameter(CONDITION_PARAM_TICKS, 2000)
combat5:addCondition(condition)


function onCastSpell(creature, variant, isHotkey)
	print("sd")
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


function sdcombo(creature)
return combat:execute(creature, variant)
end
	if getPlayerStorageValue(creature, 7000) > os.time() then
	doSendAnimatedText("Combo!", creature:getPosition(),TEXTCOLOR_WHITE_EXP)
		for i = 1, 5 do
			addEvent(function(c, t)
			local creature = Creature(c)
			local target = Creature(t)
			if(creature:getTarget() == nil) then
			return false
			end
			combat:execute(creature, variant)
			setPlayerStorageValue(creature, 7000, -1)
			end, i * 500, creature:getId(), target:getId())
		end
	end
rand = math.random(1,20)
if rand == 10 then
doCreatureSay(creature, "Novice.SD!", TALKTYPE_ORANGE_1)
return combat2:execute(creature, variant)
end
	return combat:execute(creature, variant)
end
