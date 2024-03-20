local QBCore = exports['qb-core']:GetCoreObject()

local playerPed = GetPlayerPed(-1)
local playerid = GetPlayerServerId(playerPed)
local uiOpen = false
local ok = false

-- Marker for Teleport Zones. 

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(Config.TeleportLocations) do
            DrawMarker(1, Config.TeleportLocations[k].x, Config.TeleportLocations[k].y, Config.TeleportLocations[k].z, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 0.7001, 0, 0, 255, 200, 0, 0, 0, 0)
           -- print(Config.TeleportLocations[k].Name) 
        end
    end
end)



--Marker Logic
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(Config.TeleportLocations) do
            local playerCoords = GetEntityCoords(GetPlayerPed(-1), false)
            if GetDistanceBetweenCoords(playerCoords , Config.TeleportLocations[k].x, Config.TeleportLocations[k].y, Config.TeleportLocations[k].z, true) < 2 then
               
                if IsControlJustPressed(1, 46) then -- Check if E is pressed

                    local BusMenu = {
                        {
                            header = "Bus Stop",
                            isMenuHeader = true
                        }
                    }
                
                    for k, v in pairs(Config.TeleportLocations) do
                        BusMenu[#BusMenu+1] = {
                            header = v.Location,
                            txt = 'Take a bus to this location',
                            params = {
                                event = 'xanax-teleport:clicked',
                                args = { Selected = v.Location}
                            }
                        }
                    end
        
                    exports['qb-menu']:openMenu(BusMenu)

                end

            end
        end
    end
end)

RegisterNetEvent('xanax-teleport:clicked', function(data)
    local ped = PlayerPedId()
    local currentPos = GetEntityCoords(ped)
    local playerCoords = GetEntityCoords(GetPlayerPed(-1), false)

    for k, v in pairs(Config.TeleportLocations) do
    if GetDistanceBetweenCoords(playerCoords , Config.TeleportLocations[k].x, Config.TeleportLocations[k].y, Config.TeleportLocations[k].z, true) < 2 then

        QBCore.Functions.Progressbar('Waiting for the bus', 'Awaiting for the bus', 5000, false, true, {
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
            }, {}, {}, {}, function()
    
                    local playerCoords = GetEntityCoords(GetPlayerPed(-1), false)

                    if GetDistanceBetweenCoords(playerCoords , Config.TeleportLocations[k].x, Config.TeleportLocations[k].y, Config.TeleportLocations[k].z, true) < 2 then
                        QBCore.Functions.Notify('You caught the bus.', 'primary', 7500)

                    if data.Selected == "Sandy Shores" then 
        
                        SetEntityCoords(ped, 1817.78, 3650.96, 3.23, false, false, false, true)
                
                    elseif data.Selected == "Legion Square" then 
                
                        SetEntityCoords(ped, 161.37, -966.57, 29.00, false, false, false, true)
                
                    elseif data.Selected == "Paleto Bay" then 
                
                        SetEntityCoords(ped, -318.13, 6128.69, 30.30, false, false, false, true)
                
                    end
    
                else
                    QBCore.Functions.Notify('You left the bus stop', 'error', 7500)
                end

            end, function()
                QBCore.Functions.Notify('You pressed ESC :3, Bus Canceled', 'error', 7500)
            end)

end

end

end)

function DisablActions()
    DisableControlAction(0, 1, true) -- LookLeftRight
    DisableControlAction(0, 2, true) -- LookUpDown
    DisableControlAction(0,21,true) -- disable sprint
    DisableControlAction(0,24,true) -- disable attack
    DisableControlAction(0,25,true) -- disable aim
    DisableControlAction(0,47,true) -- disable weapon
    DisableControlAction(0,58,true) -- disable weapon
    DisableControlAction(0,263,true) -- disable melee
    DisableControlAction(0,264,true) -- disable melee
    DisableControlAction(0,257,true) -- disable melee
    DisableControlAction(0,140,true) -- disable melee
    DisableControlAction(0,141,true) -- disable melee
    DisableControlAction(0,142,true) -- disable melee
    DisableControlAction(0,143,true) -- disable melee
    DisableControlAction(1, 37, true) -- disable Weapon Wheel
end

-- Blips for Teleport Zones.

Citizen.CreateThread(function()
    local blip = Config.TeleportLocations
    for k in pairs(Config.TeleportLocations) do
      BusStopBlip = AddBlipForCoord(Config.TeleportLocations[k].x, Config.TeleportLocations[k].y, Config.TeleportLocations[k].z)
      SetBlipSprite(BusStopBlip, 513)
      SetBlipDisplay(BusStopBlip, 6)
      SetBlipScale(BusStopBlip, 0.85)
      SetBlipColour(BusStopBlip, 5)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentSubstringPlayerName('Bus Stop')
      EndTextCommandSetBlipName(BusStopBlip)
    end
 end)