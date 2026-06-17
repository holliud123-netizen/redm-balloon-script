-- Database setup (Opcional)
-- Se quiser usar banco de dados para rastrear quem usou o balão
-- Este arquivo pode ser deixado vazio ou descomentado para usar MySQL

-- Descomente abaixo se estiver usando MySQL
--[[
MySQL.Async.execute([[
    CREATE TABLE IF NOT EXISTS balloon_usage (
        id INT AUTO_INCREMENT PRIMARY KEY,
        identifier VARCHAR(255),
        username VARCHAR(100),
        spawn_location VARCHAR(100),
        flight_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )
]])

function LogBalloonUsage(identifier, username, location)
    MySQL.Async.execute(
        'INSERT INTO balloon_usage (identifier, username, spawn_location) VALUES (@identifier, @username, @location)',
        {
            ['@identifier'] = identifier,
            ['@username'] = username,
            ['@location'] = location
        }
    )
end
]]
