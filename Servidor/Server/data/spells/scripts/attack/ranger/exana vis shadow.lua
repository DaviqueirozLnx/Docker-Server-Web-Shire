local waves = 3 --- numero de vezes que vÃ£o cair as flechas

local water = {490, 491, 492, 493, 4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625}
local combat = createCombatObject()
local meteor = createCombatObject()
setCombatParam(meteor, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(meteor, COMBAT_PARAM_EFFECT, 57)
setCombatFormula(meteor, COMBAT_FORMULA_LEVELMAGIC, -4.0, 0, -4.5, 0)

local meteor_water = createCombatObject()
setCombatParam(meteor_water, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(meteor_water, COMBAT_PARAM_EFFECT, 57)
setCombatFormula(meteor, COMBAT_FORMULA_LEVELMAGIC, -4.0, 0, -4.5, 0)

local condition = createConditionObject(CONDITION_FEAR)
setConditionParam(condition, CONDITION_PARAM_TICKS, 1000)
addCombatCondition(meteor, condition)
addCombatCondition(meteor_water, condition)

combat_arr = {
{0, 0, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 3, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 0, 0}
}

local combat_area = createCombatArea(combat_arr)
setCombatArea(combat, combat_area)

local function meteorCast(p)
doCombat(p.creature, p.combat, positionToVariant(p.pos))
end

local function stunEffect(creature)
doSendMagicEffect(getThingPos(creature), CONST_ME_STUN)
end

function onTargetTile(creature, pos)
if (math.random(6, 6) == 6) then
local ground = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0})
if (isInArray(water, ground.itemid) == TRUE) then
local newpos = {x = pos.x - 7, y = pos.y - 6, z = pos.z}
doSendDistanceShoot(newpos, pos, 30)
addEvent(meteorCast, 200, {creature = creature, pos = pos, combat = meteor_water})
else
local newpos = {x = pos.x - 7, y = pos.y - 6, z = pos.z}
doSendDistanceShoot(newpos, pos, 30)
addEvent(meteorCast, 200, {creature = creature,pos = pos, combat = meteor})
end
end
end
setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")
function onCastSpell(creature, var)
local target = creature:getTarget()

    if getPlayerStorageValue(creature, 1115) > os.time() then
        doPlayerSendCancel(creature, "Espere " .. getPlayerStorageValue(creature, 1115) - os.time() .. " segundos para usar a Rajada Mortífera novamente.")
        return false
    end
    setPlayerStorageValue(creature, 1115, os.time() + 40)
	
	addEvent(function()
        doPlayerSendTextMessage(creature, MESSAGE_STATUS_WARNING, "CD Pronto: Rajada Mortífera.")
    end, 40000)
	
	for i = 0, waves do
        addEvent(function(c, t)
            local creature = Creature(c)
            local target = Creature(t)
         if(creature:getTarget() == nil) then
		 return false
         end
            combat:execute(creature, var)
        end, i * 500, creature:getId(), target:getId())
    end
 
return true
end