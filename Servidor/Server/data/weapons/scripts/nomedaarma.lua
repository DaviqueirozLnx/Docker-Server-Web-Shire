function onUseWeapon(cid)
local mindmg, maxdmg = 500000, 1000000
local target = getCreatureTarget(cid)

doTargetCombatHealth(cid, target, COMBAT_PHYSICALDAMAGE, - mindmg, - maxdmg)
return true
end