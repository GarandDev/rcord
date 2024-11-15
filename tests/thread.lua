-- this test should run perfectly. if not then either has unupdated syntax or bad http request or another reason related to threads

local THREAD_ID = require(script.Parent.secrets)["THREAD_ID"]

return {
    webhook = "THREAD_WEBHOOK", -- replace this with either your own webhook or the string to the secret
    name = "run in thread",
    run = function(webhook)
        local message = webhook:createMessage()
        message:setContent("Hello thread.")
    
        local success, response = webhook:send(message, false, THREAD_ID)
        if not success then
            return false, response.error
        end

        return true
    end
}