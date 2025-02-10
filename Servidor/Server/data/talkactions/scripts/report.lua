function onSay(player, words, param)

if getPlayerStorageValue(player, 323232) > os.time() then
doPlayerSendCancel(player, "Espere "..getPlayerStorageValue(player, 323232) - os.time().." segundos para usar o !report novamente.")
return false
end
		setPlayerStorageValue(player, 323232, os.time() + 30)

	if player:getAccountType() == ACCOUNT_TYPE_NORMAL then
		return false
	end

	local data_hora_atual = os.date("*t")
	local name = player:getName()
	local file = io.open("data/reports/bugs/" .. name .. "---" .. data_hora_atual.day .. "-" .. data_hora_atual.hour .. "-" .. data_hora_atual.min .." report.txt", "a")

	if not file then
		player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "There was an error when processing your report, please contact a gamemaster.")
		return true
	end

	io.output(file)
	io.write("------------------------------\n")
	io.write("Name: " .. name)
	local playerPosition = player:getPosition()
	io.write(" [Player Position: " .. playerPosition.x .. ", " .. playerPosition.y .. ", " .. playerPosition.z .. "]\n")
	io.write("Comment: " .. words .. "\n")
	io.close(file)

	player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "Your report has been sent to " .. configManager.getString(configKeys.SERVER_NAME) .. ".")
	return true
end


