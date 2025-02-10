local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onCastSpell(creature, variant)
    if getPlayerStorageValue(creature, 99) > os.time() then
        doPlayerSendCancel(creature, "Espere " .. getPlayerStorageValue(creature, 99) - os.time() .. " segundos para usar a Essência Vital novamente.")
        return false
    end
	
	addEvent(function()
        doPlayerSendTextMessage(creature, MESSAGE_STATUS_WARNING, "CD Pronto: Essência Vital.")
    end, 25000)

    -- Define o tempo de cooldown
    setPlayerStorageValue(creature, 99, os.time() + 25)

    -- Aumenta o limite máximo de vida
    local aumento = getCreatureMaxHealth(creature) * 1.5
    setCreatureMaxHealth(creature, aumento)

    -- Função para reverter o aumento do limite máximo de vida
    local function normallife(creatureId)
        if isCreature(creatureId) then
            setCreatureMaxHealth(creatureId, getCreatureMaxHealth(creatureId) / 1.5)
        end
    end

    -- Timer para a duração da magia
    addEvent(function()
        if isCreature(creature) then
            -- Checa se o jogador ainda está vivo e logado
            if getCreatureHealth(creature) > 0 and getPlayerStorageValue(creature, 100) == 1 then
                -- A magia termina normalmente
                doSendAnimatedText("Magia Terminada!", creature:getPosition(), TEXTCOLOR_LIGHTGREEN)
            else
                -- O jogador morreu ou deslogou, reverte o aumento
                normallife(creature:getId())
                doSendAnimatedText("Life Down!", creature:getPosition(), TEXTCOLOR_RED)
            end
        end
    end, 15000, creature:getId())

    doSendAnimatedText("Life Up!", creature:getPosition(), TEXTCOLOR_LIGHTGREEN)
    return combat:execute(creature, variant)
end