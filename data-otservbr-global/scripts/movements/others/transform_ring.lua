local config = {
    outfit = 104,
    effect = 12, -- Effect on equip and deequip
    distanceeffect = 36, -- Distance effect on equip and deequip
    distanceeffectaura = 36, -- Distance effect aura
    -- animation means how fast the aura should go around the player so 500 = 0.5 sec, 1 sec = 1000
    animation = 500
}   

-- Do not change the ticks or sub ids if you don't know how to do that :D
local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, -1)
condition:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 120)
condition:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 120)
condition:setParameter(CONDITION_PARAM_SUBID, 1)

-- Do not change the ticks or sub ids if you don't know how to do that :D
local condition2 = Condition(CONDITION_OUTFIT)
condition2:setParameter(CONDITION_PARAM_TICKS, -1)
condition2:setOutfit({lookType = config.outfit})
condition2:setParameter(CONDITION_PARAM_SUBID, 1)

function RingAura(cid)
    local player = Player(cid)
    if player then
        local pos = player:getPosition()
        Position(pos.x, pos.y+1, pos.z):sendDistanceEffect(Position(pos.x-1, pos.y, pos.z), config.distanceeffectaura)       
        Position(pos.x-1, pos.y, pos.z):sendDistanceEffect(Position(pos.x, pos.y-1, pos.z), config.distanceeffectaura)
        Position(pos.x, pos.y-1, pos.z):sendDistanceEffect(Position(pos.x+1, pos.y, pos.z), config.distanceeffectaura)
        Position(pos.x+1, pos.y, pos.z):sendDistanceEffect(Position(pos.x, pos.y+1, pos.z), config.distanceeffectaura)
        effect = addEvent(RingAura, 1 * config.animation, cid)
    else
        effect = nil
    end
end

local transformRingEquip = MoveEvent()
function transformRingEquip.onEquip(player, item, slot, isCheck)
    if isCheck then
        return true
    end
    local pos = player:getPosition()
    player:addCondition(condition)
    player:addCondition(condition2)
    pos:sendMagicEffect(config.effect)
    player:say('ACTIVATED', TALKTYPE_MONSTER_SAY)
    Position(pos.x+1, pos.y+1, pos.z):sendDistanceEffect(pos, config.distanceeffect)
    Position(pos.x+1, pos.y-1, pos.z):sendDistanceEffect(pos, config.distanceeffect)
    Position(pos.x-1, pos.y-1, pos.z):sendDistanceEffect(pos, config.distanceeffect)
    Position(pos.x-1, pos.y+1, pos.z):sendDistanceEffect(pos, config.distanceeffect)
    effect = addEvent(RingAura, 1 * 1000, player:getId())
end

transformRingEquip:type("equip")
transformRingEquip:id(3063)
transformRingEquip:register()

local transformRingDeEquip = MoveEvent()
function transformRingDeEquip.onDeEquip(player, item, slot)
    local pos = player:getPosition()
    pos:sendMagicEffect(config.effect)
    pos:sendDistanceEffect(Position(pos.x+1, pos.y+1, pos.z), config.distanceeffect)
    pos:sendDistanceEffect(Position(pos.x+1, pos.y-1, pos.z), config.distanceeffect)
    pos:sendDistanceEffect(Position(pos.x-1, pos.y-1, pos.z), config.distanceeffect)
    pos:sendDistanceEffect(Position(pos.x-1, pos.y+1, pos.z), config.distanceeffect)
    player:say('DEACTIVATED', TALKTYPE_MONSTER_SAY)
    stopEvent(effect)
    player:removeCondition(CONDITION_ATTRIBUTES, condition, 1)
    player:removeCondition(CONDITION_OUTFIT, condition2, 1)
    return true
end

transformRingDeEquip:type("deequip")
transformRingDeEquip:id(3063)
transformRingDeEquip:register()