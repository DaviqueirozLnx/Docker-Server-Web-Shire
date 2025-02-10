local t = {
	pass = {msg="voltar",pos={x = 994, y = 787, z = 11}},
	savpos = {x= 1179, y=703, z=9, stackpos=253}
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
	selfSay('Você deseja realizar a passagem para parte anterior da masmorra?',cid)
	talk_state = 1

elseif talk_state == 1 then
	if msgcontains(msg, 'yes') and getPlayerItemCount(cid,15007) >= 1 then
		  doTeleportThing(cid, t.pass.pos)
		elseif getPlayerItemCount(cid,15007) <= 0 then
		selfSay('Desculpe, mas você não possui o passaporte!', cid)
		
		addEvent(function ()
			doTeleportThing(cid, t.savpos)
			return true
			end, 3000)
		end
	talk_state = 0
end

end



        if talkState[talkUser] == 1 then
            selfSay("Alright, see you later.", cid)
            talkState[talkUser] = 0
        end

npcHandler:setMessage(MESSAGE_GREET, "Olá |PLAYERNAME|, posso te ajudar a {voltar} para a parte anterior da masmorra!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

