local welcomeplayer = CreatureEvent("welcomeplayer")

-- Auto install tables if we dont got them yet (first install)
db.query([[
    CREATE TABLE IF NOT EXISTS `znote_global_storage` (
      `key` varchar(32) NOT NULL,
      `value` TEXT NOT NULL,
      UNIQUE (`key`)
    ) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;
]])

-- Determine if this is first time player logs in
local function isFirstLogin(player)
    local resultId = db.storeQuery("SELECT `value` FROM `znote_global_storage` WHERE `key`='1stLog_"..player:getAccountId().."' LIMIT 1;")
    if resultId ~= false then
        local time = result.getDataInt(resultId, "value")
        result.free(resultId)
        return false
    end
    return true
end

-- Broadcast a welcome MESSAGE_EVENT_ADVANCE message to every player online welcoming the new player
function welcomeplayer.onLogin(player)
    if isFirstLogin(player) then
        print("\nWelcome to our newest member ["..player:getName().."]!\n")
        db.query("INSERT INTO `znote_global_storage` (`key`,`value`) VALUES ('1stLog_"..player:getAccountId().."', '"..os.time().."');")
        local players = Game.getPlayers()
        local playerName = player:getName()
        for _, onlineplayer in ipairs(players) do
            onlineplayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Welcome to our newest member ["..playerName.."]!\nFeel free to use help channel for questions.")
        end
    end
    return true
end

welcomeplayer:register()