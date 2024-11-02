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

#### setUrl(url: string)
```lua
embed:setUrl("https://example.com")
```
**Description**: Adds a URL to the embed.

#### setTimestamp(timestamp: string)
```lua
embed:setTimestamp("2024-11-02T12:34:56Z")
```
**Description**: Sets a timestamp for the embed.

#### setColor(color: number | Color3)
```lua
embed:setColor(0xFF5733)
```
**Description**: Sets the color of the embed. Accepts a number or a `Color3` value.

#### addField(field: EmbedField)
```lua
embed:addField({name = "Field Name", value = "Field Value", inline = true})
```
**Description**: Adds a field to the embed.

### Message
#### setContent(content: string)
```lua
message:setContent("Hello, this is a message.")
```
**Description**: Sets the content of the message.

#### setUsername(username: string)
```lua
message:setUsername("Example User")
```
**Description**: Sets the username for the message.

#### setAvatarUrl(avatarUrl: string)
```lua
message:setAvatarUrl("https://example.com/avatar.png")
```
**Description**: Sets the avatar URL for the message.

#### createEmbed()
```lua
message:createEmbed()
```
**Description**: Creates a new embed object for the message and returns it to you.

#### addEmbed(embed: EmbedClass)
```lua
message:addEmbed(embed)
```
**Description**: Adds an embed to the message.

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
