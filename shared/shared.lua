-- Configuração do Balão
Config = {}

Config.BalloonModel = 'hotairballoon01x'

Config.SpawnLocations = {
    {
        x = 410.2,
        y = 662.2,
        z = 111.5,
        heading = 0.0,
        label = 'Strawberry'
    },
    {
        x = -330.5,
        y = 1205.3,
        z = 95.3,
        heading = 90.0,
        label = 'Rhodes'
    },
    {
        x = 1262.4,
        y = -883.2,
        z = 156.8,
        heading = 180.0,
        label = 'Saint Denis'
    },
    {
        x = -1858.5,
        y = -430.2,
        z = 161.3,
        heading = 270.0,
        label = 'Annesburg'
    }
}

Config.Controls = {
    ASCEND = 121,      -- Q
    DESCEND = 120,     -- Z
    LEFT = 174,        -- Left Arrow
    RIGHT = 175,       -- Right Arrow
    FORWARD = 32,      -- W
    BACKWARD = 33,     -- S
    HORN = 56,         -- Alt
    EXIT = 47,         -- G
}

Config.BalloonPhysics = {
    MaxAltitude = 500.0,
    MinAltitude = 10.0,
    AscentSpeed = 2.5,
    DescentSpeed = 1.8,
    MaxHorizontalSpeed = 15.0,
    DriftSpeed = 0.8,
}

-- Acesso ao balão: 'admin' = apenas admin, 'all' = todos, 'whitelist' = lista branca
Config.AccessMode = 'all' -- Mude para 'whitelist' para usar lista branca

-- Lista branca de players (use steamid ou license)
Config.Whitelist = {
    -- 'steam:1100001234567890',
    -- 'license:cfxxxxxxxxxxxxxxxxxxx',
}
