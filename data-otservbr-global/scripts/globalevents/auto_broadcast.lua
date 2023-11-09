local AutoBroadCast = GlobalEvent("text")
function AutoBroadCast.onThink(interval, lastExecution)
    local messages = {

    "Use !commands to see all commands, ",
  "All Join Discord https://discord.gg/XQyxZYpRHg Report all bugs to Qumora or GM Alan",
    "You can convert silver token into dust with just one click",

}
    Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_GAME_HIGHLIGHT) 
    return true
end
AutoBroadCast:interval(700000)
AutoBroadCast:register()