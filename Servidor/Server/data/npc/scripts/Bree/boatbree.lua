local t = {
    carlin = {x = 150, y = 356, z = 6},
	edron = {x = 736, y = 796, z = 6},
    tirith = {x = 475, y = 293, z = 6},
    raccoon = {x = 210, y = 74, z = 6},
    carlinmsg = {"carlin"},
    tirithmsg = {"tirith"},
    edronmsg = {"edron"},
    raccoonmsg = {"raccoon"}
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

    if isInArray(t.edronmsg, msg) then
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

		if isInArray(t.carlinmsg, msg) then
			selfSay('Do you wish to travel to carlin for 500 gold coins?',cid)
			talk_state = 2

		elseif talk_state == 2 then
			if msgcontains(msg, 'yes') then
				if doPlayerRemoveMoney(cid, 500) then
				  doTeleportThing(cid, t.carlin)
				else
					selfSay('Sorry, you don\'t have enough money.')
				end
			 end
			talk_state = 0
		end



		if isInArray(t.raccoonmsg, msg) then
			selfSay('Do you wish to travel to Femur hills for 400 gold coins?',cid)
			talk_state = 3

		elseif talk_state == 3 then
			if msgcontains(msg, 'yes') then
				if doPlayerRemoveMoney(cid, 400) then
				  doTeleportThing(cid, t.raccoon)
				else
					selfSay('Sorry, you don\'t have enough money.')
				end
			 end
			talk_state = 0
		end


		if isInArray(t.tirithmsg, msg) then
			selfSay('Do you wish to travel to tirith for 200 gold coins?',cid)
			talk_state = 4

		elseif talk_state == 4 then
			if msgcontains(msg, 'yes') then
				if doPlayerRemoveMoney(cid, 400) then
				  doTeleportThing(cid, t.tirith)
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

npcHandler:setMessage(MESSAGE_GREET, "Bem vindo ao meu navio |PLAYERNAME| para onde deseja ir?!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

