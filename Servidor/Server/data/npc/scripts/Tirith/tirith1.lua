local t = {
    enter = {x = 448, y = 272, z = 7},
    leave = {x = 448, y = 275, z = 7},
    entermsg = {"enter"},
    leavenmsg = {"leave"},

}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local talk_state = 0

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

    if isInArray(t.entermsg, msg) then
                    doTeleportThing(player, t.enter)
              talk_state = 1

          elseif talk_state == 1 then
              if msgcontains(msg, 'yes') then
               end
              talk_state = 0

        end


        if isInArray(t.leavenmsg, msg) then
                  doTeleportThing(cid, t.leave)
            talk_state = 1

        elseif talk_state == 1 then
            if msgcontains(msg, 'yes') then
             end
            talk_state = 0



      end

        if talkState[talkUser] == 1 then
            selfSay("Alright, see you later.", cid)
            talkState[talkUser] = 0
        end
    end

npcHandler:setMessage(MESSAGE_GREET, "Bem vindo a entrada da cidade |PLAYERNAME|, para onde deseja ir?!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
