# Embed

### Embed.new(): `Embed`
```lua
local webhook = rCord.Embed.new()
```
> [!NOTE]
> This is usually not used, as a the function [`webhook:createEmbed()`](./webhook.md#webhookcreateembed-embed) does the same thing.

### Embed:setTitle(`title: string`): `Embed`
```lua
embed:setTitle("My embed title")
```

### Embed:setDescription(`description: string`): `Embed`
```lua
embed:setDescription("Example description")
```

### Embed:setType(`type: string`): `Embed`
```lua
embed:setType("rich")
```

### Embed:setUrl(`url: string`): `Embed`
```lua
embed:setUrl("https://example.com")
```

### Embed:setTimestamp(`timestamp: string`): `Embed`
```lua
embed:setTimestamp("2024-11-02T12:34:56Z")
```

### Embed:setColor(`timestamp: number | Color3`): `Embed`
```lua
embed:setColor(Color3.new(255, 255, 255))
```

### Embed:setFooter(`body: EmbedFooter`): `Embed`
```lua
embed:setFooter({text = "Footer Text", icon_url = "https://example.com/icon.png"})
```

### Embed:addField(`field: EmbedField`): `Embed`
```lua
embed:addField({name = "Field Name", value = "Field Value", inline = true})
```

### Embed:setImage(`body: EmbedImage`): `Embed`
```lua
embed:setImage({url = "https://example.com/image.png", width = 100, height = 100})
```

### Embed:setThumbnail(`body: EmbedThumbnail`): `Embed`
```lua
embed:setThumbnail({url = "https://example.com/thumbnail.png"})
```

### Embed:setProvider(`body: EmbedProvider`): `Embed`
```lua
embed:setProvider({name = "Provider Name", url = "https://provider.com"})
```

### Embed:setAuthor(`body: EmbedAuthor`): `Embed`
```lua
embed:setAuthor({name = "Author Name", url = "https://example.com", icon_url = "https://example.com/icon.png"})
```