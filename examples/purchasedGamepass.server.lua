local MarketplaceService = game:GetService("MarketplaceService")

local rCord = require(script.Parent.Parent.rCord)
local Webhook = rCord.createWebhook('https://discord.com/api/webhooks/.../...')

MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player, passId, wasPurchased)
    if wasPurchased then
        local message = Webhook:createMessage()
        message:addEmbed(
            Webhook:createEmbed()
                :setTitle("Player bought gamepass")
                :setDescription("Player **" .. player.Name .. "** bought gamepass **" .. tostring(passId) .. "**!")
        )

        local success, response = Webhook:send(message)
        assert(success, "Failed to send webhook :(((( response: " .. response)
    end
end)