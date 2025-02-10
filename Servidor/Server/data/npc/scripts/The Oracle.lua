local t = {
    pos = {x = 160, y = 57, z = 7},
    keys = {"deus"}
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end


local function deus(cid, playerProps)
    if playerProps:getLevel() < 500 then
        npcHandler:say("Você está muito fraco. Volte quando estiver mais forte, seu corpo não aguentaria o imenso poder dos Deuses.", cid)
        return false
    end

	if playerProps:getVocation():getId() >= 9 and playerProps:getVocation():getId() < 11  then
		playerProps:sendTextMessage(22,"Sua alma foi evoluida a Deus!")
		playerProps:addMaxHealth(185)
		playerProps:setMaxMana(35)
		playerProps:addMana(35)
		playerProps:setVocation(playerProps:getVocation():getId()+4)
		playerProps:getPosition():sendMagicEffect(28)
		if(playerProps:getSex() == 1) then
			doBroadcastMessage("O nobre guerreiro "  .. getCreatureName(playerProps) .." evoluiu sua alma a Deus", 22)
		elseif(playerProps:getSex() == 0) then
			doBroadcastMessage("A nobre guerreira " .. getCreatureName(playerProps) .. " evoluiu sua alma a Deus",22)
		end


	playerProps:removeItem(14990, 30)
	playerProps:removeItem(2798,20)
	playerProps:removeItem(15010, 40)
				playerProps:setStorageValue(30039, 3)
		addEvent(function ()
			doResetLevel(playerProps)
			return true
			end, 2000)

	elseif playerProps:getVocation():getId() ==  11 then
		playerProps:sendTextMessage(22,"Sua alma foi evoluida a Deus!")
		playerProps:addMaxHealth(185)
		playerProps:setMaxMana(35)
		playerProps:addMana(35)
		playerProps:setVocation(playerProps:getVocation():getId()+4)
		playerProps:getPosition():sendMagicEffect(28)

	playerProps:removeItem(14990, 30)
	playerProps:removeItem(2798,20)
	playerProps:removeItem(15010, 40)
				playerProps:setStorageValue(30039, 3)
		addEvent(function ()
			doResetLevel(playerProps)
			return true
			end, 2000)

	elseif playerProps:getVocation():getId() == 12 then
		playerProps:sendTextMessage(22,"Sua alma foi evoluida a Deus!")
		playerProps:addMaxHealth(185)
		playerProps:setMaxMana(35)
		playerProps:addMana(35)
		playerProps:setVocation(playerProps:getVocation():getId()+4)
		playerProps:getPosition():sendMagicEffect(28)

	playerProps:removeItem(14990, 30)
	playerProps:removeItem(2798,20)
	playerProps:removeItem(15010, 40)
				playerProps:setStorageValue(30039, 3)
		addEvent(function ()
			doResetLevel(playerProps)
			return true
			end, 2000)
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
        if player:getStorageValue(30039) == -1 then
            selfSay("Fale com a Isolda primeiro.", cid)
            talkState[talkUser] = 0
		elseif player:getStorageValue(30039) == 1 then
            selfSay("Vejo que falou com a isolda, tem certeza que deseja evoluir sua alma a um Deus ?", cid)
            talkState[talkUser] = 1
        elseif player:getStorageValue(30039) == 2 then
			if getPlayerItemCount(player, 14990) >= 30 and getPlayerItemCount(player, 2798) >= 20 and getPlayerItemCount(player, 15010) >= 40 then
				deus(cid, player)

			else
				selfSay("Me traga todos os itens necessários para que eu possa realizar sua cerimonia.", cid)
                talkState[talkUser] = 0
			end
		end
    elseif msgcontains(msg, "yes") then
        if talkState[talkUser] == 1 then
            player:setStorageValue(30039, 2)
            selfSay("Me traga alguns dos itens necessários para que eu possa realizar sua cerimonia.", cid)
            talkState[talkUser] = 0
        end
    elseif msgcontains(msg, "no") then
        if talkState[talkUser] == 1 then
            selfSay("Alright, see you later.", cid)
            talkState[talkUser] = 0
        end
    end
end

npcHandler:setMessage(MESSAGE_GREET, "Olá¡ |PLAYERNAME|, posso lhe ajudar com meus conhecimentos sobre ser um {deus} ?")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
