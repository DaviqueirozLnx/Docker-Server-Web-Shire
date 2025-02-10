function onUse(cid, item, frompos, item2, topos)

if item.uid == 2389 then
queststatus = getPlayerStorageValue(cid,2512)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"You have found a bow and 200 arrows.")
doPlayerAddItem(cid,2456,1)
doPlayerAddItem(cid,2544,100)
doPlayerAddItem(cid,2544,100)
doSendMagicEffect(topos,CONST_ME_MAGIC_BLUE)
doSendAnimatedText(topos, "Cleck!", TEXTCOLOR_ORANGE)
doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MAGIC_BLUE)
setPlayerStorageValue(cid,2512,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
else
return 0
end
return 1
end
