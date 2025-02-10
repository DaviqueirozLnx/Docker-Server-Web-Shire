function onUse(player, item, fromPosition, target, toPosition, isHotkey)
local storage = 2023
local time = 1
local hm1 = (getPlayerMaxMana(player)/11 +150)
local hm2 = (getPlayerMaxMana(player)/11 +250)
local mana = math.ceil(math.random(hm1, hm2))

if player:hasCondition(CONDITION_EMPTY) then
    doPlayerSendCancel(player, "You are exhausted to use large mana fluid.")
    return false
    end

local position = player:getPosition()
if getPlayerStorageValue(player, storage) > os.time() then
return true
end
setPlayerStorageValue(player, storage, os.time() + time)
player:addMana(mana)
doSendAnimatedText("Aaah..", player:getPosition(),TEXTCOLOR_ORANGE)
doPlayerSendCancel(player,"Você usou uma large mana fluid.")
item:remove(1)
return true
end
