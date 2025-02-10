local instruments = {
	[2070] = {effect = CONST_ME_SOUND_GREEN}, -- wooden flute
	[2071] = {effect = CONST_ME_SOUND_GREEN}, -- lyre
	[2072] = {effect = CONST_ME_SOUND_GREEN}, -- lute
	[2073] = {effect = CONST_ME_SOUND_GREEN}, -- drum
	[2074] = {effect = CONST_ME_SOUND_GREEN}, -- panpipes
	[2075] = {effect = CONST_ME_SOUND_GREEN}, -- simple fanfare
	[2076] = {effect = CONST_ME_SOUND_GREEN}, -- fanfare
	[2077] = {effect = CONST_ME_SOUND_GREEN}, -- royal fanfare (actual effect is unknown)
	[2078] = {effect = CONST_ME_SOUND_GREEN}, -- post horn
	[2079] = {effect = CONST_ME_SOUND_GREEN}, -- war horn
	[2080] = {effect = CONST_ME_SOUND_BLUE}, -- piano (actual effect is unknown)
	[2081] = {effect = CONST_ME_SOUND_BLUE}, -- piano
	[2082] = {effect = CONST_ME_SOUND_BLUE}, -- piano
	[2083] = {effect = CONST_ME_SOUND_BLUE}, -- piano
	[2084] = {effect = CONST_ME_SOUND_BLUE}, -- harp (actual effect is unknown)
	[2085] = {effect = CONST_ME_SOUND_BLUE}, -- harp
	[2332] = {effect = CONST_ME_SOUND_BLUE}, -- Waldo's post horn (actual effect is unknown)
	[2367] = {effect = CONST_ME_SOUND_GREEN}, -- drum (immovable)
	[2368] = {effect = CONST_ME_SOUND_GREEN}, -- simple fanfare (immovable)
	[2369] = {effect = CONST_ME_SOUND_YELLOW, itemId = 2681, itemCount = 10, chance = 80, remove = true}, -- cornucopia (immovable)
	[2370] = {effect = CONST_ME_SOUND_GREEN}, -- lute (immovable)
	[2371] = {effect = CONST_ME_SOUND_BLUE}, -- the horn of sundering (actual effect is unknown; immovable)
	[2372] = {effect = CONST_ME_SOUND_GREEN}, -- lyre (immovable)
	[2373] = {effect = CONST_ME_SOUND_GREEN}, -- panpipes (immovable)
	[3951] = {effect = CONST_ME_SOUND_BLUE}, -- bongo drum (actual effect is unknown)
	[3952] = {effects = {failure = CONST_ME_POFF, success = CONST_ME_SOUND_GREEN}, chance = 20}, -- didgeridoo
	[3953] = {effect = CONST_ME_SOUND_RED}, -- war drum
	[3957] = {effect = CONST_ME_SOUND_YELLOW, itemId = 2681, itemCount = 10, chance = 80, remove = true}, -- cornucopia
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if(item:getId() == 2071)then

piecepos = {x=463, y=234, z=14, stackpos=2}
piece1pos = {x=453, y=236, z=14, stackpos=1}
piece2pos = {x=453, y=238, z=14, stackpos=1}
piece3pos = {x=453, y=240, z=14, stackpos=1}
piece4pos = {x=453, y=242, z=14, stackpos=1}
piece5pos = {x=453, y=244, z=14, stackpos=1}
piece6pos = {x=473, y=236, z=14, stackpos=1}
piece7pos = {x=473, y=238, z=14, stackpos=1}
piece8pos = {x=473, y=240, z=14, stackpos=1}
piece9pos = {x=473, y=242, z=14, stackpos=1}
piece10pos = {x=473, y=244, z=14, stackpos=1}
piece11pos = {x=461, y=247, z=14, stackpos=1}
piece12pos = {x=461, y=250, z=14, stackpos=1}
piece13pos = {x=466, y=247, z=14, stackpos=1}
piece14pos = {x=466, y=250, z=14, stackpos=1}
piece15pos = {x=463, y=248, z=14, stackpos=1}

rockpos1 = {x=453, y=236, z=14, stackpos=1}
rockpos2 = {x=453, y=238, z=14, stackpos=1}
rockpos3 = {x=453, y=240, z=14, stackpos=1}
rockpos4 = {x=453, y=242, z=14, stackpos=1}
rockpos5 = {x=453, y=244, z=14, stackpos=1}
rockpos6 = {x=473, y=236, z=14, stackpos=1}
rockpos7 = {x=473, y=238, z=14, stackpos=1}
rockpos8 = {x=473, y=240, z=14, stackpos=1}
rockpos9 = {x=473, y=242, z=14, stackpos=1}
rockpos10 = {x=473, y=244, z=14, stackpos=1}
rockpos11 = {x=461, y=247, z=14, stackpos=1}
rockpos12 = {x=461, y=250, z=14, stackpos=1}
rockpos13 = {x=466, y=247, z=14, stackpos=1}
rockpos14 = {x=466, y=250, z=14, stackpos=1}
rockpos15 = {x=464, y=248, z=14, stackpos=1}

getpiece = getThingfromPos(piecepos)
getpiece1 = getThingfromPos(piece1pos)
getpiece2 = getThingfromPos(piece2pos)
getpiece3 = getThingfromPos(piece3pos)
getpiece4 = getThingfromPos(piece4pos)
getpiece5 = getThingfromPos(piece5pos)
getpiece6 = getThingfromPos(piece6pos)
getpiece7 = getThingfromPos(piece7pos)
getpiece8 = getThingfromPos(piece8pos)
getpiece9 = getThingfromPos(piece9pos)
getpiece10 = getThingfromPos(piece10pos)
getpiece11 = getThingfromPos(piece11pos)
getpiece12 = getThingfromPos(piece12pos)
getpiece13 = getThingfromPos(piece13pos)
getpiece14 = getThingfromPos(piece14pos)
getpiece15 = getThingfromPos(piece15pos)

if getpiece.itemid == 2071 and getpiece1.itemid == 1455 and getpiece2.itemid == 1455 and getpiece3.itemid == 1455 and getpiece4.itemid == 1455 and getpiece5.itemid == 1455 and getpiece6.itemid == 1454 and getpiece7.itemid == 1454 and getpiece8.itemid == 1454 and getpiece9.itemid == 1454 and getpiece10.itemid == 1454 and getpiece11.itemid == 1455 and getpiece12.itemid == 1455  and getpiece13.itemid == 1454 and getpiece14.itemid == 1454 then

doRemoveItem(getpiece1.uid,1)
doRemoveItem(getpiece2.uid,1)
doRemoveItem(getpiece3.uid,1)
doRemoveItem(getpiece4.uid,1)
doRemoveItem(getpiece5.uid,1)
doRemoveItem(getpiece6.uid,1)
doRemoveItem(getpiece7.uid,1)
doRemoveItem(getpiece8.uid,1)
doRemoveItem(getpiece9.uid,1)
doRemoveItem(getpiece10.uid,1)
doRemoveItem(getpiece11.uid,1)
doRemoveItem(getpiece12.uid,1)
doRemoveItem(getpiece13.uid,1)
doRemoveItem(getpiece14.uid,1)
doCreateItem(1459,1,rockpos1)
doCreateItem(1459,1,rockpos2)
doCreateItem(1459,1,rockpos3)
doCreateItem(1459,1,rockpos4)
doCreateItem(1459,1,rockpos5)
doCreateItem(1458,1,rockpos6)
doCreateItem(1458,1,rockpos7)
doCreateItem(1458,1,rockpos8)
doCreateItem(1458,1,rockpos9)
doCreateItem(1458,1,rockpos10)
doCreateItem(1459,1,rockpos11)
doCreateItem(1459,1,rockpos12)
doCreateItem(1458,1,rockpos13)
doCreateItem(1458,1,rockpos14)
doCreateItem(1396,1,rockpos15)

doSummonCreature("gargoyle", {x=453, y=236, z=14})
doSummonCreature("gargoyle", {x=453, y=238, z=14})
doSummonCreature("gargoyle", {x=453, y=240, z=14})
doSummonCreature("gargoyle", {x=453, y=242, z=14})
doSummonCreature("gargoyle", {x=453, y=244, z=14})
doSummonCreature("gargoyle", {x=473, y=236, z=14})
doSummonCreature("gargoyle", {x=473, y=238, z=14})
doSummonCreature("gargoyle", {x=473, y=240, z=14})
doSummonCreature("gargoyle", {x=473, y=242, z=14})
doSummonCreature("gargoyle", {x=473, y=244, z=14})
doSummonCreature("gargoyle", {x=461, y=247, z=14})
doSummonCreature("gargoyle", {x=461, y=250, z=14})
doSummonCreature("gargoyle", {x=466, y=247, z=14})
doSummonCreature("gargoyle", {x=466, y=250, z=14})

doSendMagicEffect(getpiece1,CONST_ME_MAGIC_BLUE)
doSendMagicEffect(getpiece2,CONST_ME_MAGIC_BLUE)
doSendMagicEffect(getpiece3,CONST_ME_MAGIC_BLUE)
doSendMagicEffect(getpiece4,CONST_ME_MAGIC_BLUE)
doSendMagicEffect(getpiece5,CONST_ME_MAGIC_BLUE)
doSendMagicEffect(getpiece6,CONST_ME_MAGIC_BLUE)
doSendMagicEffect(getpiece7,CONST_ME_MAGIC_BLUE)
doSendMagicEffect(getpiece8,CONST_ME_MAGIC_BLUE)
doSendMagicEffect(getpiece9,CONST_ME_MAGIC_BLUE)
doSendMagicEffect(getpiece10,CONST_ME_MAGIC_BLUE)
doSendMagicEffect(getpiece11,CONST_ME_MAGIC_BLUE)
doSendMagicEffect(getpiece12,CONST_ME_MAGIC_BLUE)
doSendMagicEffect(getpiece13,CONST_ME_MAGIC_BLUE)
doSendMagicEffect(getpiece14,CONST_ME_MAGIC_BLUE)

doSendMagicEffect(fromPosition,18)
doPlayerSendTextMessage(player,22,"Os seres adormecidos foram despertados atraves do som dos deuses.")
else
doSendMagicEffect(fromPosition,18)
end
	end



	local instrument, chance = instruments[item:getId()]
	if instrument.chance then
		chance = instrument.chance >= math.random(1, 100)

		if instrument.monster and chance then
			local monster = Game.createMonster(instrument.monster, player:getPosition(), true)
			if monster then
				player:addSummon(monster)
			end
		elseif instrument.itemId and chance then
			player:addItem(instrument.itemId, instrument.itemCount)
		end
	end

	item:getPosition():sendMagicEffect(instrument.effect or instrument.effects and chance and instrument.effects.success or instrument.effects.failure)

	if instrument.transformId then
		player:say(instrument.text, TALKTYPE_MONSTER_SAY, false, nil, item:getPosition())
		item:transform(instrument.transformId)
		item:decay(instrument.decayId)
	end

	if not chance and instrument.remove then
		item:remove()
	end
	return true
end
