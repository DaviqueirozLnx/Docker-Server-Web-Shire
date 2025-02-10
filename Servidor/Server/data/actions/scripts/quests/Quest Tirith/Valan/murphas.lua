local config = {
	pos = {x=420, y=227, z=15},
	pos1 = {x=421, y=254, z=15},
	pos2 = {x=462, y=246, z=15},
	pos3 = {x=456, y=221, z=15},
	stoneid = 1353,
	stoneid1 = 1354,
	stoneid2 = 1355,
	stoneid3 = 1304,
	time = 120 -- time in seconds to remove the stone
 }


 function onUse(cid, item, fromPosition, itemEx, toPosition)
	  local stone = getTileItemById(config.pos,config.stoneid).uid
	  local stone1 = getTileItemById(config.pos1,config.stoneid1).uid
	  local stone2 = getTileItemById(config.pos2,config.stoneid2).uid
	  local stone3 = getTileItemById(config.pos3,config.stoneid3).uid

	  if(stone > 0 and item:getId() == 2447 and itemEx:getId() == 1417) then
		if(itemEx:getPosition().x == 428 and itemEx:getPosition().y == 228)then
			doRemoveItem(stone,1)
		elseif (itemEx:getPosition().x == 430 and itemEx:getPosition().y == 252)then
			doRemoveItem(stone1,1)
		elseif (itemEx:getPosition().x == 454 and itemEx:getPosition().y == 248)then
			doRemoveItem(stone2,1)
		elseif (itemEx:getPosition().x == 458 and itemEx:getPosition().y == 227)then
			doRemoveItem(stone3,1)
		end

		item:remove();
   doPlayerSendTextMessage(cid,22,"A pedra foi removida")
		doSendMagicEffect(config.pos, CONST_ME_MAGIC_RED)
		addEvent(doCreateItem, config.time * 1000, config.stoneid, 1, config.pos)
	  else
		doPlayerSendCancel(cid, "A pedra ja foi removida, aguarde 30 segundos para abrir novamente.")
	  end
	  return true
 end
