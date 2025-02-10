local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_POISONAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -1800, 0, -2000)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 32)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0, -2000, 0, -2300)

function onUseWeapon(cid, var)
rand = math.random(1,20)
if rand == 10 then
doSendAnimatedText("Plague Wand!", cid:getPosition(),TEXTCOLOR_LIGHTGREEN)
doCreatureSay(cid, "Sofra as 7 pragas do Egito!", TALKTYPE_ORANGE_1)
return doCombat(cid, combat2, var)
end
return doCombat(cid, combat, var)
end