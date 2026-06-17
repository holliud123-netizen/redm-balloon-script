local balloonActive = false
local balloonEntity = nil
local balloonSpeed = 0.0
local balloonAltitude = 0.0
local hasAccess = false
local inBalloon = false

-- Verificar acesso ao entrar no servidor
Citizen.CreateThread(function()
    Citizen.Wait(1000)
    CheckBalloonAccess()
end)

function CheckBalloonAccess()
    if Config.AccessMode == 'all' then
        hasAccess = true
        TriggerEvent('chat:addMessage', {
            color = {0, 255, 0},
            multiline = true,
            args = {'🎈 BALÃO', 'Bem-vindo! Digite /balao para começar a voar!'}
        })
        return
    end

    if Config.AccessMode == 'admin' then
        TriggerServerEvent('balloon:checkAdminAccess')
        return
    end

    if Config.AccessMode == 'whitelist' then
        TriggerServerEvent('balloon:checkWhitelistAccess')
        return
    end
end

RegisterNetEvent('balloon:accessGranted', function()
    hasAccess = true
    TriggerEvent('chat:addMessage', {
        color = {0, 255, 0},
        multiline = true,
        args = {'🎈 BALÃO', 'Você tem permissão para voar! Use /balao'}
    })
end)

RegisterNetEvent('balloon:accessDenied', function()
    hasAccess = false
    TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = true,
        args = {'🎈 BALÃO', 'Você não tem permissão para usar o balão!'}
    })
end)

RegisterCommand('balao', function(source, args, rawCommand)
    if not hasAccess then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {'❌ ERRO', 'Você não tem acesso ao balão!'}
        })
        return
    end

    if balloonEntity ~= nil and DoesEntityExist(balloonEntity) then
        TriggerEvent('chat:addMessage', {
            color = {255, 255, 0},
            multiline = true,
            args = {'⚠️ AVISO', 'Já existe um balão ativo! Use /destruirbalao primeiro.'}
        })
        return
    end

    OpenSpawnMenu()
end, false)

RegisterCommand('destruirbalao', function(source, args, rawCommand)
    if balloonEntity ~= nil and DoesEntityExist(balloonEntity) then
        DeleteEntity(balloonEntity)
        balloonEntity = nil
        balloonActive = false
        TriggerEvent('chat:addMessage', {
            color = {0, 255, 0},
            multiline = true,
            args = {'🎈 BALÃO', 'Balão destruído!'}
        })
    else
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {'❌ ERRO', 'Não há balão ativo!'}
        })
    end
end, false)

function OpenSpawnMenu()
    TriggerEvent('chat:addMessage', {
        color = {0, 200, 255},
        multiline = true,
        args = {'🎈 BALÃO', '════════════════════════════════'}
    })
    TriggerEvent('chat:addMessage', {
        color = {0, 200, 255},
        multiline = true,
        args = {'', 'Selecione um local para spawn:'}
    })

    for i, location in ipairs(Config.SpawnLocations) do
        TriggerEvent('chat:addMessage', {
            color = {255, 255, 255},
            multiline = true,
            args = {i .. '.', location.label .. ' - Digite: /spawnbalao ' .. i}
        })
    end

    TriggerEvent('chat:addMessage', {
        color = {0, 200, 255},
        multiline = true,
        args = {'', '════════════════════════════════'}
    })
end

RegisterCommand('spawnbalao', function(source, args, rawCommand)
    if not hasAccess then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {'❌ ERRO', 'Você não tem acesso ao balão!'}
        })
        return
    end

    local locationId = tonumber(args[1])

    if not locationId or locationId < 1 or locationId > #Config.SpawnLocations then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {'❌ ERRO', 'Local inválido!'}
        })
        return
    end

    local location = Config.SpawnLocations[locationId]
    SpawnBalloon(location)
end, false)
