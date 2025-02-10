local firstItems = {
    helmet={id= 2457, slot=1},
    backpack={id=1988, slot=3},
    armor={id=2463, slot=4},
    legs={id=2647, slot=7},
    boot={id=2643, slot=8},
}

function onLogin(cid)
	local player = Player(cid)


	if player:getLastLoginSaved() == 0 then
        if player:getVocation():getId() == 9 then
            player:addItem(2190, 1, false, 6)
            player:addItem(2510, 1, false, 5)
        elseif player:getVocation():getId() == 10 then
            player:addItem(2182, 1, false, 6)
            player:addItem(2510, 1, false, 5)
        elseif player:getVocation():getId() == 11 then
            player:addItem(2455, 1, false, 6)
            player:addItem(2543, 100, false, 10)
        elseif player:getVocation():getId() == 12 then
            player:addItem(2391, 1, false, 6)
        end
			for key, item in pairs(firstItems) do
				if(item.id == firstItems.backpack.id)then
					local bag = player:addItem(item.id)
					bag:addItem(2160,1)
					bag:addItem(15000,1)
					bag:addItem(2263,1)
					bag:addItem(2312,1)
					bag:addItem(2270,1)
				else
					player:addItem(item.id, 1, false, item.slot)
				end
			end
    end

    return true
end
