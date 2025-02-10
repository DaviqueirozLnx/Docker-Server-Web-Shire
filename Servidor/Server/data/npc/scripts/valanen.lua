local t = {
    pos = {x = 460, y = 261, z = 13},
    keys = {"anoriel"}
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
    local player = Player(cid)

    if(not npcHandler:isFocused(cid)) then
        return false
    end
    msg = msg:lower();
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

    if isInArray(t.keys, msg) then
        if player:getLevel() >= 250 then
            selfSay("You accept your fate and understand that this magic will take you to a distant place.", cid)
            talkState[talkUser] = 1
        else
            selfSay("You are not powerful enough to harness this magic. Come back when you have reached level 250.", cid)
        end
    elseif msgcontains(msg, "yes") then
        if talkState[talkUser] == 1 then
            doTeleportThing(cid, t.pos)
        end
    elseif msgcontains(msg, "no") then
        if talkState[talkUser] == 1 then
            selfSay("Alright, see you later.", cid)
            talkState[talkUser] = 0
        end
    end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
