function onUse(player, item, fromPosition, target, toPosition, isHotkey)
local storage = 2023
local time = 1
local hm1 = (getPlayerMaxMana(player)/15 +100)
local hm2 = (getPlayerMaxMana(player)/15 +150)
local mana = math.ceil(math.random(hm1, hm2))
local position = player:getPosition()

if player:hasCondition(CONDITION_EMPTY) then
    doPlayerSendCancel(player, "You are exhausted to use small mana fluid.")
    return false
    end

if getPlayerStorageValue(player, storage) > os.time() then
return true
end
setPlayerStorageValue(player, storage, os.time() + time)
player:addMana(mana)
doSendAnimatedText("Aah..", player:getPosition(),TEXTCOLOR_ORANGE)
doPlayerSendCancel(player,"Você usou uma small mana fluid.")
return true
end
