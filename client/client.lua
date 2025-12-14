
local heldData = nil

RegisterNuiCallback('buyLicense', function(data, cb) TriggerServerEvent('qb-cityhall:server:buyLicense', data, heldData)  cb('ok') end)
RegisterNuiCallback('selectJob', function(data, cb)  TriggerServerEvent('qb-cityhall:server:selectJob', data, heldData)   cb('ok') end)
RegisterNUICallback('hideUI', function(_, cb)    cb('ok')    SetNuiFocus(false, false) heldData = nil end)

local function generateLicenses()
    local licenses = {}
    for k, v in pairs(exports['qb-core']:GetPlayerData().metadata['licences'] or {}) do
        if v then
            table.insert(licenses, k)
        end
    end
    return licenses
end

local function openCityHall()
    SendNUIMessage({
        action = 'setVisible',
        data = {
            jobs = Config.Jobs,
            licenses = Config.Licenses,
            playerLicenses = generateLicenses(),
        }
    })
    SetNuiFocus(true, true)
end

CreateThread(function()
    for index, location in pairs(Config.Locations) do
        RequestModel(GetHashKey(location.ped.model))
        while not HasModelLoaded(GetHashKey(location.ped.model)) do
            Wait(1)
        end
        local ped = CreatePed(4, GetHashKey(location.ped.model), location.coords.x, location.coords.y, location.coords.z, location.coords.w, false, true)
        SetPedCanRagdoll(ped, false)
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)
        TaskStartScenarioInPlace(ped, location.ped.scenario, 0, true)
        local options = {
            {
                label = 'Open City Hall',
                icon = 'fas fa-city',
                action = function()
                    heldData = index
                    openCityHall()
                end,
            },
        }
        if Config.UseTarget then 
            exports['qb-target']:AddTargetEntity(ped, {
                options = options,
                distance = 2.5
            })
        else
            exports['qb-interact']:addEntityZone(ped, {
                width = 2.0,
                length = 2.0,
                options = options,
                height = 2,
                debugPoly = false,
            })
        end
    end
end)