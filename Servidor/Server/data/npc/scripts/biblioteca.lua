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


local topicList = {
    NONE = 0,
    ShimaENatalier = 1,
    RESET = 2,
    ENERGYZE = 3,
    NECKLACE1 = 4,
    NECKLACE2 = 5,
    NECKLACE3 = 6
}


local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if msgcontains(msg, "mission") then
        npcHandler:say("Hmm... Vamos ver... Parece que você é um(a) aventureiro(a) corajoso(a). Tenho uma história para contar, uma história de batalhas sangrentas e lendas esquecidas. Você está interessado(a) em ouvir mais sobre isso?", cid)
        npcHandler.topic[cid] = topicList.ShimaENatalier
        return true
	elseif npcHandler.topic[cid] == topicList.ShimaENatalier then
		if msgcontains(msg,"yes") then
			doPlayerSendTextMessage(cid,22,"Missão de Shima e Natalier foi adicionada.")
			setPlayerStorageValue(cid,30033, 1)
		end
        return true
	end

end

npcHandler:setMessage(MESSAGE_GREET, "Bem vindo a Biblioteca, como posso ajuda |PLAYERNAME|?")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
