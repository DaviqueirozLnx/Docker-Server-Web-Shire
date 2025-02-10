local focus = 0
local talk_start = 0
local target = 0
local following = false
local attacking = false

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
	local player = Player(cid)

  	if (msgcontains(msg, 'hi')) then
  		selfSay('Olá mortal ' .. player:getName() .. ',  fico impressionado que tenha chegado até aqui, força ja vi que tem,agora vamos ver se tem cérebro, está pronto?')
  		focus = cid
	end

		if msgcontains(msg, 'yes') and talk_start == 0 then
			selfSay('qual é o nome do anel que conduz a mana shield?')
			talk_state = 1

		elseif msgcontains(msg, 'energy ring') then
			selfSay('qual é o nome do anel que conduz a mana healing e health healing?')
			talk_state = 1

		elseif msgcontains(msg, 'ring of healing') then
			selfSay('qual é a runa que se é chamada de extreme sudden death rune?')
			talk_state = 2

		elseif msgcontains(msg, 'dark sd') then
			selfSay('qual é o nome do npc que faz o Hunter Addon?')
			talk_state = 3

		elseif msgcontains(msg, 'brian') then
			doTeleportThing(cid, {x=480, y=261, z=15})
			doBroadcastMessage('Parabéns ' .. player:getName() .. ',  está a caminho da ultima sala do templo dos Deuses, e a um passo da imortalidade. Boa Sorte!')
		elseif msgcontains(msg, 'sd') or msgcontains(msg, 'sd dark') or msgcontains(msg, 'esd') then
	frost1pos = {x=486, y=262, z=15}
	frost2pos = {x=486, y=262, z=15}
	doSummonCreature("Frost Dragon", frost1pos)
	doSummonCreature("Frost Dragon", frost2pos)
			selfSay('Resposta Incorreta! ai esta...')
			talk_state = 3

		elseif msgcontains(msg, 'bye') then
	frost1pos = {x=486, y=262, z=15}
	frost2pos = {x=486, y=262, z=15}
	doSummonCreature("Frost Dragon", frost1pos)
	doSummonCreature("Frost Dragon", frost2pos)
			selfSay('Resposta Incorreta! ai esta...')
			talk_state = 3

		elseif msgcontains(msg, 'energy ring') then
			selfSay('Ok, vamos para a proxima pergunta?')
			talk_state = 2

		elseif msgcontains(msg, 'life ring') then
	frost1pos = {x=486, y=262, z=15}
	frost2pos = {x=486, y=262, z=15}
	doSummonCreature("Frost Dragon", frost1pos)
	doSummonCreature("Frost Dragon", frost2pos)
			selfSay('Resposta Incorreta! ai esta...')
			talk_state = 2

		elseif msgcontains(msg, 'energy ring') then
			selfSay('Ok, vamos para a proxima pergunta?')
			talk_state = 1

		elseif msgcontains(msg, 'utamo') then
	frost1pos = {x=480, y=259, z=15}
	frost2pos = {x=480, y=262, z=15}
	doSummonCreature("Frost Dragon", demon1pos)
	doSummonCreature("Frost Dragon", demon2pos)
			selfSay('Resposta Incorreta! ai esta...')
			talk_state = 1

		elseif msgcontains(msg, 'leave') then
			selfSay('Do you wish to leave the training camp?')
			talk_state = 2
		end
end


function onCreatureChangeOutfit(creature)

end
