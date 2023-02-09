-- client
local gNumPlayers = 1

local gLastRichPresenceUpdateTime

local function UpdateRichPresence()

    local gameTimer = GetGameTimer()

    if not gLastRichPresenceUpdateTime or gameTimer - gLastRichPresenceUpdateTime >= 30000 then

        gLastRichPresenceUpdateTime = gameTimer

        SetDiscordAppId(966363661167911012) -- 
        SetDiscordRichPresenceAsset('derp')
        SetDiscordRichPresenceAssetText('Delaware Roleplay')
        SetDiscordRichPresenceAssetSmall('info')
        SetDiscordRichPresenceAssetSmallText('Venha Jogar com a gente!')
        SetRichPresence("Habitantes: "..gNumPlayers.."/64\nDelaware Roleplay")
        -- Actions    
        SetDiscordRichPresenceAction(0, "DISCORD", "https://discord.gg/Gc2yRKr6ju")
        SetDiscordRichPresenceAction(1, "JOGAR", "https://cfx.re/join/589dmr")
        
    end
end

CreateThread(function()
    while true do
        Wait(60000)
        UpdateRichPresence()
    end
end)

RegisterNetEvent('discordRichPresenceSetNumPlayers', function(numPlayers)
    gNumPlayers = numPlayers

    UpdateRichPresence()
end)