local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 38)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -5.40, 0, -5.75, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 38)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -10.40, 0, -10.75, 0)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 38)
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -20.40, 0, -20.75, 0)

local condition = createConditionObject(CONDITION_FIRE)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 10, 2000, -10000)
addCombatCondition(combat, condition)
addCombatCondition(combat2, condition)
addCombatCondition(combat3, condition)

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

local area = createCombatArea(arr)
setCombatArea(combat, area)

local area2 = createCombatArea(arr2)
setCombatArea(combat2, area2)

local area3 = createCombatArea(arr3)
setCombatArea(combat3, area3) 

function onCastSpell(creature, variant)
function FIspell(creature)
doCombat(creature, combat, variant)
end
function FIspell2(creature)
doCombat(creature, combat2, variant)
end
function FIspell3(creature)
doCombat(creature, combat3, variant)
end
for i = 1, 1 do
addEvent(FIspell, i * 120, creature:getId())
addEvent(FIspell2, i * 240, creature:getId())
addEvent(FIspell3, i * 360, creature:getId())
end
return true
end