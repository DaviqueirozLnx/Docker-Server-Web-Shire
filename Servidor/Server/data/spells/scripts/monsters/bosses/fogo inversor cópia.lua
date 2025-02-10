local spell = {}
spell.config = {
    [3] = {
   damageType = COMBAT_FIREDAMAGE,
   areaEffect = 38,
   area = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 2, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   }   
    },
    [2] = {
   damageType = COMBAT_FIREDAMAGE,
   areaEffect = 38,
   area = {
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 1, 1, 1, 0, 0},
   {0, 1, 0, 0, 0, 1, 0},
   {0, 1, 0, 2, 0, 1, 0},
   {0, 1, 0, 0, 0, 1, 0},
   {0, 0, 1, 1, 1, 0, 0},
   {0, 0, 0, 0, 0, 0, 0}
   }   
    },
    [1] = {
   damageType = COMBAT_FIREDAMAGE,
   areaEffect = 38,
   area = {
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 1, 1, 1, 0, 0},
   {0, 0, 1, 2, 1, 0, 0},
   {0, 0, 1, 1, 1, 0, 0},
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 0, 0, 0, 0, 0}
   }   
    }
}
  
spell.combats = {}
for _, config in ipairs(spell.config) do
    local combat = createCombatObject()
    setCombatParam(combat, COMBAT_PARAM_TYPE, config.damageType)
    setCombatParam(combat, COMBAT_PARAM_EFFECT, config.areaEffect)
    setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -10.40, 0, -10.75, 0)
	
	local condition = createConditionObject(CONDITION_FIRE)
    setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
    addDamageCondition(condition, 10, 2000, -10000)
    addCombatCondition(combat, condition)

    setCombatArea(combat, createCombatArea(config.area))
    table.insert(spell.combats, combat)
end
function onCastSpell(creature, var)

    for n = 1, #spell.combats do
   addEvent(doCombat, (n * 120), creature, spell.combats[n], var)
    end
    return true
end