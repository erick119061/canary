local checkPremium = MoveEvent()
function checkPremium.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end
    -- Check requirements
    if not player:isPremium() then
        player:say("Only Premium players are able to enter this boat.", TALKTYPE_MONSTER_SAY, false, player, fromPosition)
        player:teleportTo(fromPosition)
        fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
        return true
    end
    return true
end
checkPremium:position({x = 32314, y = 32214, z = 6}) -- essa será a posição que você vai colocar uma uniqueId no RME.
checkPremium:position({x = 32313, y = 32214, z = 6}) -- essa será a posição que você vai colocar uma uniqueId no RME.
checkPremium:position({x = 32312, y = 32214, z = 6}) -- essa será a posição que você vai colocar uma uniqueId no RME.
checkPremium:position({x = 32311, y = 32214, z = 6}) -- essa será a posição que você vai colocar uma uniqueId no RME.
checkPremium:position({x = 32310, y = 32214, z = 6}) -- essa será a posição que você vai colocar uma uniqueId no RME.
checkPremium:position({x = 32309, y = 32214, z = 6}) -- essa será a posição que você vai colocar uma uniqueId no RME.
checkPremium:position({x = 32308, y = 32214, z = 6}) -- essa será a posição que você vai colocar uma uniqueId no RME.
checkPremium:position({x = 32307, y = 32214, z = 6}) -- essa será a posição que você vai colocar uma uniqueId no RME.
checkPremium:register()