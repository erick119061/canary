local scrollsCraft = Action()

function capAll(str)
    return str:gsub("^(%a)", string.upper):gsub("([^%a]%a)", string.upper)
end
local config = {
    mainTitleMsg = "Scroll Table",
    mainMsg = "Welcome to the Scroll Table.\nPlease choose a category:",
 
    craftTitle = "Scroll Craft: ",
    craftMsg = "Click on Recipe to see the necessary items to craft a Scroll.\n\nHere is a list of all Scrolls available to craft. Scrolls are used to Learn how to craft an item or resources learning recipes: ",
    needItems = "You do not have all the required items to make ",
    system = {
    [1] = {tiers = "Job Scrolls",
            items = {
                [1] = {item = "Skinner's Scroll",
                        itemID = 6120,
                        reqItems = {
                                [1] = {item = 10100, count = 25}, -- 25 Large Chunk of Meat
                                [2] = {item = 10032, count = 25}, -- 25 Monster Pawn
                                [3] = {item = 2152, count = 50}, -- 50 Platinum Coins
                            },
                        },
                },
            },
            [2] = {tiers = "Equipments Scroll",
            items = {
                [1] = {item = "Rare Equipment Discovery Scroll",
                        itemID = 24334,
                        reqItems = {
                                [1] = {item = 42053, count = 1}, -- 1 Feather of fate
                                [2] = {item = 41995, count = 7}, -- 7 Dusts
                            },
                        },

                },
            },
            },
            }
 
function scrollsCraft.onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
        player:sendMainCraftWindow(config)
        return true
end
scrollsCraft:id(15389)
scrollsCraft:register()