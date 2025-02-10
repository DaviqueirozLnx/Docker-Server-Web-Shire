
function onUse(cid, item, frompos, item2, topos)
local player = Player(cid)
local valorstorage = 9005
local exhausted_seconds = 60



function stamina(cid)
	if Player(cid) == nil then
	return false
	end
return player:setStamina(2520)
end


if player:getStorageValue(valorstorage) > os.time() then
cid:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are already using the energetic.")
return false
end


doCreatureSay(cid, "Glep Glep!", 16)
doSendAnimatedText("Stamina Up!", cid:getPosition(),TEXTCOLOR_LIGHTGREEN)
cid:getPosition():sendMagicEffect(15)
player:setStorageValue(valorstorage, os.time() + exhausted_seconds)
doRemoveItem(item.uid,1)

end



