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

local function deus(cid, playerProps)

	if playerProps:getItemCount(6550) < 100 then
        npcHandler:say('Você ainda não tem todas as essencias necesárias.', cid)
        return false
    end
    if playerProps:getLevel() < 400 then
        npcHandler:say("Você está muito fraco. Volte quando estiver mais forte, seu corpo não aguentaria o imenso poder dos Deuses.", cid)
        return false
    end

	if playerProps:getVocation():getId() >= 9 and playerProps:getVocation():getId() < 11  then
		playerProps:addMagicLevel(10)
		playerProps:sendTextMessage(22,"Sua alma foi evoluida a Deus!")
		playerProps:addMaxHealth(185)
		playerProps:setMaxMana(35)
		playerProps:addMana(35)
		playerProps:setVocation(playerProps:getVocation():getId()+4)
		playerProps:getPosition():sendMagicEffect(28)
		playerProps:removeItem(6500,100)

		if(playerProps:getSex() == 1) then
			doBroadcastMessage("O nobre guerreiro "  .. getCreatureName(playerProps) .." evoluiu sua alma a Deus", 22)
		elseif(playerProps:getSex() == 0) then
			doBroadcastMessage("A nobre guerreira " .. getCreatureName(playerProps) .. " evoluiu sua alma a Deus",22)
		end

		addEvent(function ()
			doResetLevel(playerProps)
			return true
			end, 2000)

	elseif playerProps:getVocation():getId() ==  11 then
		playerProps:addMagicLevel(2)
		playerProps:addSkillLevel(4,10)
		playerProps:addSkillLevel(5,10)
		playerProps:sendTextMessage(22,"Sua alma foi evoluida a Deus!")
		playerProps:addMaxHealth(185)
		playerProps:setMaxMana(35)
		playerProps:addMana(35)
		playerProps:setVocation(playerProps:getVocation():getId()+4)
		playerProps:getPosition():sendMagicEffect(28)
		playerProps:removeItem(6500,100)

		addEvent(function ()
			doResetLevel(playerProps)
			return true
			end, 2000)

			return true
	elseif playerProps:getVocation():getId() == 12 then
		playerProps:addSkillLevel(cid,0,10)
		playerProps:addSkillLevel(cid,1,10)
		playerProps:addSkillLevel(cid,2,10)
		playerProps:addSkillLevel(cid,3,10)
		playerProps:addSkillLevel(cid,5,10)
		playerProps:sendTextMessage(22,"Sua alma foi evoluida a Deus!")
		playerProps:addMaxHealth(185)
		playerProps:setMaxMana(35)
		playerProps:addMana(35)
		playerProps:setVocation(playerProps:getVocation():getId()+4)
		playerProps:getPosition():sendMagicEffect(28)
		playerProps:removeItem(6500,100)

		addEvent(function ()
			doResetLevel(playerProps)
			return true
			end, 2000)

			return true
	end
end

local function necklace(cid, playerProps)
	if playerProps:getItemCount(2198) >= 1 and playerProps:getItemCount(2161) >= 1 and playerProps:getItemCount(2170) >= 1 and playerProps:getItemCount(2171) >= 1 and playerProps:getItemCount(2172) >= 1 and playerProps:getItemCount(2201) >= 1 then
		playerProps:removeItem(2198,1)
		playerProps:removeItem(2161,1)
		playerProps:removeItem(2170,1)
		playerProps:removeItem(2171,1)
		playerProps:removeItem(2172,1)
		playerProps:removeItem(2201,1)

		doPlayerSendTextMessage(cid,22,"Voce recebeu um Elemental Necklace.")
		doPlayerAddItem(playerProps,2197,1)


	else
		npcHandler:say("Você não tem todos os amuletos necessários.", cid)
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

		doPlayerSendTextMessage(cid,22,"Voce recebeu um Spirit Elemental Amulet.")
		doPlayerAddItem(playerProps,2173,1)


	else
		npcHandler:say("Você não tem todos os amuletos necessários.", cid)
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

		doPlayerSendTextMessage(cid,22,"Voce recebeu um Elemental magic amulet.")
		doPlayerAddItem(playerProps,2125,1)


	else
		npcHandler:say("Você não tem todos os amuletos necessários.", cid)
        return true
	end
