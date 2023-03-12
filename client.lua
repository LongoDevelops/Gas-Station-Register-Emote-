Citizen.CreateThread(function()
    local location = Config.coords
    local animDict = "abigail_mcs_1_concat-3"
    local anim = "csb_abigail_dual-3"
    while true do
        Citizen.Wait(4)
        DrawMarker(29, Config.coords.x, Config.coords.y, Config.coords.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 114, 204, 114, 255, false, false, 2, false, NULL, NULL, false)

        if Vdist(GetEntityCoords(PlayerPedId()), location) < Config.distance then
            DisplayText("Press ~g~~INPUT_CONTEXT~~w~ to Open Register! (Emote)", true, -1)
            if IsControlJustReleased(0, 38) then
                if not HasAnimDictLoaded(animDict) then
                    RequestAnimDict(animDict)
                    while not HasAnimDictLoaded(animDict) do
                        Citizen.Wait(10000)

                        
                    end
                end
                if HasAnimDictLoaded(animDict) then
                    TaskPlayAnim(PlayerPedId(), animDict, anim, 8.0, 8.0, -1, 50, 0, false, false, false)
            end
        end
    end
    if Vdist(GetEntityCoords(PlayerPedId()), location) > Config.distance then
            StopAnimTask(PlayerPedId(), animDict, anim, -1)
        end
    end
end)


function DisplayText(message, beep, duration)
    AddTextEntry('LD_ALERT', message)
    BeginTextCommandDisplayHelp('LD_ALERT')
    EndTextCommandDisplayHelp(0, false, beep, duration)
end