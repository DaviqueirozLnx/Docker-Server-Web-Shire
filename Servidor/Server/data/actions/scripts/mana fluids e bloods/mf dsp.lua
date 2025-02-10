function onUse(player, item, fromPosition, target, toPosition, isHotkey)
local storage = 2023
local time = 1
local hm1 = (getPlayerMaxMana(player)/7 +250)
local hm2 = (getPlayerMaxMana(player)/7 +300)
local mana = math.ceil(math.random(hm1, hm2))
local position = player:getPosition()

if player:hasCondition(CONDITION_EMPTY) then
    doPlayerSendCancel(player, "You are exhausted to use great mana fluid.")
    return false
    end

if getPlayerStorageValue(player, storage) > os.time() then
return true
end

setPlayerStorageValue(player, storage, os.time() + time)
player:addMana(mana)
doSendAnimatedText("Aaaahh..", player:getPosition(),TEXTCOLOR_ORANGE)
doPlayerSendCancel(player,"Você usou uma great mana fluid.")
item:remove(1)
return true
end
