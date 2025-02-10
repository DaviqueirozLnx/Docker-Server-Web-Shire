local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_POISON)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat2, COMBAT_PARAM_DISPEL, CONDITION_FIRE)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat3, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat4, COMBAT_PARAM_DISPEL, CONDITION_EMO)

local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat5, COMBAT_PARAM_DISPEL, CONDITION_ENERGY)

local combat6 = createCombatObject()
setCombatParam(combat6, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat6, COMBAT_PARAM_DISPEL, CONDITION_HASTE)

local combat7 = createCombatObject()
setCombatParam(combat7, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat7, COMBAT_PARAM_DISPEL, CONDITION_OUTFIT)

local combat8 = createCombatObject()
setCombatParam(combat8, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat8, COMBAT_PARAM_DISPEL, CONDITION_INVISIBLE)

local combat9 = createCombatObject()
setCombatParam(combat9, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat9, COMBAT_PARAM_DISPEL, CONDITION_LIGHT)

local combat10 = createCombatObject()
setCombatParam(combat10, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat10, COMBAT_PARAM_DISPEL, CONDITION_MANASHIELD)

local combat11 = createCombatObject()
setCombatParam(combat11, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat11, COMBAT_PARAM_DISPEL, CONDITION_DROWN)

local combat12 = createCombatObject()
setCombatParam(combat12, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat12, COMBAT_PARAM_DISPEL, CONDITION_DRUNK)


function onCastSpell(cid, var)
     doSendAnimatedText("Dispel!", cid:getPosition(),TEXTCOLOR_WHITE_EXP)
	doCombat(cid, combat2, var)
	doCombat(cid, combat3, var)
	doCombat(cid, combat4, var)
	doCombat(cid, combat5, var)
	doCombat(cid, combat6, var)
	doCombat(cid, combat7, var)
	doCombat(cid, combat8, var)
	doCombat(cid, combat9, var)
	doCombat(cid, combat10, var)
	doCombat(cid, combat11, var)
	doCombat(cid, combat12, var)
	return doCombat(cid, combat, var)
end

