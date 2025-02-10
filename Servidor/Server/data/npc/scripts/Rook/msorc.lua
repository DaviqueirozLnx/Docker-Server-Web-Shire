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
    MISSIONTEST= 1,
    MISSIONWORM = 2,
    MISSIONSTRAWBARRY = 3,

}



local questNumber = {
	QuestTreinamento = 30036
}

local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if msgcontains(msg, "test") and player:getStorageValue(questNumber.QuestTreinamento)  >=4 then
        npcHandler:say("Não tenho tempo a perder mortal... Vamos ao treinamento?", cid)
        npcHandler.topic[cid] = topicList.MISSIONTEST
		return true
	elseif npcHandler.topic[cid] == topicList.MISSIONTEST then
		if msgcontains(msg,"yes") then
			doSendMagicEffect(player:getPosition(),CONST_ME_MAGIC_BLUE)
			player:setStorageValue(questNumber.QuestTreinamento, 6)
			doPlayerSendTextMessage(cid,23,"Você foi teleportado para o Centro de Consulta.")
			doTeleportThing(cid, {x = 260, y = 198, z = 8})
		end
		return true
	end
end
npcHandler:setMessage(MESSAGE_GREET, "Estava te esperando |PLAYERNAME| , ! Tem certeza, quer treinar para ser um Feiticeiro Temido? Então diga 'test' mortal.")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
