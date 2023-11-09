local config = {
-- Window Config
	mainTitleMsg = "Crafting System", -- Main window title
	mainMsg = "Welcome to the crafting system. Please choose a vocation to begin.", -- Main window message
 
	craftTitle = "Crafting System: ", -- Title of the crafting screen after player picks of vocation
	craftMsg = "Here is a list of all items that can be crafted for the ", -- Message on the crafting screen after player picks of vocation
-- End Window Config
 
-- Player Notifications Config
	needItems = "You do not have all the required items to make ", -- This is the message the player recieves if he does not have all required items
 
-- Crafting Config
	system = {
	[1] = {vocation = "Master Sorcerer", -- This is the category can be anything.
			items = {
				[1] = {item = "Sanguine Coil", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 43882, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 27457, count = 1}, -- Silver Tokens
								[2] = {item = 30399, count = 1}, -- Black Skull
								[3] = {item = 34090, count = 1}, -- Magic Sulphur
								[4] = {item = 34152, count = 1}, -- Shadow Orb
								[5] = {item = 28717, count = 1}, -- Cluster of Solace
								[6] = {item = 8192, count = 200}, -- Cluster of Solace
							},
						},
												[2] = {item = "Sanguine Galoshes", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 43887, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 34097, count = 1}, -- Cobra Wand
								[2] = {item = 3079, count = 1}, -- Soultainer
								[3] = {item = 6529, count = 1}, -- Lion Wand
								[4] = {item = 8192, count = 200}, -- Qumora Token
								[5] = {item = 22721, count = 200}, -- gold
								[6] = {item = 22516, count = 200}, -- silver
										},
						},
												[3] = {item = "Sanguine Greaves", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 43881, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 34093, count = 1}, -- Cobra Wand
								[2] = {item = 34092, count = 1}, -- Soultainer
								[3] = {item = 27649, count = 1}, -- Lion Wand
								[4] = {item = 8192, count = 200}, -- Qumora Token
								[5] = {item = 22721, count = 200}, -- gold
								[6] = {item = 22516, count = 200}, -- silver
										},
						}
				},
			},
 
	[2] = {vocation= "Elder Druid", 
			items = {
				[1] = {item = "Sanguine Rod",
						itemID = 43885,
						reqItems = {
								[1] = {item = 27458, count = 1}, -- Silver Tokens
								[2] = {item = 30400, count = 1}, -- Soul orb
								[3] = {item = 34151, count = 1}, -- Magic Sulphur
								[4] = {item = 28716, count = 1}, -- Diamond Sceptre
								[5] = {item = 34091, count = 1}, -- Cluster of Solace
								[6] = {item = 8192, count = 200}, -- Cluster of Solace
						},
					},
											[2] = {item = "Sanguine Galoshes", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 43887, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 34098, count = 1}, -- Cobra Wand
								[2] = {item = 3079, count = 1}, -- Soultainer
								[3] = {item = 6529, count = 1}, -- Lion Wand
								[4] = {item = 8192, count = 200}, -- Qumora Token
								[5] = {item = 22721, count = 200}, -- gold
								[6] = {item = 22516, count = 200}, -- silver
										},
						},
												[3] = {item = "Sanguine Greaves", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 43881, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 34093, count = 1}, -- Cobra Wand
								[2] = {item = 34098, count = 1}, -- Soultainer
								[3] = {item = 27649, count = 1}, -- Lion Wand
								[4] = {item = 8192, count = 200}, -- Qumora Token
								[5] = {item = 22721, count = 200}, -- gold
								[6] = {item = 22516, count = 200}, -- silver
										},
						},
				},
			},
 
		[3] = {vocation = "Royal Paladin", 
				items = {
					[1] = {item = "Sanguine Crossbow",
							itemID = 43879,
							reqItems = {
								[1] = {item = 27456, count = 1}, -- Silver Tokens
								[2] = {item = 30393, count = 1}, -- Crossbow
								[3] = {item = 34089, count = 1}, -- Magic Sulphur
								[4] = {item = 28718, count = 1}, -- Pulverized Ore
								[5] = {item = 34150, count = 1}, -- Cluster of Solace
								[6] = {item = 8192, count = 200}, -- Cluster of Solace
							},
						},
 
					[2] = {item = "Sanguine Bow",
							itemID = 43877,
							reqItems = {
								[1] = {item = 27455, count = 1}, -- Silver Tokens
								[2] = {item = 30393, count = 1}, -- Goosebump Leather
								[3] = {item = 34150, count = 1}, -- Steel Boots
								[4] = {item = 28718, count = 1},
								[5] = {item = 34088, count = 1},
								[6] = {item = 8192, count = 200}, -- Cluster of Solace
								
							},
						},
						
						[3] = {item = "Sanguine Boots", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 43884, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 3079, count = 1}, -- Cobra Wand
								[2] = {item = 6529, count = 1}, -- Soultainer
								[3] = {item = 34098, count = 1}, -- Lion Wand
								[4] = {item = 30394, count = 1}, -- Falon Wand
								[5] = {item = 8192, count = 200}, -- Qumora Token
								[6] = {item = 22721, count = 200}, -- gold
								[7] = {item = 22516, count = 200}, -- silver
										},
					
				},
										[4] = {item = "Sanguine Legs", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 43876, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 28720, count = 1}, -- Cobra Wand
								[2] = {item = 34092, count = 1}, -- Soultainer
								[3] = {item = 34094, count = 1}, -- Lion Wand
								[4] = {item = 8192, count = 200}, -- Qumora Token
								[5] = {item = 22721, count = 200}, -- gold
								[6] = {item = 22516, count = 200}, -- silver
										},
						},
					},
					
				},
 
		[4] = {vocation = "Elite Knight",
				items = {
					[1] = {item = "Sanguine Blade",
							itemID = 43864,
							reqItems = {
								[1] = {item = 27449, count = 1}, -- Silver Tokens
								[2] = {item = 30398, count = 1}, -- Sword
								[3] = {item = 34155, count = 1}, -- Piece of royal steel
								[4] = {item = 28723, count = 1}, -- Pulverized ore
								[5] = {item = 34082, count = 1}, -- Cluster of Solace
								[6] = {item = 8192, count = 200}, -- Cluster of Solace
							},
						},
 
 
					[2] = {item = "Sanguine Hatchet",
							itemID = 43868,
							reqItems = {
								[1] = {item = 27451, count = 1}, -- Silver Tokens
								[2] = {item = 30396, count = 1}, -- Boots of haste
								[3] = {item = 34253, count = 1}, -- piece of hell steel
								[4] = {item = 28724, count = 1}, -- piece of hell steel
								[5] = {item = 34084, count = 1}, -- piece of hell steel
								[6] = {item = 8192, count = 200}, -- Cluster of Solace
							},
						},
							[3] = {item = "Sanguine Cudgel",
							itemID = 43866,
							reqItems = {
								[1] = {item = 27453, count = 1}, -- Silver Tokens
								[2] = {item = 30395, count = 1}, -- Boots of haste
								[3] = {item = 34254, count = 1}, -- piece of hell steel
								[4] = {item = 28725, count = 1}, -- Boots of haste
								[5] = {item = 34087, count = 1}, -- piece of hell steel
								[6] = {item = 8192, count = 200}, -- Cluster of Solace
							},
						},
							[4] = {item = "Sanguine Battleaxe",
							itemID = 43874,
							reqItems = {
								[1] = {item = 27452, count = 1}, -- Silver Tokens
								[2] = {item = 30396, count = 1}, -- Boots of haste
								[3] = {item = 34253, count = 1}, -- piece of hell steel
								[4] = {item = 28724, count = 1}, -- Boots of haste
								[5] = {item = 34085, count = 1}, -- piece of hell steel
								[6] = {item = 8192, count = 200}, -- Cluster of Solace
							},
						},
						[5] = {item = "Sanguine Boots", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 43884, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 3079, count = 1}, -- Cobra Wand
								[2] = {item = 6529, count = 1}, -- Soultainer
								[3] = {item = 34097, count = 1}, -- Lion Wand
								[4] = {item = 30394, count = 1}, -- Falon Wand
								[5] = {item = 8192, count = 200}, -- Qumora Token
								[6] = {item = 22721, count = 200}, -- gold
								[7] = {item = 22516, count = 200}, -- silver
										},
						},
												[6] = {item = "Sanguine Legs", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 43876, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 28720, count = 1}, -- Cobra Wand
								[2] = {item = 34092, count = 1}, -- Soultainer
								[3] = {item = 34094, count = 1}, -- Lion Wand
								[4] = {item = 8192, count = 200}, -- Qumora Token
								[5] = {item = 22721, count = 200}, -- gold
								[6] = {item = 22516, count = 200}, -- silver
										},
						},
					},
				},
			},
		}
 
local simpleCraftingSystem = Action()
function simpleCraftingSystem.onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    player:sendMainCraftWindow(config)
    return true
end

simpleCraftingSystem:id(28189)
simpleCraftingSystem:register()