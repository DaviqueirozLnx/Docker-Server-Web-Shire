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
    if msgcontains(msg, "lugar orc") then
        npcHandler:say("Então você veio a mandado da Rainha de Carlin?", cid)
        npcHandler.topic[cid] = 1
        return true
	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg,"yes") then
			player:getPosition():sendMagicEffect(13)
			npcHandler:say("vá rápido!", cid)
			doPlayerSendTextMessage(cid,22,"Quest 'O Resgate de sarina!' atualiza.")
			player:setStorageValue(30038, 2)
		end
        return true
	end

end

npcHandler:setMessage(MESSAGE_GREET, "Olá, como posso ajudar |PLAYERNAME|?")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
