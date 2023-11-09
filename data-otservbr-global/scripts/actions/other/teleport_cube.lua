local teleportScript = Action()

local cfg = {
    useEffect = true, -- display effect after item used? true = yes, false = no
    removeCharge = true, -- remove rune after using it? true = yes, false = no
    minLevel = 8, --level to use
    effect = CONST_ME_TELEPORT -- id or name of Effect
}

function teleportScript.onUse(player, item, fromPosition, target, toPosition, isHotkey)

    if player:getStorageValue(52346) >= os.time() then
        player:sendCancelMessage("You cant use it now")
        return true
    end

    if player:getLevel() < cfg.minLevel then
        player:say("You need " .. cfg.minLevel .. " level to use this item.", TALKTYPE_MONSTER_SAY)
        return true
    end

    if player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot teleport with pz.")
        return true
    end

    if cfg.useEffect then
        player:say("Teleported Home!", TALKTYPE_MONSTER_SAY)
        player:getPosition():sendMagicEffect(cfg.effect)
    end

    if cfg.removeCharge then
        item:remove(0)
    end
   
    player:teleportTo(player:getTown():getTemplePosition())
    player:setStorageValue(52346, os.time() + 10) -- 10 means 10 seconds
    return true
end

teleportScript:id(31633)
teleportScript:register()