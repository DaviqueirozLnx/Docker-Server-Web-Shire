function onUse(cid, item, frompos, item2, topos)
	local playerProps = Player(cid)

    voc = getPlayerVocation(cid)
    queststatus = getPlayerStorageValue(cid,2180)

    if queststatus == -1 then
    if voc == 1 or voc == 5 and playerProps:getLevel() >= 200 then
    doPlayerSetVocation(cid, 9)
	playerProps:sendTextMessage(22,"A força dos Semi-Deuses agora o acompanham nobre Wyzard.")
    end

    if voc == 2 or voc == 6 and playerProps:getLevel() >= 200 then
    doPlayerSetVocation(cid, 10)
	playerProps:sendTextMessage(22,"A força dos Semi-Deuses agora o acompanham nobre Cleric.")
    end

    if voc == 3 or voc == 7 and playerProps:getLevel() >= 200 then
    doPlayerSetVocation(cid, 11)
	playerProps:sendTextMessage(22,"A força dos Semi-Deuses agora o acompanham nobre Ranger.")
    end

    if voc == 4 or voc == 8 and playerProps:getLevel() >= 200 then
    doPlayerSetVocation(cid, 12)
	playerProps:sendTextMessage(22,"A força dos Semi-Deuses agora o acompanham nobre Slayer.")
    end


	playerProps:addMaxHealth(185)
	playerProps:setMaxMana(35)
	playerProps:addMana(35)
    doSendMagicEffect(topos,CONST_ME_MAGIC_BLUE)
	doSendAnimatedText("Cleck!", playerProps:getPosition(),TEXTCOLOR_LIGHTGREEN)
    doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MAGIC_BLUE)
    setPlayerStorageValue(cid,2180,1)
	addEvent(function ()
		doResetLevel(cid)
		return true
		end, 3000)

    else
    doPlayerSendTextMessage(cid,22,"Está vazio, você já completou essa missão.")
    end
    return TRUE
    end
