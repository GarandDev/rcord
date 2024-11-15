# Using rCord

Here you will see how you use rCord in your project.

## Importing rCord
First we will import the rCord module into your script.
```lua
local rCord = require(..) -- Adjust this to your path
```

## Registering your webhook
Now, register your webhook.
```lua
local webhook = rCord.createWebhook("https://discord.com/api/webhooks/.../...")
```

## Sending a Message
This will send a generic message to your webhook.
```lua
webhook:send("Hello")
```
![alt text](/assets/preview/sendingMessage.png)

## Sending an Embed
This will send a compact embed to your webhook.
```lua
local message = webhook:createMessage()
message:addEmbed(
   webhook:createEmbed():setTitle("Wow! Embed"):setDescription("Wow, this is real")
)

webhook:send(message)
```
![alt text](/assets/preview/sendingEmbed.png)