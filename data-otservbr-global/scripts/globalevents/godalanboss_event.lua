local config = {
    teleportId = 1949,
    days = {
        ["Friday"] = {Position(32343, 32226, 7), Position(31612, 32009, 7)},
    },
    bossPosition = Position(31612, 32006, 7),
    bossName     = 'God Alan',
    spawnTime    = '12:00:00'
}

local GodlalanRespawn = GlobalEvent("GodlalanRespawn")
function GodlalanRespawn.onTime(interval)
    local day = config.days[os.date("%A")]
    if day then
        local item = Game.createItem(config.teleportId, 1, day[1])
        if item then
            if not item:isTeleport() then
                item:remove()
                return false
            end
            item:setDestination(day[2])
        end
        addEvent(function()
            Game.createMonster(config.bossName, config.bossPosition, false, true)
            Game.broadcastMessage(config.bossName .. ' In revenge for my brother death, I will devastate this continent!', MESSAGE_GAME_HIGHLIGHT)
        end, 5000)
    end
    return true
end

GodlalanRespawn:time(config.spawnTime)
GodlalanRespawn:register()