local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local voices = { {text = "statue, chair, tables, outhers! Have a look!"} }
npcHandler:addModule(VoiceModule:new(voices))

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


-- Statues --
shopModule:addBuyableItem({'knight statue'},		 	1442, 5000,		'Knight Statue')
shopModule:addBuyableItem({'minotaur statue'},	 		1446, 5000, 	 	'Minotaur Statue')
shopModule:addBuyableItem({'goblin statue'},		 	1447, 5000,		'Goblin Statue')
-- Tables --
shopModule:addBuyableItem({'small table'},		 	3912, 1500,		'Small Table')
shopModule:addBuyableItem({'small round table'},	 	3911, 1500,		'Small Round Table')
shopModule:addBuyableItem({'stone table'},	 		3913, 2000, 	 	'Stone Table')
shopModule:addBuyableItem({'square table'},		 	3910, 2000,		'Square Table')
shopModule:addBuyableItem({'big table'},		 	3909, 2500,		'Big Table')
shopModule:addBuyableItem({'tusk table'},		 	3914, 2500,		'Tusk Table')
shopModule:addBuyableItem({'bamboo table'},		 	3919, 2500,		'Bamboo Table')
-- Chairs --
shopModule:addBuyableItem({'wooden chair'},		 	3901, 2500,		'Wooden Chair')
shopModule:addBuyableItem({'sofa chair'},		 	3902, 5000,		'Sofa Chair')
shopModule:addBuyableItem({'red cushioned chair'}, 		3903, 4000, 	 	'Red Cushioned Chair')
shopModule:addBuyableItem({'green cushioned chair'},	 	3904, 4000,		'Green Cushioned Chair')
shopModule:addBuyableItem({'tusk chair'},		 	3905, 3000,		'Tusk Chair')
shopModule:addBuyableItem({'ivory chair'},		 	3906, 3000,		'Ivory Chair')
shopModule:addBuyableItem({'tree stump'},		 	3907, 1500,		'Tree Stump')
-- other --
shopModule:addBuyableItem({'coal basin'},		 	3908, 4000,		'Coal Basin')
shopModule:addBuyableItem({'harp'},			 	3917, 4500,		'Harp')
shopModule:addBuyableItem({'bird cage'},		 	3918, 4500,		'Bird Cage')
shopModule:addBuyableItem({'thick trunk'},		 	3920, 1500,		'Thick Trunk')
shopModule:addBuyableItem({'drawers'},	 			3921, 4000,		'Drawers')
shopModule:addBuyableItem({'barrel'},			 	3923, 1500,		'Barrel')
shopModule:addBuyableItem({'piano'},			 	3926, 5000,		'Piano')
shopModule:addBuyableItem({'globe'},		 		3927, 2500,		'Globe')
shopModule:addBuyableItem({'potted flower'}, 			3928, 2500,		'Potted Flower')
shopModule:addBuyableItem({'indoor plant'},		 	3929, 2500,		'Indoor Plant')
shopModule:addBuyableItem({'christmas tree'},		 	3931, 3500,		'Christmas Tree')
shopModule:addBuyableItem({'dresser'},		 		3932, 2000,		'Dresser')
shopModule:addBuyableItem({'pendulum clock'},	 		3933, 4500,		'Pendulum Clock')
shopModule:addBuyableItem({'locker'},		 		3934, 3500,		'Locker')
shopModule:addBuyableItem({'trough'},		 		3935, 1500,		'Trough')
shopModule:addBuyableItem({'bookcase'},		 		3936, 4000,		'Bookcase')	
shopModule:addBuyableItem({'table lamp'},	 		3937, 2500,		'Table Lamp')
shopModule:addBuyableItem({'large trunk'},		 	3938, 3500,		'Large Trunk')	
-- Tapestries --
shopModule:addBuyableItem({'purple tapestry'},		 	1857, 2500,		'Purple Tapestry')
shopModule:addBuyableItem({'green tapestry'},		 	1860, 2500,		'Green Tapestry')
shopModule:addBuyableItem({'yellow tapestry'},		 	1863, 2500,		'Yellow Tapestry')
shopModule:addBuyableItem({'orange tapestry'},		 	1866, 2500,		'Orange Tapestry')
shopModule:addBuyableItem({'red tapestry'},		 	1869, 2500,		'Red Tapestry')
shopModule:addBuyableItem({'blue tapestry'},		 	1872, 2500,		'Blue Tapestry')
shopModule:addBuyableItem({'white tapestry'},		 	1880, 2500,		'White Tapestry')


npcHandler:addModule(FocusModule:new())
