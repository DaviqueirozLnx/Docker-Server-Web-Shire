function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == ITEM_GOLD_COIN and item.type == ITEMCOUNT_MAX then
		Item(item.uid):remove(100)
	 cid:addItem(ITEM_PLATINUM_COIN, 1)
	 doSendAnimatedText("$$$", Player(cid):getPosition(),129)
	 elseif item.itemid == ITEM_RUBY_COIN then
		Item(item.uid):remove(1)
		cid:addItem(ITEM_CRYSTAL_COIN, 100)
		doSendAnimatedText("$$$", Player(cid):getPosition(),95)
	elseif item.itemid == ITEM_PLATINUM_COIN and item.type == ITEMCOUNT_MAX then
		Item(item.uid):remove(100)
		cid:addItem(ITEM_CRYSTAL_COIN, 1)
		doSendAnimatedText("$$$", Player(cid):getPosition(),95)
	elseif item.itemid == ITEM_CRYSTAL_COIN and item.type == ITEMCOUNT_MAX then
		Item(item.uid):remove(100)
		cid:addItem(ITEM_RUBY_COIN, 1)
		doSendAnimatedText("$$$", Player(cid):getPosition(),180)
	elseif item.itemid == ITEM_PLATINUM_COIN and item.type < ITEMCOUNT_MAX then
		Item(item.uid):remove(1)
		doPlayerAddItem(cid,ITEM_GOLD_COIN,100)
		doSendAnimatedText("$$$", Player(cid):getPosition(),210)
	elseif item.itemid == ITEM_CRYSTAL_COIN then
		Item(item.uid):remove(1)
		doPlayerAddItem(cid,ITEM_PLATINUM_COIN,100)
		doSendAnimatedText("$$$", Player(cid):getPosition(),129)
	else
	 return FALSE
	end
	return TRUE
	end
