local config = {
    actionId = 18563, -- on lever
    lever = {
        left = 2772,
        right = 2773
    },
    playItem = {
        itemId = 43732, -- item required to pull lever
        count = 1
    },
    rouletteOptions = {
        rareItemChance_broadcastThreshold = 500,
        ignoredItems = {1617}, -- if you have tables/counters/other items on the roulette tiles, add them here
        winEffects = {CONST_ANI_FIRE, CONST_ME_TUTORIALSQUARE, CONST_ME_TUTORIALSQUARE, CONST_ME_FIREWORK_RED, CONST_ME_FIREWORK_BLUE}, -- first effect needs to be distance effect
        effectDelay = 444,
        spinTime = {min = 6, max = 10}, -- seconds
        spinSlowdownRamping = 5,
        rouletteStorage = 48552 -- required storage to avoid player abuse (if they logout/die before roulette finishes.. they can spin again for free)
    },
    prizePool = {
        {itemId = 3043, count = {1, 100},   chance = 1200}, -- {itemId = itemid, count = {min, max}, chance = chance/100000} (crystal coins)
        {itemId = 653, count = {1, 1},    chance = 1000 }, -- costume bag
        {itemId = 21203, count = {1, 1},    chance = 1200 }, -- glooth bag
        {itemId = 37611, count = {1, 1},    chance = 1200 }, -- loot sell
        {itemId = 2991, count = {1, 2},   chance = 1300 }, -- doll
        {itemId = 19369, count = {1, 1}, chance = 100 }, -- eye of the storm
        {itemId = 34109, count = {1, 3},    chance = 1000 }, -- bag you desire
		{itemId = 6509, count = {1, 1},    chance = 1200 }, -- christmas present bag
		{itemId = 6510, count = {1, 1},    chance = 1200 }, -- christmas present bag
		{itemId = 6505, count = {1, 1},    chance = 1200 }, -- falcon bag
        {itemId = 39546, count = {1, 1},    chance = 1000 }, -- primal bag
        {itemId = 43895, count = {1, 1},    chance = 50 }, -- bag you covet
        {itemId = 3555, count = {1, 1},    chance = 100  },  -- golden boots
	    {itemId = 43886, count = {1, 1},    chance = 10  },  -- grand sanguine rod
		{itemId = 43880, count = {1, 1},    chance = 40  },  -- grand sanguine crossbow
		{itemId = 43865, count = {1, 1},    chance = 40  },  -- grand sanguine blade
		{itemId = 43878, count = {1, 1},    chance = 40  },  -- grand sanguine bow
		{itemId = 43883, count = {1, 1},    chance = 40  },  -- grand sanguine coil
		{itemId = 43869, count = {1, 1},    chance = 40  },  -- grand sanguine hatchet
		{itemId = 43867, count = {1, 1},    chance = 40  }  -- grand sanguine cudgel
    
    },
    roulettePositions = { -- hard-coded to 7 positions.
        Position(31930, 32042, 5),
        Position(31931, 32042, 5),
        Position(31932, 32042, 5),
        Position(31933, 32042, 5),
        Position(31934, 32042, 5), -- position 4 in this list is hard-coded to be the reward location, which is the item given to the player
        Position(31935, 32042, 5),
        Position(31936, 32042, 5),
        Position(31937, 32042, 5),
        Position(31938, 32042, 5),
    }
}

local chancedItems = {} -- used for broadcast. don't edit

local function resetLever(position)
    local lever = Tile(position):getItemById(config.lever.right)
    lever:transform(config.lever.left)
end

local function updateRoulette(newItemInfo)
    local positions = config.roulettePositions
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            if i ~= 9 then
                item:moveTo(positions[i + 1])
            else
                item:remove()
            end
        end
    end
    if ItemType(newItemInfo.itemId):getCharges() then
        local item = Game.createItem(newItemInfo.itemId, 1, positions[1])
        item:setAttribute("charges", newItemInfo.count)
    else
        Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[1])
    end
end

local function clearRoulette(newItemInfo)
    local positions = config.roulettePositions
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            item:remove()
        end
        if newItemInfo == nil then
            positions[i]:sendMagicEffect(244)
        else
            if ItemType(newItemInfo.itemId):getCharges() then
                local item = Game.createItem(newItemInfo.itemId, 1, positions[i])
                item:setAttribute("charges", newItemInfo.count)
            else
                Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[i])
            end
        end
    end
end

