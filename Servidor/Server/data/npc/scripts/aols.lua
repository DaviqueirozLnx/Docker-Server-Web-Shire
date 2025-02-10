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



local function necklace(cid, playerProps)
	if playerProps:getItemCount(2198) >= 1 and playerProps:getItemCount(2161) >= 1 and playerProps:getItemCount(2170) >= 1 and playerProps:getItemCount(2171) >= 1 and playerProps:getItemCount(2172) >= 1 and playerProps:getItemCount(2201) >= 1 then
		playerProps:removeItem(2198,1)
		playerProps:removeItem(2161,1)
		playerProps:removeItem(2170,1)
		playerProps:removeItem(2171,1)
		playerProps:removeItem(2172,1)
		playerProps:removeItem(2201,1)

		doPlayerSendTextMessage(cid,22,"Você recebeu um Elemental Necklace.")
		doPlayerAddItem(playerProps,2197,1)


	else
		npcHandler:say("você não tem todos os amuletos necessários.", cid)
        return true
	end
end

local function amulet(cid, playerProps)
	if playerProps:getItemCount(2129) >= 1 and playerProps:getItemCount(2133) >= 1 and playerProps:getItemCount(2130) >= 1 and playerProps:getItemCount(2199) >= 1 and playerProps:getItemCount(2135) >= 1 and playerProps:getItemCount(2126) >= 1 and playerProps:getItemCount(2131) >= 1 then
		playerProps:removeItem(2129,1)
		playerProps:removeItem(2133,1)
		playerProps:removeItem(2130,1)
		playerProps:removeItem(2199,1)
		playerProps:removeItem(2135,1)
		playerProps:removeItem(2126,1)
		playerProps:removeItem(2131,1)

		doPlayerSendTextMessage(cid,22,"Você recebeu um Spirit Elemental Amulet.")
		doPlayerAddItem(playerProps,2173,1)


	else
		npcHandler:say("você não tem todos os amuletos necessários.", cid)
        return true
	end
end

local function magic(cid, playerProps)
	if playerProps:getItemCount(2118) >= 1 and playerProps:getItemCount(2142) >= 1 and playerProps:getItemCount(2132) >= 1 and playerProps:getItemCount(2136) >= 1 and playerProps:getItemCount(2138) >= 1 and playerProps:getItemCount(2196) >= 1 and playerProps:getItemCount(2131) >= 1 then
		playerProps:removeItem(2118,1)
		playerProps:removeItem(2142,1)
		playerProps:removeItem(2132,1)
		playerProps:removeItem(2136,1)
		playerProps:removeItem(2138,1)
		playerProps:removeItem(2200,1)
		playerProps:removeItem(2196,1)

		doPlayerSendTextMessage(cid,22,"Você recebeu um Elemental magic amulet.")
		doPlayerAddItem(playerProps,2125,1)


	else
		npcHandler:say("você não tem todos os amuletos necessários.", cid)
        return true
	end
end

local function energyze(cid, playerProps, msg)
	if msgcontains(msg, 'yes') and playerProps:getItemCount(2197) >= 1 then

		if doPlayerRemoveMoney(playerProps, 50000) then
			doPlayerSendTextMessage(playerProps,22,"Você energizou seu Elemental necklace.")
			playerProps:getPosition():sendMagicEffect(28)
			playerProps:removeItem(2197,1)
			doPlayerAddItem(playerProps,13682,1)
			talk_state = 0
			else
			selfSay('você não tem dinheiro suficiente!')
			talk_state = 0
			end

	elseif msgcontains(msg, 'yes') and playerProps:getItemCount(2173) >= 1 then
		if doPlayerRemoveMoney(playerProps, 150000) then
			doPlayerSendTextMessage(playerProps,22,"Você energizou seu Spirit Elemental amulet.")
			playerProps:getPosition():sendMagicEffect(28)
			playerProps:removeItem(2173,1)
			doPlayerAddItem(playerProps,13683,1)
			talk_state = 0
			else
			selfSay('você não tem dinheiro suficiente!')
			talk_state = 0
			end

	elseif msgcontains(msg, 'yes') and playerProps:getItemCount(2125) >= 1 then
		if doPlayerRemoveMoney(playerProps, 300000) then
			doPlayerSendTextMessage(playerProps,22,"Você energizou seu Elemental magic amulet.")
			playerProps:getPosition():sendMagicEffect(28)
			playerProps:removeItem(2125,1)
			doPlayerAddItem(playerProps,13684,1)
			talk_state = 0
			else
			selfSay('você não tem dinheiro suficiente!')
			talk_state = 0
			end

	elseif msgcontains(msg, 'yes') and playerProps:getItemCount(2197) >= 0 and playerProps:getItemCount(2125) >= 0 and playerProps:getItemCount(2173) >= 0 then
			selfSay('You dont have this item!')
			talk_state = 0



		end
end

