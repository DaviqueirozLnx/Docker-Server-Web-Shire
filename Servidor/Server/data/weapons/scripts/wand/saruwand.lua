local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -2400, 0, -2700)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 32)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0, -2700, 0, -2900)

function onUseWeapon(cid, var)
rand = math.random(1,20)
if rand == 10 then
doSendAnimatedText("Saruman Wand!", cid:getPosition(),TEXTCOLOR_BLUE)
doCreatureSay(cid, "A energia obscura o consumirá!", TALKTYPE_ORANGE_1)
return doCombat(cid, combat2, var)
end
return doCombat(cid, combat, var)
end