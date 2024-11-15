# Webhook

### Webhook.new(`url: string`): `Webhook`
```lua
local webhook = rCord.Webhook.new()
```
> [!NOTE]
> This is usually not used, as a the function [`rCord.createWebhook()`](./rcord.md#rcordcreatewebhook-webhook) does the same thing.

### Webhook:createMessage(): `Message`
```lua
local message = webhook:createMessage()
```

### Webhook:createEmbed(): `Embed`
```lua
local message = webhook:createEmbed()
```

### Webhook:send(`body: string | Message`, `wait: boolean?`, `thread_id: string?`): `(boolean, ResponseData)`
```lua
local success, response = webhook:send("Hello")
```