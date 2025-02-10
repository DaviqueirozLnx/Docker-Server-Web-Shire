function onAttack(cid,target)

	if getPlayerStorageValue(cid, 29399) == 1 then

	doMonsterSetTarget(cid,false)

	doCreatureSetSkullType(cid,SKULL_NONE)

	doRemoveCondition(cid,CONDITION_INFIGHT)

	doPlayerSendCancel(cid,"Não é possível atacar com Attack Guild desligado!")
	doPlayerSendCancel(cid,RETURNVALUE_NOTPOSSIBLE)
		self:getPosition():sendMagicEffect(CONST_ME_POFF)
	end

	return true

	end
