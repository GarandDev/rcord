local MarketplaceService = game:GetService("MarketplaceService")

local rCord = require(script.Parent.Parent.rCord)
local Webhook = rCord.Webhook.new('https://discord.com/api/webhooks/1302027217915871384/wqm1CY7TG4CuRgj6mlkUPDWTC7yiqaqxE4M0gRA5HPPXMs8iyR7xZmeVPdE9p48m5SDm')

MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player, passId, wasPurchased)
    if wasPurchased then
        local message = rCord.Message.new()
        message:addEmbed(message:createEmbed():setTitle("Player bought gamepass"):setDescription("Player **" .. player.Name .. "** bought gamepass **" .. tostring(passId) .. "**!"))

        local success, response = Webhook:send(message)
        assert(success, "Failed to send webhook :(((( response: " .. response)
    end
end)