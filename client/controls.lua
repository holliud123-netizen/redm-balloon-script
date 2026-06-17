Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if balloonActive and balloonEntity ~= nil and DoesEntityExist(balloonEntity) then
            local driverPed = GetPedInVehicleSeat(balloonEntity, -1)
            local playerPed = PlayerPedId()

            if driverPed == playerPed then
                inBalloon = true
                local coords = GetEntityCoords(balloonEntity)
                local currentAltitude = coords.z

                -- Subir (Q)
                if IsControlPressed(0, Config.Controls.ASCEND) then
                    if currentAltitude < Config.BalloonPhysics.MaxAltitude then
                        local newZ = currentAltitude + Config.BalloonPhysics.AscentSpeed
                        if newZ > Config.BalloonPhysics.MaxAltitude then
                            newZ = Config.BalloonPhysics.MaxAltitude
                        end
                        SetEntityCoords(balloonEntity, coords.x, coords.y, newZ, false, false, false, false)
                        balloonAltitude = newZ
                    end
                end

                -- Descer (Z)
                if IsControlPressed(0, Config.Controls.DESCEND) then
                    if currentAltitude > Config.BalloonPhysics.MinAltitude then
                        local newZ = currentAltitude - Config.BalloonPhysics.DescentSpeed
                        if newZ < Config.BalloonPhysics.MinAltitude then
                            newZ = Config.BalloonPhysics.MinAltitude
                        end
                        SetEntityCoords(balloonEntity, coords.x, coords.y, newZ, false, false, false, false)
                        balloonAltitude = newZ
                    end
                end

                -- Mover para frente (W)
                if IsControlPressed(0, Config.Controls.FORWARD) then
                    local heading = GetEntityHeading(balloonEntity)
                    local x = coords.x + math.cos(math.rad(heading)) * Config.BalloonPhysics.DriftSpeed
                    local y = coords.y + math.sin(math.rad(heading)) * Config.BalloonPhysics.DriftSpeed
                    SetEntityCoords(balloonEntity, x, y, coords.z, false, false, false, false)
                end

                -- Mover para trás (S)
                if IsControlPressed(0, Config.Controls.BACKWARD) then
                    local heading = GetEntityHeading(balloonEntity)
                    local x = coords.x - math.cos(math.rad(heading)) * Config.BalloonPhysics.DriftSpeed
                    local y = coords.y - math.sin(math.rad(heading)) * Config.BalloonPhysics.DriftSpeed
                    SetEntityCoords(balloonEntity, x, y, coords.z, false, false, false, false)
                end

                -- Girar esquerda (Left Arrow)
                if IsControlPressed(0, Config.Controls.LEFT) then
                    local heading = GetEntityHeading(balloonEntity)
                    SetEntityHeading(balloonEntity, heading + 2.0)
                end

                -- Girar direita (Right Arrow)
                if IsControlPressed(0, Config.Controls.RIGHT) then
                    local heading = GetEntityHeading(balloonEntity)
                    SetEntityHeading(balloonEntity, heading - 2.0)
                end

                -- Sair (G)
                if IsControlJustReleased(0, Config.Controls.EXIT) then
                    ClearPedTasksImmediately(playerPed)
                    TaskLeaveVehicle(playerPed, balloonEntity, 0)
                    inBalloon = false
                    balloonActive = false

                    TriggerEvent('chat:addMessage', {
                        color = {255, 255, 0},
                        multiline = true,
                        args = {'🎈 BALÃO', 'Você saiu do balão!'}
                    })
                end

                -- Atualizar HUD
                TriggerEvent('balloon:updateHUD', {
                    altitude = currentAltitude,
                    health = GetVehicleEngineHealth(balloonEntity)
                })
            else
                inBalloon = false
            end
        else
            inBalloon = false
        end
    end
end)
