local config = {
    actionId = 32147,
    delay = 60 * 60, -- 1 hour
    delayPersistent = false,
    bosses = {
        { name = "Rat", pos = Position(32368, 32165, 7) },
        { name = "Demon", pos = Position(32371, 32165, 7) },
    }
}

local movIn = MoveEvent()

function movIn.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end
    local playerId = player:getId()
    local ground = Tile(position):getGround()
    if ground then
        local now = os.time()
        local delay = config.delayPersistent and ground:getCustomAttribute("delay") or config.time
        if not delay or delay <= now then
            position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
            for _, info in pairs(config.bosses) do
                Game.createMonster(info.name, info.pos)
            end
            if not config.delayPersistent then
                config.time = now + config.delay
            else
                ground:setCustomAttribute("delay", now + config.delay)
            end
        else
            position:sendMagicEffect(CONST_ME_POFF)
            player:sendTextMessage(MESSAGE_STATUS_DEFAULT, string.format("You must wait %d seconds to summon the bosses again.", delay - now))
        end
    end
    return true
end

movIn:aid(config.actionId)
movIn:register()