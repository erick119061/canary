local rewards = {
    { id = 34150, name = "Lion Longbow" },
    { id = 34151, name = "Lion Rod" },
    { id = 34152, name = "Lion Wand" },
    { id = 34153, name = "Lion Spellbook" },
    { id = 34154, name = "Lion Shield" },
    { id = 34155, name = "Lion Longsword" },
    { id = 34156, name = "Lion Spangenhelm" },
    { id = 34157, name = "Lion Plate" },
    { id = 34158, name = "Lion Amulet" }
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

bagyouCovet:id(6509)
bagyouCovet:register()
