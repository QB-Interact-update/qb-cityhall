local availableJobs = Config.AvailableJobs

-- Exports
local function checkDist(src, loc, dist)
    local pedCoords = GetEntityCoords(GetPlayerPed(src))
    local distance = #(pedCoords - vector3(loc.x, loc.y, loc.z))
    if distance < dist then
        return true
    end
    return false
end

local function AddCityJob(jobName, toCH)
    if availableJobs[jobName] then return false, Lang:t('error.already_added') end
    availableJobs[jobName] = {
        ['label'] = toCH.label,
        ['isManaged'] = toCH.isManaged
    }
    return true, 'success'
end

exports('AddCityJob', AddCityJob)

-- Functions

local function giveStarterItems()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    for _, v in pairs(QBCore.Shared.StarterItems) do
        local info = {}
        if v.item == 'id_card' then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
        elseif v.item == 'driver_license' then
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.type = Lang:t('info.driver_class')
        end
        exports['qb-inventory']:AddItem(source, v.item, 1, false, info, 'qb-cityhall:giveStarterItems')
    end
end

-- Callbacks

QBCore.Functions.CreateCallback('qb-cityhall:server:receiveJobs', function(_, cb)
    cb(availableJobs)
end)


QBCore.Functions.CreateCallback('qb-cityhall:server:getLicenses', function(source, cb, hallId)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return cb({}) end

    local licensesMeta = Player.PlayerData.metadata['licences']
    if not checkDist(source, Config.Cityhalls[hallId].coords, 5.0) then
        return cb({})
    end

    local availableLicenses = {}

    for license, data in pairs(Config.Cityhalls[hallId].licenses) do
        if not data.metadata or licensesMeta[data.metadata] then
            availableLicenses[license] = data
        end
    end
    cb(availableLicenses)
end)
-- Events

RegisterNetEvent('qb-cityhall:server:requestId', function(item, hall)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if not checkDist(src, Config.Cityhalls[hall].coords, 5.0) then
        return
    end

    local itemInfo = Config.Cityhalls[hall].licenses[item]
    if not Player.Functions.RemoveMoney('cash', itemInfo.cost, 'cityhall id') then
        return TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_enough_money'), 'error')
    end

    local info = {}
    if item == 'id_card' then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
    elseif item == 'driver_license' then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = Lang:t('info.driver_class')
    elseif item == 'weaponlicense' then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
    else
        return false
    end
    if not exports['qb-inventory']:AddItem(source, item, 1, false, info, 'qb-cityhall:server:requestId') then return end
    TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
end)

RegisterNetEvent('qb-cityhall:server:sendDriverTest', function(instructors, location)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if not checkDist(src, Config.DrivingSchools[location].coords, 5.0) then
        return
    end
    for i = 1, #instructors do
        local citizenid = instructors[i]
        local SchoolPlayer = QBCore.Functions.GetPlayerByCitizenId(citizenid) or QBCore.Functions.GetOfflinePlayer(citizenid)
        local gender
        if SchoolPlayer.PlayerData.charinfo.gender == '0' then
            gender = Lang:t('email.mr')
        else
            gender = Lang:t('email.mrs')
        end
        if SchoolPlayer.PlayerData.source then
            TriggerClientEvent('qb-cityhall:client:sendDriverEmail', SchoolPlayer.PlayerData.source, Player.PlayerData.charinfo)
        else
            local mailData = {
                sender = Lang:t('email.sender'),
                subject = Lang:t('email.subject'),
                message = Lang:t('email.message', {
                    gender = gender,
                    lastname = Player.PlayerData.charinfo.lastname,
                    firstname = Player.PlayerData.charinfo.firstname,
                    phone = Player.PlayerData.charinfo.phone
                }),
                button = {}
            }
            exports['qb-phone']:sendNewMailToOffline(citizenid, mailData)
        end
    end
    TriggerClientEvent('QBCore:Notify', src, Lang:t('info.driving_school_await_contact'), 'success', 5000)
end)

RegisterNetEvent('qb-cityhall:server:ApplyJob', function(job, location)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if not checkDist(src, Config.Cityhalls[location].coords, 5.0) then
        return
    end
    if not availableJobs[job] then
        return TriggerClientEvent('QBCore:Notify', src, Lang:t('error.jobNotAvailable'), 'error')
    end

    local JobInfo = QBCore.Shared.Jobs[job]
    Player.Functions.SetJob(job)
    TriggerClientEvent('QBCore:Notify', src, Lang:t('info.new_job', { job = JobInfo.label }))
end)

RegisterNetEvent('qb-cityhall:server:getIDs', giveStarterItems)

RegisterNetEvent('QBCore:Client:UpdateObject', function()
    QBCore = exports['qb-core']:GetCoreObject()
end)

-- Commands

QBCore.Commands.Add('drivinglicense', 'Give a drivers license to someone', { { 'id', 'ID of a person' } }, true, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
    if SearchedPlayer then
        if not SearchedPlayer.PlayerData.metadata['licences']['driver'] then
            for i = 1, #Config.DrivingSchools do
                for id = 1, #Config.DrivingSchools[i].instructors do
                    if Config.DrivingSchools[i].instructors[id] == Player.PlayerData.citizenid then
                        SearchedPlayer.PlayerData.metadata['licences']['driver'] = true
                        SearchedPlayer.Functions.SetMetaData('licences', SearchedPlayer.PlayerData.metadata['licences'])
                        TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, Lang:t('success.passed_driving_test'), 'success', 5000)
                        TriggerClientEvent('QBCore:Notify', source, Lang:t('success.granted_license'), 'success', 5000)
                        break
                    end
                end
            end
        else
            TriggerClientEvent('QBCore:Notify', source, Lang:t('error.no_perms_driving_license'), 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, Lang:t('error.player_not_online'), 'error')
    end
end)