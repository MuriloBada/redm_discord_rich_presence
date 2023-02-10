RedEM = exports["redem_roleplay"]:RedEM()

AddEventHandler('redemrp:playerLoaded', function()
    startRichPresence()
end)

RegisterNetEvent('startRichpresence', function()
    startRichPresence()
end)

function startRichPresence()
    local Player = RedEM.GetPlayer(source)
    if Player then
        TriggerClientEvent('discordRichPresenceSetNumPlayers', Player.source, GetPlayers(), Player)
    end
end