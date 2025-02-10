function onCastSpell(cid, var)

local target = getCreatureTarget(cid)
local pos = getThingPos(cid)
local tPos = {x = getThingPos(target).x, y = getThingPos(target).y, z = getThingPos(target).z}

if(target > 0) then
doSendDistanceShoot(pos, tPos, 47)
doSendAnimatedText("Jump!", tPos,TEXTCOLOR_WHITE_EXP)
doSendMagicEffect(tPos,27)
doTeleportThing(cid, tPos)
end
return true
end