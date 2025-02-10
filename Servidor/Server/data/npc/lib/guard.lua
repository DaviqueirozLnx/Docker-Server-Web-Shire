-- @ Mehah and Gesior



function OTSYS_TIME()

	return os.clock()*1000

	end



	defender = {

	cid = 0,

	targetList = {},

	targetTime = OTSYS_TIME(),

	hitInterval = 1000,

	shootEffect = CONST_ANI_THROWINGSTAR,

	hitEffect = CONST_ME_HITAREA,

	typeDmg = COMBAT_PHYSICALDAMAGE,

	minDmg = -300, maxDmg = -1200,

	sayText = "",

	minHeal = 1, maxHeal = 10,

	hitSkulledPlayer = 1,

	multiAttack = 1,

	dmgRadiusX = 7,

	dmgRadiusY = 5,

	healRadiusX = 3,

	healRadiusY = 3,

	}



	function defender:new()

	local obj = {}

	setmetatable(obj, self)

	self.__index = self

	return obj

	end



	function defender:onThink(_cid)

	if self.cid == 0 then

	self.cid = _cid

	return

	end



	local _time = OTSYS_TIME()

	if (_time - self.targetTime) > self.hitInterval then

	self.targetTime = _time

	local position = getCreaturePosition(self.cid)

	local creature = {}

	local pos = {x = 0, y = 0, z = 0, stackpos = 0}

	if self.minDmg > 0 and self.maxDmg > 0 then

	self:clearTargetList()

	for x = -self.dmgRadiusX, self.dmgRadiusX do

	for y = -self.dmgRadiusY, self.dmgRadiusY do

	if not (x == 0 and y == 0) then

	pos = {x = position.x+x, y = position.y+y, z = position.z, stackpos = STACKPOS_TOP_CREATURE}

	creature = getTopCreature(pos)

	if (creature.type == 2) or (creature.type == 1 and self.hitSkulledPlayer == 1 and getPlayerSkullType(creature.uid) > 0) then

	if self.multiAttack ~= 1 and #self.targetList > 0 then

	break

	end

	self:addTarget(creature.uid)

	self:doSendDamage(creature.uid)

	end

	end

	end

	end

	if #self.targetList > 0 then

	if self.sayText ~= "" then

	doCreatureSay(self.cid, self.sayText, TALKTYPE_ORANGE_1)

	end

	end

	end



	if self.minHeal > 0 and self.maxHeal > 0 then

	self:clearTargetList()

	for x = -self.healRadiusX, self.healRadiusX do

	for y = -self.healRadiusY, self.healRadiusY do

	if not (x == 0 and y == 0) then

	pos = {x = position.x+x, y = position.y+y, z = position.z, stackpos = STACKPOS_TOP_CREATURE}

	creature = getTopCreature(pos)

	if (creature.type == 1) then

	self:doSendDamage(creature.uid)

	end

	end

	end

	end

	end

	end

	end



	function defender:doSendDamage(target)

	if isCreature(target) ~= nil and Creature(target):getSkull() >= 3 then

	local hitDmg = math.random(self.minDmg, self.maxDmg)

	if getCreatureHealth(target) <= hitDmg then

	doSetCreatureDropLoot(target, 0)

	end

	doSendDistanceShoot(getCreaturePosition(self.cid), getCreaturePosition(target), self.shootEffect)

	doTargetCombatHealth(self.cid, target, self.typeDmg, hitDmg, hitDmg, self.hitEffect)

	end

	end



	function defender:doHeal(target)

	doTargetCombatHealth(self.cid, target, COMBAT_HEALING, self.maxHeal, self.minHeal, CONST_ME_MAGIC_BLUE)

	end





	function defender:addTarget(_target)

	table.insert(self.targetList,_target)

	end



	function defender:clearTargetList()

	self.targetList = {}

	end



	function defender:setHitInterval(hitInterval)

	self.hitInterval = tonumber(hitInterval)

	end



	function defender:setShootEffect(shootEffect)

	self.shootEffect = shootEffect

	end



	function defender:setHitEffect(hitEffect)

	self.hitEffect = hitEffect

	end



	function defender:setTypeDmg(typeDmg)

	self.typeDmg = typeDmg

	end



	function defender:setSayText(sayText)

	self.sayText = tostring(sayText)

	end



	function defender:setDamage(minDmg,maxDmg)

	self.minDmg = tonumber(minDmg)

	self.maxDmg = tonumber(maxDmg)

	end



	function defender:setHeal(minHeal,maxHeal)

	self.minHeal = tonumber(minHeal)

	self.maxHeal = tonumber(maxHeal)

	end



	function defender:setHitSkulledPlayer(hitSkulledPlayer)

	self.hitSkulledPlayer = tonumber(hitSkulledPlayer)

	end



	function defender:setMultiAttack(multiAttack)

	self.multiAttack = tonumber(multiAttack)

	end



	function defender:setDmgRadius(dmgRadiusX,dmgRadiusY)

	self.dmgRadiusX = tonumber(dmgRadiusX)

	self.dmgRadiusY = tonumber(dmgRadiusY)

	end



	function defender:setHealRadius(healRadiusX,healRadiusY)

	self.healRadiusX = tonumber(healRadiusX)

	self.healRadiusY = tonumber(healRadiusY)

	end


