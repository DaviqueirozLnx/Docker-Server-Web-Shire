local t = {
    keys = {"brewqe12ee"},
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
			  selfSay('Do you wish to travel to Edron for 400 gold coins?',cid)
			  talk_state = 1

		  elseif talk_state == 1 then
			  if msgcontains(msg, 'yes') then
				  if doPlayerRemoveMoney(cid, 400) then
					doTeleportThing(cid, t.edron)
				  else
					  selfSay('Sorry, you don\'t have enough money.')
				  end
			   end
			  talk_state = 0

		end


  	end

        if talkState[talkUser] == 1 then
            selfSay("Alright, see you later.", cid)
            talkState[talkUser] = 0
        end

npcHandler:setMessage(MESSAGE_GREET, "Olá |PLAYERNAME| a funcionalidade de criação e acompanhamento de guild pode ser feita pelo site ou pelo applicativo, nossos desenvolvedores estã trabalhando para adicionar a funcionalidade em game?!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

