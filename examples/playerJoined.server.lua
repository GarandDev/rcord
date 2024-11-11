local Players = game:GetService("Players")

local rCord = require(script.Parent.Parent.rCord)
local Webhook = rCord.Webhook.new('https://discord.com/api/webhooks/1302027217915871384/wqm1CY7TG4CuRgj6mlkUPDWTC7yiqaqxE4M0gRA5HPPXMs8iyR7xZmeVPdE9p48m5SDm')

Players.PlayerAdded:Connect(function(player)
    local message = rCord.Message.new()
    message:setContent("New player joined")
    message:addEmbed(message:createEmbed():setTitle("Player joined!!!!"):setDescription("Player **" .. player.Name .. "** has joined!"))

    local success, response = Webhook:send(message)
    assert(success, "Failed to send webhook :(((( response: " .. response)
end)