local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 42)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOYLDAMAGE)
setCombatParam(combat, COMBAT_PARAM_AGRESSIVE, true)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -10.40, 0, -10.75, 0)

local paralyze = Condition(CONDITION_PARALYZE)
paralyze:setParameter(CONDITION_PARAM_TICKS, 4000)
paralyze:setFormula(-1, 80, -1, 80)
combat:addCondition(paralyze)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 18)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_AGRESSIVE, true)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -10.40, 0, -10.75, 0)

local paralyze = Condition(CONDITION_WEAKNESS)
paralyze:setParameter(CONDITION_PARAM_TICKS, 4000)
combat2:addCondition(paralyze)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 44)
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_AGRESSIVE, true)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -10.40, 0, -10.75, 0)

local condition = createConditionObject(CONDITION_FIRE)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 10, 2000, -5000)
addCombatCondition(combat3, condition)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 98)
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_AGRESSIVE, true)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -10.40, 0, -10.75, 0)

local paralyze = Condition(CONDITION_PARALYZE)
paralyze:setParameter(CONDITION_PARAM_TICKS, 4000)
paralyze:setFormula(-1, 80, -1, 80)
combat4:addCondition(paralyze)

local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_EFFECT, 65)
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat5, COMBAT_PARAM_AGRESSIVE, true)
setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -10.40, 0, -10.75, 0)

local condition = createConditionObject(CONDITION_POISON)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 10, 2000, -5000)
addCombatCondition(combat5, condition)

local arr = {
{1, 1, 1},
{1, 2, 1},
{1, 1, 1}
}

local arr2 = {
{0, 1, 1, 1, 0},
{1, 0, 0, 0, 1},
{1, 0, 2, 0, 1},
{1, 0, 0, 0, 1},
{0, 1, 1, 1, 0},
}

local arr3 = {
{0, 0, 1, 1, 1, 0, 0},
{0, 1, 0, 0, 0, 1, 0},
{1, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 2, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 1},
{0, 1, 0, 0, 0, 1, 0},
{0, 0, 1, 1, 1, 0, 0}
}

local arr4 = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
}

local arr5 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{1, 1, 0, 0, 0, 2, 0, 0, 0, 1, 1},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

local area = createCombatArea(arr)
setCombatArea(combat, area) -- holy

local area2 = createCombatArea(arr2)
setCombatArea(combat2, area2) -- death

local area3 = createCombatArea(arr3)
setCombatArea(combat3, area3) -- fogo

local area4 = createCombatArea(arr4)
setCombatArea(combat4, area4) -- gelo

local area5 = createCombatArea(arr5)
setCombatArea(combat5, area5) -- terra

function onCastSpell(creature, variant)


function holyspell(creature)
doCombat(creature, combat, variant)
doCombat(creature, combat2, variant)
doCombat(creature, combat3, variant)
doCombat(creature, combat4, variant)
return doCombat(creature, combat5, variant)
end
for i = 1, 3 do
addEvent(holyspell, i * 800, creature:getId())
end
return true
end