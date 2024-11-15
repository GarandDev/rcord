local rCord = require(script.Parent.rCord)
local secrets = require(script.secrets)

local RUN_TESTS = true

if RUN_TESTS then
    for _, test in pairs(script:GetChildren()) do
        local data = require(test)
        if not data.run then
            return
        end

        local startTime = os.time()
        local success, err = data.run(rCord.createWebhook(secrets[data.webhook]))
        local endTime = os.time() - startTime

        print(`[{success and "✅️" or "⛔"}] ran test '{data.name}', it took '{endTime}ms'`)
        if not success and err then
            print("[⛔]", err)
        end
    end
end