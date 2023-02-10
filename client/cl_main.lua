local gNumPlayers = 1

local gLastRichPresenceUpdateTime

local function UpdateRichPresence(Player)
    if Player then
        local PlayerName = Player.firstname..' '..Player.lastname
        local gameTimer = GetGameTimer()

        print(PlayerName)
        if not gLastRichPresenceUpdateTime or gameTimer - gLastRichPresenceUpdateTime >= 2 then
            gLastRichPresenceUpdateTime = gameTimer
            -- This is the Application ID (Replace this with you own)
            SetDiscordAppId(YourApplicationIDHere)
            
            SetRichPresence('Input your phrase here!\n'..'('..Player.source..') - '..PlayerName) -- This will take the player name and the source
            
            -- Here you will have to put the image name for the "large" icon.
            -- You can create one by go to Rich Presence/Art Assets tab in your application and  click Add Image(s)
            -- The Paramater is your Image key that you uploaded (you can change it too once you upload)
            SetDiscordRichPresenceAsset('LargeIcon')
            

            -- Here you can add hover text for the "large" icon.
            SetDiscordRichPresenceAssetText('RedEM:RP')
            


            -- Here is the same as the LargeIcon one, but for the Small one
            SetDiscordRichPresenceAssetSmall('SmallIcon')
            
            
            -- Here you can add hover text for the "small" icon.
            SetDiscordRichPresenceAssetSmallText('Come play with us')

            --[[ 
                Here you can add buttons that will display in your Discord Status,
                First paramater is the button index (0 or 1 or more), second is the title and 
                last is the url (this has to start with "fivem://connect/" or "https://") 
            ]]--
            SetDiscordRichPresenceAction(0, "Connect", "fivem://connect/YourIpHere")

            --You can add more Natives Here vvv
            --SetDiscordRichPresenceAction(1, "Example", "https://example.com")
        end
    end
end

CreateThread(function()
    while true do
        Wait(10000)
        UpdateRichPresence()
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        TriggerServerEvent('startRichpresence')
    end
end)

RegisterNetEvent('discordRichPresenceSetNumPlayers', function(numPlayers, Player)
    local _source = source
    gNumPlayers = numPlayers

    UpdateRichPresence(Player)
end)
