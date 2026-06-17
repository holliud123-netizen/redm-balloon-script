function SpawnBalloon(location)
    local model = GetHashKey(Config.BalloonModel)

    RequestModel(model)
    local timeout = 0
    while not HasModelLoaded(model) and timeout < 10000 do
        Citizen.Wait(10)
        timeout = timeout + 10
    end

    if not HasModelLoaded(model) then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {'❌ ERRO', 'Não foi possível carregar o modelo do balão!'}
        })
        return false
    end

    balloonEntity = CreateVehicle(model, location.x, location.y, location.z, location.heading, true, false)

    if balloonEntity == 0 then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {'❌ ERRO', 'Não foi possível criar o balão!'}
        })
        ReleaseNamedWeapon(model)
        return false
    end

    -- Configurar propriedades do balão
    SetVehicleEngineHealth(balloonEntity, 1000.0)
    SetVehicleBodyHealth(balloonEntity, 1000.0)
    SetVehicleDeformationFixed(balloonEntity)
    SetVehicleWindowBroken(balloonEntity, 0, false)
    SetVehicleDoorsShut(balloonEntity, false)
    SmashVehicleWindow(balloonEntity, 0)
    SmashVehicleWindow(balloonEntity, 1)

    -- Entra no balão
    local playerPed = PlayerPedId()
    TaskWarpPedIntoVehicle(playerPed, balloonEntity, -1)

    balloonActive = true
    balloonAltitude = location.z

    TriggerEvent('chat:addMessage', {
        color = {0, 255, 0},
        multiline = true,
        args = {'🎈 BALÃO', 'Bem-vindo ao balão!'}
    })

    TriggerEvent('chat:addMessage', {
        color = {100, 200, 255},
        multiline = true,
        args = {'⌨️ CONTROLES', 'Q=Subir | Z=Descer | W=Frente | A/D=Virar | G=Sair'}
    })

    ReleaseNamedWeapon(model)
    return true
end

function GetBalloonData()
    if balloonEntity == nil or not DoesEntityExist(balloonEntity) then
        return nil
    end

    local coords = GetEntityCoords(balloonEntity)
    return {
        heading = GetEntityHeading(balloonEntity),
        coords = coords,
        health = GetVehicleEngineHealth(balloonEntity),
        altitude = coords.z,
        isDriver = GetPedInVehicleSeat(balloonEntity, -1) == PlayerPedId()
    }
end
