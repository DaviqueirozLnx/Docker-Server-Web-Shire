local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 77)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 28)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1.0, 0, 1.3, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 32)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 27)
setCombatFormula(combat2, COMBAT_FORMULA_SKILL, 1.0, 0, 1.3, 0)

function onUseWeapon(cid, var)
rand = math.random(1,20)
if rand == 10 then
doSendAnimatedText("Critical!", cid:getPosition(),TEXTCOLOR_RED)
doCreatureSay(cid, "Poder dos elementos!", TALKTYPE_ORANGE_1)
doCombat(cid, combat2, var)
end
return doCombat(cid, combat, var)
end