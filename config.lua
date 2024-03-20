Config = {}
    --{x = 161.37, y = -966.57, z = 29.00},
    --{x = 1848.6, y = 3677.58, z = 32.95}
Config.UsingQBCore = true -- Turn this off if you're not using QBCore :3

Config.TeleportBlip = {
    ['targetHeading'] = 273.47,                                         -- qb-target box zone
    ['SetBlipSprite'] = 85,                                             -- Blip Icon (https://docs.fivem.net/docs/game-references/blips/)
    ['SetBlipDisplay'] = 6,                                             -- Blip Behavior (https://docs.fivem.net/natives/?_0x9029B2F3DA924928)
    ['SetBlipScale'] = 0.85,                                            -- Blip Size
    ['SetBlipColour'] = 5,                                              -- Blip Color
    ['BlipLabel'] = "Bus Stop",                                      -- Blip Label
    ['minZ'] = 31.92,                                                   -- Max Z
    ['maxZ'] = 35.92,                                                   -- Max Z
}

Config.TeleportLocations = { -- For the Blips and markers. This will also teleport players to the location if they select it.
    {["Location"] = "Legion Square", x = 161.37, y = -966.57, z = 29.00},
    {["Location"] = "Sandy Shores", ["x"] = 1817.78, ["y"] = 3650.96, ["z"] = 33.23},
    {["Location"] = "Paleto Bay", x = -318.13, y = 6128.69, z = 30.30} 
}