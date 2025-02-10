local waves = 16 --- numero de vezes que vão cair as flechas

local water = {490, 491, 492, 493, 4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625}
local combat = createCombatObject()
local meteor = createCombatObject()
setCombatParam(meteor, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(meteor, COMBAT_PARAM_EFFECT, 16)
setCombatFormula(meteor, COMBAT_FORMULA_LEVELMAGIC, -30, -50, -40, -55)

local meteor_water = createCombatObject()
setCombatParam(meteor_water, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(meteor_water, COMBAT_PARAM_EFFECT, 16)
setCombatFormula(meteor, COMBAT_FORMULA_LEVELMAGIC, -30, -50, -40, -55)

combat_arr = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
}
local combat_area = createCombatArea(combat_arr)
setCombatArea(combat, combat_area)

local function meteorCast(p)
doCombat(p.cid, p.combat, positionToVariant(p.pos))
end

local function stunEffect(cid)
doSendMagicEffect(getThingPos(cid), CONST_ME_STUN)
end

function onTargetTile(cid, pos)
if (math.random(3, 6) == 6) then
local ground = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0})
if (isInArray(water, ground.itemid) == TRUE) then
local newpos = {x = pos.x - 7, y = pos.y - 6, z = pos.z}
doSendDistanceShoot(newpos, pos, 4)
addEvent(meteorCast, 200, {cid = cid, pos = pos, combat = meteor_water})
else
local newpos = {x = pos.x - 7, y = pos.y - 6, z = pos.z}
doSendDistanceShoot(newpos, pos, 4)
addEvent(meteorCast, 200, {cid = cid,pos = pos, combat = meteor})
end
end
end
setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")
function onCastSpell(cid, var)
	for i = 0, waves do
		addEvent(function()
			if isCreature(cid) then
				doCombat(cid, combat, var)
			end
		end, 200 * i)
	end
	
 
return true
end