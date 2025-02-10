local dodgeStorage = 4500344
local config = {
 -- [itemid] -- Dodge must be a whole number out of 10000. | 1000 = 10.00% | 2 = 00.02% 
    [13557] = {dodgePercent = 3000, slot = "head"},
	[135579] = {dodgePercent = 3000, slot = "head"}		

}

-- Don't touch under here.

-- Equip ------------------------------------------------------------------------------
local dodgeOnEquip = MoveEvent()

function dodgeOnEquip.onEquip(player, item, slot, isCheck)
    if not isCheck then
        local itemId = item:getId()
        if config[itemId] then
            local newValue = player:getStorageValue(dodgeStorage) + config[itemId].dodgePercent
			print(newValue)
            player:setStorageValue(dodgeStorage, newValue)
        end
    end
    return true
end

for itemId, _ in pairs(config) do
    dodgeOnEquip:slot(config[itemId].slot)
    dodgeOnEquip:id(itemId)
end
dodgeOnEquip:register()

-- DeEquip ----------------------------------------------------------------------------
local dodgeOnDeEquip = MoveEvent()

function dodgeOnDeEquip.onDeEquip(player, item, slot, isCheck)
    if not isCheck then
        local itemId = item:getId()
        if config[itemId] then
			local newValue = player:getStorageValue(dodgeStorage) - config[itemId].dodgePercent
			print(newValue)
            player:setStorageValue(dodgeStorage, newValue)
        end
    end
    return true
end

for itemId, _ in pairs(config) do
    dodgeOnDeEquip:slot(config[itemId].slot)
    dodgeOnDeEquip:id(itemId)
end
dodgeOnDeEquip:register()

-- Health Change ----------------------------------------------------------------------
local dodgeHealthChange = CreatureEvent("onHealthChange_dodgeChance")

function dodgeHealthChange.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if not creature:isPlayer() then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    local storageValue = creature:getStorageValue(dodgeStorage)
    local rand = math.random(10000)
    if rand <= storageValue then
        primaryDamage = 0
        secondaryDamage = 0
 doSendAnimatedText("Dodge!", creature:getPosition(),TEXTCOLOR_PURPLE)
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

dodgeHealthChange:register()


-- Mana Change ------------------------------------------------------------------------
local dodgeManaChange = CreatureEvent("onManaChange_dodgeChance")

function dodgeManaChange.onManaChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if not creature:isPlayer() then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    local storageValue = creature:getStorageValue(dodgeStorage)
    local rand = math.random(10000)
    if rand <= storageValue then
        primaryDamage = 0
        secondaryDamage = 0
 doSendAnimatedText("Dodge!", creature:getPosition(),TEXTCOLOR_PURPLE)
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

dodgeManaChange:register()


-- Login ------------------------------------------------------------------------------
local function updateDodgeStorage(playerId)
    local player = Player(playerId)
    if player then
        local storageValue = 0
        local slotItem
        for i = 1, 10 do
            slotItem = player:getSlotItem(i)
            if slotItem then
                slotItem = slotItem:getId()
                if config[slotItem] then
                    storageValue = storageValue + config[slotItem].dodgePercent
                end
            end
        end        
        player:setStorageValue(dodgeStorage, storageValue)
    end
end

local loginEvent = CreatureEvent("onLogin_updateDodgeStorage")
loginEvent:type("login")

function loginEvent.onLogin(player)
    player:registerEvent("onHealthChange_dodgeChance")
    player:registerEvent("onManaChange_dodgeChance")
    addEvent(updateDodgeStorage, 100, player:getId()) -- slight delay, cuz of login jank
    return true
end

loginEvent:register()