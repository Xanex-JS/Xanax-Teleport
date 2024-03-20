local QBCore = exports['qb-core']:GetCoreObject()

-- Callback for teleport Locations

RegisterNUICallback('SandyShoresTP', function(data)

    if Config.UsingQBCore == true then

        

    end

end)

function Notify(Text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(Text)
    DrawNotification(true, true)
end