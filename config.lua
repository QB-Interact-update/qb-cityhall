Config = Config or {}
QBCore = exports['qb-core']:GetCoreObject()
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.AvailableJobs = {                                     -- Only used when not using qb-jobs.
    ['trucker'] = { ['label'] = 'Trucker', ['isManaged'] = false },
    ['taxi'] = { ['label'] = 'Taxi', ['isManaged'] = false },
    ['tow'] = { ['label'] = 'Tow Truck', ['isManaged'] = false },
    ['reporter'] = { ['label'] = 'News Reporter', ['isManaged'] = false },
    ['garbage'] = { ['label'] = 'Garbage Collector', ['isManaged'] = false },
    ['bus'] = { ['label'] = 'Bus Driver', ['isManaged'] = false },
    ['hotdog'] = { ['label'] = 'Hot Dog Stand', ['isManaged'] = false }
}

Config.Cityhalls = {
    { -- Cityhall 1
        coords = vector4(-265.09, -963.59, 30.22, 207.86),
        showBlip = true,
        blipData = {
            sprite = 487,
            display = 4,
            scale = 0.65,
            colour = 0,
            title = 'City Services'
        },
        ped = {
            model = 'a_m_m_hasjew_01',
            scenario = 'WORLD_HUMAN_STAND_MOBILE',
        },
        licenses = {
            ['id_card'] = {
                label = 'ID Card',
                cost = 50,
            },
            ['driver_license'] = {
                label = 'Driver License',
                cost = 50,
                metadata = 'driver'
            },
            ['weaponlicense'] = {
                label = 'Weapon License',
                cost = 50,
                metadata = 'weapon'
            },
        }
    },
}

Config.DrivingSchools = {
    { -- Driving School 1
        coords = vec3(240.3, -1379.89, 33.74),
        showBlip = true,
        blipData = {
            sprite = 225,
            display = 4,
            scale = 0.65,
            colour = 3,
            title = 'Driving School'
        },
        ped = {
            model = 'a_m_m_eastsa_02',
            scenario = 'WORLD_HUMAN_STAND_MOBILE',
        },
        instructors = {
            'DJD56142',
            'DXT09752',
            'SRI85140',
        }
    },
}
