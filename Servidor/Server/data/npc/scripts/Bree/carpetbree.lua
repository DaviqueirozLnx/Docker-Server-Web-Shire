local t = {
	mordor = {msg="mordor",pos={x = 1158, y = 1086, z = 6}, pay=5000},
	bramum = {msg="bramum",pos={x=793, y=2058, z=6}, pay=2500},
	canudis = {msg="canudis",pos={x=752, y=1932, z=6}, pay=1000},
	morgun = {msg="morgun",pos={x=881, y=1879, z=6}, pay=2500},
	tanoris = {msg="tanoris",pos={x=1094, y=1883, z=6}, dsp=100},
	hell = {msg="hell",pos={x=881, y=1879, z=6}, pay=2500},

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

    if msgcontains(msg, t.bramum.msg) then
			  selfSay('você deseja viajar para Bramum por '.. t.bramum.pay ..' moedas de ouro?',cid)
			  talk_state = 1

		  elseif talk_state == 1 then
			  if msgcontains(msg, 'yes') then
				  if doPlayerRemoveMoney(cid, t.bramum.pay) then
					doTeleportThing(cid, t.bramum.pos)
				  else
					  selfSay('Sorry, you don\'t have enough money.')
				  end
			   end
			  talk_state = 0
		end


		if msgcontains(msg, t.canudis.msg) then
			selfSay('você deseja viajar para canudis por '.. t.canudis.pay .. ' moedas de ouro?',cid)
			talk_state = 2

		elseif talk_state == 2 then
			if msgcontains(msg, 'yes') then
				if doPlayerRemoveMoney(cid, t.canudis.pay) then
				  doTeleportThing(cid, t.canudis.pos)
				else
					selfSay('Sorry, you don\'t have enough money.')
				end
			 end
			talk_state = 0
	  end


	  if msgcontains(msg, t.hell.msg) then
		selfSay('você deseja viajar para Hell por ' .. t.hell.pay .. ' moedas de ouro?',cid)
		talk_state = 3

	elseif talk_state == 3 then
		if msgcontains(msg, 'yes') then
			if doPlayerRemoveMoney(cid, t.hell.pay) then
			  doTeleportThing(cid, t.hell.pos)
			else
				selfSay('Sorry, you don\'t have enough money.')
			end
		 end
		talk_state = 0
  end


  if msgcontains(msg, t.mordor.msg) then
	selfSay('você deseja viajar para Mordor por ' .. t.mordor.pay .. ' moedas de ouro?',cid)
	talk_state = 4

elseif talk_state == 4 then
	if msgcontains(msg, 'yes') then
		if doPlayerRemoveMoney(cid, t.mordor.pay) then
		  doTeleportThing(cid, t.mordor.pos)
		else
			selfSay('Sorry, you don\'t have enough money.')
		end
	 end
	talk_state = 0
end


if msgcontains(msg, t.morgun.msg) then
	selfSay('você deseja viajar para Morgun por ' .. t.morgun.pay .. ' moedas de ouro?',cid)
	talk_state = 5

elseif talk_state == 5 then
	if msgcontains(msg, 'yes') then
		if doPlayerRemoveMoney(cid, t.morgun.pay) then
		  doTeleportThing(cid, t.morgun.pos)
		else
			selfSay('Sorry, you don\'t have enough money.')
		end
	 end
	talk_state = 0
end

if msgcontains(msg, t.tanoris.msg) then
	selfSay('você deseja viajar para Tanoris por ' .. t.tanoris.dsp .. ' slp?',cid)
	talk_state = 6

elseif talk_state == 6 then
	if msgcontains(msg, 'yes') then
		if doPlayerRemoveMoney(cid, t.tanoris.pay) then
		  doTeleportThing(cid, t.tanoris.pos)
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

npcHandler:setMessage(MESSAGE_GREET, "Bem vindo ao meu Tapete mágico |PLAYERNAME| para onde deseja ir?!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

