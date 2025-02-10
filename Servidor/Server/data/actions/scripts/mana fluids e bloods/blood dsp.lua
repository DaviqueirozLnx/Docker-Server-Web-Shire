local function Blood3(player)
if isPlayer(player) ~= nil then
doPlayerSendTextMessage(player,MESSAGE_STATUS_WARNING,"Seu blood acabou.")
end
end

local function Blood2(player)
if isPlayer(player) ~= nil then
doCreatureAddHealth(player,(12*getCreatureMaxHealth(player)/100)+(skill*6)+(magic*2))
doCreatureAddMana(player,(12*getCreatureMaxMana(player)/100)+(skill*6)+(magic*2))
doSendMagicEffect(getCreaturePosition(player), 56)
end
end

local function Blood1(player)
if isPlayer(player) ~= nil then
doSendMagicEffect(getCreaturePosition(player), 56)
for i = 1, 14 do
addEvent(Blood2, i * 2000, player)
end
for i = 1, 1 do
addEvent(Blood3, 14 * 2000, player)
end
end
end

local function OldOutfit(player, oldOutfit)
if isPlayer(player) ~= nil then
doCreatureChangeOutfit(player,oldOutfit)
end
end

local Speed = createConditionObject(CONDITION_HASTE)
setConditionParam(Speed, CONDITION_PARAM_TICKS, 30000)
setConditionFormula(Speed, 0, 6000, 0, 6000)

local imortal = createConditionObject(CONDITION_IMMORTAL)
setConditionParam(imortal, CONDITION_PARAM_TICKS, 4000)

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
oldOutfit = getCreatureOutfit(player)
chronos = { lookType = 251,lookHead = getCreatureOutfit(player).lookHead, lookBody = getCreatureOutfit(player).lookBody, lookLegs = getCreatureOutfit(player).lookLegs, lookFeet = getCreatureOutfit(player).lookFeet, lookAddons = getCreatureOutfit(player).lookAddons } 
hazus = { lookType = 194,lookHead = getCreatureOutfit(player).lookHead, lookBody = getCreatureOutfit(player).lookBody, lookLegs = getCreatureOutfit(player).lookLegs, lookFeet = getCreatureOutfit(player).lookFeet, lookAddons = getCreatureOutfit(player).lookAddons } 
kazard = { lookType = 262,lookHead = getCreatureOutfit(player).lookHead, lookBody = getCreatureOutfit(player).lookBody, lookLegs = getCreatureOutfit(player).lookLegs, lookFeet = getCreatureOutfit(player).lookFeet, lookAddons = getCreatureOutfit(player).lookAddons } 
rei = { lookType = 266,lookHead = getCreatureOutfit(player).lookHead, lookBody = getCreatureOutfit(player).lookBody, lookLegs = getCreatureOutfit(player).lookLegs, lookFeet = getCreatureOutfit(player).lookFeet, lookAddons = getCreatureOutfit(player).lookAddons } 
skill = getPlayerSkill(player,0)
magic = getPlayerMagLevel(player)
Blood = math.random(1,4)

-- Exhausted Settings --
local exhausted_seconds = 30 -- Segundos que o blood vai demorar para usar denovo
local exhausted_storagevalue = 4850 -- Storage Value do exhausted

local exhausted_seconds2 = 1 -- How many seconds 
local exhausted_storagevalue2 = 9893 -- Storage Value 

local exhausted_seconds3 = 2 -- How many seconds 
local exhausted_storagevalue3 = 8162 -- Storage Value 

local exhausted_seconds4 = 1 -- How many seconds 
local exhausted_storagevalue4 = 6245 -- Storage Value 

local exhausted_seconds5 = 15 -- How many seconds 
local exhausted_storagevalue5 = 15555 -- Storage Value 

-- Exhausted Settings END --

if player:hasCondition(CONDITION_EXHAUSTED) then
doPlayerSendCancel(player, "You are exhausted to use blood of god's.")
return false
end


if getPlayerSoul(player) <= 49 then
doPlayerSendTextMessage(player,20,'Desculpe, você não tem Souls suficiente.')
return true
end

if(os.time() < getPlayerStorageValue(player, exhausted_storagevalue)) then
doPlayerSendTextMessage(player,20,'Você não pode usar um blood of gods durante o efeito de outro.')
return true
end

if(os.time() < getPlayerStorageValue(player, exhausted_storagevalue2)) then
 doPlayerSendCancel(player,"Você está muito cansado.")
return true
end

if(os.time() < getPlayerStorageValue(player, exhausted_storagevalue3)) then
doPlayerSendCancel(player,"Você está muito cansado.")
return true
end

if(os.time() < getPlayerStorageValue(player, exhausted_storagevalue4)) then
doPlayerSendCancel(player,"Você está esgotado.")
return true
end

if(os.time() < getPlayerStorageValue(player, exhausted_storagevalue5)) then
doPlayerSendCancel(player,"Você está muito cansado.")
return true
end

