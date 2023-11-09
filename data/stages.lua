-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 8,
		multiplier = 2000
	}, {
		minlevel = 9,
		maxlevel = 50,
		multiplier = 1900
	}, {
		minlevel = 51,
		maxlevel = 150,
		multiplier = 1800
	}, {
		minlevel = 151,
		maxlevel = 200,
		multiplier = 1600
	}, {
		minlevel = 201,
		maxlevel = 350,
		multiplier = 1400
	}, {
		minlevel = 351,
		maxlevel = 500,
		multiplier = 1000
	}, {
		minlevel = 501,
		maxlevel = 600,
		multiplier = 800
	}, {
		minlevel = 601,
		maxlevel = 700,
		multiplier = 600
	}, {
		minlevel = 701,
		maxlevel = 800,
		multiplier = 400
	}, {
		minlevel = 801,
		maxlevel = 900,
		multiplier = 200
	}, {
		minlevel = 901,
		maxlevel = 1100,
		multiplier = 100
	}, {
		minlevel = 1101,
		maxlevel = 1500,
		multiplier = 80
	}, {
		minlevel = 1501,
		maxlevel = 2500,
		multiplier = 50
	}, {
		minlevel = 2501,
		maxlevel = 2700,
		multiplier = 25
	}, {
		minlevel = 2701,
		maxlevel = 3000,
		multiplier = 15
	}, {
		minlevel = 3001,
		maxlevel = 3500,
		multiplier = 10
	}, {
		minlevel = 3501,
		multiplier = 5
	}
}

skillsStages = {
	{
		minlevel = 10,
		maxlevel = 60,
		multiplier = 100
	}, {
		minlevel = 61,
		maxlevel = 80,
		multiplier = 80
	}, {
		minlevel = 81,
		maxlevel = 110,
		multiplier = 60
	}, {
		minlevel = 111,
		maxlevel = 125,
		multiplier = 40
	}, {
		minlevel = 126,
		multiplier = 20
	}
}

magicLevelStages = {
	{
		minlevel = 0,
		maxlevel = 60,
		multiplier = 130
	}, {
		minlevel = 61,
		maxlevel = 80,
		multiplier = 100
	}, {
		minlevel = 81,
		maxlevel = 100,
		multiplier = 80
	}, {
		minlevel = 101,
		maxlevel = 110,
		multiplier = 60
	}, {
		minlevel = 111,
		maxlevel = 125,
		multiplier = 40
	}, {
		minlevel = 126,
		multiplier = 20
	}
}
