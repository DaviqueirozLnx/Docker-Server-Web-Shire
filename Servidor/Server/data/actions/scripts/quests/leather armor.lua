function onUse(cid, item, frompos, item2, topos)

if item.uid == 2467 then
queststatus = getPlayerStorageValue(cid,2467)
if queststatus == 1 then
doPlayerSendTextMessage(cid,22,"Você encontrou o Queijo do Glovian.")
doPlayerSendTextMessage(cid,19,"Quest 'Infestação do armazen!' completada.")
doPlayerAddItem(cid,2235,1)
doSendMagicEffect(topos,CONST_ME_MAGIC_BLUE)
doSendAnimatedText("Cleck!",topos, TEXTCOLOR_ORANGE)
doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MAGIC_BLUE)
setPlayerStorageValue(cid,2467,2)
else
doPlayerSendTextMessage(cid,22,"O Baú está vazio.")
end
else
return 0
end
return 1
end
