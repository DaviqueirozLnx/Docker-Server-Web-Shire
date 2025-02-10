local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 6)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 32)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0, -650, 0, -1050)

function onUseWeapon(cid, var)

	local item = cid:getSlotItem(6);
	local damage = 0;

	if item ~= null then
	damage = item:getAttack()
	end

	setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, damage, -400, 0, -650)

rand = math.random(1,20)
if rand == 10 then
doSendAnimatedText("Mind Wand!", cid:getPosition(),TEXTCOLOR_RED)
doCreatureSay(cid, "Queime até a morte!", TALKTYPE_ORANGE_1)
return doCombat(cid, combat2, var)
end
return doCombat(cid, combat, var)
end
