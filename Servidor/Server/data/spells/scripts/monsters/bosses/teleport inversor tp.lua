function onCastSpell(cid, var)

local target = getCreatureTarget(cid)
local pos = getThingPos(cid)
local tPos = {x = getThingPos(target).x, y = getThingPos(target).y, z = getThingPos(target).z}

if(target > 0) then
doSendDistanceShoot(pos, tPos, 45)
doSendAnimatedText("Swapped!", pos,TEXTCOLOR_LIGHTBLUE)
doSendMagicEffect(pos,12)
doTeleportThing(target, pos)
doTeleportThing(cid, tPos)
end
return true
end