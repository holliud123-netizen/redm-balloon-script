-- Comando para dar acesso admin ao balão
RegisterCommand('balloonadmin', function(source, args, rawCommand)
    if not IsPlayerAceAllowed(source, 'command') then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {'❌ ERRO', 'Você não tem permissão!'}
        })
        return
    end

    local targetId = tonumber(args[1])
    if not targetId then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {'❌ ERRO', 'Uso: /balloonadmin [playerid]'}
        })
        return
    end

    if GetPlayerName(targetId) then
        TriggerClientEvent('balloon:accessGranted', targetId)
        TriggerClientEvent('chat:addMessage', targetId, {
            color = {0, 255, 0},
            multiline = true,
            args = {'🎈 BALÃO', 'Admin te deu acesso ao balão!'}
        })
    else
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {'❌ ERRO', 'Player não encontrado!'}
        })
    end
end, true)
