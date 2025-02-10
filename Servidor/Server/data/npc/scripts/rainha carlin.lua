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
    PROMOTE = 1,
    MISSIONWORM = 2,
    MISSIONSTRAWBARRY = 3,
    MISSIONTEST = 4,

}

local itensQuest = {
	morango = 2680,
	darkCogumelo = 2792,
	minhoca = 3976,
	money = 2152
}

local questNumber = {
	PROMOTE = 30038,
}

local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if msgcontains(msg, 'promotion') or msgcontains(msg, 'promote') then
        npcHandler:say("A promoção para o próximo nível é uma honra concedida a poucos. deseja fazer ?", cid)
        npcHandler.topic[cid] = topicList.PROMOTE
	elseif msgcontains(msg, 'promotion') or msgcontains(msg, 'promote') and player:getVocation():getId() >= 5 then
		npcHandler:say("Olá meu nobre, vejo que já és promovido!", cid)
		npcHandler.topic[cid] = topicList.MISSIONTEST
		return true
    elseif npcHandler.topic[cid] == topicList.PROMOTE then
		if(player:getLevel() < 30)then
			npcHandler:say("Você não tem level suficiente, pegue level 30 e volte para conversar comigo!", cid)
            npcHandler.topic[cid] = topicList.NONE
            return false
		end
		if msgcontains(msg,"yes") and player:getStorageValue(questNumber.PROMOTE) == -1 then
			doSendMagicEffect(player:getPosition(),CONST_ME_MAGIC_BLUE)
			doPlayerSendTextMessage(cid,22,"Quest 'A Promoção!' adicionada.")
			player:setStorageValue(questNumber.PROMOTE, 1)
		elseif msgcontains(msg, "yes") and player:getStorageValue(questNumber.PROMOTE) == 3 then
			doSendMagicEffect(player:getPosition(),CONST_ME_MAGIC_BLUE)
			npcHandler:say("Obrigada, irei enviar a Guarda Real para cuidar disso!", cid)
			doPlayerSendTextMessage(cid,22,"Quest 'A Promoção!' completada.")
			player:setVocation(player:getVocation():getId()+4)
			player:setStorageValue(questNumber.PROMOTE, 4)
			addEvent(function ()
				player:kickPlayer()
			end, 3000)
		elseif msgcontains(msg, "yes") and player:getStorageValue(questNumber.PROMOTE) < 3 then
			npcHandler:say("Onde esta minha filha Sarina?", cid)
			npcHandler.topic[cid] = topicList.NONE
		end
        return true
	elseif npcHandler.topic[cid] == topicList.MISSIONTEST then

		return true
	end
end

npcHandler:setMessage(MESSAGE_GREET, "Tenha respeito, criança!")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())


