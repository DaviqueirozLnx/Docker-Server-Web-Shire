function onCastSpell(cid, var)
    local formula = {
        min = (5000),
        max = (5500),
    }

    local pos, creatures = getThingPos(cid), {}

    for x = pos.x - 7, pos.x + 7 do
        for y = pos.y - 5, pos.y + 5 do
            local v = getTopCreature({x=x, y=y, z=pos.z}).uid
            if isPlayer(v) or isMonster(v) and v ~= cid then
                if isSightClear(getThingPos(cid), getThingPos(v), false) then
                    table.insert(creatures, v)
                end
            end
        end
    end

    if #creatures > 0 then
        for _, c in ipairs(creatures) do
		local target = cid:getTarget()
		local cPos = target:getPosition()
            if isCreature(c) and cid:getPosition() ~= getCreaturePosition(c) then
			print(isCreature(c))
			doSendMagicEffect(getCreaturePosition(c), CONST_ME_ENERGYHIT)
            doSendDistanceShoot(pos, getCreaturePosition(c), CONST_ANI_ENERGY)
                doTargetCombatHealth(cid, c, COMBAT_ENERGYDAMAGE, - formula.min, - formula.max, CONST_ME_ENERGYHIT)
            end
        end
        return true
    end
                        doSendMagicEffect(getCreaturePosition(target), 3)
                    doSendDistanceEffect(getCreaturePosition(target), 3)
    doPlayerSendCancel(cid, 'There isn\'t monsters or players near you or any creature isn\'t sight clear.')
    return false
end