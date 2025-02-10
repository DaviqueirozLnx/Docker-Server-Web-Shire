local focus = 0
local talk_start = 0
local target = 0
local days = 0

function onThingMove(creature, thing, oldpos, oldstackpos)

end


function onCreatureAppear(creature)

end


function onCreatureDisappear(cid, pos)
  	if focus == cid then
          selfSay('Good bye then.')
          focus = 0
          talk_start = 0
  	end
end


function onCreatureTurn(creature)

end


function msgcontains(txt, str)
  	return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end


function onCreatureSay(cid, type, msg)
  	msg = string.lower(msg)

  	if (msgcontains(msg, 'hi') and (focus == 0)) and getDistanceToCreature(cid) < 4 then
 		selfSay('Ohh I Need Help.')
 		focus = cid
 		talk_start = os.clock()

	elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
  		selfSay('Sorry, ' .. creatureGetName(cid) .. '! I talk to you in a minute.')

  	elseif focus == cid then
		talk_start = os.clock()

		if msgcontains(msg, 'promasdeotion') or msgcontains(msg, 'gfhfhff') then
 			if getPlayerVocation(cid) > 4 then
 				selfSay('Sorry, you are already promoted.')
 				talk_state = 0
 			elseif getPlayerLevel(cid) < 100 then
				selfSay('Sorry, you need level 100 to buy promotion.')
				talk_state = 0
			elseif not isPremium(cid) then
				selfSay('Sorry, you must be premium to buy promotion.')
				talk_state = 0
			else
				selfSay('Do you want to buy promotion for 20k?')
				talk_state = 1
			end

		elseif msgcontains(msg, 'premasdsadium') or msgcontains(msg, 'premmy') then
			selfSay('Do you want to buy 7 days of premium for 7k?')
			talk_state = 2

		elseif talk_state == 1 then
			if msgcontains(msg, 'yes') then
				if pay(cid,20000) then
					doPlayerSetVocation(cid, getPlayerVocation(cid)+4)
					selfSay('You are now promoted!')
				else
					selfSay('Sorry, you do not have enough money.')
				end
 			end
			talk_state = 0

		elseif talk_state == 2 then
			if msgcontains(msg, 'yes') then
				if pay(cid,7000) then
					selfSay('/premium '.. creatureGetName(cid) ..', 7')
					selfSay('You have 7 days of premium more!')
				else
					selfSay('Sorry, you do not have enough money.')
				end
			end
			talk_state = 0

		elseif msgcontains(msg, 'message') or msgcontains(msg, 'message') then
			selfSay('Você pode entregar esta carta para a Rainha pra min por favor? estou em apuros.')
			talk_state = 3

		elseif talk_state == 3 then
			if msgcontains(msg, 'yes') then
				if pay(cid,0) then
	doPlayerAddItem(cid,5958,1)
	doPlayerAddItem(cid,2318,1)
 	doPlayerSendTextMessage(cid,22,"Use essa ultima pedra para que você consiga sair do meu castelo, fale com o Mercier Cobran sobre a ( queen )")
	doSendAnimatedText(getPlayerPosition(cid), "Queen", TEXTCOLOR_RED)
	doPlayerSendTextMessage(cid,21,"Fale com a Rainha sobre o Narzan.")
	doSendMagicEffect(getPlayerPosition(cid),14)
					selfSay('Tome aqui essa mensagem entregue para a Rainha urgente')
				else
					selfSay('Desculpe, mas voce não Começou a Royal Family Quest.')
				end
			end
			talk_state = 4

		elseif msgcontains(msg, 'royal familsdfy two') or msgcontains(msg, 'two sdfmission') then
			selfSay('Go bother someone else!')
			talk_state = 4

		elseif talk_state == 4 then
			if msgcontains(msg, 'yes') then
                                    if doPlayerRemoveItem(cid,4873,1) == 1 then
				travel(cid, 56, 432, 7)
	doSendAnimatedText(getPlayerPosition(cid), "Royal", TEXTCOLOR_YELLOW)
	doSendMagicEffect(getPlayerPosition(cid),14)
					selfSay('How rude!')
				else
					selfSay('Desculpe, mas voce não Começou a Royal Family Quest.')
				end
			end
			talk_state = 5

		elseif msgcontains(msg, 'royal fasdfmily three') or msgcontains(msg, 'three sdfmission') then
			selfSay('Go bother someone else!')
			talk_state = 5

		elseif talk_state == 5 then
			if msgcontains(msg, 'yes') then
                                    if doPlayerRemoveItem(cid,2637,1) == 1 then
				travel(cid, 56, 432, 7)
	doSendAnimatedText(getPlayerPosition(cid), "Royal", TEXTCOLOR_YELLOW)
	doSendMagicEffect(getPlayerPosition(cid),14)
					selfSay('How rude!')
				else
					selfSay('Desculpe, mas voce não Começou a Royal Family Quest.')
				end
			end

  		elseif msgcontains(msg, 'bye')  and getDistanceToCreature(cid) < 4 then
  			selfSay('Good bye, ' .. creatureGetName(cid) .. '!')
  			focus = 0
  			talk_start = 0
  		end
  	end
end


function onCreatureChangeOutfit(creature)

end


function onThink()
	doNpcSetCreatureFocus(focus)
  	if (os.clock() - talk_start) > 30 then
  		if focus > 0 then
  			selfSay('Next Please...')
  		end
  			focus = 0
  	end
 	if focus ~= 0 then
 		if getDistanceToCreature(focus) > 5 then
 			selfSay('Good bye then.')
 			focus = 0
		end
 	end
end
