

local criticalDefaultChance = 5
local criticalDefaultDamage = 1.3

local weaponTypeToSkillType = {
    [WEAPON_SWORD] = function(p) return p:getEffectiveSkillLevel(SKILL_SWORD) end,
    [WEAPON_AXE] = function(p) return p:getEffectiveSkillLevel(SKILL_AXE) end,
    [WEAPON_CLUB] = function(p) return p:getEffectiveSkillLevel(SKILL_CLUB) end,
    [WEAPON_AMMO] = function(p) return p:getEffectiveSkillLevel(SKILL_DISTANCE) end,
    [WEAPON_DISTANCE] = function(p) return p:getEffectiveSkillLevel(SKILL_DISTANCE) end,
    [WEAPON_WAND] = function(p) return p:getMagicLevel() end
}

function getSkillByYouWeapon(player)
    local skillValue = 0
    local weapon = player:getSlotItem(CONST_SLOT_LEFT)
    if weapon and ItemType(weapon:getId()):getWeaponType() > 0 then
        skillValue = weaponTypeToSkillType[ItemType(weapon:getId()):getWeaponType()] and weaponTypeToSkillType[ItemType(weapon:getId()):getWeaponType()](player) or 0
    else
        weapon = player:getSlotItem(CONST_SLOT_RIGHT)
        if weapon and ItemType(weapon:getId()):getWeaponType() > 0 then
            skillValue = weaponTypeToSkillType[ItemType(weapon:getId()):getWeaponType()] and weaponTypeToSkillType[ItemType(weapon:getId()):getWeaponType()](player) or 0
        end
    end
    return skillValue
end

local function onChange(creature, attacker, damage, origin)

	-- if isPlayer(attacker) and getPlayerGuildId(creature) == getPlayerGuildId(attacker) then
	-- 	local p1 = Player(attacker)
	-- 	if(isPlayer(creature)) then
	-- 	local p2 = Player(creature)
	-- 	if(p2:getId() ~= p1:getId()) then
	-- 	doPlayerSendTextMessage(attacker, MESSAGE_STATUS_CONSOLE_BLUE, "Você não pode atacar membros da sua guild.")
	-- 	return false
	-- 	end
    --     end
	-- end



   -- local skill = getSkillByYouWeapon(attacker)
    -- if math.random(100 + skill) <= (criticalDefaultChance + (skill / 2)) then // update crit por skill
	

	
	local rand = math.random(1,5)
	local critDamage = damage * criticalDefaultDamage
    if rand == 1 then
		if origin == ORIGIN_MELEE then
            doSendAnimatedText("Critical!", attacker:getPosition(),TEXTCOLOR_RED)
			doCreatureAddHealth(attacker,(getCreatureMaxHealth(attacker)/10))
			creature:getPosition():sendMagicEffect(32)
			return critDamage
        elseif origin == ORIGIN_RANGED then
            doSendAnimatedText("Critical!", attacker:getPosition(),TEXTCOLOR_RED)
			doCreatureAddMana(attacker,(getCreatureMaxMana(attacker)/10))
			creature:getPosition():sendMagicEffect(32)
			return critDamage
        elseif attacker:hasCondition(CONDITION_CRITICAL) and origin == ORIGIN_RANGED then
			doSendAnimatedText("Critical!", attacker:getPosition(),TEXTCOLOR_RED)
			doCreatureAddMana(attacker,(getCreatureMaxMana(attacker)/10))
			creature:getPosition():sendMagicEffect(32)
		return critDamage
		end
	elseif getPlayerStorageValue(attacker, 123124) > os.time() then
	doCreatureAddMana(attacker,(getCreatureMaxMana(attacker)/10))
	return damage
		else
		return damage
	end
return damage
end



function onHealthChange(creature, attacker, pD, pT, sD, sT, origin)
    if isPlayer(attacker) then
        pD = onChange(creature, attacker, pD, origin)
    end
    return pD, pT, sD, sT
end

function onManaChange(creature, attacker, pD, pT, sD, sT, origin)
    if isPlayer(attacker) then
        pD = onChange(creature, attacker, pD, origin)
    end
    return pD, pT, sD, sT
end
