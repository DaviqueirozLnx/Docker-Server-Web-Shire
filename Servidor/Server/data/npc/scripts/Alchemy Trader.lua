local t = {
    keys = {"trocar"}
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local itensOverlordList = {
	alchemistflu = 14991,
	rubycoin = 13685,
	alchemistflu = 14990,
	overlordpot = 15005
}
local function trocar(cid, playerProps)

	alchemistflu = (100)
	rubycoin = (150)
	overlordpot = (1)
	
	if alchemistflu <= playerProps:getItemCount(itensOverlordList.alchemistflu)
	and  rubycoin <= playerProps:getItemCount(itensOverlordList.rubycoin) then
		playerProps:removeItem(itensOverlordList.alchemistflu, alchemistflu)
		playerProps:removeItem(itensOverlordList.rubycoin, rubycoin)
		playerProps:addItem(itensOverlordList.overlordpot, overlordpot)
        selfSay("Obrigado pelo negócio, volte sempre!", cid)
	else
		npcHandler:say("Você não tem todos os itens necessários.", cid)
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
			trocar(cid, player)
    elseif msgcontains(msg, "no") then
        if talkState[talkUser] == 1 then
            selfSay("Alright, see you later.", cid)
            talkState[talkUser] = 0
        end
    end
end

npcHandler:setMessage(MESSAGE_GREET, "Olá! |PLAYERNAME|, posso {trocar} 150KKs e 100 alchemist magic fluids em 1 alchemy potion, o que você acha?")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())