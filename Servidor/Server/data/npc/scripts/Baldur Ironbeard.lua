local t = {
    pos = {x = 160, y = 57, z = 7},
    rails = {"rails"},
    enter = {"enter"},
	QUESTTRILHOS = 30040,
	positionIn = {x = 1025, y = 801, z = 15},
	ItemBlackPearl = 2144,
	ItemBarArgent = 15008,
	ItemEnergyStone = 15010
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

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

    if isInArray(t.rails, msg) and player:getStorageValue(t.QUESTTRILHOS) == -1 then
		doSendMagicEffect(player:getPosition(),CONST_ME_MAGIC_BLUE)
		doPlayerSendTextMessage(cid,22,"Quest 'Manutenção dos Trilhos!' adicionada.")
		player:setStorageValue(t.QUESTTRILHOS, 1)
		talkState[talkUser] = 0

	elseif isInArray(t.rails, msg) and player:getStorageValue(t.QUESTTRILHOS) == 1 then
		selfSay('Trouxe todos os itens necessários para que possamos concertar os trilhos ?',cid)
		talkState[talkUser] = 1
	elseif isInArray(t.enter,msg) then
		selfSay('Você deseja entrar na masmorra? Certifique-se de está com o passaport.',cid)
		talkState[talkUser] = 2

    elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
		if getPlayerItemCount(cid, t.ItemBarArgent) >= 5 and getPlayerItemCount(cid, t.ItemEnergyStone) >= 50 and getPlayerItemCount(cid, t.ItemBlackPearl) >= 100 then
			player:removeItem(t.ItemBarArgent,5)
			player:removeItem(t.ItemEnergyStone,50)
			player:removeItem(t.ItemBlackPearl,100)

			player:addItem(15007)
			doSendMagicEffect(player:getPosition(),CONST_ME_MAGIC_BLUE)
			npcHandler:say("Parabéns, aqui está seu passaport!", cid)
			doPlayerSendTextMessage(cid,22,"Quest 'Manutenção dos Trilhos!' completada.")
			player:setStorageValue(t.QUESTTRILHOS, 2)
		else
			selfSay('Traga todos os itens necessários para completar a missão.',cid)
			talkState[talkUser] = 0

		end
    elseif msgcontains(msg, "yes") and talkState[talkUser] == 2 then
			if player:getStorageValue(t.QUESTTRILHOS) == 2 and getPlayerItemCount(cid,15007) >= 1 and getPlayerReset(player) >= 1 then
        		doTeleportThing(cid, t.positionIn)
            	talkState[talkUser] = 0

			elseif getPlayerReset(player) <= 0  then
				selfSay('Apenas Players com 1 reset conseguem acessar a masmorra.',cid)
			else
				selfSay('Complete a Quest dos trilhos primeiro',cid)
            	talkState[talkUser] = 0
			end
    end
end

npcHandler:setMessage(MESSAGE_GREET, "Olá |PLAYERNAME|, Como pode ver os trilhos da masmorra está danificado, é preciso que você concerte os trilhos para que eu possa lhe da um passaporte de acesso a masmorra, caso já tenha concertado diga {enter} caso contrário diga {rails}")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
