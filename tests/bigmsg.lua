-- this test should fail. if it doesn't then idk why lmfao, firstly it should get picked up by the validator, and if not by some reason then discord should throw it off

return {
    webhook = "BIGMSG_WEBHOOK", -- replace this with either your own webhook or the string to the secret
    name = "big message validator",
    run = function(webhook)
        local str = "" -- create large string (probably better ways)
        repeat str = str .. "aaaaaaaa" until #str > 3000
    
        local message = webhook:createMessage()
        message:setContent(str)
        
        local success = webhook:send(message)
        return not success -- the reason why are making false=true here is because it's supposed to fail
    end
}