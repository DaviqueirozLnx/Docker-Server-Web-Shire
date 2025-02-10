local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local voices = { {text = "Tools! Have a look!"} }
npcHandler:addModule(VoiceModule:new(voices))

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

keywordHandler:addKeyword({'stuff'}, StdModule.say, {npcHandler = npcHandler, text = 'Just ask me for a {trade} to see my offers.'})
keywordHandler:addAliasKeyword({'wares'})
keywordHandler:addAliasKeyword({'offer'})



local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

local function showOffers(player)
    npcHandler:say("aqui está alguns dos itens que eu vendo:rope, bag, backpack, bag e outros ", player)
end

	keywordHandler:addKeyword({'offer'}, showOffers)

	shopModule:addBuyableItem({'bag'}, 1987, 20, 'bag')
	shopModule:addBuyableItem({'backpack'}, 1988, 20, 'backpack')
	shopModule:addBuyableItem({'rope'}, 2120, 50, 'rope')
	shopModule:addBuyableItem({'scythe'}, 2550, 50, 'scythe')
	shopModule:addBuyableItem({'pick'}, 2553, 50, 'pick')
	shopModule:addBuyableItem({'shovel'}, 2554, 50, 'shovel')
	shopModule:addBuyableItem({'fishing rod'}, 2580, 100, 'fishing rod')
	shopModule:addSellableItem({'vial'}, 2006, 15, 'vial')


npcHandler:addModule(FocusModule:new())


local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

