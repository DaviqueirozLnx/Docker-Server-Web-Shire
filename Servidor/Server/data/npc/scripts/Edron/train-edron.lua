local t = {
    enter = {x = 755, y = 849, z = 8},
	leave = {x = 757, y = 849, z = 8},

    entermsg = {"enter"},
    leavemsg = {"leave"},
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
		selfSay('Deseja entrar no campo de treinamento por 500 gold?',cid)
		talk_state = 1

	elseif talk_state == 1 then
		if msgcontains(msg, 'yes') then
			if doPlayerRemoveMoney(cid, 500) then
			  doTeleportThing(cid, t.enter)
			else
				selfSay('Sorry, you don\'t have enough money.')
			end
		 end
		talk_state = 0

  end

  if isInArray(t.leavemsg, msg) then
	selfSay('Deseja sair do campo de treinamento ?',cid)
	talk_state = 2

elseif talk_state == 2 then
	if msgcontains(msg, 'yes') then
		  doTeleportThing(cid, t.leave)
	 end
	talk_state = 0

end


  	end

        if talkState[talkUser] == 1 then
            selfSay("Alright, see you later.", cid)
            talkState[talkUser] = 0
        end

npcHandler:setMessage(MESSAGE_GREET, "Bem vindo ao campo de treinamento |PLAYERNAME| deseja entrar?!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

