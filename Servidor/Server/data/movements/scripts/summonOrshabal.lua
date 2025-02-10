function onStepIn(creature, item, position, fromPosition)
	local player = Player(creature)
	if player and position.x == 477 and position.y == 257  then
		doSummonCreature("orshabaal", {x= 498, y= 256, z=13} )
		doPlayerSendTextMessage(player,22,"Um orshabal surgil na sala do Sacrifício")

	end

end
