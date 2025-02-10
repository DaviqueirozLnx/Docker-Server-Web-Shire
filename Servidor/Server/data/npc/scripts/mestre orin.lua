local t = {
    pos = {x = 160, y = 57, z = 7},
    keys = {"reset"}
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local itensResetList = {
	belfegor = 14991,
	corruption = 14992,
	vialAlchemist = 15005
}
local function reset(cid, playerProps)

	if playerProps:getLevel() < 500 then
		npcHandler:say("você não tem o level necessário para obter o conhecimento do renascimento.", cid)
		return false
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
		playerProps:setMaxMana((mana/10)*(vezes+1))
		playerProps:addMana(playerProps:getMaxMana())

		playerProps:removeItem(itensResetList.belfegor, corruption)
		playerProps:removeItem(itensResetList.corruption, belfegor)
		playerProps:removeItem(itensResetList.vialAlchemist, vialAlchemist)

		doPlayerSendTextMessage(cid,22,"Você irá renascer em alguns segundos.")
		
		setPlayerReset(playerProps, 1)

		
		addEvent(function()
			doResetLevel(playerProps)
		end, 3000)
	else
		npcHandler:say("Você não tem todos os itens necessários. Corruption Cape: ".. corruption .. ", Belfegor Mask: " .. belfegor .. ", Overlord Potion: " .. vialAlchemist.. ".", cid)
	end


end

function creatureSayCallback(cid, type, msg)
    local player = Player(cid)

    if(not npcHandler:isFocused(cid)) then
        return false
    end
    msg = msg:lower();
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

    if isInArray(t.keys, msg) then
        if player:getStorageValue(30050) == -1 then
            selfSay("Fale com a Isolda primeiro.", cid)
            talkState[talkUser] = 0
		elseif player:getStorageValue(30050) == 1 then
            selfSay("Vejo que falou com a isolda, Eu vos declaro apto ao conhecimento da ressurreição!", cid)
			player:setStorageValue(30050, 2)
            talkState[talkUser] = 0
        elseif player:getStorageValue(30050) == 2 then
			reset(cid, player)
		end
    elseif msgcontains(msg, "no") then
        if talkState[talkUser] == 1 then
            selfSay("Alright, see you later.", cid)
            talkState[talkUser] = 0
        end
    end
end

npcHandler:setMessage(MESSAGE_GREET, "Olá! |PLAYERNAME|, posso lhe ajudar com meus conhecimentos sobre o {reset}?")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())