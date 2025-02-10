-- local area = createCombatArea { {0, 1, 1, 1, 0}, {1, 1, 1, 1, 1}, {1, 1, 3, 1, 1}, {1, 1, 1, 1, 1}, {0, 1, 1, 1, 0} }
-- local configDamage = {1, 2, 4}
-- local time = 40
-- local storage = 13

-- function onCastSpell(cid, var)

-- if getPlayerStorageValue(cid, storage) > os.time() then
-- doPlayerSendCancel(cid, "Espere "..getPlayerStorageValue(cid, storage) - os.time().." segundos para usar o Iceberg novamente.")
-- return false
-- end
-- setPlayerStorageValue(cid, storage, os.time() + time)

    -- local target = cid:getTarget()
	-- for i = 1, 3 do
	  -- addEvent(function(c, t)
	    -- if Creature(c) and Creature(t) then
		-- local level = cid:getLevel()
		-- local magicLevel = cid:getMagicLevel()
		-- local d1 = (level / 5) + (magicLevel * 5)
        -- local d2 = (level / 5) + (magicLevel * 5)
		  -- local cid = Creature(c)
		  -- local target = Creature(t)
		  -- local pos = cid:getPosition()
		  -- local tPos = target:getPosition()
		  -- doSendDistanceShoot(pos, tPos, 10)
		  -- doSendAnimatedText("Iceberg!", target:getPosition(),TEXTCOLOR_LIGHTBLUE)
		  -- doAreaCombat(cid, COMBAT_ICEDAMAGE, tPos, area, configDamage[i] * -d1 ,configDamage[i] * -d2 , 13)
	     -- end
	-- end, i * 1000, cid:getId(), target:getId())
-- end
-- return true
	-- end


local combat = Combat()
function combatFunc(damage)
combat:setParameter(COMBAT_PARAM_EFFECT, 13)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, true)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 10)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -damage, 0, -damage, 0)

local paralyze = Condition(CONDITION_PARALYZE)
paralyze:setParameter(CONDITION_PARAM_TICKS, 2000)
paralyze:setFormula(-1, 80, -1, 80)
combat:addCondition(paralyze)
end
combat:setArea(createCombatArea(AREA_CIRCLE2X2))

function onCastSpell(creature, variant)
local target = creature:getTarget()
if getPlayerStorageValue(creature, 1113) > os.time() then
doPlayerSendCancel(creature, "Espere "..getPlayerStorageValue(creature, 1113) - os.time().." segundos para usar o Iceberg novamente.")
return false
end
setPlayerStorageValue(creature, 1113, os.time() + 40)


local damageDefault = {1.5, 3.0, 6.0}
local tempo = {0, 1000, 1333.33333}
for x = 1, 3 do
addEvent(function(c, t)
local creature = Creature(c)
 local target = Creature(t)
 if(creature:getTarget() == nil) then
  return false
 end
doSendAnimatedText("Iceberg!", target:getPosition(),TEXTCOLOR_LIGHTBLUE)
combatFunc(damageDefault[x])
combat:execute(creature, variant)
end, x * tempo[x], creature:getId(), target:getId())
end
	return true
end
