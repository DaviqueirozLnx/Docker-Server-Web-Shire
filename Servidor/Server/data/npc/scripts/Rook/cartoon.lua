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
    MISSIONDARKMUSHROMM= 1,
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
	QuestTreinamento = 30035,
	QuestTreinamento1 = 30036
}

local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if msgcontains(msg, "mission") and player:getStorageValue(questNumber.QuestTreinamento) == - 1 then
        npcHandler:say("Olá aventureiro(a) estou precisando de 10 dark mushroom, você deve traze-los para que eu possa da continuidade no seu treinamento!", cid)
        npcHandler.topic[cid] = topicList.MISSIONDARKMUSHROMM
	elseif msgcontains(msg, "teste") and player:getStorageValue(questNumber.QuestTreinamento) >= 4 then
		npcHandler:say("Pelo que vi ja está apto à iniciar seu teste, tem certeza que deseja iniciar ?!", cid)
		npcHandler.topic[cid] = topicList.MISSIONTEST
		return true
	elseif msgcontains(msg, "teste") and player:getStorageValue(questNumber.QuestTreinamento) ~= 4 then
		npcHandler:say("Complete todas as missões primeiro...", cid)
		return true
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == topicList.NONE then
		if player:getItemCount(itensQuest.darkCogumelo) >= 10 and player:getStorageValue(questNumber.QuestTreinamento) == 1 then
			player:removeItem(itensQuest.darkCogumelo, 10)
            player:setStorageValue(questNumber.QuestTreinamento, 2)
			player:addItem(itensQuest.money, 10)
			doSendMagicEffect(player:getPosition(),CONST_ME_MAGIC_BLUE)
			player:addExperience(1000)
			doPlayerSendTextMessage(cid,22,"Você concluiu a quest do Dark Mushroom.")
			npcHandler.topic[cid] = topicList.NONE
			return true
		elseif player:getItemCount(itensQuest.minhoca) >= 10 and player:getStorageValue(questNumber.QuestTreinamento) == 2	 then
			player:removeItem(itensQuest.minhoca, 10)
            player:setStorageValue(questNumber.QuestTreinamento, 3)
			player:addItem(itensQuest.money, 10)
			doSendMagicEffect(player:getPosition(),CONST_ME_MAGIC_BLUE)
			player:addExperience(1500)
			doPlayerSendTextMessage(cid,22,"Você concluiu a quest do Worm.")
			npcHandler.topic[cid] = topicList.NONE
			return true
		elseif player:getItemCount(itensQuest.morango) >= 10 and player:getStorageValue(questNumber.QuestTreinamento) == 3	 then
			player:removeItem(itensQuest.morango, 10)
            player:setStorageValue(questNumber.QuestTreinamento, 4)
			player:addItem(itensQuest.money, 10)
			doSendMagicEffect(player:getPosition(),CONST_ME_MAGIC_BLUE)
			player:addExperience(1800)
			doPlayerSendTextMessage(cid,22,"Você concluiu a quest do Strawbarry.")
			npcHandler.topic[cid] = topicList.NONE
			return true
		end
		return true
    elseif npcHandler.topic[cid] == topicList.MISSIONDARKMUSHROMM then
		if msgcontains(msg,"yes") then
			doSendMagicEffect(player:getPosition(),CONST_ME_MAGIC_BLUE)

			doPlayerSendTextMessage(cid,22,"Nova quest adicionada '!'.")
			player:setStorageValue(questNumber.QuestTreinamento, 1)
		end
        return true
	elseif npcHandler.topic[cid] == topicList.MISSIONTEST then
		if msgcontains(msg,"yes") then
			if player:getLevel() < 10 then
				npcHandler:say("você precisa ter no minimo level 10 para iniciar o treinamento com os mentores", cid)
				return true
			end
			doSendMagicEffect(player:getPosition(),CONST_ME_MAGIC_BLUE)
			doPlayerSendTextMessage(cid,23,"você foi teleportado para a Sala da Destinação.")
			doTeleportThing(cid, {x = 275, y = 197, z = 8})
			player:setStorageValue(questNumber.QuestTreinamento1, 4)
		end
		return true
	end
end

npcHandler:setMessage(MESSAGE_GREET, "Bem vindo(a) |PLAYERNAME| , como posso ajudar ?,  veja se eu tenho uma missão para você digitando {mission} ou {teste} para iniciar o treinamento")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
