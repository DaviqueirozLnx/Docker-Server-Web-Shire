local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 10)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -150, 0, -350)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 32)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0, -350, 0, -420)

function onUseWeapon(cid, var)
rand = math.random(1,20)
if rand == 10 then
doSendAnimatedText("Arcane Wand!", cid:getPosition(),TEXTCOLOR_BLUE)
doCreatureSay(cid, "Electabuzz!", TALKTYPE_ORANGE_1)
return doCombat(cid, combat2, var)
end
return doCombat(cid, combat, var)
end