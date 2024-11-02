# rCord Documentation

The **rCord** documentation for the different classes

### Proxy
#### generateUrl(url: string)
```lua
Proxy:generateUrl("[https://](https://webhook.proxything.com/api/webhooks/%s/%s)")
```
**Description**: Generates a new URL using the specified conversion URL format.

### Embed
#### setTitle(title: string)
```lua
embed:setTitle("My Embed Title")
```
**Description**: Sets the title of the embed.

#### setType(type: string)
```lua
embed:setType("rich")
```
**Description**: Sets the type of the embed.

#### setDescription(description: string)
```lua
embed:setDescription("This is an example description.")
```
**Description**: Sets the description of the embed.

### setUrl(url: string)
```lua
embed:setUrl("https://example.com")
```
**Description**: Adds a URL to the embed.

### setTimestamp(timestamp: string)
```lua
embed:setTimestamp("2024-11-02T12:34:56Z")
```
**Description**: Sets a timestamp for the embed.

### setColor(color: number | Color3)
```lua
embed:setColor(0xFF5733)
```
**Description**: Sets the color of the embed. Accepts a number or a `Color3` value.

### setFooter(body: EmbedFooter)
```lua
embed:setFooter({text = "Footer Text", icon_url = "https://example.com/icon.png"})
```
**Description**: Sets the footer of the embed.

### setImage(body: EmbedImage)
```lua
embed:setImage({url = "https://example.com/image.png", width = 100, height = 100})
```
**Description**: Sets the image of the embed.

### setThumbnail(body: EmbedThumbnail)
```lua
embed:setThumbnail({url = "https://example.com/thumbnail.png"})
```
**Description**: Sets the thumbnail of the embed.

### setProvider(body: EmbedProvider)
```lua
embed:setProvider({name = "Provider Name", url = "https://provider.com"})
```
**Description**: Sets the provider of the embed.

### setAuthor(body: EmbedAuthor)
```lua
embed:setAuthor({name = "Author Name", url = "https://example.com", icon_url = "https://example.com/icon.png"})
```
**Description**: Sets the author of the embed.

### addField(field: EmbedField)
```lua
embed:addField({name = "Field Name", value = "Field Value", inline = true})
```
**Description**: Adds a field to the embed.

## Message
### setContent(content: string)
```lua
message:setContent("Hello, this is a message.")
```
**Description**: Sets the content of the message.

### setUsername(username: string)
```lua
message:setUsername("Example User")
```
**Description**: Sets the username for the message.

### setAvatarUrl(avatarUrl: string)
```lua
message:setAvatarUrl("https://example.com/avatar.png")
```
**Description**: Sets the avatar URL for the message.

### setTTS(tts: boolean)
```lua
message:setTTS(true)
```
**Description**: Enables or disables text-to-speech for the message.

### createEmbed()
```lua
local embed = message:createEmbed()
```
**Description**: Creates a new embed object to be added to the message.

### addEmbed(embed: EmbedClass)
```lua
message:addEmbed(embed)
```
**Description**: Adds an embed to the message.

### toJSON()
```lua
local json = message:toJSON()
```
**Description**: Converts the message object to a JSON-encoded table for sending.

### Webhook
#### createMessage()
```lua
local message = webhook:createMessage()
```
**Description**: Creates a new message object for the webhook and returns it to you.

#### setProxy(proxy: string | ProxyClass)
```lua
webhook:setProxy("newstargeted")
```
**Description**: Sets a new proxy for the webhook.

#### send(body: string | MessageClass)
```lua
webhook:send("Simple message")
```
**Description**: Sends a message either in a string or a message class.
```
