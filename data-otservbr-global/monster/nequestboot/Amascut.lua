local mType = Game.createMonsterType("Amascut")
local monster = {}

monster.description = "a Amascut"
monster.experience = 9000
monster.outfit = {
	lookType = 268,
	lookHead = 10,
	lookBody = 40,
	lookLegs = 50,
	lookFeet = 101,
	lookAddons = 0,
	lookMount = 406,
}

monster.bosstiary = {
	bossRaceId = 303,
	bossRace = RARITY_NEMESIS,
}

monster.health = 22000
monster.maxHealth = 22000
monster.race = "undead"
monster.corpse = 6330
monster.speed = 235
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5,
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 50,
	targetDistance = 1,
	runHealth = 2000,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "I kept my axe sharp, especially for you!", yell = false },
	{ text = "Time for a little torturing practice!", yell = false },
	{ text = "Scream for me!", yell = false },
}

monster.loot = {
	{ id = 6537, chance = 100000 }, -- mr. punish's handcuffs
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -4660, maxDamage = -12280 },
}

monster.defenses = {
	defense = 72,
	armor = 64,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
