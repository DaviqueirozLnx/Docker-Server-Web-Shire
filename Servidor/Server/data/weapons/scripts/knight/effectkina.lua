

function onUseWeapon(cid, var)
local target = cid:getTarget()
addMagicEffect(target:getPosition(), 76)
end


combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, 1)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)