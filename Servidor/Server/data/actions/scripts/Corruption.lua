local config = {
	deadTree = {Actionid= 14550,id=5392},
	firebug = {id=5468},
	firewall = {
		id=5063,
		location = {
			deadTreeLocalization = {x = 1138, y = 819, z = 8}
		},
	},
	fenceHorizontal = {
		id = 1544,
        firewall = 5061,
		location = {
			{x = 1164, y = 790, z = 8},
			{x = 1163, y = 790, z = 8},
			{x = 1147, y = 818, z = 8},
			{x = 1146, y = 818, z = 8},
		},
	},
	fenceVertical = {
		id = 1543,
        firewall = 5062,
		location = {
			{x = 1158, y = 836, z = 8},
			{x = 1158, y = 837, z = 8},
			{x = 1158, y = 841, z = 8},
			{x = 1158, y = 842, z = 8},
			{x = 1150, y = 842, z = 8},
			{x = 1150, y = 841, z = 8},
			{x = 1150, y = 836, z = 8},
			{x = 1150, y = 837, z = 8},
			{x = 1152, y = 802, z = 8},
			{x = 1152, y = 803, z = 8}
		}
	},
	time = 5 -- time in seconds to remove the stone
 }

function onUse(cid, item, fromPosition, itemEx, toPosition)

	  if(item:getId() == config.firebug.id and itemEx:getId() == config.deadTree.id and itemEx:getActionId() == config.deadTree.Actionid) then

		itemEx:remove();
		doCreateItem(config.firewall.id,1,config.firewall.location.deadTreeLocalization)
		doPlayerSendTextMessage(cid,22,"O arbusto foi removido por "..config.time.." minutos!")
		item:remove();

		handleRemoveFenceVertical(true)
		handleRemoveFenceHorizontal(true)
		doSendMagicEffect(config.pos, CONST_ME_MAGIC_RED)
		addEvent(function ()
			handleAddDeadTreeAndRemoveFireWall()
		end, 1000 * 60 * config.time)
	  end
	  return true
 end


function handleAddDeadTreeAndRemoveFireWall()
	local itemCreated = getTileItemById(config.firewall.location.deadTreeLocalization, config.firewall.id).uid
	doRemoveItem(itemCreated,1)
	doCreateItemAction(config.deadTree.id,1,config.firewall.location.deadTreeLocalization,config.deadTree.Actionid)

	handleRemoveFenceHorizontal(false)
	handleRemoveFenceVertical(false)

end

function handleRemoveFenceHorizontal(normalFlux)

	for i=1,#config.fenceHorizontal.location do
		local pos = Position(config.fenceHorizontal.location[i])
		if(normalFlux)then
			item = getTileItemById(pos, config.fenceHorizontal.id).uid
			doRemoveItem(item,1)
			doCreateItem(config.fenceHorizontal.firewall,1, pos)
		else
			item = getTileItemById(pos, config.fenceHorizontal.firewall).uid
			doRemoveItem(item,1)
			doCreateItem(config.fenceHorizontal.id,1, pos)

		end
		i = i + 1
	end
end

function handleRemoveFenceVertical(normalFlux)
	for i=1,#config.fenceVertical.location do
		local pos = Position(config.fenceVertical.location[i])
		if(normalFlux)then
			item = getTileItemById(pos, config.fenceVertical.id).uid
			doRemoveItem(item,1)
			doCreateItem(config.fenceVertical.firewall,1, pos)
		else
			item = getTileItemById(pos, config.fenceVertical.firewall).uid
			doRemoveItem(item,1)
			doCreateItem(config.fenceVertical.id,1, pos)
		end
		i = i + 1
	end
end