if Blood == 1 and (os.time() >= getPlayerStorageValue(player, exhausted_storagevalue)) and (os.time() >= getPlayerStorageValue(player, exhausted_storagevalue2)) and (os.time() >= getPlayerStorageValue(player, exhausted_storagevalue3)) and (os.time() >= getPlayerStorageValue(player, exhausted_storagevalue4)) then
doCreatureAddHealth(player,15*getCreatureMaxHealth(player)/100)
doCreatureAddMana(player,15*getCreatureMaxHealth(player)/100)
doSetCreatureOutfit(player, chronos, 30000)
player:getPosition():sendMagicEffect(60)
doPlayerSendTextMessage(player,20,"Você tomou o sangue dos deuses e se transformou em um Chronos.(Boost: regeneração ao uso da SD.)")
doCreatureSay(player, "Grr! Chronos voltou!", TALKTYPE_ORANGE_1)
addEvent(Blood1, 1*2000, player:getId())
addEvent(OldOutfit,1*25000,player,oldOutfit)
setPlayerStorageValue(player, exhausted_storagevalue, os.time() + exhausted_seconds)
doPlayerAddSoul(player,-50)
doRemoveItem(item.uid,1)

elseif Blood == 2 and (os.time() >= getPlayerStorageValue(player, exhausted_storagevalue)) and (os.time() >= getPlayerStorageValue(player, exhausted_storagevalue2)) and (os.time() >= getPlayerStorageValue(player, exhausted_storagevalue3)) and (os.time() >= getPlayerStorageValue(player, exhausted_storagevalue4)) then
doCreatureAddHealth(player,10*getCreatureMaxHealth(player)/100)
doCreatureAddMana(player,10*getCreatureMaxHealth(player)/100)
doSetCreatureOutfit(player, kazard, 30000)
doAddCondition(player, Speed)
player:getPosition():sendMagicEffect(60)
doPlayerSendTextMessage(player,20,"Você tomou o sangue dos deuses e se transformou em um Kazard. (Boost: super velocidade e silence ao uso da SD.)")
doCreatureSay(player, "Nhe hehe!", TALKTYPE_ORANGE_1)
addEvent(Blood1, 1*2000, player:getId())
addEvent(OldOutfit,1*25000,player,oldOutfit)
setPlayerStorageValue(player, exhausted_storagevalue, os.time() + exhausted_seconds)
doPlayerAddSoul(player,-50)
doRemoveItem(item.uid,1)

elseif Blood == 3 and (os.time() >= getPlayerStorageValue(player, exhausted_storagevalue)) and (os.time() >= getPlayerStorageValue(player, exhausted_storagevalue2)) and (os.time() >= getPlayerStorageValue(player, exhausted_storagevalue3)) and (os.time() >= getPlayerStorageValue(player, exhausted_storagevalue4)) then
doCreatureAddHealth(player,10*getCreatureMaxHealth(player)/100)
doCreatureAddMana(player,10*getCreatureMaxHealth(player)/100)
doSetCreatureOutfit(player, hazus, 30000)
player:getPosition():sendMagicEffect(60)
doPlayerSendTextMessage(player,20,"Você tomou o sangue dos deuses e se transformou em um Hazus. (Boost: reflexão ao uso da SD.)")
doCreatureSay(player, "Minhas mãos estão queimando!", TALKTYPE_ORANGE_1)
addEvent(Blood1, 1*2000, player:getId())
addEvent(OldOutfit,1*25000,player,oldOutfit)
setPlayerStorageValue(player, exhausted_storagevalue, os.time() + exhausted_seconds)
doPlayerAddSoul(player,-50)
doRemoveItem(item.uid,1)

elseif Blood == 4 and (os.time() >= getPlayerStorageValue(player, exhausted_storagevalue)) and (os.time() >= getPlayerStorageValue(player, exhausted_storagevalue2)) and (os.time() >= getPlayerStorageValue(player, exhausted_storagevalue3)) and (os.time() >= getPlayerStorageValue(player, exhausted_storagevalue4)) then
doCreatureAddHealth(player,10*getCreatureMaxHealth(player)/100)
doCreatureAddMana(player,10*getCreatureMaxHealth(player)/100)
doSetCreatureOutfit(player, rei, 4000)
doAddCondition(player, imortal)
player:getPosition():sendMagicEffect(60)
doPlayerSendTextMessage(player,20,"Você tomou o sangue dos deuses e se transformou no Rei. (Boost: imortalidade.)")
doCreatureSay(player, "Haha, o rei está no comando!", TALKTYPE_ORANGE_1)
addEvent(Blood1, 1*2000, player:getId())
addEvent(OldOutfit,1*3500,player,oldOutfit)
setPlayerStorageValue(player, exhausted_storagevalue, os.time() + exhausted_seconds)
doPlayerAddSoul(player,-50)
doRemoveItem(item.uid,1)
end
end
