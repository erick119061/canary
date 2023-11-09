-- Credits:
-- Sarah Wesker  OTLand
-- adaptado e otimizado para Canary por NvSo

local config = {
    storage = 20000, --mude o armazenamento para um tem livre
    pointItemId = 8192, -- no momento é Crystal Coin
    pointsPerHour = 1,
    timeSeconds = 3600, -- 1 hour
    checkDuplicateIps = true,
    showLog = false -- Mostrar mensagem no console?
}

local onlinePointsEvent = GlobalEvent("GainPointPerHour")
local intervalShort = 30000
local intervalLong = 60000

function onlinePointsEvent.onThink(interval)
    local players = Game.getPlayers()
    local playerCount = #players

    if playerCount == 0 then
        onlinePointsEvent:interval(intervalLong)
        return true
    end

    local checkIp = {}
    local storage = config.storage
    local pointItemId = config.pointItemId
    local pointsPerHour = config.pointsPerHour
    local checkDuplicateIps = config.checkDuplicateIps
    local timeSeconds = config.timeSeconds
    local showLog = config.showLog

    local ipSet = {}
    for i, player in ipairs(players) do
        local ip = player:getIp()
        if ip ~= 0 and (not checkDuplicateIps or not ipSet[ip]) then
            ipSet[ip] = true
            local seconds = math.max(0, player:getStorageValue(storage))
            if seconds >= timeSeconds then
                player:setStorageValue(storage, 0)
                local item = player:addItem(pointItemId, pointsPerHour)
                if item then
                    player:sendTextMessage(MESSAGE_LOOT, string.format("You\234 it received %d {%d|%s} for being online for an hour.", pointsPerHour, pointItemId, item:getName()))
                    if showLog then
                        local playerName = player:getName()
                        Spdlog.info("Player Rewarded: " .. playerName .. " [Success]")
                    end
                end
            else
                player:setStorageValue(storage, seconds + math.ceil(interval / 1000))
            end
        end
    end

    onlinePointsEvent:interval(intervalShort)
    return true
end

onlinePointsEvent:interval(intervalShort)
onlinePointsEvent:register()
