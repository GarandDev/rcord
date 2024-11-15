# rCord

### rCord.createWebhook(): `Webhook`
```lua
local webhook = rCord.createWebhook()
```

### rCord.Webhook: `Webhook`
```lua
local webhook = rCord.Webhook.new()
```
> [!NOTE]
> This is usually done via [`rCord.createWebhook()`](#rcordcreatewebhook-webhook)

### rCord.Embed: `Embed`
```lua
local embed = rCord.Embed.new()
```
> [!NOTE]
> This is usually done via [`webhook:createEmbed()`](./webhook.md#webhookcreateembed-embed)

### rCord.Message: `Message`
```lua
local message = rCord.Message.new()
```
> [!NOTE]
> This is usually done via [`webhook:createMessage()`](./webhook.md#webhookcreatemessage-message)
