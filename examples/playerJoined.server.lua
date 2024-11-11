local Players = game:GetService("Players")

local rCord = require(script.Parent.Parent.rCord)
local Webhook = rCord.createWebhook('https://discord.com/api/webhooks/.../...')

Players.PlayerAdded:Connect(function(player)
    local message = Webhook:createMessage()
    message:setContent("New player joined")
    message:addEmbed(
        Webhook:createEmbed()
            :setTitle("Player joined!!!!")
            :setDescription("Player **" .. player.Name .. "** has joined!")
    )

    local success, response = Webhook:send(message)
    assert(success, "Failed to send webhook :(((( response: " .. response)
end)