local function chanceNewReward()
    local newItemInfo = {itemId = 0, count = 0}
    
    local rewardTable = {}
    while #rewardTable < 1 do
        for i = 1, #config.prizePool do
            if config.prizePool[i].chance >= math.random(10000) then
                rewardTable[#rewardTable + 1] = i
            end
        end
    end
    
    local rand = math.random(#rewardTable)
    newItemInfo.itemId = config.prizePool[rewardTable[rand]].itemId
    newItemInfo.count = math.random(config.prizePool[rewardTable[rand]].count[1], config.prizePool[rewardTable[rand]].count[2])
    chancedItems[#chancedItems + 1] = config.prizePool[rewardTable[rand]].chance
    
    return newItemInfo
end

local function initiateReward(leverPosition, effectCounter)
    if effectCounter < #config.rouletteOptions.winEffects then
        effectCounter = effectCounter + 1
        if effectCounter == 1 then
            config.roulettePositions[1]:sendDistanceEffect(config.roulettePositions[5], config.rouletteOptions.winEffects[1])
            config.roulettePositions[9]:sendDistanceEffect(config.roulettePositions[5], config.rouletteOptions.winEffects[1])
        else
            for i = 1, #config.roulettePositions do
                config.roulettePositions[i]:sendMagicEffect(config.rouletteOptions.winEffects[effectCounter])
            end
        end
        if effectCounter == 2 then
            local item = Tile(config.roulettePositions[5]):getTopVisibleThing()
            local newItemInfo = {itemId = item:getId(), count = item:getCount()}
            clearRoulette(newItemInfo)
        end
        addEvent(initiateReward, config.rouletteOptions.effectDelay, leverPosition, effectCounter)
        return
    end
    resetLever(leverPosition)
end

local function rewardPlayer(playerId, leverPosition)
    local player = Player(playerId)
    if not player then
        return
    end
    
    local item = Tile(config.roulettePositions[5]):getTopVisibleThing()
    
    if ItemType(item:getId()):getCharges() then
        local addedItem = player:addItem(item:getId(), 1, true)
        addedItem:setAttribute("charges", item:getCharges())
    else
        player:addItem(item:getId(), item:getCount(), true)
    end

    player:setStorageValue(config.rouletteOptions.rouletteStorage, -1)
    if chancedItems[#chancedItems - 3] <= config.rouletteOptions.rareItemChance_broadcastThreshold then
        Game.broadcastMessage("The player " .. player:getName() .. " has won " .. item:getName() .. " from the roulette!", MESSAGE_EVENT_ADVANCE)
    end
end

local function roulette(playerId, leverPosition, spinTimeRemaining, spinDelay)
    local player = Player(playerId)
    if not player then
        resetLever(leverPosition)
        return
    end
    
    local newItemInfo = chanceNewReward()
    updateRoulette(newItemInfo)
    
    if spinTimeRemaining > 0 then
        spinDelay = spinDelay + config.rouletteOptions.spinSlowdownRamping
        addEvent(roulette, spinDelay, playerId, leverPosition, spinTimeRemaining - (spinDelay - config.rouletteOptions.spinSlowdownRamping), spinDelay)
        return
    end
    
    initiateReward(leverPosition, 0)
    rewardPlayer(playerId, leverPosition)
end

local casinoRoulette = Action()

function casinoRoulette.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item:getId() == config.lever.right then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Casino Roulette is currently in progress. Please wait.")
        return true
    end
    
    if player:getItemCount(config.playItem.itemId) < config.playItem.count then
        if player:getStorageValue(config.rouletteOptions.rouletteStorage) < 1 then
            player:sendTextMessage(MESSAGE_STATUS_SMALL, "Casino Roulette requires " .. config.playItem.count .. " " .. (ItemType(config.playItem.itemId):getName()) .. " to use.")
            return true
        end
        -- player:sendTextMessage(MESSAGE_STATUS_SMALL, "Free Spin being used due to a previous unforeseen error.")
    end
    
    item:transform(config.lever.right)
    clearRoulette()
    chancedItems = {}
    
    player:removeItem(config.playItem.itemId, config.playItem.count)
    player:setStorageValue(config.rouletteOptions.rouletteStorage, 1)
    
    local spinTimeRemaining = math.random((config.rouletteOptions.spinTime.min * 1000), (config.rouletteOptions.spinTime.max * 1000))
    roulette(player:getId(), toPosition, spinTimeRemaining, 100)
    return true
end

casinoRoulette:aid(config.actionId)
casinoRoulette:register()


local disableMovingItemsToRoulettePositions = MoveEvent()

disableMovingItemsToRoulettePositions.onAddItem = function(moveitem, tileitem, position, item, count, fromPosition, toPosition)
    for v, k in pairs(config.roulettePositions) do
        if toPosition == k then
            return false
        end
    end
    return true
end

disableMovingItemsToRoulettePositions:position(config.roulettePositions)
disableMovingItemsToRoulettePositions:register()