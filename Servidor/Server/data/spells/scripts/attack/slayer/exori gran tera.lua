local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 61)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, true)
combat:setParameter(COMBAT_PARAM_CREATEITEM, 5396)
combat:setFormula(COMBAT_FORMULA_SKILL, 4.5, 0, 5.0, 0)
combat:setArea(createCombatArea( {
{0, 0, 0, 0, 0, 0, 0},
{0, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 2, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 0},
{0, 0, 0, 0, 0, 0, 0},
}))

local time = 40
local storage = 16

function onCastSpell(creature, variant)

if getPlayerStorageValue(creature, storage) > os.time() then
doPlayerSendCancel(creature, "Espere "..getPlayerStorageValue(creature, storage) - os.time().." segundos para usar o Cárcere Erosivo novamente.")
return false
end
setPlayerStorageValue(creature, storage, os.time() + time)

	addEvent(function()
        doPlayerSendTextMessage(creature, MESSAGE_STATUS_WARNING, "CD Pronto: Cárcere Erosivo.")
    end, 40000)

	return combat:execute(creature, variant)
end






