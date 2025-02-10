local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                npcHandler:onThink()                    end

-- QUEST --
function Task1(cid, message, keywords, parameters, node)

local stor1 = 25578 -- this is the same STOR1 from quests.xml

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    local player = Player(cid)

    if       player:getStorageValue(stor1) < 0 then
                npcHandler:say('I will be waiting here, I guess. Please hurry up!',cid)
             player:setStorageValue(stor1, 0)
    elseif   player:getStorageValue(stor1) == 0 then
                npcHandler:say('I am still waiting for you to unlock this room.',cid)
    elseif   player:getStorageValue(stor1) == 1 then
                npcHandler:say('Thank you, the room is unlocked!! I must reward you somehow.. Here, take my money.',cid)
            doPlayerAddItem(cid, 2152, 25)
            player:setStorageValue(stor1, 2)
                 doSendMagicEffect(getCreaturePosition(cid), 13)
    elseif   player:getStorageValue(stor1) == 2 then
                npcHandler:say('You already unlocked the room, thank you!',cid)
    end
end

local node1 = keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Some bastards forced me into entering here then locked the room by pulling a lever around here somewhere. Would you please find it and unlock me?'})
      node1:addChildKeyword({'yes'}, Task1, {})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Seems like you are no better than them.', reset = true})

npcHandler:addModule(FocusModule:new())
