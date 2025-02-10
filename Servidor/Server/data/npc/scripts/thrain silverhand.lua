local t = {
    keys = {"argent bar"}
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local itensArgentBarList = {
	ironore = 5880,
}
local function argentbar(cid, playerProps)

	ironore = (20)
	
	if ironore <= playerProps:getItemCount(itensArgentBarList.ironore) then
		playerProps:removeItem(itensArgentBarList.ironore, ironore)
		playerProps:addItem(15008, 1)
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
			argentbar(cid, player)
    elseif msgcontains(msg, "no") then
        if talkState[talkUser] == 1 then
            selfSay("Alright, see you later.", cid)
            talkState[talkUser] = 0
        end
    end
end

npcHandler:setMessage(MESSAGE_GREET, "Olá! |PLAYERNAME|, sou o dwarf profissional em forjas, o que acha de trocar 20 iron ores em 1 {argent bar}?")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())