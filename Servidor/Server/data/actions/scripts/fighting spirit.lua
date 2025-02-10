local dbexp = createConditionObject(CONDITION_DOUBLE_XP)
setConditionParam(dbexp, CONDITION_PARAM_TICKS, 1800000)

function onUse(cid, item, frompos, item2, topos)

if cid:hasCondition(CONDITION_DOUBLE_XP) then
cid:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are already using the fighting spirit.")
return false
end

doCreatureSay(cid, "Glop Glop!", 16)
doSendAnimatedText("Fight. Spirit!", cid:getPosition(),TEXTCOLOR_ORANGE)
cid:getPosition():sendMagicEffect(14)
doAddCondition(cid, dbexp)
doRemoveItem(item.uid,1)
end