local topicList = {
    NONE = 0,
    DEUS = 1,
    RESET = 2,
    ENERGYZE = 3,
    NECKLACE1 = 4,
    NECKLACE2 = 5,
    NECKLACE3 = 6
}

local questList = {
	RESET = 30032,
	DEUS = 30039,

}



local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if msgcontains(msg, "deus") then
        npcHandler:say("Bem... pelo visto deseja se tornar um Deus, a jornada pode ser bastante longa, cheia de desafios. Tem certeza que deseja evoluir sua alma?", cid)
        npcHandler.topic[cid] = topicList.DEUS
        return true
	elseif msgcontains(msg, "reset") then
        npcHandler:say("Saudações, viajante. Percebo que busca aprimorar suas habilidades. Talvez seja sábio procurar o Mestre Orin para orienta-l(a)o, deseja iniciar esta jornada ?", cid)
		npcHandler.topic[cid] = topicList.RESET
		return true
	elseif msgcontains(msg, "necklace") then
        npcHandler:say("Para criar um Elemetal Necklace, será necessário os seguintes itens amuletos:  mysterious, dragon breath, scorpion, platinum, fluids e vampire tooth, deseja realmente que eu o crie?", cid)
        npcHandler.topic[cid] = topicList.NECKLACE1
        return true
	elseif msgcontains(msg, "amulet") then
        npcHandler:say("Para criar um Spirit Elemetal Amulet, será necessário os seguintes itens amuletos:  Ialamar, frozzen, sickness, Samantha, Mastafar, priest e eletric, deseja realmente que eu o crie?", cid)
        npcHandler.topic[cid] = topicList.NECKLACE2
        return true
	elseif msgcontains(msg, "magic") then
        npcHandler:say("Para criar um Elemental magic Amulet , será necessário os seguintes itens amuletos:  Merlian, relic of the hell, Broonier, Thordain, dark wyzard, angel e gaya, deseja realmente que eu o crie?", cid)
        npcHandler.topic[cid] = topicList.NECKLACE3
        return true
	elseif msgcontains(msg, "energyze") then
		npcHandler:say("Posso energizar seu colar com minha aura por 50k, seu amuleto por 100k ou seu amuleto mágico por 150k, você quer que eu energize-os com minha aura?", cid)
        npcHandler.topic[cid] = topicList.ENERGYZE
        return true

	elseif msg == "offer" then
		local offer = ""

		doShowTextDialog(cid, 2125, "Topicos que podem falar comigo!\n\nenergyze\nmagic\namulet\nnecklace\ndeus\nreset" )
		return true
    elseif npcHandler.topic[cid] == topicList.DEUS then
		if player:getLevel() >= 500 and player:getStorageValue(questList.DEUS) == -1 then
			doSendMagicEffect(player:getPosition(),CONST_ME_MAGIC_BLUE)
			npcHandler:say("Procure Arkalis!", cid)
			doPlayerSendTextMessage(cid,22,"Quest 'O Conhecimento!' adicionada .")
			player:setStorageValue(questList.DEUS, 1)
        	return true
		elseif player:getStorageValue(questList.DEUS) == 1 or  player:getStorageValue(questList.DEUS) == 2 then
			npcHandler:say("A missão ja está em andamento.", cid)
			return false
		elseif player:getStorageValue(questList.DEUS) == 3  then
			npcHandler:say("A missão ja foi concluida.", cid)
			return false
		else
			npcHandler:say("você não tem nível suficiente para fazer isso.", cid)
            return false
		end
        -- deus(cid, player)
	elseif npcHandler.topic[cid] == topicList.NECKLACE1 then
		if msgcontains(msg,"yes") then
			necklace(cid, player)
		end
        return true
	elseif npcHandler.topic[cid] == topicList.NECKLACE2 then
		if msgcontains(msg,"yes") then
			amulet(cid, player)
		end
        return true
	elseif npcHandler.topic[cid] == topicList.NECKLACE3 then
		if msgcontains(msg,"yes") then
			magic(cid, player)
		end
        return true
	elseif npcHandler.topic[cid] == topicList.RESET then
		if msgcontains(msg,"yes") then
			if player:getVocation():getId()  < 13 then
				npcHandler:say("você não tem vocação suficiente para fazer isso.", cid)
				return false
			end

			if player:getLevel() < 500 then
				npcHandler:say("você não tem Level suficiente para fazer isso.", cid)
				return false
			end

			doSendMagicEffect(player:getPosition(),CONST_ME_MAGIC_BLUE)
			npcHandler:say("Procure Mestre Orin!", cid)
			doPlayerSendTextMessage(cid,22,"Quest 'O Renascimento!' adicionada .")
			player:setStorageValue(30050,1)
			return true
		end
        return true
	elseif npcHandler.topic[cid] == topicList.ENERGYZE then
		if msgcontains(msg,"yes") then
			energyze(cid, player, msg)
		end
        return true
	end

end

npcHandler:setMessage(MESSAGE_GREET, "Bem vindo ao meu templo, como posso ajuda |PLAYERNAME|?")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
