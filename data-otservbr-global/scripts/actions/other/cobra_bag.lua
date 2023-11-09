local rewards = {
    { id = 30393, name = "Cobra Crossbow" },
    { id = 30394, name = "Cobra Boots" },
    { id = 30395, name = "Cobra Club" },
    { id = 30396, name = "Cobra axe" },
    { id = 30397, name = "Cobra Hood" },
    { id = 30398, name = "Cobra Sword" },
    { id = 30399, name = "Cobra Wand" },
    { id = 30400, name = "Cobra Rod" }
 }

local bagyouCovet = Action()

function bagyouCovet.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received a ' .. rewardItem.name .. '.')
	return true
end

bagyouCovet:id(6510)
bagyouCovet:register()
