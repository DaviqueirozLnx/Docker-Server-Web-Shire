local t = {
	pass = {msg="cemitério",pos={x = 1152, y = 853, z = 7}, pay=10000000},
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local talk_state = 0

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


  if msgcontains(msg, t.pass.msg) then
	selfSay('Você deseja ir para o cemitério por ' .. t.pass.pay .. ' moedas de ouro?',cid)
	talk_state = 1

elseif talk_state == 1 then
	if msgcontains(msg, 'yes') then
		if doPlayerRemoveMoney(cid, t.pass.pay) then
		  doTeleportThing(cid, t.pass.pos)
		else
		selfSay('Desculpe, você não possui o dinheiro suficiente.', cid)
		end
	 end
	talk_state = 0
end

end



        if talkState[talkUser] == 1 then
            selfSay("Alright, see you later.", cid)
            talkState[talkUser] = 0
        end

npcHandler:setMessage(MESSAGE_GREET, "Olá |PLAYERNAME|, eu posso te levar ao {cemitério} por 10KKs!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

