local mType = Game.createMonsterType("ghost demon")
local monster = {}

monster.name = "Ghost Demon"
monster.description = "a ghost demon"
monster.experience = 100000000
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 75000000
monster.maxHealth = 75000000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6068
monster.speed = 820
monster.summonCost = 100

monster.changeTarget = {
	interval = 5000,
	chance = 12
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
	interval = 5000,
	chance = 10,
	{text = "Revenge ... is so ... sweet!", yell = false},
	{text = "Life...force! Feed me your... lifeforce!", yell = false}
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
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1500, chance = 100, skill = 210, attack = 235},
	{name ="combat", interval = 1000, chance = 35, type = COMBAT_LIFEDRAIN, minDamage = -1850, maxDamage = -17350, range = 1, radius = 1, target = true},
	{name ="combat", interval = 2000, chance = 55, type = COMBAT_DEATHDAMAGE, minDamage = -1475, maxDamage = -11020, length = 5, spread = 3, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = -1700, maxDamage = -20350, radius = 6, target = false, effect = CONST_ME_POFF},
	{name ="combat", interval = 1500, chance = 48, type = COMBAT_PHYSICALDAMAGE, minDamage = -1350, maxDamage = -11500, radius = 3, target = false, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 10,
	armor = 10
}

monster.maxSummons = 1
monster.summons = {
	{name = "Ghost Demon Summon", chance = 50, interval = 1000, max = 1}
}

monster.loot = {
	{name = "lasting exercise wand", chance = 200, maxCount = 1},
	{name = "lasting exercise sword", chance = 200, maxCount = 1},
	{name = "lasting exercise rod", chance = 200, maxCount = 1},
	{name = "lasting exercise club", chance = 200, maxCount = 1},
	{name = "lasting exercise bow", chance = 200, maxCount = 1},
	{name = "lasting exercise axe", chance = 200, maxCount = 1},
	{name = "eye of the storm", chance = 200, maxCount = 1},
	{id = 18343, chance = 200, maxCount = 1},
	{name = "pair of soulstalkers", chance = 100, maxCount = 1},
	{name = "pair of soulwalkers", chance = 100, maxCount = 1},
	{name = "soulbastion", chance = 100, maxCount = 1},
	{name = "soulbiter", chance = 100, maxCount = 1},
	{name = "soulbleeder", chance = 100, maxCount = 1},
	{name = "soulcrusher", chance = 100, maxCount = 1},
	{name = "soulcutter", chance = 100, maxCount = 1},
	{name = "souleater", chance = 100, maxCount = 1},
	{name = "soulhexer", chance = 100, maxCount = 1},
	{name = "soulmaimer", chance = 100, maxCount = 1},
	{name = "soulmantle", chance = 100, maxCount = 1},
	{name = "soulpiercer", chance = 100, maxCount = 1},
	{name = "soulshanks", chance = 100, maxCount = 1},
	{name = "soulshell", chance = 100, maxCount = 1},
	{name = "soulshredder", chance = 100, maxCount = 1},
	{name = "soulshroud", chance = 100, maxCount = 1},
	{name = "soulstrider", chance = 100, maxCount = 1},
	{name = "soultainter", chance = 100, maxCount = 1},
		{ id = 3025, chance = 13500 }, -- Ancient amulet
	{ id = 3116, chance = 19000 }, -- big bone
	{ name = "black pearl", chance = 15000, maxCount = 35 },
	{ name = "boots of haste", chance = 14000 },
	{ id = 3076, chance = 22500 }, -- crystal ball
	{ name = "crystal necklace", chance = 21500 },
	{ id = 3007, chance = 15500 }, -- crystal ring
	{ name = "demon shield", chance = 15500 },
	{ name = "devil helmet", chance = 11000 },
	{ name = "dragon hammer", chance = 34500 },
	{ id = 3051, chance = 13500 }, -- Energy ring
	{ name = "fire axe", chance = 17000 },
	{ name = "giant sword", chance = 12500 },
	{ name = "platinum coin", chance = 69900, maxCount = 100 },
	{ name = "platinum coin", chance = 68800, maxCount = 100 },
	{ name = "crystal coin", chance = 47700, maxCount = 40 },
	{ name = "crystal coin", chance = 36600, maxCount = 15 },
	{ name = "gold ring", chance = 28000 },
	{ name = "golden legs", chance = 15000 },
	{ name = "giant ruby", chance = 31500 },
	{ name = "giant sapphire", chance = 31500 },
	{ name = "giant emerald", chance = 31500 },
	{ name = "ice rapier", chance = 27500 },
		}

mType:register(monster)
