-- original credits Simple Task 4.0 (tfs 0.4): Vodkart & Demonbholder

local creatureEvent = CreatureEvent("Task")

function creatureEvent.onLogin(player)
    player:registerEvent("killtasks")
    return true
end

creatureEvent:register()




local talkAction = TalkAction("!task")

function talkAction.onSay(player, words, param, type)
param,task,daily = param:lower(), player:getTaskMission(), player:getDailyTaskMission()
if isInArray({"counter","contador"},param) then
    print("counter")
    player:setStorageValue(task_sys_storages[8], player:getStorageValue(task_sys_storages[8]) <= 0 and 1 or 0)
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,"[Task System] The counter was "..(player:getStorageValue(task_sys_storages[8]) <= 0 and "ativado" or "desativado")..".") return true
elseif isInArray({"daily","diaria"},param) then
    print("daily")
    if not daily_task[daily] or player:getStorageValue(task_sys_storages[7]) <= 0 then
        player:sendCancelMessage("Sorry, but you're not on any Daily Task.") return true
    elseif player:getStorageValue(task_sys_storages[6]) - os.time() <= 0 and player:getStorageValue(task_sys_storages[5]) < daily_task[daily].count then
        player:showTextDialog("Sorry, but you didn't finish the Daily Task in time! Please go back to npc and start a new Daily Task!") return true
    end
    return player:showTextDialog(1953, "[->] CURRENT DAILY TASK INFO [<-]\n\nNome: "..daily_task[daily].name.."\nProgreso: ["..(player:getStorageValue(task_sys_storages[5]) < 0 and 0 or player:getStorageValue(task_sys_storages[5])).."/"..daily_task[daily].count.."]\nPlazo de entrega: "..os.date("%d %B %Y %X ", player:getStorageValue(task_sys_storages[6])).."\nMonsters to hunt:: "..getMonsterFromList(daily_task[daily].monsters_list).."\n\n[->] CURRENT TASK REWARDS [<-]\n\nMoney: "..(daily_task[daily].money > 0 and daily_task[daily].money or 0).."\nExperiencia: "..(daily_task[daily].exp > 0 and daily_task[daily].exp or 0).."\nTask Points: "..daily_task[daily].points.."\nItems: "..(#daily_task[daily].reward > 0 and getItemsFromList(daily_task[daily].reward) or "Nenhum item de recompensa")..".")
end
if not task_sys[task] or player:getStorageValue(task_sys[task].start) <= 0 then
    player:sendCancelMessage("you are not in any task.") return true
end
return player:showTextDialog(1953, "-> CURRENT TASK ["..player:getTaskMission().."/"..#task_sys.."] <-\n\nTask Name: "..task_sys[task].name.."\nTask Level: "..task_sys[task].level.."\nTask Progress: ["..(player:getStorageValue(task_sys_storages[3]) < 0 and 0 or player:getStorageValue(task_sys_storages[3])).."/"..task_sys[task].count.."]\nMonster To Hunt: "..getMonsterFromList(task_sys[task].monsters_list)..".\nItens Para Entrega: "..(#task_sys[task].items > 0 and getItemsFromList(task_sys[task].items) or "Nenhum")..".\n\n[->] CURRENT TASK REWARDS [<-]\n\nReward Money: "..(task_sys[task].money > 0 and task_sys[task].money or 0).."\nReward Experiencia: "..(task_sys[task].exp > 0 and task_sys[task].exp or 0).."\nReward Points: "..task_sys[task].points.."\nRedward Items: "..(#task_sys[task].reward > 0 and getItemsFromList(task_sys[task].reward) or "no reward items")..".")
end

--talkAction:accountType(ACCOUNT_TYPE_GOD)
--talkAction:access(true)
talkAction:separator(" ")
talkAction:register()


local creatureEvent = CreatureEvent("killtasks")

function creatureEvent.onKill(creature, target)
if creature:isPlayer() and target:isMonster() then

        local t,daily = task_sys[creature:getTaskMission()], daily_task[creature:getDailyTaskMission()]

        if t and creature:getStorageValue(t.start) > 0 and isInArray(t.monsters_list, target:getName()) and creature:getStorageValue(task_sys_storages[3]) < t.count then

            creature:setStorageValue(task_sys_storages[3], creature:getStorageValue(task_sys_storages[3]) < 0 and 1 or (creature:getStorageValue(task_sys_storages[3])+1))
            if creature:getStorageValue(task_sys_storages[8]) <= 0 and creature:getStorageValue(task_sys_storages[3]) < t.count then
                 creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE,"[Sistema de Tarefas] derrotou Total [" .. creature:getStorageValue(task_sys_storages[3]) .. "/" .. t.count .. " ] da Tarefa de " .. t.name .. ".")
            end
            if creature:getStorageValue(task_sys_storages[3]) >= t.count then
                 creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE,"[Task System] Felicidades! You finished the Task of "..t.name..", go back to npc seems to get your reward.")
            end
        end
        if daily and creature:getStorageValue(task_sys_storages[7]) > 0 and creature:getStorageValue(task_sys_storages[6]) - os.time() >= 0 and isInArray(daily.monsters_list, target:getName()) and creature:getStorageValue(task_sys_storages[5]) < daily.count then
            creature:setStorageValue(task_sys_storages[5], creature:getStorageValue(task_sys_storages[5]) < 0 and 1 or (creature:getStorageValue(task_sys_storages[5])+1))
            if creature:getStorageValue(task_sys_storages[8]) <= 0 and creature:getStorageValue(task_sys_storages[5]) < daily.count then
                 creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,"[Daily Task System] defeated Total [" .. creature:getStorageValue(task_sys_storages[5]) .. "/" .. daily.count .. "] of the Task of " .. daily.name .. ".")
            end
            if creature:getStorageValue(task_sys_storages[5]) >= daily.count then
                 creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE,"[Daily Task System] Felicidades! You finished the Task of "..daily.name..", go back to npc seems to get your reward.")
            end
        end
    end
    return true
end

creatureEvent:register()
