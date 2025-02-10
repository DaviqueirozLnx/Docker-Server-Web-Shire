local itens = {
	manafluid_id_valor_qtd = {14997, 15, 100},
	blood_id_valor_qtd = {14998, 50, 20},
	fightingSpirit_id_valor_qtd = {15004, 50, 1},
	teleport_id_valor_qtd = {14994, 25, 10},
	energetico_id_valor_qtd = {15009, 25, 10},
	blessedring_id_valor_qtd = {13688,40, 20},
	bpExplossion_id_valor_qtd = {2313,50, 2000 },
	bpSd_id_valor_qtd = {2268,50, 1000 },
	bpUh_id_valor_qtd = {2273,50, 1000 },
	bpGfb_id_valor_qtd = {2304,10, 800 },
	bphmm_id_valor_qtd = {2311,5, 2000},
	bpDestroy_id_valor_qtd = {2261,5,1200},
	bpLifeRing_id_valor_qtd = {2216,20,20},
	premium_dias_qtd = {30,100},
	dsp_id_valor_qtd = {6527,10000000, 100},
	captivesoul_id_valor_qtd = {13692,20, 1},
}

local t = {
    uh = {"uh"},
    explo = {"explosion"},
    sd = {"sd"},
    gfb = {"gfb"},
    destroyfield = {"destroy field"},
    premium = {"premium"},
    cirurgia = {"cirurgia"}, -- mudar npc
    dsp = {"slp"}, --
    blood = {"blood"},
    energetico = {"energetico"},
    fightingspirit = {"fighting spirit"},
    teleport = {"teleport"},
    healingRing = {"ring of healing"},
    lifering = {"life ring"},
    manafluid = {"mana fluid"},
    blessedring = {"blessed ring"},
    hmm = {"hmm"},
	captivesoul = {"captive soul"},

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
	local dsp = getPlayerItemCount(player, 6527)

    if(not npcHandler:isFocused(cid)) then
        return false
    end
    msg = msg:lower();
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

		if isInArray(t.manafluid, msg) then
			selfSay('Deseja comprar '..itens.manafluid_id_valor_qtd[3]..' great mana fluids por '.. itens.manafluid_id_valor_qtd[2].." SLP's?",cid)
			talk_state = 2
		elseif isInArray(t.blood, msg) then
			selfSay('Deseja comprar '..itens.blood_id_valor_qtd[3]..' great blood of gods por '.. itens.blood_id_valor_qtd[2].." SLP's?",cid)
			talk_state = 3
  	  	elseif isInArray(t.fightingspirit, msg) then
			selfSay('Deseja comprar '..itens.fightingSpirit_id_valor_qtd[3]..' fighting spirit por '.. itens.fightingSpirit_id_valor_qtd[2].." SLP's?",cid)
			talk_state = 4
		elseif isInArray(t.teleport, msg) then
			selfSay('Deseja comprar '..itens.teleport_id_valor_qtd[3]..' teleports por '.. itens.teleport_id_valor_qtd[2].." SLP's?",cid)
			talk_state = 5
		elseif isInArray(t.blessedring, msg) then
			selfSay('Deseja comprar '..itens.blessedring_id_valor_qtd[3]..' blessed rings por '.. itens.blessedring_id_valor_qtd[2].." SLP's?",cid)
			talk_state = 6
		elseif isInArray(t.explo, msg) then
			selfSay('Deseja comprar '..itens.bpExplossion_id_valor_qtd[3]..' explosions por '.. itens.bpExplossion_id_valor_qtd[2].." SLP's?",cid)
			talk_state = 7
		elseif isInArray(t.sd, msg) then
			selfSay('Deseja comprar '..itens.bpSd_id_valor_qtd[3]..' sds por '.. itens.bpSd_id_valor_qtd[2].." SLP's?",cid)
			talk_state = 8
		elseif isInArray(t.uh, msg) then
			selfSay('Deseja comprar '..itens.bpUh_id_valor_qtd[3]..' uhs por '.. itens.bpUh_id_valor_qtd[2].." SLP's?",cid)
			talk_state = 9
		elseif isInArray(t.gfb, msg) then
			selfSay('Deseja comprar '..itens.bpGfb_id_valor_qtd[3]..' gfbs por '.. itens.bpGfb_id_valor_qtd[2].." SLP's?",cid)
			talk_state = 10
		elseif isInArray(t.hmm, msg) then
			selfSay('Deseja comprar '..itens.bphmm_id_valor_qtd[3]..' hmms por '.. itens.bphmm_id_valor_qtd[2].." SLP's?",cid)
			talk_state = 11

		elseif isInArray(t.destroyfield, msg) then
			selfSay('Deseja comprar '..itens.bphmm_id_valor_qtd[3]..' destroy fields por '.. itens.bpDestroy_id_valor_qtd[2].." SLP's?",cid)
			talk_state = 12
		elseif isInArray(t.premium, msg) then
			selfSay('Deseja comprar '..itens.premium_dias_qtd[1]..' dias por '.. itens.premium_dias_qtd[2].." SLP's?",cid)
			talk_state = 13

		elseif isInArray(t.lifering, msg) then
			selfSay('Deseja comprar '..itens.bpLifeRing_id_valor_qtd[3]..' Life rings por '.. itens.bpLifeRing_id_valor_qtd[2].." SLP's?",cid)
			talk_state = 14

		elseif isInArray(t.energetico, msg) then
			selfSay('Deseja comprar '..itens.energetico_id_valor_qtd[3]..' energetico por '.. itens.energetico_id_valor_qtd[2].." SLP's?",cid)
			talk_state = 15

		elseif isInArray(t.dsp, msg) then
			selfSay('Deseja comprar '..itens.dsp_id_valor_qtd[3]..' Shire Legends Points por 10KK?',cid)
			talk_state = 16
			elseif isInArray(t.captivesoul, msg) then
			selfSay('Deseja comprar '..itens.captivesoul_id_valor_qtd[3]..' captive soul por '.. itens.captivesoul_id_valor_qtd[2].." SLP's?",cid)
			talk_state = 17
		elseif msg == "offer" then
			local offer = ""
			for key, value in pairs(t) do
				offer = offer .. table.concat(value, ", ") .. "\n"
			end
			doShowTextDialog(cid, 13923, "Items à venda pelo NPC Mark Merchant!\n\n" .. offer)

		elseif talk_state == 2 then
			if msgcontains(msg, 'yes') then
				handleManaFluid(cid)
			end
			talk_state = 0

		elseif talk_state == 3 then
			if msgcontains(msg, 'yes') then
				handleBlood(cid)
			end
			talk_state = 0

		elseif talk_state == 4 then
			if msgcontains(msg, 'yes') then
				handleFightingSpirit(cid)
			end
			talk_state = 0

		elseif talk_state == 5 then
			if msgcontains(msg, 'yes') then
				handleTeleport(cid)
			end
			talk_state = 0

		elseif talk_state == 6 then
			if msgcontains(msg, 'yes') then
				handleBlessedRing(cid)
			end
			talk_state = 0

		elseif talk_state == 7 then
			if msgcontains(msg, 'yes') then
				handleBpExplosion(cid)
			end
			talk_state = 0


		elseif talk_state == 8 then
			if msgcontains(msg, 'yes') then
				handleBpSd(cid)
			end
			talk_state = 0

		elseif talk_state == 9 then
			if msgcontains(msg, 'yes') then
				handleBpUh(cid)
			end
			talk_state = 0


		elseif talk_state == 10 then
			if msgcontains(msg, 'yes') then
				handleGfb(cid)
			end
			talk_state = 0

		elseif talk_state == 11 then
			if msgcontains(msg, 'yes') then
				handleHmm(cid)
			end
			talk_state = 0

		elseif talk_state == 12 then
			if msgcontains(msg, 'yes') then
				handleDestroyer(cid)
			end
			talk_state = 0
		elseif talk_state == 13 then
			if msgcontains(msg, 'yes') then
				handlePremium(cid)
			end
			talk_state = 0

		elseif talk_state == 14 then
			if msgcontains(msg, 'yes') then
				handleLifeRing(cid)
			end
			talk_state = 0

		elseif talk_state == 15 then
			if msgcontains(msg, 'yes') then
				handleEnergetico(cid)
			end
			talk_state = 0

		elseif talk_state == 16 then
			if msgcontains(msg, 'yes') then
				handleSlp(cid)
			end
			talk_state = 0
			elseif talk_state == 17 then
			if msgcontains(msg, 'yes') then
				handleCaptiveSoul(cid)
			end
			talk_state = 0
	  end




  	end

        if talkState[talkUser] == 1 then
            selfSay("Alright, see you later.", cid)
            talkState[talkUser] = 0
        end

npcHandler:setMessage(MESSAGE_GREET, "Bem vindo à minha loja |PLAYERNAME| oque deseja comprar hoje?!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())


handleDarkExplosion = function(cid)
	doPlayerTakeItem(cid,6527,50)
	dsp = getPlayerItemCount(cid, 6527)
	selfSay('Aqui esta! Obrigado e volte sempre.',cid)
	doPlayerSendTextMessage(cid,22,"Voce recebeu bps explosion.")
	doPlayerSendTextMessage(cid, 20, 'Ainda lhe resta ' .. dsp .. ' Shire Legends Points.')
			  container = doPlayerAddItem(cid, 2001, 1)
			  for i=1,20 do
				  doAddContainerItem(container, 2314, 100)

				  i=i+1;
			  end

			doAddContainerItem(container, containe2, 30)
			doAddContainerItem(container, containe3, 30)
end

handleManaFluid = function (cid)
	if doPlayerRemoveItem(cid,6527, itens.manafluid_id_valor_qtd[2]) then
		dsp = getPlayerItemCount(cid, 6527)
		selfSay('Aqui esta! Obrigado e volte sempre.',cid)
		doPlayerSendTextMessage(cid,22,"Voce recebeu "..itens.manafluid_id_valor_qtd[3].." great mana fluids.")
		doPlayerSendTextMessage(cid, 20, 'Ainda lhe resta ' .. dsp .. ' Shire Legends Points.')
		doPlayerAddItem(cid, itens.manafluid_id_valor_qtd[1], itens.manafluid_id_valor_qtd[3])
	else
		selfSay('Desculpe, mas você não tem pontos suficiente.')
	end
end

handleBlood = function (cid)
	if doPlayerRemoveItem(cid,6527, itens.blood_id_valor_qtd[2]) then
		dsp = getPlayerItemCount(cid, 6527)
		selfSay('Aqui esta! Obrigado e volte sempre.',cid)
		doPlayerSendTextMessage(cid,22,"Voce recebeu "..itens.blood_id_valor_qtd[3].." Blood of God's.")
		doPlayerSendTextMessage(cid, 20, 'Ainda lhe resta ' .. dsp .. ' Shire Legends Points.')
		doPlayerAddItem(cid, itens.blood_id_valor_qtd[1], itens.blood_id_valor_qtd[3])
	else
		selfSay('Desculpe, mas você não tem pontos suficiente.')
	end
end

handleFightingSpirit= function (cid)
	if doPlayerRemoveItem(cid,6527, itens.fightingSpirit_id_valor_qtd[2]) then
		dsp = getPlayerItemCount(cid, 6527)
		selfSay('Aqui esta! Obrigado e volte sempre.',cid)
		doPlayerSendTextMessage(cid,22,"Voce recebeu "..itens.fightingSpirit_id_valor_qtd[3].." Fighting Spirit.")
		doPlayerSendTextMessage(cid, 20, 'Ainda lhe resta ' .. dsp .. ' Shire Legends Points.')
		doPlayerAddItem(cid, itens.fightingSpirit_id_valor_qtd[1], itens.fightingSpirit_id_valor_qtd[3])
	else
		selfSay('Desculpe, mas você não tem pontos suficiente.')
	end
end

handleTeleport = function (cid)
	if doPlayerRemoveItem(cid,6527, itens.teleport_id_valor_qtd[2]) then
		dsp = getPlayerItemCount(cid, 6527)
		selfSay('Aqui esta! Obrigado e volte sempre.',cid)
		doPlayerSendTextMessage(cid,22,"Voce recebeu "..itens.teleport_id_valor_qtd[3].." Teleports.")
		doPlayerSendTextMessage(cid, 20, 'Ainda lhe resta ' .. dsp .. ' Shire Legends Points.')
		doPlayerAddItem(cid, itens.teleport_id_valor_qtd[1], itens.teleport_id_valor_qtd[3])
	else
		selfSay('Desculpe, mas você não tem pontos suficiente.')
	end
end

handleBpExplosion = function(cid)
	if doPlayerRemoveItem(cid,6527, itens.bpExplossion_id_valor_qtd[2]) then
		dsp = getPlayerItemCount(cid, 6527)
		selfSay('Aqui esta! Obrigado e volte sempre.',cid)
		doPlayerSendTextMessage(cid,22,"Voce recebeu "..itens.bpExplossion_id_valor_qtd[3].." Explosions.")
		doPlayerSendTextMessage(cid, 20, 'Ainda lhe resta ' .. dsp .. ' Shire Legends Points.')
		container = doPlayerAddItem(cid, 2001, 1)
			doAddContainerItem(container, itens.bpExplossion_id_valor_qtd[1], itens.bpExplossion_id_valor_qtd[3])
	else
		selfSay('Desculpe, mas você não tem pontos suficiente.')
	end
end

handleBpUh = function(cid)
	if doPlayerRemoveItem(cid,6527, itens.bpUh_id_valor_qtd[2]) then
		dsp = getPlayerItemCount(cid, 6527)
		selfSay('Aqui esta! Obrigado e volte sempre.',cid)
		doPlayerSendTextMessage(cid,22,"Voce recebeu "..itens.bpUh_id_valor_qtd[3].." uhs.")
		doPlayerSendTextMessage(cid, 20, 'Ainda lhe resta ' .. dsp .. ' Shire Legends Points.')
		container = doPlayerAddItem(cid, 2002, 1)
			doAddContainerItem(container, itens.bpUh_id_valor_qtd[1], itens.bpUh_id_valor_qtd[3])
	else
		selfSay('Desculpe, mas você não tem pontos suficiente.')
	end
end

handleBpSd = function(cid)
	if doPlayerRemoveItem(cid,6527, itens.bpSd_id_valor_qtd[2]) then
		dsp = getPlayerItemCount(cid, 6527)
		selfSay('Aqui esta! Obrigado e volte sempre.',cid)
		doPlayerSendTextMessage(cid,22,"Voce recebeu "..itens.bpSd_id_valor_qtd[3].." sds.")
		doPlayerSendTextMessage(cid, 20, 'Ainda lhe resta ' .. dsp .. ' Shire Legends Points.')
		container = doPlayerAddItem(cid, 2003, 1)
			doAddContainerItem(container, itens.bpSd_id_valor_qtd[1], itens.bpUh_id_valor_qtd[3])
	else
		selfSay('Desculpe, mas você não tem pontos suficiente.')
	end
end

handleBlessedRing = function(cid)
	if doPlayerRemoveItem(cid,6527, itens.blessedring_id_valor_qtd[2]) then
		dsp = getPlayerItemCount(cid, 6527)
		selfSay('Aqui esta! Obrigado e volte sempre.',cid)
		doPlayerSendTextMessage(cid,22,"Voce recebeu "..itens.blessedring_id_valor_qtd[3].." Blessed Rings.")
		doPlayerSendTextMessage(cid, 20, 'Ainda lhe resta ' .. dsp .. ' Shire Legends Points.')
		container = doPlayerAddItem(cid, 2003, 1)
		for i=1,20 do
			doAddContainerItem(container, 13689, 1)
		end
	else
		selfSay('Desculpe, mas você não tem pontos suficiente.')
	end
end

handleGfb = function(cid)
	if doPlayerRemoveItem(cid,6527, itens.bpGfb_id_valor_qtd[2]) then
		dsp = getPlayerItemCount(cid, 6527)
		selfSay('Aqui esta! Obrigado e volte sempre.',cid)
		doPlayerSendTextMessage(cid,22,"Voce recebeu "..itens.bpGfb_id_valor_qtd[3].." Great Fireball Runes.")
		doPlayerSendTextMessage(cid, 20, 'Ainda lhe resta ' .. dsp .. ' Shire Legends Points.')
		container = doPlayerAddItem(cid, 2003, 1)
		for i=1,20 do
			doAddContainerItem(container, itens.bpGfb_id_valor_qtd[1], 40)
		end
	else
		selfSay('Desculpe, mas você não tem pontos suficiente.')
	end
end

handleHmm = function(cid)
	if doPlayerRemoveItem(cid,6527, itens.bphmm_id_valor_qtd[2]) then
		dsp = getPlayerItemCount(cid, 6527)
		selfSay('Aqui esta! Obrigado e volte sempre.',cid)
		doPlayerSendTextMessage(cid,22,"Voce recebeu "..itens.bphmm_id_valor_qtd[3].." Heavy Magic Missiles.")
		doPlayerSendTextMessage(cid, 20, 'Ainda lhe resta ' .. dsp .. ' Shire Legends Points.')
		container = doPlayerAddItem(cid, 2001, 1)
		for i=1,20 do
			doAddContainerItem(container, itens.bphmm_id_valor_qtd[1], 100)
		end
	else
		selfSay('Desculpe, mas você não tem pontos suficiente.')
	end
end

handleDestroyer = function(cid)
	if doPlayerRemoveItem(cid,6527, itens.bpDestroy_id_valor_qtd[2]) then
		dsp = getPlayerItemCount(cid, 6527)
		selfSay('Aqui esta! Obrigado e volte sempre.',cid)
		doPlayerSendTextMessage(cid,22,"Voce recebeu "..itens.bpDestroy_id_valor_qtd[3].." Destroy Fields.")
		doPlayerSendTextMessage(cid, 20, 'Ainda lhe resta ' .. dsp .. ' Shire Legends Points.')
		container = doPlayerAddItem(cid, 2001, 1)
		for i=1,20 do
			doAddContainerItem(container, itens.bpDestroy_id_valor_qtd[1], 60)
		end
	else
		selfSay('Desculpe, mas você não tem pontos suficiente.')
	end
end

handlePremium = function(cid)
	if doPlayerRemoveItem(cid,6527, itens.premium_dias_qtd[2]) then
		dsp = getPlayerItemCount(cid, 6527)
		selfSay('Aqui esta! Obrigado e volte sempre.',cid)
		doPlayerSendTextMessage(cid,22,"Voce recebeu "..itens.premium_dias_qtd[1].." dias de Premium.")
		doPlayerSendTextMessage(cid, 20, 'Ainda lhe resta ' .. dsp .. ' Shire Legends Points.')
		container = doPlayerAddItem(cid, 2001, 1)
		selfSay('/premium '.. creatureGetName(cid) ..', 30', cid)

	else
		selfSay('Desculpe, mas você não tem pontos suficiente.')
	end
end

handleLifeRing = function(cid)
	if doPlayerRemoveItem(cid,6527, itens.bpLifeRing_id_valor_qtd[2]) then
		dsp = getPlayerItemCount(cid, 6527)
		selfSay('Aqui esta! Obrigado e volte sempre.',cid)
		doPlayerSendTextMessage(cid,22,"Voce recebeu "..itens.bpLifeRing_id_valor_qtd[3].." Life Rings.")
		doPlayerSendTextMessage(cid, 20, 'Ainda lhe resta ' .. dsp .. ' Shire Legends Points.')
		container = doPlayerAddItem(cid, 2003, 1)
		for i=1,20 do
			doAddContainerItem(container, itens.bpLifeRing_id_valor_qtd[1], 1)
		end
	else
		selfSay('Desculpe, mas você não tem pontos suficiente.')
	end
end

handleEnergetico = function(cid)
	if doPlayerRemoveItem(cid,6527, itens.energetico_id_valor_qtd[2]) then
		dsp = getPlayerItemCount(cid, 6527)
		selfSay('Aqui esta! Obrigado e volte sempre.',cid)
		doPlayerSendTextMessage(cid,22,"Voce recebeu "..itens.energetico_id_valor_qtd[3].." Energético.")
		doPlayerSendTextMessage(cid, 20, 'Ainda lhe resta ' .. dsp .. ' Shire Legends Points.')
		doPlayerAddItem(cid, itens.energetico_id_valor_qtd[1], 1)
	else
		selfSay('Desculpe, mas você não tem pontos suficiente.')
	end
end

handleCaptiveSoul = function(cid)
	if doPlayerRemoveItem(cid,6527, itens.captivesoul_id_valor_qtd[2]) then
		dsp = getPlayerItemCount(cid, 6527)
		selfSay('Aqui esta! Obrigado e volte sempre.',cid)
		doPlayerSendTextMessage(cid,22,"Voce recebeu "..itens.captivesoul_id_valor_qtd[3].." Captive Soul.")
		doPlayerSendTextMessage(cid, 20, 'Ainda lhe resta ' .. dsp .. ' Shire Legends Points.')
		doPlayerAddItem(cid, itens.captivesoul_id_valor_qtd[1], 1)
	else
		selfSay('Desculpe, mas você não tem pontos suficiente.')
	end
end

handleSlp = function (cid)
	if(doPlayerRemoveMoney(cid,itens.dsp_id_valor_qtd[2])) then
		doPlayerAddItem(cid,6527,100)
		selfSay('Aqui esta! Obrigado e volte sempre.')
		doPlayerSendTextMessage(cid,22,"Voce recebeu 100 Shire Legends Points.")
	else
		selfSay('Desculpe, mas você não tem dinheiro suficiente.')
	end
end

function tableLength(tbl)
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end


-- npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
-- npcHandler:addModule(FocusModule:new())


