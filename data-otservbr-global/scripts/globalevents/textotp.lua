local effects = {

    {position = Position(32350, 32218, 7), text = 'Mini Boss!', effect = 71}, --hub
	{position = Position(32352, 32223, 7), text = 'Hunts', effect = 62},
	{position = Position(32348, 32218, 7), text = 'Bosses!', effect = 54},
	{position = Position(32343, 32218, 7), text = 'Quest!', effect = 38},
	{position = Position(32354, 32223, 7), text = 'Event Room!', effect = 49},
	{position = Position(31844, 32028, 7), text = 'Craft Here!'},
	{position = Position(31834, 32028, 7), text = 'Craft Here!'},
	{position = Position(32350, 32224, 7), text = 'Craft!', effect = 7},
	{position = Position(31866, 31873, 7), text = 'Roulette!', effect = 6},
	{position = Position(31863, 31878, 7), text = 'Dice', effect = 9},
	{position = Position(31866, 31880, 7), text = 'Reward', effect = 10},
    -- {position = Position(32380, 32239, 7), text = 'Tokens TPs!', effect = CONST_ME_FIREAREA},	--miner area
	{position = Position(32791, 32329, 10), text = 'Use " !libropoi " para conseguir el libro', effect = CONST_ME_FIREAREA},

}



local animatedText = GlobalEvent("AnimatedText") 

function animatedText.onThink(interval)

    for i = 1, #effects do

        local settings = effects[i]

        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)

        if #spectators > 0 then

            if settings.text then

                for i = 1, #spectators do

                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)

                end

            end

            if settings.effect then

                settings.position:sendMagicEffect(settings.effect)

            end

        end

    end

   return true

end



animatedText:interval(5000)

animatedText:register()