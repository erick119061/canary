local config = {
    day = {"Monday", "Wednesday", "Friday", "Sunday"},
    pos = Position(32376, 32212, 7),
    topos = Position(32373, 32209, 7),
    _time = 5, -- tempo que o teleport ira sumir em minutos
    msg_open = "The Infected Boss Tower Portal is open, and will close in 5 minutes.",
    msg_close = "The Portal closed.",
    portal_id = 1949,
}
 
local function doRemoveTeleportEvent()
    local tile = Tile(config.pos)
    if tile then
        local portal = tile:getItemById(config.portal_id)
        if portal then
            portal:remove()
        end
    end
    Game.broadcastMessage(config.msg_close, MESSAGE_GAME_HIGHLIGHT) 
end
 
local function doCreateTeleportEvent()
    local tile = Tile(config.pos)
    if tile then
        local portal
        if tile:getItemById(config.portal_id) then
            portal = tile:getItemById(config.portal_id)
        else
            portal = Game.createItem(config.portal_id, 1, config.pos)
        end
        if portal then
            portal:setDestination(config.topos)
            addEvent(doRemoveTeleportEvent, config._time*60*1000)
        end
    end
end
 
local event_tp_by_day = GlobalEvent("event_tp_by_day")
function event_tp_by_day.onTime(interval)
    if isInArray(config.day, os.date("%A")) then
        doCreateTeleportEvent()
        Game.broadcastMessage(config.msg_open, MESSAGE_GAME_HIGHLIGHT) 
    end
    return true
end
event_tp_by_day:time("12:00:00")
event_tp_by_day:register()