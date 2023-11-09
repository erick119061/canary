local mType = Game.createMonsterType("ghost demon summon")
local monster = {}

monster.name = "Ghost Demon "
monster.description = "a ghost demon"
monster.experience = 0
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 10000000
monster.maxHealth = 10000000
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
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	healthHidden = false,
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
	{name ="combat", interval = 1000, chance = 35, type = COMBAT_LIFEDRAIN, minDamage = -850, maxDamage = -1350, range = 1, radius = 1, target = true},
	{name ="combat", interval = 2000, chance = 55, type = COMBAT_DEATHDAMAGE, minDamage = -475, maxDamage = -1020, length = 5, spread = 3, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = -700, maxDamage = -1350, radius = 6, target = false, effect = CONST_ME_POFF},
	{name ="combat", interval = 1500, chance = 48, type = COMBAT_PHYSICALDAMAGE, minDamage = -350, maxDamage = -700, radius = 3, target = false, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 10,
	armor = 10
}

monster.loot = {
}

mType:register(monster)
