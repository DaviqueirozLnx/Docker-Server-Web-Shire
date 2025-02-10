local t = {
    pos = {x = 753, y = 817, z = 3},
    keys = {"edron"}
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

    if isInArray(t.keys, msg) then
			  selfSay('Do you wish to travel to Edron for 800 gold coins?',cid)
			  talk_state = 1

		  elseif talk_state == 1 then
			  if msgcontains(msg, 'yes') then
				  if doPlayerRemoveMoney(cid, 800) then
					doTeleportThing(cid, t.pos)
				  else
					  selfSay('Sorry, you don\'t have enough money.')
				  end
			   end
			  talk_state = 0

	  elseif msgcontains(msg, 'offer') then
			  selfSay('I can take you to Edron for just a small fee.')
		  end
	  end
        if talkState[talkUser] == 1 then
            selfSay("Alright, see you later.", cid)
            talkState[talkUser] = 0
        end

npcHandler:setMessage(MESSAGE_GREET, "Bem vindo ao tapete magico |PLAYERNAME|!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

