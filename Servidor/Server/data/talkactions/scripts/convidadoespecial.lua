function onSay(player, words, param)

container = doPlayerAddItem(player, 2000, 1)
doAddContainerItem(container, 6527, 1000)

player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Parabéns, você é um convidado especial!")
	return false
end
