local mType = Game.createMonsterType("frozen golem")
local monster = {}

monster.name = "Frozen Golem"
monster.description = "a frozen golem"
monster.experience = 250000000
monster.outfit = {
	lookType = 261,
	lookHead = 0,
	lookBody = 47,
	lookLegs = 105,
	lookFeet = 105,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 10000000
monster.maxHealth = 10000000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 7282
monster.speed = 788
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 98,
	targetDistance = 1,
	runHealth = 3500,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 2000,
	chance = 5,
	{text = "So you think you are cool?", yell = false},
	{text = "I hope it is not too cold for you! HeHeHe.", yell = false},
	{text = "Freeze!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 202, attack = 207},
	{name ="speed", interval = 1000, chance = 12, speed = {min = -1200, max = -1200}, duration = 30000, radius = 5, target = false, effect = CONST_ME_ENERGYHIT},
	{name ="combat", interval = 3000, chance = 55, type = COMBAT_LIFEDRAIN, minDamage = -1475, maxDamage = -11020, length = 5, spread = 3, effect = CONST_ME_ICEATTACK},
	{name ="combat", interval = 2500, chance = 42, type = COMBAT_PHYSICALDAMAGE, minDamage = -1080, maxDamage = -21385, range = 7, radius = 3, target = true, shootEffect = CONST_ANI_LARGEROCK},
	{name ="combat", interval = 2000, chance = 32, type = COMBAT_ICEDAMAGE, minDamage = -1315, maxDamage = -34150, range = 7, radius = 6, target = false, effect = CONST_ME_ICETORNADO},
	{name ="combat", interval = 2500, chance = 28, type = COMBAT_ICEDAMAGE, minDamage = -2710, maxDamage = -124125, range = 7, radius = 3, target = false, effect = CONST_ME_GIANTICE},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_MANADRAIN, minDamage = -1600, maxDamage = -23200, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 35,
	armor = 22,
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_HEALING, minDamage = 1025, maxDamage = 10880, effect = CONST_ME_MAGIC_BLUE}
}


monster.loot = {
	{name = "strike enhancement", chance = 2000, maxCount = 1},
	{name = "stamina extension", chance = 2000, maxCount = 1},
	{name = "charm upgrade", chance = 2000, maxCount = 1},
	{name = "wealth duplex", chance = 2000, maxCount = 1},
	{name = "bestiary betterment", chance = 2000, maxCount = 1},
	{name = "fire resilience", chance = 2000, maxCount = 1},
	{name = "ice resilience", chance = 2000, maxCount = 1},
	{name = "earth resilience", chance = 2000, maxCount = 1},
	{name = "energy resilience", chance = 2000, maxCount = 1},
	{name = "holy resilience", chance = 2000, maxCount = 1},
	{name = "death resilience", chance = 2000, maxCount = 1},
	{name = "physical resilience", chance = 2000, maxCount = 1},
	{name = "fire amplification", chance = 2000, maxCount = 1},
	{name = "ice amplification", chance = 2000, maxCount = 1},
	{name = "earth amplification", chance = 2000, maxCount = 1},
	{name = "energy amplification", chance = 2000, maxCount = 1},
	{name = "holy amplification", chance = 2000, maxCount = 1},
	{name = "death amplification", chance = 2000, maxCount = 1},
	{name = "physical amplification", chance = 2000, maxCount = 1},
	{name = "premium scroll", chance = 200, maxCount = 1},
	{name = "stamina refill", chance = 200, maxCount = 1},
	{name = "tibia coin", chance = 200, maxCount = 100},
		{id = 3116, chance = 9000}, -- big bone
	{id = 3027, chance = 15000, maxCount = 15}, -- black pearl
	{id = 3041, chance = 1500}, -- blue gem
	{id = 3079, chance = 4000}, -- boots of haste
	{id = 3076, chance = 2500}, -- crystal ball
	{id = 3008, chance = 1500}, -- crystal necklace
	{id = 3007, chance = 5500}, -- crystal ring
	{id = 3420, chance = 15500}, -- demon shield
	{id = 3356, chance = 11000}, -- devil helmet
	{id = 3275, chance = 20000}, -- double axe
	{id = 3322, chance = 4500}, -- dragon hammer
	{id = 3051, chance = 13500}, -- energy ring
	{id = 3320, chance = 17000}, -- fire axe
	{id = 3281, chance = 12500}, -- giant sword
	{id = 3031, chance = 99900, maxCount = 100}, -- gold coin
	{id = 3031, chance = 88800, maxCount = 100}, -- gold coin
	{id = 3031, chance = 77700, maxCount = 100}, -- gold coin
	{id = 3031, chance = 66600, maxCount = 100}, -- gold coin
	{id = 3063, chance = 8000}, -- gold ring
	{id = 3364, chance = 5000}, -- golden legs
	{id = 2903, chance = 7500}, -- golden mug
	{id = 3306, chance = 4500}, -- golden sickle
	{id = 3038, chance = 1500}, -- green gem
	{id = 3284, chance = 7500}, -- ice rapier
	{id = 3061, chance = 1000}, -- life crystal
	{id = 3046, chance = 11500}, -- magic light wand
	{id = 3366, chance = 3000}, -- magic plate armor
	{id = 3414, chance = 7500}, -- mastermind shield
	{id = 3048, chance = 5000}, -- might ring
	{id = 3062, chance = 4000}, -- mind stone
	{id = 3070, chance = 3500}, -- moonlight rod
	{id = 3060, chance = 12000}, -- orb
	{id = 43895, chance = 100000, unique = true}, -- bag you covet
	{id = 3055, chance = 4500}, -- platinum amulet
	{id = 3084, chance = 4500}, -- protection amulet
	{id = 2848, chance = 2600}, -- purple tome
	{id = 3098, chance = 13000}, -- ring of healing
	{id = 3006, chance = 3500}, -- ring of the sky
	{id = 3054, chance = 13000}, -- silver amulet
	{id = 3290, chance = 15500}, -- silver dagger
	{id = 3324, chance = 5000}, -- skull staff
	{id = 3033, chance = 13500, maxCount = 20}, -- small amethyst
	{id = 3028, chance = 9500, maxCount = 5}, -- small diamond
	{id = 3032, chance = 15500, maxCount = 10}, -- small emerald
	{id = 3029, chance = 13500, maxCount = 10}, -- small sapphire
		}

mType:register(monster)
