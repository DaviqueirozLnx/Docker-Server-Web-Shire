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
    RATOS = 1,

}

local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if msgcontains(msg, "mission") and player:getStorageValue(2467) == -1 then
        npcHandler:say("Ajuda".. player:getName()..  "! Meu depósito de comida estava infestado de ratos! Não posso perder mais comida! poderia me ajudar ?", cid)
        npcHandler.topic[cid] = topicList.RATOS
        return true
	elseif msgcontains(msg, "mission") and player:getStorageValue(2467) == 2 and player:getItemCount(2235) >= 1 then
		doPlayerSendTextMessage(cid,22,"Quest 'Infestação do armazen!' completada.")
		doPlayerAddItem(cid,2675,15)
		doPlayerAddItem(cid,2448,1)
		doPlayerAddItem(cid,2512,1)
		doPlayerAddItem(cid,2467,1)

		player:removeItem(2235,1)
		player:setStorageValue(2467, 3)
		npcHandler.topic[cid] = topicList.NONE
		return true
	elseif npcHandler.topic[cid] == topicList.RATOS then
		if msgcontains(msg,"yes") then
			npcHandler.topic[cid] = topicList.NONE
			doPlayerSendTextMessage(cid,22,"Nova quest adicionada 'Aquecimento!'.")
			player:setStorageValue(2467,1)
			doSendMagicEffect(getPlayerPosition(cid),13)
			return true
		end
        return true
	end

end

npcHandler:setMessage(MESSAGE_GREET, "Bem vindo a Rook, como posso ajudar |PLAYERNAME|?, veja se eu tenho uma missão para você digitando {mission}")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
