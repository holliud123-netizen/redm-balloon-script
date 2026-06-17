print("^2[Balão RedM]^7 Script carregado com sucesso!")
print("^3[Balão RedM]^7 Digite /balao para voar no balão!")

-- Event para verificar acesso de admin
RegisterNetEvent('balloon:checkAdminAccess', function()
    local source = source
    if IsPlayerAceAllowed(source, 'command') then
        TriggerClientEvent('balloon:accessGranted', source)
    else
        TriggerClientEvent('balloon:accessDenied', source)
    end
end)

-- Event para verificar acesso de whitelist
RegisterNetEvent('balloon:checkWhitelistAccess', function()
    local source = source
    local identifier = GetPlayerIdentifier(source, 0)

    local hasAccess = false
    for _, whitelistedId in ipairs(Config.Whitelist) do
        if identifier == whitelistedId then
            hasAccess = true
            break
        end
    end

    if hasAccess then
        TriggerClientEvent('balloon:accessGranted', source)
    else
        TriggerClientEvent('balloon:accessDenied', source)
    end
end)

-- Backup do player ao entrar
AddEventHandler('playerConnecting', function(name, reason, deferrals)
    deferrals.defer()
    Citizen.Wait(100)
    deferrals.done()
end)
