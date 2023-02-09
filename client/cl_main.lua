RedEM = exports["redem_roleplay"]:RedEM()
local gNumPlayers = 1

local gLastRichPresenceUpdateTime

local function UpdateRichPresence(source)
    local Player = RedEM.GetPlayer(source) 
    if Player then
        local PlayerName = Player.firstname..' '..Player.lastname
        local gameTimer = GetGameTimer()

        if not gLastRichPresenceUpdateTime or gameTimer - gLastRichPresenceUpdateTime >= 30000 then

            gLastRichPresenceUpdateTime = gameTimer

            -- This is the Application ID (Replace this with you own)
            SetDiscordAppId(966363661167911012)
            -- SetDiscordAppId(YourApplicationIDHere)
            
            SetRichPresence(PlayerName.." ["..source.."]\nRedM Server "..gNumPlayers..'/128') -- This will take the player name and the source and the current amount of online players
            
            -- Here you will have to put the image name for the "large" icon.
            -- You can create one by go to Rich Presence/Art Assets tab in your application and  click Add Image(s)
            -- The Paramater is your Image key that you uploaded (you can change it too once you upload)
            SetDiscordRichPresenceAsset('derp')
            -- SetDiscordRichPresenceAsset('LargeIcon')
            

            -- Here you can add hover text for the "large" icon.
            SetDiscordRichPresenceAssetText('RedEM:RP')
            


            -- Here is the same as the LargeIcon one, but for the Small one
            SetDiscordRichPresenceAssetSmall('info')
            
            
            -- Here you can add hover text for the "small" icon.
            SetDiscordRichPresenceAssetSmallText('Come play with us')

            --[[ 
                Here you can add buttons that will display in your Discord Status,
                First paramater is the button index (0 or 1), second is the title and 
                last is the url (this has to start with "fivem://connect/" or "https://") 
            ]]--
            SetDiscordRichPresenceAction(0, "Join", "fivem://connect/YourIpHere")

            --You can add more Natives Here vvv
            --SetDiscordRichPresenceAction(1, "Example", "https://example.com")
        end
    end
end

CreateThread(function()
    while true do
        Wait(60000)
        UpdateRichPresence()
    end
end)

RegisterNetEvent('discordRichPresenceSetNumPlayers', function(numPlayers)
    local _source = source
    gNumPlayers = numPlayers

    UpdateRichPresence(_source)
end)