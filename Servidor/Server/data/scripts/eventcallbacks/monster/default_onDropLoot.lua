local ec = EventCallback

local lootRate = {
    ["dragon"] = 1,
	["rat"] = 1,
	["cave rat"] = 1,
	["bear"] = 1,
    ["rotworm"] = 1,
	["dragon lord"] = 1,
	["juggernaut"] = 1,
	["jugger manticos"] = 1,
	["undead dragon"] = 1,
	["thul"] = 1,
	["the plasmother"] = 1,
	["son of verminor"] = 1,
	["primate"] = 1,
	["primate umbaca"] = 1,
	["primate savage"] = 1,
	["primate guard"] = 1,
	["primate geomancer"] = 1,
	["nomad"] = 1,
	["murphas"] = 1,
	["nightmare"] = 1,
	["mr. punish"] = 1,
	["mammoth"] = 1,
	["elephant"] = 1,
	["lupus wolf"] = 1,
	["icw witch"] = 1,
	["ice golem"] = 1,
	["hellhound"] = 1,
	["hellfire"] = 1,
	["hellfire fighter"] = 1,
	["fury"] = 1,
	["frost giant"] = 1,
	["frost dragon"] = 1,
	["dracula"] = 1,
	["dracola"] = 1,
	["diamond spider"] = 1,
	["spider"] = 1,
	["poison spider"] = 1,
	["diamond golem"] = 1,
	["destroyer"] = 1,
	["dark warlock"] = 1,
	["dark torturer"] = 1,
	["crystal spider"] = 1,
	["crystal golem"] = 1,
	["carrion worm"] = 1,
	["hydra"] = 1,
	["demon"] = 1,
	["zombie"] = 1,
	["warlock"] = 1,
	["bandit"] = 1,
	["assassin"] = 1,
	["dwarf"] = 1,
	["dwarf soldier"] = 1,
	["dwarf geomancer"] = 1,
	["amazon"] = 1,
	["apocalypse"] = 1,
	["orshabaal"] = 1,
	["chef bandit"] = 1,
	["cyclops"] = 1,
	["monk"] = 1,
	["dark monk"] = 1,
	["diabolic imp"] = 1,
	["skeleton"] = 1,
	["demon skeleton"] = 1,
	["elf"] = 1,
	["elf scout"] = 1,
	["elf arcanist"] = 1,
	["giant spider"] = 1,
	["hunter wolf"] = 1,
	["lich"] = 1,
	["lion"] = 1,
	["tiger"] = 1,
	["lizard templar"] = 1,
	["lizard snakecharmer"] = 1,
	["lizard sentinel"] = 1,
	["marid"] = 1,
	["merlkin"] = 1,
	["minotaur"] = 1,
	["minotaur archer"] = 1,
	["minotaur guard"] = 1,
	["minotaur mage"] = 1,
	["mummy"] = 1,
	["necromancer"] = 1,
	["scorpion"] = 1,
	["tarantula"] = 1,
	["vampire"] = 1,
	["witch"] = 1,
	["wild warrior"] = 1,
	["wolf"] = 1,
	["dworc venom spider"] = 1,
	["hunter"] = 1,
	["dharalion"] = 1,
	["banshee"] = 1,
	}

ec.onDropLoot = function(self, corpse)
    if configManager.getNumber(configKeys.RATE_LOOT) == 0 then
        return
    end

    local player = Player(corpse:getCorpseOwner())
    local mType = self:getType()
    local monsterName = mType:getName():lower()
    local customRate = 1

    if lootRate[monsterName] then
        customRate = lootRate[monsterName]
    end

    if not player or player:getStamina() > 840 then
        local monsterLoot = mType:getLoot()
        for i = 1, #monsterLoot do
            if monsterLoot[i].chance then
                monsterLoot[i].chance = math.min(monsterLoot[i].chance * customRate, MAX_LOOTCHANCE)
            end
        end

        for i = 1, #monsterLoot do
            local item = corpse:createLootItem(monsterLoot[i], self:getName())
            if not item then
                print('[Warning] DropLoot:', 'Could not add loot item to corpse.')
            end
        end

        local gold = 0
        if corpse:isContainer() then
            local container = Container(corpse:getUniqueId())
            if container then
                for slot = 0, container:getSize() - 1 do
                    local item = container:getItem(slot)
                end
            else
                print("[Warning] DropLoot:", "Container not found.")
            end
        end

        local text = ("Loot of %s: %s"):format(mType:getNameDescription(), corpse:getContentDescription())
        local party = player:getParty()
        if party then
            party:broadcastPartyLoot(text)
        else
			print("oi")
			player:sendTextMessage(MESSAGE_INFO_DESCR, text)
        end
    else
        local text = ("Loot of %s: nothing (due to low stamina)"):format(mType:getNameDescription())
        local party = player:getParty()
        if party then
            party:broadcastPartyLoot(text)
        else
            player:sendTextMessage(MESSAGE_INFO_DESCR, text)
        end
    end
end

ec:register()
