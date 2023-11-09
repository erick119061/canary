local waypointList = {
    [1] = {
        name = "Thais",
        actionId = 2000,
        position = Position(32310, 32208, 6),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 22118, amount = 1}
    },
    [2] = {
        name = "Ab'Dendriel",
        actionId = 2001,
        position = Position(32734, 31668, 6),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    },
    [3] = {
        name = "Carlin",
        actionId = 2002,
        position = Position(32386, 31820, 6),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    },
    [4] = {
        name = "Kazordoon",
        actionId = 2003,
        position = Position(32627, 31922, 11),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    },
    [5] = {
        name = "Venore",
        actionId = 2004,
        position = Position(32953, 32025, 6),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    },
    [6] = {
        name = "Ankrahmun",
        actionId = 2005,
        position = Position(33090, 32885, 6),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    },
    [7] = {
        name = "Edron",
        actionId = 2006,
        position = Position(33174, 31766, 6),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    },
    [8] = {
        name = "Farmine",
        actionId = 2007,
        position = Position(32981, 31540, 1),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    },
    [9] = {
        name = "Darashia",
        actionId = 2008,
        position = Position(33288, 32480, 6),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    },
    [10] = {
        name = "Liberty Bay",
        actionId = 2009,
        position = Position(32283, 32890, 6),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    },
    [11] = {
        name = "Port Hope",
        actionId = 2010,
        position = Position(32530, 32786, 6),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    },
    [12] = {
        name = "Svargrond",
        actionId = 2011,
        position = Position(32339, 31110, 6),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    },
    [13] = {
        name = "Yalahar",
        actionId = 2012,
        position = Position(32816, 31270, 6),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    },
    [14] = {
        name = "Gray Beach",
        actionId = 2013,
        position = Position(33190, 31983, 7),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    },
    [15] = {
        name = "Krailos",
        actionId = 2014,
        position = Position(33493, 31713, 6),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    },
    [16] = {
        name = "Rathleton",
        actionId = 2015,
        position = Position(33485, 31981, 7),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    },
    [17] = {
        name = "Roshamuul",
        actionId = 2016,
        position = Position(33493, 32566, 7),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    },
    [18] = {
        name = "Issavi",
        actionId = 2017,
        position = Position(33899, 31464, 6),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    },
    [19] = {
        name = "Boss Room",
        actionId = 2018,
        position = Position(33465, 32482, 9),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    },
    [20] = {
        name = "Cormaya",
        actionId = 2019,
        position = Position(33288, 31957, 6),
        requireQuest = {check = false, storage = 5000, value = 5000},
        cost = {check = false, itemId = 27920, amount = 1}
    }
}

local cooldowns = {}

local waypoints = MoveEvent()
function waypoints.onStepIn(player,item,position,fromPosition)
    if not player:isPlayer() then
        return false
    end
        if cooldowns[player:getName()] ~= nil then
            if cooldowns[player:getName()] > os.time() - 2 then
            player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need to wait ".. cooldowns[player:getName()] - (os.time() - 2) .."seconds before traveling again.")
                    return false
            end
        end
    local waypoint = false

    for i=1,#waypointList do
        if waypointList[i].actionId == item.actionid then
            waypoint = waypointList[i]
        end
    end

    if waypoint then
        if waypoint.requireQuest.Check then
            if player:getStorageValue(waypoint.requireQuest.storage) < waypoint.requireQuest.value then
                player:teleportTo(fromPosition)
                player:say("You have not completed the prerequisite quest to unlock waypoint to ".. waypoint.name ..".", TALKTYPE_MONSTER_SAY)
                return false
            end
        end
        if player:getStorageValue(waypoint.actionId) ~= 1 then
            player:setStorageValue(waypoint.actionId,1)
            player:say("You have unlocked waypoint to ".. waypoint.name ..".", TALKTYPE_MONSTER_SAY)
            return true
        end

        player:registerEvent("revWaypoints")
        local window = ModalWindow(5000, "Waypoints", "Waypoint: " .. waypoint.name .. "\n")

        local unlockedWps = 0

        for i=1,#waypointList do
            if player:getStorageValue(waypointList[i].actionId) == 1 then
                if waypointList[i].actionId ~= item.actionid then
                    unlockedWps = unlockedWps+1
                    window:addChoice(i, waypointList[i].name)
                end
            end
        end

        window:addButton(0,"Select")
        window:addButton(1,"Cancel")
        window:setDefaultEnterButton(0)
        window:setDefaultEscapeButton(1)
        if unlockedWps ~= 0 then
            window:sendToPlayer(player)
        end
      
        return true
    end
end

for j=1,#waypointList do
    waypoints:aid(waypointList[j].actionId)
end

waypoints:type("stepin")
waypoints:register()

local wpWindow = CreatureEvent("revWaypoints")
wpWindow:type("modalwindow")

function wpWindow.onModalWindow(player,modalWindowId,buttonId,choiceId)
    if modalWindowId == 5000 then
        if buttonId == 110 then
            local travel = true
            if waypointList[choiceId].cost.check then
                        if not player:removeItem(waypointList[choiceId].cost.itemId,waypointList[choiceId].cost.amount) then
                                    travel = false
                                    print("test")
                        end
            end
            if travel then
                cooldowns[player:getName()] = os.time()
                player:unregisterEvent("revWaypoints")
                player:teleportTo(waypointList[choiceId].position)
                player:getPosition():sendMagicEffect(15)
            else
                player:say("You cant afford to travel to ".. waypointList[choiceId].name ..".",TALKTYPE_MONSTER_SAY)
            end
          
            return true
        end
    end
end

wpWindow:register()