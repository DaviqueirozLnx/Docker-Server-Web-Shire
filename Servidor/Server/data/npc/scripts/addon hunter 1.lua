local t = {
   snipergloves=5875,
    keys = {"sniper gloves"},
	storage = 40003
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

    if isInArray(t.keys, msg) then
		selfSay('Hahahaha vejo que ficou interessado, Ótimo! Mas não acho que você o encontrará nos próximos dois meses, deseja continuar?',cid)
		talk_state = 1

		  elseif talk_state == 1 then
			  if msgcontains(msg, 'yes') and player:getStorageValue(t.storage) == -1 then
				doPlayerSendTextMessage(cid,19,"Nova quest adicionada '(Addon) Sniper Gloves.'.")
				doSendMagicEffect(getPlayerPosition(cid),13)
				setPlayerStorageValue(cid,t.storage,1)
			elseif msgcontains(msg, 'yes') and getPlayerStorageValue(cid, t.storage) == 1 then
				if(player:getItemCount(t.snipergloves) < 1 ) then
					doPlayerSendTextMessage(cid,19,"Vocês precisa de 1 sniper gloves antes de poder fazer sua roupa.")
				else
					player:removeItem(t.snipergloves,1)
					player:addOutfitAddon(129, 1)
					player:addOutfitAddon(137, 1)
					doPlayerSendTextMessage(cid,19,"Quest '(Addon) Sniper Gloves.' completada.")
					doSendMagicEffect(getPlayerPosition(cid),13)
					setPlayerStorageValue(cid,t.storage,2)
					selfSay('Excelente! Como prometido, aqui está sua roupa.')
				end
			end
			  talk_state = 0

	  elseif msgcontains(msg, 'offer') then
			  selfSay('I can take you to  Femur Hills for just a small fee.')
		  end
	  end

npcHandler:setMessage(MESSAGE_GREET, "Olá |PLAYERNAME| vejo que não tem bom gosto para roupas, eu posso lhe proporcionar um addon incrível, caso vocês queira digite 'sniper gloves'!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

