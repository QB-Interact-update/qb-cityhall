local uhOhs = {}

local function checkDistance(src, loc, dist)
    local playerCoords = GetEntityCoords(GetPlayerPed(src))
    if #(playerCoords - vector3(loc.x, loc.y, loc.z)) <= dist then
        return true
    else
        uhOhs[src] = (uhOhs[src] or 0) + 1
        if uhOhs[src] >= 5 then
            print(('qb-cityhall: %s attempted to exploit the cityhall system.'):format(GetPlayerName(src)))
            DropPlayer(src, 'Exploiting the cityhall system is not allowed.')
        end
        return false
    end
end

local function getLicenseData(license)
    for k, v in pairs(Config.Licenses) do
        if v.name == license then
            return v
        end
    end
    return nil
end

local function getLicenseMeta(license, type)
    local Player = exports['qb-core']:GetPlayer(source)
    if license == 'id_card' then
        local info = {}
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
        return info
    else
        local info = {}
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = type
        return info
    end
end
local function giveStarterItems()
    local Player = exports['qb-core']:GetPlayer(source)
    if not Player then return end
    for _, v in pairs(exports['qb-core']:GetStarterItems()) do
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
            info.type = 'Class C Driver License'
        end
        exports['qb-inventory']:AddItem(source, v.item, 1, false, info, 'qb-cityhall:giveStarterItems')
    end
end
RegisterNetEvent('qb-cityhall:server:getIDs', giveStarterItems)

RegisterNetEvent('qb-cityhall:server:buyLicense', function(licenseName, location)
    local src = source
    if not checkDistance(src, Config.Locations[location].coords, 5.0) then return end
    local Player = exports['qb-core']:GetPlayer(src)
    local licenseData = getLicenseData(licenseName)
    if not licenseData then
        print(('qb-cityhall: %s attempted to buy an invalid license: %s'):format(GetPlayerName(src), licenseName))
        return
    end
    if licenseData.name == 'id_card' then
        goto continue
    end
    if Player.PlayerData.metadata['licences'] and not Player.PlayerData.metadata['licences'][licenseData.license] then
        if licenseData.license == 'drivers' then
            for i = 1, #Config.Instructors do 
                local instructor = Config.Instructors[i]
                local mailData = {
                    sender = 'Township',
                    subject = 'Driving lessons request',
                    message = 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>' .. Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname .. '<br />Phone Number: <strong>' .. Player.PlayerData.charinfo.phone .. '</strong><br><br>Kind regards,<br>Township Los Santos',
                    button = {}
                }
                exports['qb-phone']:sendNewMailToOffline(instructor, mailData)
                return
            end
        end
        TriggerClientEvent('QBCore:Notify', src, 'You Dont own this license.', 'error')
        return
    end
    ::continue::
    if Player.Functions.RemoveMoney('bank', licenseData.price, 'bought-license-' .. licenseData.license) or Player.Functions.RemoveMoney('cash', licenseData.price, 'bought-license-' .. licenseData.license) then
        exports['qb-inventory']:AddItem(src, licenseData.name, 1, false, getLicenseMeta(licenseData.name, licenseData.label), 'qb-cityhall:buyLicense')
        TriggerClientEvent('qb-inventory:client:ItemBox', src, Items[licenseData.name], 'add')
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money', 'error')
    end
end)

local function verifyAllowedJob(jobName)
    for _, v in pairs(Config.Jobs) do
        if v.name == jobName then
            return true
        end
    end
    return false
end
RegisterNetEvent('qb-cityhall:server:selectJob', function(jobName, location)
    local src = source
    if not checkDistance(src, Config.Locations[location].coords, 5.0) then return end
    local jobData = Jobs[jobName]
    if not jobData then
        print(('qb-cityhall: %s attempted to select an invalid job: %s'):format(GetPlayerName(src), jobName))
        return
    end
    if not verifyAllowedJob(jobName) then
        print(('qb-cityhall: %s attempted to select a job that is not allowed: %s'):format(GetPlayerName(src), jobName))
        return
    end
    if not exports['qb-multijob']:hasJob(src, jobName) then
        local success = exports['qb-multijob']:addJob(src, jobName, 0)
        if not success then
            TriggerClientEvent('QBCore:Notify', src, 'You Are At The Maximum Amount Of Jobs', 'error')
            return
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'You already have this job.', 'error')
        return
    end
end)
exports['qb-core']:AddCommand('drivinglicense', 'Give a drivers license to someone', { { 'id', 'ID of a person' } }, true, function(source, args)
    local src = source
    local targetId = tonumber(args[1])
    if not targetId then
        TriggerClientEvent('QBCore:Notify', src, 'Invalid ID', 'error')
        return
    end
    local driver, instructor = exports['qb-core']:GetPlayer(targetId), exports['qb-core']:GetPlayer(src)
    local driverID, instructorID = driver.PlayerData.citizenid, instructor.PlayerData.citizenid
    for i = 1, #Config.Instructors do
        if Config.Instructors[i] == instructorID then
            driver.PlayerData.metadata['licences'].driver = true
            driver.Functions.SetMetaData('licences', driver.PlayerData.metadata['licences'])
            return
        end
    end
    TriggerClientEvent('QBCore:Notify', src, 'You are not authorized to give driving licenses.', 'error')
end)

TriggerClientEvent('chat:addSuggestions', -1, {
    name = '/drivinglicense',
    help = 'Give a drivers license to someone',
    params = {
        {
            name = 'id',
            help = 'ID of a person'
        }
    }
})