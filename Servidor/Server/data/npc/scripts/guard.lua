NpcSystem.parseParameters(npcHandler)



local guard = defender:new()



guard:setHitInterval(getNpcParameter("HitInterval"))

guard:setShootEffect(getNpcParameter("ShootEffect"))

guard:setHitEffect(getNpcParameter("HitEffect"))

guard:setTypeDmg(getNpcParameter("TypeDmg"))

guard:setDamage(getNpcParameter("minDamage"),getNpcParameter("maxDamage"))

guard:setSayText(getNpcParameter("sayText"))

guard:setHeal(getNpcParameter("minHeal"),getNpcParameter("maxHeal"))

guard:setHitSkulledPlayer(getNpcParameter("hitSkulledPlayer"))

guard:setMultiAttack(getNpcParameter("multiAttack"))

guard:setDmgRadius(getNpcParameter("dmgRadiusX"),getNpcParameter("dmgRadiusY"))

guard:setHealRadius(getNpcParameter("healRadiusX"),getNpcParameter("healRadiusY"))



function onThink()

guard:onThink(getNpcCid())


end
