
local t = {
	honeycombs=5902,
	chicken=5890,
	helmet = 2480,
	 keys = {"hat"},
	 storage = 40001
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
		 selfSay('Hahahaha vejo que ficou interessado, ótimo! mas acho que vai ser pouco cansativo para fazer seu chapeu, deseja continuar?',cid)
		 talk_state = 1

		   elseif talk_state == 1 then
			   if msgcontains(msg, 'yes') and player:getStorageValue(t.storage) == -1 then
				 doPlayerSendTextMessage(cid,19,"Nova quest adicionada '(Addon) Citizen Hat.'.")
				 doSendMagicEffect(getPlayerPosition(cid),13)
				 setPlayerStorageValue(cid,t.storage,1)
			 elseif msgcontains(msg, 'yes') and getPlayerStorageValue(cid, t.storage) == 1 then
				 if(player:getItemCount(t.chicken) < 100 and player:getItemCount(t.honeycombs) < 50 and player:getItemCount(t.helmet) < 1 ) then
					 doPlayerSendTextMessage(cid,19,"você precisa de 100 chicken feathers 50 honeycombs e 1 legion helmet antes de poder fazer sua roupa.")
				 else
					 player:removeItem(t.chicken,100)
					 player:removeItem(t.honeycombs,50)
					 player:removeItem(t.helmet,1)

					 player:addOutfitAddon(128, 2)
					 player:addOutfitAddon(136, 2)
					 doPlayerSendTextMessage(cid,19,"Quest '(Addon) Citizen Hat.' completada.")
					 doSendMagicEffect(getPlayerPosition(cid),13)
					 setPlayerStorageValue(cid,t.storage,2)
					 selfSay('Excelente! Como prometido, aqui estÃ¡ sua roupa.')
				 end
			 end
			   talk_state = 0

	   elseif msgcontains(msg, 'offer') then
			   selfSay('I can take you to  Femur Hills for just a small fee.')
		   end
	   end

 npcHandler:setMessage(MESSAGE_GREET, "Olá |PLAYERNAME| vejo que não tem bom gosto para roupas, eu posso lhe proporcionar um addon incrível, caso você queira digite 'hat'!")
 npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
 npcHandler:addModule(FocusModule:new())

