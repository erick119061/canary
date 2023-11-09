local coinsID = {
    22118,
}

local depositcoins = TalkAction("/deposit")

function depositcoins.onSay(player, words, param)

    local split = param:split(",")

    local itemType = ItemType(split[1])
    if itemType:getId() == 0 then
        itemType = ItemType(tonumber(split[1]))
        if not tonumber(split[1]) or itemType:getId() == 0 then
            player:sendCancelMessage("There is no item with that id or name.")
            return false
        end
    end

    if table.contains(coinsID, itemType:getId()) then

    local count = tonumber(split[2])
    if count then
        if itemType:isStackable() then
            count = math.min(10000, math.max(1, count))
        elseif not itemType:isFluidContainer() then
            count = math.min(100, math.max(1, count))
        else
            count = math.max(0, count)
        end
    else
        if not itemType:isFluidContainer() then
            count = 1
        else
            count = 0
        end
    end

    local result = player:removeItem(itemType:getId(), count)
    if result then
        if not itemType:isStackable() then
            if type(result) == "table" then
                for _, item in ipairs(result) do
                    item:decay()
                end
            else
                result:decay()
            end
        end
      db.query("UPDATE `accounts` SET `coins` = `coins` + '" .. count .. "' WHERE `id` = '" .. player:getAccountId() .. "';")
      player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received "..count.."  Tibia Coins")
      player:getPosition():sendMagicEffect(CONST_ME_PINK_FIREWORKS)
      else
      player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have "..count.." Tibia Coins enough to make the switch")
      player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end
    end
    return false
end

depositcoins:separator(" ")
depositcoins:groupType("normal")
depositcoins:register()

