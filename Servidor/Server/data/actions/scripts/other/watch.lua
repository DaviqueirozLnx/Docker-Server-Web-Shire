function onUse(player, item, fromPosition, target, toPosition, isHotkey)

  if(item:getId() == 1729 and item.actionid == 333  ) then
	doTeleportThing(player,{x=121, y=311, z=7})
	doSendMagicEffect(getPlayerPosition(player),50)
  end

	player:sendTextMessage(MESSAGE_INFO_DESCR, "The time is " .. getFormattedWorldTime() .. ".")
	return true
end
