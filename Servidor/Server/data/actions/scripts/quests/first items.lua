local firstItems =
{
	2050,
	2650,
	2050
}

function onUse(cid, item, frompos, item2, topos)
		queststatus = getPlayerStorageValue(cid,1001)
		if queststatus == -1 then
			for i = 1, table.maxn(firstItems) do
				doPlayerAddItem(cid, firstItems[i], 1)
			end


			local bag = doPlayerAddItem(cid, 1987, 1)
			doSendMagicEffect(topos,CONST_ME_MAGIC_BLUE)
            doPlayerSendTextMessage(cid,20,"Quest completada 'Primeiros Itens'.")
            doPlayerSendTextMessage(cid,22,"Você pegou seus itens'.")
			doSendAnimatedText("Cleck!",topos,  TEXTCOLOR_ORANGE)
			doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MAGIC_BLUE)
			doAddContainerItem(bag, 2674, 3)
			setPlayerStorageValue(cid, 1001, 1)
		else
		doPlayerSendTextMessage(cid,22,"O Baú está vazio.")
		end
		return TRUE
end
