local condition = createConditionObject(CONDITION_SOUL)
setConditionParam(condition, CONDITION_PARAM_TICKS, 600000)
condition:setParameter(CONDITION_PARAM_SOULGAIN, 2)
condition:setParameter(CONDITION_PARAM_SOULTICKS, 1000)

function onUse(cid, item, frompos, item2, topos)

if cid:hasCondition(CONDITION_SOUL) then
cid:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are already using the captive soul.")
return false
end

doCreatureSay(cid, "Glap Glap!", 16)
doSendAnimatedText("Capt. Soul!", cid:getPosition(),TEXTCOLOR_RED)
cid:getPosition():sendMagicEffect(14)
doAddCondition(cid, condition)
doRemoveItem(item.uid,1)
end