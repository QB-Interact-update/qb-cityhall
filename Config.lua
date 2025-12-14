Config = {}
Items, Jobs = exports['qb-core']:GetSharedItems(), exports['qb-core']:GetSharedJobs()
Config.Licenses = {
    {name = 'driver_license',     label = 'Driver License',     license = 'driver', price = 100},
    {name = 'id_card',            label = 'ID Card',            license = 'invalid', price = 50},
    {name = 'weapons_license',    label = 'Weapons License',    license = 'weapon', price = 75},
    {name = 'pilot_license',      label = 'Pilot License',      license = 'pilot', price = 5000},
    {name = 'fishing_license',    label = 'Fishing License',    license = 'fishing', price = 200},
    {name = 'hunting_license',    label = 'Hunting License',    license = 'hunting', price = 300},
    {name = 'boat_license',       label = 'Boat License',       license = 'boat', price = 150},
}

Config.Jobs = {
    {name = 'tow',      label = 'Tow Truck Driver', description = 'Help stranded vehicles on the road.',     image = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1ukW9A1-SE7PlDDyvw83FZBjjEKw6qoBtOA&s'},
    {name = 'taxi',     label = 'Taxi Driver',      description = 'Transport passengers around the city.',   image = 'https://gtacars.net/images/f8482ba54ef46318e61c84fedf386a64'},
    {name = 'reporter',  label = 'News Reporter',   description = 'Deliver goods across long distances.',    image='https://img.gta5-mods.com/q75/images/media-eup-pack-livepd-press-stringer/4d187c-Thumb1.png'},
    {name = 'garbage', label = 'Garbage Collector', description = 'Collect and manage waste in the city.',   image = 'https://img.gta5-mods.com/q75/images/los-angeles-sanitation-for-trash2/1e1327-20160715222000_1.jpg'},
    {name = 'trucker',  label = 'Truck Driver',     description = 'Deliver goods across long distances.',    image='https://i.imgur.com/z1gp9R5.jpeg'},
    {name = 'bus',     label = 'Bus Driver',        description = 'Operate buses and transport passengers.', image = 'https://gtamag.com/images/photo/gta-mag-Busdelaeroport2-046542.jpg'},
    {name = 'hotdog',    label = 'Hot Dog Vendor',  description = 'Sell hot dogs to pedestrians.',           image = 'https://img.youtube.com/vi/Xi5G0TYTwKo/0.jpg'}
}

Config.Locations = {
    { -- Cityhall 1
        coords = vector4(-265.09, -963.59, 30.22, 207.86),
        ped = {
            model = 'a_m_m_hasjew_01',
            scenario = 'WORLD_HUMAN_STAND_MOBILE',
        },
    },
}

Config.Instructors = {
    'ABC1234'
}