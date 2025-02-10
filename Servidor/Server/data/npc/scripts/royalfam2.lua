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
 		selfSay('What do you want here?')
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

		elseif msgcontains(msg, 'queen') or msgcontains(msg, 'queen') then
			selfSay('Go bother someone else!')
			talk_state = 7

		elseif talk_state == 7 then
			if msgcontains(msg, 'yes') then
                                    if doPlayerRemoveItem(cid,2318,1) == 1 then
				travel(cid, 30, 298, 7)
	doSendAnimatedText(getPlayerPosition(cid), "Royal", TEXTCOLOR_YELLOW)
	doSendMagicEffect(getPlayerPosition(cid),14)
					selfSay('How rude!')
				else
					selfSay('Desculpe, mas voce não Começou a Royal Family Quest.')
				end
			end
			talk_state = 4

		elseif msgcontains(msg, 'carlin') or msgcontains(msg, 'carlin') then
			selfSay('Go bother someone else!')
			talk_state = 4

		elseif talk_state == 4 then
			if msgcontains(msg, 'yes') then
                                    if doPlayerRemoveItem(cid,2637,1) == 1 then
				travel(cid, 30, 298, 7)
  			local item1 =  doPlayerAddItem(cid,4873,1)
	doSetItemSpecialDescription(item1, "It is a Brooch of Royal Family.")
 	doPlayerSendTextMessage(cid,22,"Click on use Brooch for Search Next Mission.")
	doPlayerSendTextMessage(cid,21,"Quest 2 Parte 'The Royal Family.'.")
	doSendAnimatedText(getPlayerPosition(cid), "Royal", TEXTCOLOR_YELLOW)
	doSendMagicEffect(getPlayerPosition(cid),14)
					selfSay('How rude!')
				else
					selfSay('Desculpe, mas voce não Começou a Royal Family Quest.')
				end
			end
			talk_state = 5

		elseif msgcontains(msg, 'queen') or msgcontains(msg, 'queen') then
			selfSay('You wanna get the letter for queen?')
			talk_state = 5

		elseif talk_state == 5 then
			if msgcontains(msg, 'yes') then
                                    if doPlayerRemoveItem(cid,2318,1) == 1 then
				travel(cid, 30, 298, 7)
	doSendAnimatedText(getPlayerPosition(cid), "Royal", TEXTCOLOR_YELLOW)
	doSendMagicEffect(getPlayerPosition(cid),14)
					selfSay('How rude!')
				else
					selfSay('Desculpe, mas voce não Começou a Royal Family Quest.')
				end
			end
			talk_state = 4


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
