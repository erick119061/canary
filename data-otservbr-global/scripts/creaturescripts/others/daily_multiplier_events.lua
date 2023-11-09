--Credits: NvSo#4349
-- enableBonusWithBoosts enabled by default, it adds the stamina and expBoost bonuses that the character has applied to the active event.
-- Note: The Exp Gain rate on the client can be erroneously affected by the total experience bonus

local enableBonusWithBoosts = true

local events_by_day = {
    ['Monday'] = {
        ['LOOT'] = 5, --50%
        ['SKILL'] = 5, --100%
        ['EXP'] = 5, --100%
    },
    ['Tuesday'] = {
        ['LOOT'] = 5, --50%
        ['EXP'] = 5, --100%
    },
    ['Wednesday'] = {
        ['SKILL'] = 5, --100%
        ['EXP'] = 5, --100%
    },
    ['Thursday'] = {
        ['LOOT'] = 5, --50%
        ['SKILL'] = 5, --100%
    },
    ['Friday'] = {
        ['LOOT'] = 5, --50%
        ['EXP'] = 5, --100%
    },
    ['Saturday'] = {
        ['LOOT'] = 20, --50%
        ['SKILL'] = 20, --100%
        ['EXP'] = 20, --100%
    },
    ['Sunday'] = {
        ['LOOT'] = 20, --50%
        ['SKILL'] = 20, --100%
        ['EXP'] = 20, --100%
    },
}

local BASE_SKILL_RATE = 100
local BASE_LOOT_RATE = 100
local BASE_EXP_RATE = 100

local function applyMultiplierToPlayer(player, type, multiplier)
    local staminaBoost = 1
    local storeBoost = 1

    if configManager.getBoolean(configKeys.STAMINA_SYSTEM) then
        local staminaMinutes = player:getStamina()
        if staminaMinutes > 2340 and player:isPremium() then
            staminaBoost = 1.5
        elseif staminaMinutes <= 840 then
            staminaBoost = 0.5
        end
    end

    local storeXpBoost = player:getStoreXpBoost()
    if storeXpBoost > 0 then
        storeBoost = storeXpBoost / 100
    end

    local baseMultiplier = 1

    if type == 'SKILL' then
        baseMultiplier = BASE_SKILL_RATE + (BASE_SKILL_RATE * (multiplier / 100))
    elseif type == 'LOOT' then
        baseMultiplier = BASE_LOOT_RATE + (BASE_LOOT_RATE * (multiplier / 100))
    elseif type == 'EXP' then
        baseMultiplier = BASE_EXP_RATE + (BASE_EXP_RATE * (multiplier / 100))
    end

    local finalMultiplier = baseMultiplier

    if enableBonusWithBoosts and type == 'EXP' then
        finalMultiplier = BASE_EXP_RATE + (BASE_EXP_RATE * (multiplier / 100))
        finalMultiplier = finalMultiplier * staminaBoost * storeBoost
    else
        finalMultiplier = finalMultiplier
    end

    if type == 'SKILL' then
        SCHEDULE_SKILL_RATE = finalMultiplier
    elseif type == 'LOOT' then
        SCHEDULE_LOOT_RATE = finalMultiplier
    elseif type == 'EXP' then
        SCHEDULE_EXP_RATE = finalMultiplier
    end
end

local function activateEvent(type, multiplier)
    if not type then return false end
    if not CustomDailyEvents then
        CustomDailyEvents = {}
    end
    CustomDailyEvents[type] = multiplier
    Spdlog.info("Today ".. os.date('%A') ..", daily event is: " .. type .. " +" .. multiplier .. "%")
end

local dailyEventsStartup = GlobalEvent("dailyEventsStartup")

function dailyEventsStartup.onStartup()
    local day = os.date('%A')

    local todayEvents = events_by_day[day]
    for type, multiplier in pairs(todayEvents) do
        activateEvent(type, multiplier)
    end
end
dailyEventsStartup:register()

local applyDailyMultiplier = CreatureEvent("applyDailyMultiplier")

function applyDailyMultiplier.onLogin(player)
    if CustomDailyEvents then
       for type, multiplier in pairs(CustomDailyEvents) do
            applyMultiplierToPlayer(player, type, multiplier)
        end
        local message = "Today's active events:\n"

        if CustomDailyEvents['EXP'] then
            local expRate = CustomDailyEvents['EXP']
            message = message .. " Exp: +" .. expRate .. "%,"
        end

        if CustomDailyEvents['LOOT'] then
            local lootRate = CustomDailyEvents['LOOT']
            message = message .. " Loot: +" .. lootRate .. "%,"
        end

        if CustomDailyEvents['SKILL'] then
            local skillRate = CustomDailyEvents['SKILL']
            message = message .. " Skill: +" .. skillRate .. "%,"
        end

        if message ~= "Today's active events:" then
            message = string.sub(message, 1, -2)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
        end
    end

    return true
end
applyDailyMultiplier:register()