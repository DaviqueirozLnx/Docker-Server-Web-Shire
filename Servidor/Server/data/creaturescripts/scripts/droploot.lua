function onDeath(player, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
	if player:hasFlag(PlayerFlag_NotGenerateLoot) or player:getVocation():getId() == VOCATION_NONE then
		return true
	end

	local amuletsEnergyzed = {13682,13683,13684}
	local amulet = player:getSlotItem(CONST_SLOT_NECKLACE)
	local isRedOrBlack = table.contains({SKULL_RED, SKULL_BLACK}, player:getSkull())
	if amulet and (amulet.itemid == 13682 or amulet.itemid == 13683 or amulet.itemid == 13684) and not isRedOrBlack then
		local isPlayer = false
		if killer then
			if killer:isPlayer() then
				isPlayer = true
			else
				local master = killer:getMaster()
				if master and master:isPlayer() then
					isPlayer = true
				end
			end
		end

		if not isPlayer or not player:hasBlessing(6) then
			if(amulet.itemid == 13682 or amulet.itemid == 13683 or amulet.itemid == 13684)then
				player:removeItem(amulet.itemid, 1, -1, false)
				if(amulet.itemid == 13682) then
						player:addItem(2197, 1, false, CONST_SLOT_NECKLACES)
				elseif(amulet.itemid == 13683) then
						player:addItem(2173, 1, false, CONST_SLOT_NECKLACES)
                elseif(amulet.itemid == 13684) then
						player:addItem(2125, 1, false, CONST_SLOT_NECKLACES)
				end
			end
		end
	else
		for i = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
			local item = player:getSlotItem(i)
			local lossPercent = player:getLossPercent()
			if item then
				if isRedOrBlack or math.random(item:isContainer() and 100 or 1000) <= lossPercent then
					if (isRedOrBlack or lossPercent ~= 0) and not item:moveTo(corpse) then
						item:remove()
					end
				end
			end
		end
	end

	if not player:getSlotItem(CONST_SLOT_BACKPACK) then
		player:addItem(ITEM_BAG, 1, false, CONST_SLOT_BACKPACK)
	end
	return true
end
