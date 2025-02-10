function onUse(cid, item, frompos, item2, topos)

item2:setAttribute("attack",item2:getAttribute("attack") + 100)
-- item2:setAttribute("attackspeed",item2:getAttribute("attackspeed") + 100)
-- print("description",item2:getDescription())
-- print("attack",item2:getAttack())
-- print("attackspeed",item2:getAttackSpeed())
-- print("defense",item2:getDefense())
-- print("extradefense",item2:getExtraDefense())
-- print("armor",item2:getArmor())
-- print("text",item2:getAttribute("text"))


if item2.itemid == 2391 then
doTransformItem(item2.uid,13664)
doDecayItem(item2.uid)
doPlayerSendTextMessage(cid,19,"Agora sua war hammer esta [+1].")
doRemoveItem(item.uid,1)

elseif item2.itemid == 2393 then
doTransformItem(item2.uid,13657)
doDecayItem(item2.uid)
doPlayerSendTextMessage(cid,19,"Agora sua giant sword esta [+1].")
doRemoveItem(item.uid,1)

elseif item2.itemid == 2414 then
doTransformItem(item2.uid,13667)
doDecayItem(item2.uid)
doPlayerSendTextMessage(cid,19,"Agora sua dragon lance esta [+1].")
doRemoveItem(item.uid,1)

elseif item2.itemid == 2493 then
doTransformItem(item2.uid,13654)
doDecayItem(item2.uid)
doPlayerSendTextMessage(cid,19,"Agora sua demon helmet esta [+1].")
doRemoveItem(item.uid,1)

elseif item2.itemid == 2470 then
doTransformItem(item2.uid,13652)
doDecayItem(item2.uid)
doPlayerSendTextMessage(cid,19,"Agora sua golden legs esta [+1].")
doRemoveItem(item.uid,1)

elseif item2.itemid == 2472 then
doTransformItem(item2.uid,13631)
doDecayItem(item2.uid)
doPlayerSendTextMessage(cid,19,"Agora sua magic plate armor esta [+1].")
doRemoveItem(item.uid,1)

elseif item2.itemid == 13654 then
doTransformItem(item2.uid,13655)
doDecayItem(item2.uid)
doPlayerSendTextMessage(cid,19,"Agora sua demon helmet esta [+2].")
doRemoveItem(item.uid,1)

elseif item2.itemid == 13652 then
doTransformItem(item2.uid,13653)
doDecayItem(item2.uid)
doPlayerSendTextMessage(cid,19,"Agora sua golden legs esta [+2].")
doRemoveItem(item.uid,1)

elseif item2.itemid == 13631 then
doTransformItem(item2.uid,13630)
doDecayItem(item2.uid)
doPlayerSendTextMessage(cid,19,"Agora sua magic plate armor esta [+2].")
doRemoveItem(item.uid,1)
else
doPlayerSendTextMessage(cid,19,"Voce n�o pode forjar esse item.")
end
end

