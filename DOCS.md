## rCord
### createWebhook(url: string): WebhookClass
```lua
-- Creates a webhook object and returns it to you. 
rCord.createWebhook("https://discord.com/api/webhooks/.../...") 
```

---

## Webhook
### createMessage(): MessageClass
```lua
-- Creates a message object and returns it to you.
webhook:createMessage() 
```

### createEmbed(): EmbedClass
```lua
-- Creates an embed object and returns it to you.
webhook:createEmbed() 
```

### createCustomProxy(conversionUrl: string): ProxyClass
```lua
-- Creates a proxy object and returns it to you.
webhook:createCustomProxy("https://webhook.proxything.com/api/webhooks/%s/%s") 
```

### setProxy(proxy: string | ProxyClass): nil
```lua
-- Sets the proxy for the webhook. Can accept either a string key of a proxy or a ProxyClass instance.
webhook:setProxy("newstargeted")
```

### send(body: string | MessageClass): (boolean, string)
```lua
-- Sends a message, can either be a string key or a MessageClass.
local success, response = webhook:send("Hello, world!")
```

---

## Message
### setContent(content: string): MessageClass
```lua
-- Sets the content of the message.
message:setContent("Hello, this is a message.")
```

### setUsername(username: string): MessageClass
```lua
-- Sets the username for the message.
message:setUsername("Example User")
```

### setAvatarUrl(avatarUrl: string): MessageClass
```lua
-- Sets the avatar URL for the message.
message:setAvatarUrl("https://example.com/avatar.png")
```

### setTTS(tts: boolean): MessageClass
```lua
-- Enables or disables text-to-speech for the message.
message:setTTS(true)
```

### addEmbed(embed: EmbedClass): MessageClass
```lua
-- Adds an embed to the message.
message:addEmbed(embed)
```

### toJSON(): MessageType
```lua
-- Converts the message object to a JSON-encoded table for sending.
local json = message:toJSON()
```

---

## Embed
### setTitle(title: string): EmbedClass
```lua
-- Sets the title of the embed.
embed:setTitle("My Embed Title")
```

### setType(type: string): EmbedClass
```lua
-- Sets the type of the embed.
embed:setType("rich")
```

### setDescription(description: string): EmbedClass
```lua
-- Sets the description of the embed.
embed:setDescription("This is an example description.")
```

### setUrl(url: string): EmbedClass
```lua
-- Adds a URL to the embed.
embed:setUrl("https://example.com")
```

### setTimestamp(timestamp: string): EmbedClass
```lua
-- Sets a timestamp for the embed.
embed:setTimestamp("2024-11-02T12:34:56Z")
```

### setColor(color: number | Color3): EmbedClass
```lua
-- Sets the color of the embed. Accepts a number or a Color3 value.
embed:setColor(0xFF5733)
```

### setFooter(body: EmbedFooter): EmbedClass
```lua
-- Sets the footer of the embed.
embed:setFooter({text = "Footer Text", icon_url = "https://example.com/icon.png"})
```

### setImage(body: EmbedImage): EmbedClass
```lua
-- Sets the image of the embed.
embed:setImage({url = "https://example.com/image.png", width = 100, height = 100})
```

### setThumbnail(body: EmbedThumbnail): EmbedClass
```lua
-- Sets the thumbnail of the embed.
embed:setThumbnail({url = "https://example.com/thumbnail.png"})
```

### setProvider(body: EmbedProvider): EmbedClass
```lua
-- Sets the provider of the embed.
embed:setProvider({name = "Provider Name", url = "https://provider.com"})
```

### setAuthor(body: EmbedAuthor): EmbedClass
```lua
-- Sets the author of the embed.
embed:setAuthor({name = "Author Name", url = "https://example.com", icon_url = "https://example.com/icon.png"})
```

### addField(field: EmbedField): EmbedClass
```lua
-- Adds a field to the embed.
embed:addField({name = "Field Name", value = "Field Value", inline = true})
```

---

## Proxy
### generateUrl(url: string): string
```lua
-- Generates a new URL using the specified conversion URL format.
Proxy:generateUrl("https://discord.com/api/webhooks/.../...")
```
