local pos = {x = 1031, y = 1141, z = 7}

function onUse(cid, item, frompos, item2, topos)
		local player = Player(cid)
		doTeleportThing(player, pos)
		doSendAnimatedText("Troll!!", pos,TEXTCOLOR_LIGHTGREEN)

		return TRUE
end
