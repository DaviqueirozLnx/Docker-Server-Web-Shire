
local positions = {
	["Sorcerer"] = {x = 272, y = 191, z = 8},
	["Druid"] = {x = 278, y = 191, z = 8},
	["Archer"] = {x = 278, y = 200, z = 8},
	["Knight"] = {x = 272, y = 200, z = 8},
}
function onThink( interval, lastExecution)

	for index, value in pairs(positions) do
		doSendAnimatedText(index,value, 198)
	end

return true
end
