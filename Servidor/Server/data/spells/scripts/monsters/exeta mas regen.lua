local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 40)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, 1, 0,10)

local condition = createConditionObject(CONDITION_REGEN)
setConditionParam(condition, CONDITION_PARAM_TICKS, 15000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, 10000)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 1)
addCombatCondition(combat, condition)

local function Cooldown(cid)
if isPlayer(cid) == TRUE then
doPlayerSendTextMessage(cid,MESSAGE_STATUS_WARNING,'CD: Exeta Mas Regen')
end
end

local exhausted_seconds = 40 -- Segundos que o Player Poderá castar a spell novamente
local exhausted_storagevalue = 6784 -- Storage Value do Cool Down

function onCastSpell(cid, var)
if(os.time() < getPlayerStorageValue(cid, exhausted_storagevalue)) then
doPlayerSendCancel(cid,'A Magia ainda não esta pronta, espere os segundos restantes.')
return TRUE
end
   	rand = math.random(1,1)
	if rand == 1 and isPlayer(cid) == 1 then
 	doPlayerSay(cid,"Exeta mas regen",16)
      addEvent(Cooldown, 1*40000,cid)
         setPlayerStorageValue(cid, exhausted_storagevalue, os.time() + exhausted_seconds)
	return doCombat(cid, combat, var)
	elseif rand == 2 and isPlayer(cid) == 1 then
 	doPlayerSay(cid,"Exeta mas regen!",16)
      addEvent(Cooldown, 1*40000,cid)
         setPlayerStorageValue(cid, exhausted_storagevalue, os.time() + exhausted_seconds)
	return doCombat(cid, combat, var)
else
      addEvent(Cooldown, 1*40000,cid)
         setPlayerStorageValue(cid, exhausted_storagevalue, os.time() + exhausted_seconds)
	return doCombat(cid, combat, var)
end
end