end

local function energyze(cid, playerProps, msg)
	if msgcontains(msg, 'yes') and playerProps:getItemCount(2197) >= 1 then

		if doPlayerRemoveMoney(playerProps, 10000) then
			doPlayerSendTextMessage(playerProps,22,"Voce energizou seu Elemental necklace.")
			playerProps:getPosition():sendMagicEffect(28)
			playerProps:removeItem(2197,1)
			doPlayerAddItem(playerProps,13682,1)
			talk_state = 0
			else
			selfSay('Você não tem dinheiro suficiente!')
			talk_state = 0
			end

	elseif msgcontains(msg, 'yes') and playerProps:getItemCount(2173) >= 1 then
		if doPlayerRemoveMoney(playerProps, 100000) then
			doPlayerSendTextMessage(playerProps,22,"Voce energizou seu Spirit Elemental amulet.")
			playerProps:getPosition():sendMagicEffect(28)
			playerProps:removeItem(2173,1)
			doPlayerAddItem(playerProps,13683,1)
			talk_state = 0
			else
			selfSay('Você não tem dinheiro suficiente!')
			talk_state = 0
			end

	elseif msgcontains(msg, 'yes') and playerProps:getItemCount(2125) >= 1 then
		if doPlayerRemoveMoney(playerProps, 150000) then
			doPlayerSendTextMessage(playerProps,22,"Voce energizou seu Elemental magic amulet.")
			playerProps:getPosition():sendMagicEffect(28)
			playerProps:removeItem(2125,1)
			doPlayerAddItem(playerProps,13684,1)
			talk_state = 0
			else
			selfSay('Você não tem dinheiro suficiente!')
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
	RESET = 30032
}

local itensResetList = {
	belfegor = 14991,
	corruption = 14992,
	vialAlchemist = 14990
}
local function reset(cid, playerProps)
	if playerProps:getStorageValue(questList.RESET) < 0 and playerProps:getLevel() >= 500 then
		npcHandler:say("Vejo que não falou com Mestre Orin, para obter o conhecimento do renascimento é necessário visita-lo.", cid)
		playerProps.setStorageValue(questList.RESET, 1)
		return true
	-- elseif playerprops:getlevel() < 510 then
		-- npchandler:say("você não tem o level necessário para obter o conhecimento do renascimento.", cid)
		-- return false
	end
	
	-- Mover para o npc Mestre Orin
	vezes = getPlayerReset(playerProps)
	corruption = (10*(vezes+1))
	belfegor = (10*(vezes+1))
	vialAlchemist = (1*(vezes+1))
	health = playerProps:getBaseMaxHealth()
	mana = playerProps:getMaxMana()
	
	if belfegor <= playerProps:getItemCount(itensResetList.belfegor)
	and  corruption <= playerProps:getItemCount(itensResetList.corruption)
	and  vialAlchemist <= playerProps:getItemCount(itensResetList.vialAlchemist) then
	
		playerProps:addMaxHealth((health/10)*(vezes+1))
		playerProps:setMaxMana((mana/15)*(vezes+1))
		playerProps:addMana(playerProps:getMaxMana())
		
		playerProps:removeItem(itensResetList.belfegor)
		playerProps:removeItem(itensResetList.corruption)
		playerProps:removeItem(itensResetList.vialAlchemist)
		
		doPlayerSendTextMessage(cid,22,"Você irá renascer em alguns segundos.")
		addEvent(function()
			doResetLevel(playerProps)
		end, 3000)
	else
		npcHandler:say("Você não tem todos os itens necessários. Corruption Cape: ".. corruption .. ", Belfegor Mask: " .. belfegor .. ", Alchemist Magic Fluid: " .. vialAlchemist.. ".", cid)
	end

	
end

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
	
	print(player:getMaxMana())
        npcHandler:say("Saudações, viajante. Percebo que busca aprimorar suas habilidades. Talvez seja sábio procurar o Mestre Orin para orientação, deseja iniciar esta jornada ?", cid)
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
    elseif npcHandler.topic[cid] == topicList.DEUS then
        deus(cid, player)
        return true
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
			reset(cid, player)
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
