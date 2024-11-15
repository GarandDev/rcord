# Message

### Message.new(): `Message`
```lua
local webhook = rCord.Message.new()
```
> [!NOTE]
> This is usually not used, as a the function [`webhook:createMessage()`](./webhook.md#webhookcreatemessage-message) does the same thing.

### Message:setContent(`content: string`): `Message`
```lua
message:setContent("This is the content of the message")
```

### Message:setUsername(`username: string`): `Message`
```lua
message:setUsername("BobIsBest")
```

### Message:setAvatarUrl(`avatarUrl: string`): `Message`
```lua
message:setAvatarUrl("https://example.com/avatar.png")
```

### Message:setTTS(`tts: boolean`): `Message`
```lua
message:setTTS(true)
```

### Message:addEmbed(`embed: Embed`): `Message`
```lua
message:addEmbed(webhook:createEmbed())
```

### Message:toJSON(): `MessageType`
```lua
local json = message:toJSON()
```