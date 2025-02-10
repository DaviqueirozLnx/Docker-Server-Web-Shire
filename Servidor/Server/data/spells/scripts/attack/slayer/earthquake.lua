local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 27)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, true)
combat:setFormula(COMBAT_FORMULA_SKILL, 1.0, 0, 1.3, 0)
combat:setArea(createCombatArea( {
{0, 0, 1, 0, 0},
{0, 1, 1, 1, 0},
{1, 1, 2, 1, 1},
{0, 1, 1, 1, 0},
{0, 0, 1, 0, 0}
}))

function onCastSpell(creature, variant)

function exoricombo(creature)
return combat:execute(creature, variant)
end

if getPlayerStorageValue(creature, 7000) > os.time() then
doSendAnimatedText("Combo!", creature:getPosition(),TEXTCOLOR_WHITE_EXP)
for i = 1, 5 do
addEvent(exoricombo, i * 500, creature:getId())
setPlayerStorageValue(creature, 7000, -1)
end
end
	return combat:execute(creature, variant)
end







