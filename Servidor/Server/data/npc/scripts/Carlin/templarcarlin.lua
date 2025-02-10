local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)
    npcHandler:onCreatureAppear(cid)
end

function onCreatureDisappear(cid)
    npcHandler:onCreatureDisappear(cid)
end

function onCreatureSay(cid, type, msg)
    npcHandler:onCreatureSay(cid, type, msg)
end

function onThink()
    npcHandler:onThink()
end

local function greetCallback(cid)
    -- count[cid], transfer[cid] = nil, nil
    return true
end

local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if msgcontains(msg, "temple") then
        npcHandler:say("Você deseja morar em Carlin?", cid)
        npcHandler.topic[cid] = 1
        return true
	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg,"yes") then
		player:getPosition():sendMagicEffect(13)
		player:setTown(Town(3))
		player:sendTextMessage(22,"Você agora é morador de Carlin.")
		addEvent(function()
			player:kickPlayer()
		end, 4000)

		end
        return true
	end

end

npcHandler:setMessage(MESSAGE_GREET, "Bem vindo ao templo de Carlin |PLAYERNAME|!")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
