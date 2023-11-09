local mType = Game.createMonsterType("god alan")
local monster = {}

monster.name = "God Alan"
monster.description = "a god hero"
monster.experience = 500000000
monster.outfit = {
	lookType = 302,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 58000000
monster.maxHealth = 58000000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 18242
monster.speed = 980
monster.summonCost = 0

monster.changeTarget = {
	interval = 7200,
	chance = 90
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
	interval = 10000,
	chance = 50,
	{text = "I'm God Hero! Herosofwar Creator!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1200, chance = 100, minDamage = -7800, maxDamage = -9300},
	{name ="combat", interval = 2000, chance = 80, type = COMBAT_HOLYDAMAGE, minDamage = -9650, maxDamage = -15750, range = 7, radius = 5, target = true, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYDAMAGE},
	{name ="combat", interval = 2000, chance = 55, type = COMBAT_HOLYDAMAGE, minDamage = -6875, maxDamage = -11520, length = 5, spread = 3, effect = CONST_ME_HOLYAREA}
}

monster.defenses = {
	defense = 35,
	armor = 22,
	{name ="combat", interval = 1000, chance = 1, type = COMBAT_HEALING, minDamage = 5000, maxDamage = 10000, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 2
monster.summons = {
	{name = "Community Manager", chance = 75, interval = 5000, max = 2}
}

monster.loot = {
	{name = "falcon bow", chance = 450, maxCount = 1},
	{id = 6505, chance = 400}, -- falcon bag
	{name = "falcon circlet", chance = 450, maxCount = 1},
	{name = "falcon coif", chance = 450, maxCount = 1},
	{name = "falcon rod", chance = 450, maxCount = 1},
	{name = "falcon wand", chance = 450, maxCount = 1},
	{name = "falcon shield", chance = 200, maxCount = 1},
	{name = "falcon greaves", chance = 200, maxCount = 1},
	{name = "falcon plate", chance = 200, maxCount = 1},
	{name = "gold token", chance = 3000, maxCount = 14},
	{name = "silver token", chance = 3000, maxCount = 14},
	{name = "qumora arrow", chance = 200, maxCount = 1},
	{name = "qumora boots", chance = 200, maxCount = 1},
	{id = 34109, chance = 200, maxCount = 1},
	{id =  6510, chance = 200, maxCount = 1},
	{id = 6505, chance = 200, maxCount = 1},
	{id = 6509, chance = 200, maxCount = 1},
    {id = 39546, chance = 200, maxCount = 1},
	{name = "premium scroll", chance = 200, maxCount = 1},
	{name = "stamina refill", chance = 200, maxCount = 1},
	{name = "tibia coin", chance = 200, maxCount = 100},
	{name = "blue tome", chance = 20000},
	{name = "teddy bear", chance = 12500},
	{id = 3007, chance = 8333}, -- crystal ring
	{name = "white pearl", chance = 25000, maxCount = 15},
	{name = "black pearl", chance = 11111, maxCount = 14},
	{name = "small diamond", chance = 25000, maxCount = 5},
	{name = "small sapphire", chance = 25000, maxCount = 10},
	{name = "small emerald", chance = 25000, maxCount = 10},
	{name = "small amethyst", chance = 25000, maxCount = 17},
	{name = "talon", chance = 12500, maxCount = 7},
	{name = "platinum coin", chance = 100000, maxCount = 69},
	{name = "green gem", chance = 20000},
	{name = "blue gem", chance = 14285},
	{name = "might ring", chance = 12500},
	{id = 3049, chance = 12500}, -- stealth ring
	{name = "strange symbol", chance = 11111},
	{name = "life crystal", chance = 12500},
	{name = "mind stone", chance = 20000},
	{name = "gold ring", chance = 20000},
	{id = 3098, chance = 20000}, -- ring of healing
	{name = "twin axe", chance = 11111},
	{name = "golden armor", chance = 8333},
	{name = "magic plate armor", chance = 8333},
	{name = "demon shield", chance = 12500},
	{name = "golden boots", chance = 8333},
	{name = "demon horn", chance = 33333, maxCount = 2},
	{id = 6299, chance = 25000}, -- death ring
	{name = "demonic essence", chance = 100000},
	{name = "ruthless axe", chance = 14285},
	{name = "assassin star", chance = 12500, maxCount = 44},
	{name = "havoc blade", chance = 16666},
	{name = "ravenwing", chance = 14285},
	{name = "great mana potion", chance = 20000},
	{name = "great health potion", chance = 20000},
	{name = "glacier kilt", chance = 8333},
	{name = "great spirit potion", chance = 25000},
	{name = "ultimate health potion", chance = 25000},
	{name = "oceanborn leviathan armor", chance = 16666},
		}


mType:register(monster)
