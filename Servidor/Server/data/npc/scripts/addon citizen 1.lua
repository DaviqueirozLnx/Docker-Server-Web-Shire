local t = {
	couro=5878,
	 keys = {"backpack"},
	 storage = 40000
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
		 selfSay('Hahahaha vejo que ficou interessado, ótimo! mas acho que vou demorar um pouco para fazer sua mochila, deseja continuar?',cid)
		 talk_state = 1

		   elseif talk_state == 1 then
			   if msgcontains(msg, 'yes') and player:getStorageValue(t.storage) == -1 then
				 doPlayerSendTextMessage(cid,19,"Nova quest adicionada '(Addon) Citizen Backpack.'.")
				 doSendMagicEffect(getPlayerPosition(cid),13)
				 setPlayerStorageValue(cid,t.storage,1)
			 elseif msgcontains(msg, 'yes') and getPlayerStorageValue(cid, t.storage) == 1 then
				 if(player:getItemCount(t.couro) < 100) then
					 doPlayerSendTextMessage(cid,19,"Você precisa de 100 pieces of fine minotaur leather antes de poder fazer sua roupa.")
				 else
					 player:removeItem(t.couro,100)
					 player:addOutfitAddon(128, 1)
					 player:addOutfitAddon(136, 1)
					 doPlayerSendTextMessage(cid,19,"Quest '(Addon) Citizen Backpack.'.' completada.")
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

 npcHandler:setMessage(MESSAGE_GREET, "Olá |PLAYERNAME| vejo que não tem bom gosto para roupas, eu posso lhe proporcionar um addon incrível, caso você queira digite 'backpack'!")
 npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
 npcHandler:addModule(FocusModule:new())

