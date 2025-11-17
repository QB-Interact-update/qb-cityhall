local blips = {}
local peds = {
    cityHall = {},
    drivingSchool = {}
}

local function initBlips()
    for i = 1, #Config.Cityhalls do
        local hall = Config.Cityhalls[i]
        if hall.showBlip then
            blips[#blips + 1] = AddBlipForCoord(hall.coords.x, hall.coords.y, hall.coords.z)
            hall = hall.blipData
            SetBlipSprite(blips[#blips], hall.sprite or 1)
            SetBlipDisplay(blips[#blips], hall.display or 4)
            SetBlipScale(blips[#blips], hall.scale or 1.0)
            SetBlipColour(blips[#blips], hall.colour or 1)
            SetBlipAsShortRange(blips[#blips], hall.shortRange or false)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(hall.title or 'No Title Given')
            EndTextCommandSetBlipName(blips[#blips])
        end
    end
    for i = 1, #Config.DrivingSchools do
        local hall = Config.DrivingSchools[i]
        if hall.showBlip then
            blips[#blips + 1] = AddBlipForCoord(hall.coords.x, hall.coords.y, hall.coords.z)
            hall = hall.blipData
            SetBlipSprite(blips[#blips], hall.sprite or 1)
            SetBlipDisplay(blips[#blips], hall.display or 4)
            SetBlipScale(blips[#blips], hall.scale or 1.0)
            SetBlipColour(blips[#blips], hall.colour or 1)
            SetBlipAsShortRange(blips[#blips], hall.shortRange or false)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(hall.title or 'No Title Given')
            EndTextCommandSetBlipName(blips[#blips])
        end
    end
end

local function openCityhallMenu(location)
    local mainMenu = {
        {
            header = Lang:t('info.cityHall.header'),
            isMenuHeader = true
        },
        {
            header = Lang:t('info.cityHall.idHead'),
            txt = Lang:t('info.cityHall.idDesc'),
            action = function()
                local menu = {
                    {
                        header = Lang:t('info.cityHall.idsHead'),
                        isMenuHeader = true
                    },
                }
                local licenseList = QBCore.Functions.TriggerCallback('qb-cityhall:server:getLicenses', location)
                for license, data in pairs(licenseList) do
                    menu[#menu + 1] = {
                        header = data.label,
                        txt = 'Cost: $' .. data.cost,
                        action = function()
                            TriggerServerEvent('qb-cityhall:server:requestId', license, location)
                        end
                    }
                end
                exports['qb-menu']:openMenu(menu)
            end,
        },
        {
            header = Lang:t('info.cityHall.jobCenterHead'),
            txt = Lang:t('info.cityHall.jobCenterDesc'),
            action = function()
                local menu = {
                    {
                        header = Lang:t('info.cityHall.jobCenterHead'),
                        isMenuHeader = true
                    },
                }
                local jobList = QBCore.Functions.TriggerCallback('qb-cityhall:server:receiveJobs')
                for jobName, jobData in pairs(jobList) do
                    menu[#menu + 1] = {
                        header = jobData.label,
                        txt = Lang:t('info.apply_job', { job = jobData.label }),
                        action = function()
                            TriggerServerEvent('qb-cityhall:server:ApplyJob', jobName, location)
                        end
                    }
                end
                exports['qb-menu']:openMenu(menu)
            end
        },
        {
            header = 'Close Menu',
            txt = '',
            action = function() exports['qb-menu']:closeMenu() end
        }
    }
    exports['qb-menu']:openMenu(mainMenu)
end

local function spawnPeds()
    for k, v in pairs (Config.Cityhalls) do
        local options = {
            {
                label = Lang:t('info.interactions.openCity'),
                icon = 'fa-solid fa-city',
                action = function()
                    openCityhallMenu(k)
                end
            }
        }
        if v.ped then
            RequestModel(GetHashKey(v.ped.model))
            while not HasModelLoaded(GetHashKey(v.ped.model)) do
                Wait(1)
            end
            peds['cityHall'][#peds['cityHall']+1] = CreatePed(4, GetHashKey(v.ped.model), v.coords.x, v.coords.y, v.coords.z, v.coords.w, false, false)
            local ped = peds['cityHall'][#peds['cityHall']]
            SetEntityInvincible(ped, true)
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            TaskStartScenarioInPlace(ped, v.ped.scenario or 'WORLD_HUMAN_STAND_MOBILE', true, true)
            if Config.UseTarget then
                exports['qb-target']:AddTargetEntity(ped, {
                    options = options,
                    distance = 2.0
                })
            else
                exports['qb-interact']:addEntityZone(ped, {
                    options = options,
                })
            end
        else
            if Config.UseTarget then
                exports['qb-target']:AddBoxZone('cityhall_' .. k, v.coords.xyz, 1.0, 1.0, {
                    name = 'cityhall_' .. k,
                    heading = v.coords.w,
                    debugPoly = false,
                    minZ = v.coords.z - 1.0,
                    maxZ = v.coords.z + 1.0
                }, {
                    options = options,
                    distance = 2.0
                })
            else
                exports['qb-interact']:addInteractZone({
                    name = 'cityHall_' .. k,
                    length = 2.0,
                    width = 2.0,
                    height = 2.0,
                    options = options,
                    debugPoly = true,
                    coords = v.coords
                })
            end
        end
        for k, v in pairs (Config.DrivingSchools) do
            local options = {
                {
                    label = Lang:t('info.interactions.openDriving'),
                    icon = 'fa-solid fa-car-side',
                    action = function()
                        TriggerServerEvent('qb-cityhall:server:sendDriverTest', v.instructors, k)
                    end
                }
            }
            if v.ped then
                RequestModel(GetHashKey(v.ped.model))
                while not HasModelLoaded(GetHashKey(v.ped.model)) do
                    Wait(1)
                end
                peds['drivingSchool'][#peds['drivingSchool']+1] = CreatePed(4, GetHashKey(v.ped.model), v.coords.x, v.coords.y, v.coords.z, v.coords.w, false, false)
                local ped = peds['drivingSchool'][#peds['drivingSchool']]
                SetEntityInvincible(ped, true)
                FreezeEntityPosition(ped, true)
                SetEntityInvincible(ped, true)
                SetBlockingOfNonTemporaryEvents(ped, true)
                TaskStartScenarioInPlace(ped, v.ped.scenario or 'WORLD_HUMAN_STAND_MOBILE', true, true)
                if Config.UseTarget then
                    exports['qb-target']:AddTargetEntity(ped, {
                        options = options,
                        distance = 2.0
                    })
                else
                    exports['qb-interact']:addEntityZone(ped, {
                        options = options,
                    })
                end
            else
                if Config.UseTarget then
                    exports['qb-target']:AddBoxZone('drivingschool_' .. k, v.coords, 1.0, 1.0, {
                        name = 'drivingschool_' .. k,
                        heading = 0.0,
                        debugPoly = false,
                        minZ = v.coords.z - 1.0,
                        maxZ = v.coords.z + 1.0
                    }, {
                        options = options,
                        distance = 2.0
                    })
                else
                    exports['qb-interact']:addInteractZone({
                        name = 'drivingSchool_' .. k,
                        length = 2.0,
                        width = 2.0,
                        height = 2.0,
                        options = options,
                        debugPoly = true,
                        coords = v.coords
                    })
                end
            end
        end
    end
end


local function deletePeds()
    for k, v in pairs(peds) do
        for _, ped in pairs(v) do
            DeleteEntity(ped)
        end
    end
    peds = {}
end 

local function deleteBlips()
    for _, blip in pairs(blips) do
        RemoveBlip(blip)
    end
    blips = {}
end

RegisterNetEvent('qb-cityhall:client:sendDriverEmail', function(charinfo)
    SetTimeout(math.random(2500, 4000), function()
        local gender = Lang:t('email.mr')
        if QBCore.Functions.GetPlayerData().charinfo.gender == 1 then
            gender = Lang:t('email.mrs')
        end
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Lang:t('email.sender'),
            subject = Lang:t('email.subject'),
            message = Lang:t('email.message', { gender = gender, lastname = charinfo.lastname, firstname = charinfo.firstname, phone = charinfo.phone }),
            button = {}
        })
    end)
end)

-- loaders and deloaders
AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    deleteBlips()
    deletePeds()
end)

CreateThread(function()
    initBlips()
    spawnPeds()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    deletePeds()
end)