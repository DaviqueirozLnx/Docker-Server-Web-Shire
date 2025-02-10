local cfg = {
useEffect = true, -- display effect after item used? true = yes, false = no
removeCharge = true, -- remove rune after using it? true = yes, false = no
minLevel = 8, --level to use
effect = CONST_ME_TELEPORT -- id or name of Effect
}

local function Teleport10(player)
if isPlayer(cid) == TRUE then
xpos = getPlayerStorageValue(cid, 111)
ypos = getPlayerStorageValue(cid, 222)
zpos = getPlayerStorageValue(cid, 333)
spos = {x=xpos, y=ypos, z=zpos}
doTeleportThing(cid, spos)
doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE, 'Você foi teletransportado com sucesso.')
player:say("Teleported Home!", TALKTYPE_MONSTER_SAY)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_ENERGYAREA)
doSendAnimatedText(getCreaturePosition(cid), "Woup!!", 213)
end
return TRUE
end


local condition = createConditionObject(CONDITION_EXHAUST)
setConditionParam(condition, CONDITION_PARAM_TICKS, 5000)

local paralyze = Condition(CONDITION_PARALYZE)
paralyze:setParameter(CONDITION_PARAM_TICKS, 5000)
paralyze:setFormula(-1, 80, -1, 80)


function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)

if cid:hasCondition(CONDITION_EXHAUST) then
doPlayerSendTextMessage(cid,24, 'Você está exausto demais para usar o teleporte.')
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are exhausted to use teleport.")
return false
end


if player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot teleport with pz.")
doAddCondition(cid, exhaust)
return true
end


local teleport = getPlayerStorageValue(cid, 444)

if teleport == -1 or teleport == 0 then
savpos = {x=getThingPos(cid).x, y=getThingPos(cid).y, z=getThingPos(cid).z, stackpos=253}
setPlayerStorageValue(cid, 111, savpos.x)
setPlayerStorageValue(cid, 222, savpos.y)
setPlayerStorageValue(cid, 333, savpos.z)
setPlayerStorageValue(cid, 444, 1)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE, 'Você gravou suas coordenadas em seu teleport mistico.')

elseif teleport == 1 then
doTeleportThing(cid, savpos)
setPlayerStorageValue(cid, 444, 0)
doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE, 'Você ativou seu teleport mistico.')
doSendAnimatedText("Woup!!", savpos,TEXTCOLOR_WHITE_EXP)
player:getPosition():sendMagicEffect(cfg.effect)
doAddCondition(cid, condition)
doAddCondition(cid, paralyze)
doRemoveItem(item.uid,1)
end

return true
end