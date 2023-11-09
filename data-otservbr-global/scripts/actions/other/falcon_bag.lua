local rewards = {
    { id = 28714, name = "falcon circlet" },
    { id = 28715, name = "falcon coif" },
    { id = 28716, name = "falcon rod" },
    { id = 28717, name = "falcon wand" },
    { id = 28718, name = "falcon bow" },
    { id = 28719, name = "falcon plate" },
    { id = 28720, name = "falcon greaves" },
    { id = 28721, name = "falcon shield" },
    { id = 28722, name = "falcon escutcheon" },
    { id = 28723, name = "falcon longsword" },
    { id = 28724, name = "falcon battleaxe" },
    { id = 28725, name = "falcon mace" }
}

local bagyouDesire = Action()

function bagyouDesire.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received a ' .. rewardItem.name .. '.')
	return true
end

bagyouDesire:id(6505)
bagyouDesire:register()
