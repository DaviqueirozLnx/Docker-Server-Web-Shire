local config = {
    maxTargets = 5,
    specRange = 4,

    combatType = COMBAT_DEATHDAMAGE,
    combatEffect = 92
}

local setmetatable = setmetatable
local contains = table.contains
local insert = table.insert
local sort = table.sort

---@class BounceSpell
---@field playerId integer
---@field targets integer[]
---@field currentTargetId integer
---@field lastTargetPos Position
local BounceSpell = {}

---@param creature Creature
---@param target Creature
---@return BounceSpell BounceSpell
local function getBounceSpell(creature, target)
    local bounceSpell = setmetatable({}, {__index = BounceSpell})
    bounceSpell.playerId = creature:getId()
    local targetId = target:getId()
    bounceSpell.targets = {targetId}
    bounceSpell.currentTargetId = targetId
    bounceSpell.lastTargetPos = creature:getPosition()
    return bounceSpell
end

---@param target Creature|Creature
---@return boolean
function BounceSpell:checkTarget(target)
    local creature = Creature(self.playerId)
    if not creature then return false end
    local targetPlayer = target:getPlayer()
    return not targetPlayer or
               (not targetPlayer:getGroup():getAccess() and
                   not self:isFriend(targetPlayer))
end

do
    local getSpectators = Game.getSpectators
    local x, y = config.specRange, config.specRange

    ---@param pos Position
    ---@return Creature[]
    function BounceSpell:getSpectators(pos)
        local spectators = getSpectators(pos, false, false, x, x, y, y)
        local spects = {}
        for _, spectator in ipairs(spectators) do
            local spectatorId = spectator:getId()
            if spectatorId ~= self.playerId and
                not Tile(spectator:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) and
                not contains(self.targets, spectatorId) and self:checkTarget(spectator) then
                insert(spects, spectator)
            end
        end
        return spects
    end
end

---@param target Creature
---@return boolean
function BounceSpell:isFriend(target)
    local creature = Creature(self.playerId)
    if not creature then return false end
    local party = creature:getParty()
    if not party then return false end

    local targetId = target:getId()
    if targetId == party:getLeader():getId() then return true end
    for _, member in ipairs(party:getMembers()) do
        if targetId == member:getId() then return true end
    end
    return false
end

---@param from Position
---@param to Position
---@return integer
local function getDistanceTo(from, to) return from:getDistance(to) end

---@param pos Position
---@return boolean
function BounceSpell:getTargets(pos)
    local spects = self:getSpectators(pos)
    if #spects > 1 then
        sort(spects, function(a, b)
            return getDistanceTo(pos, a:getPosition()) <
                       getDistanceTo(pos, b:getPosition())
        end)
    end

    local target = nil
    for _, spectator in ipairs(spects) do
        if pos:isSightClear(spectator:getPosition(), true) then
            target = spectator
            break
        end
    end

    if not target then return false end

    local targetId = target:getId()
    insert(self.targets, targetId)
    self.currentTargetId = targetId
    self.lastTargetPos = pos
    return true
end

local combats = {}

for divisor = 1, config.maxTargets do
    local combat = Combat()
    combat:setParameter(COMBAT_PARAM_TYPE, config.combatType)
    combat:setParameter(COMBAT_PARAM_EFFECT, config.combatEffect)

    ---@param creature Creature
    function onGetFormulaValues(creature, level, magicLevel)
        local min = (level * 4.3) + (magicLevel * 190) + 52
        local max = (level * 4.6) + (magicLevel * 280) + 79
        return -min / divisor, -max / divisor
    end

    combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

    combats[#combats + 1] = combat
end

---@return boolean
function BounceSpell:execute()
    local creature = Creature(self.playerId)


    local target = Creature(self.currentTargetId)
    if not target then return false end

    local combat = combats[#self.targets] or combats[#combats]
    if not combat then error("Bounce Spell: Invalid combat.") end

    local targetPos = target:getPosition()
    self.lastTargetPos:sendDistanceEffect(targetPos, 42)
    combat:execute(creature, Variant(targetPos))

    if #self.targets >= config.maxTargets then return false end

    self.currentTargetId = nil
    if self:getTargets(target:getPosition()) then
        addEvent(self.execute, 100 + (#self.targets * 10), self)
    end
    return true
end

local spell = Spell(SPELL_INSTANT)

function onCastSpell(creature, variant, isHotkey)
    local target = creature:getTarget()
    if not target then error("Bounce Spell: Invalid target.") end

    return getBounceSpell(creature, target):execute()
end
