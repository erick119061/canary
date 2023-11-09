local mType = Game.createMonsterType("Dark Walkers")
local monster = {}

monster.description = "a Dark Walkers"
monster.experience = 67500
monster.outfit = {
	lookType = 567,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 31500
monster.maxHealth = 31500
monster.race = "blood"
monster.corpse = 18962
monster.speed = 120
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 200,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
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
	{text = "High Five!", yell = false},
	{text = "scrabble", yell = false},
	{text = "Put it there!", yell = false}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 137},
	{name = "platinum coin", chance = 24470},
	{name = "yellow gem", chance = 800},
	{name = "wand of inferno", chance = 5590},
	{name = "sudden death rune", chance = 7300},
	{name = "skull staff", chance = 130},
	{name = "mysterious voodoo skull", chance = 100},
	{id = 6299, chance = 800}, -- death ring
	{id = 3043, chance = 100000, maxCount = 2}, -- crystal coin
	{id = 34109, chance = 10}, -- bag you desire
	{id = 39546, chance = 10}, -- primal bag
	{name = "strong health potion", chance = 2260, maxCount = 2},
	{name = "strong mana potion", chance = 3600, maxCount = 2},
	{name = "unholy bone", chance = 9570},
	{name = "pile of grave earth", chance = 6650},
	{name = "safety pin", chance = 6000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -3720, condition = {type = CONDITION_POISON, totalDamage = 180, interval = 4000}},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -340, maxDamage = -3650, range = 1, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -475, maxDamage = -3800, range = 1, shootEffect = CONST_ANI_DEATH, target = false},
	{name ="drunk", interval = 2000, chance = 10, radius = 5, effect = CONST_ME_SMALLCLOUDS, target = false, duration = 4000}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="invisible", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 1100, maxDamage = 2250, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 15, speedChange = 420, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = -5},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = -5},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
