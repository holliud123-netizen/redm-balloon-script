-- UI Client Side

RegisterNetEvent('balloon:updateHUD', function(data)
    SendNUIMessage({
        type = 'updateBalloonHUD',
        altitude = data.altitude,
        health = data.health,
        active = true
    })
end)
