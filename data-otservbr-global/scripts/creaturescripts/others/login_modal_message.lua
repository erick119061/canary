-- Canary Login Modal Message
-- NvSo

local messageLogin = CreatureEvent("messageLogin")

function messageLogin.onLogin(player)
    local text = "We welcome you all to ".. configManager.getString(configKeys.SERVER_NAME) .." \n Please Join Us On Discord https://discord.gg/XQyxZYpRHg Report All Bugs To Qumora or GM Alan."
    local menu = ModalWindow{
        title = "Welcome to " .. configManager.getString(configKeys.SERVER_NAME),
        message = text
    }
    menu:addButton("Close")

    menu:sendToPlayer(player)
    return true
end

messageLogin:register() 