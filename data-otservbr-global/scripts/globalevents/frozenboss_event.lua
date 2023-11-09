local config = {
    teleportId = 1949,
    days = {
		["Wednesday"] = {Position(32343, 32226, 7), Position(31612, 32009, 7)},
    },
    bossPosition = Position(31612, 32006, 7),
    bossName     = 'Frozen Golem',
    spawnTime    = '12:00:00'
}

local FrozenRespawn = GlobalEvent("FrozenRespawn")
function FrozenRespawn.onTime(interval)
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

FrozenRespawn:time(config.spawnTime)
FrozenRespawn:register()