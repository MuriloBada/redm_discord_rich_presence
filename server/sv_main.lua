-- Server Side
AddEventHandler('redemrp:playerLoaded', function()
    TriggerClientEvent('discordRichPresenceSetNumPlayers', -1, GetNumPlayerIndices())
end)

-- Re-send num players on resource (re)start.
CreateThread(function()
    Citizen.Wait(2000)
    TriggerClientEvent('discordRichPresenceSetNumPlayers', -1, GetNumPlayerIndices())
end)