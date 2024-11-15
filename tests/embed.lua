-- this test should run perfectly. if not then either has unupdated syntax or bad http request

return {
    webhook = "EMBED_WEBHOOK", -- replace this with either your own webhook or the string to the secret
    name = "regular embed test",
    run = function(webhook)
        local message = webhook:createMessage()
        message:addEmbed(
            webhook:createEmbed()
                :setTitle("Test big embed")
                :setDescription("Wow this is just a test")
                :setColor(Color3.new(1, 0.447058, 0.447058))
                :setFooter({text = "Hello"})
                :setAuthor({name = "GarandDev"})
        )
    
        local success, response = webhook:send(message)

        if not success then
            return false, response.error
        end

        return true
    end
}