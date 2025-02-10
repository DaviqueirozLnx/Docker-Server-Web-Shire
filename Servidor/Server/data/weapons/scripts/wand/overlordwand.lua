local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 99)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 33)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -3950, 0, -4050)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 32)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 33)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0, -4050, 0, -4450)

function onUseWeapon(cid, var)
rand = math.random(1,20)
if rand == 10 then
doSendAnimatedText("Overlord Wand!", cid:getPosition(),TEXTCOLOR_BLUE)
doCreatureSay(cid, "Haha! Tá eletrizado!?", TALKTYPE_ORANGE_1)
return doCombat(cid, combat2, var)
end
return doCombat(cid, combat, var)
end