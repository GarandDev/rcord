local HttpService = game:GetService("HttpService")

local DEFAULT_PROXY = "newstargeted"
local PROXIES = {
	newstargeted = "https://webhook.newstargeted.com/api/webhooks/%s/%s",
	lewisakura = "https://webhook.lewisakura.moe/api/webhooks/%s/%s",
}

export type EmbedFooter = {
    text: string,
    icon_url: string | nil,
    proxy_icon_url: string | nil,
}

export type EmbedField = {
    name: string,
    value: string,
    inline: boolean | nil,
}

export type EmbedImage = {
    url: string,
    height: number | nil,
    width: number | nil,
}

export type EmbedThumbnail = {
    url: string,
    height: number | nil,
    width: number | nil,
}

export type EmbedProvider = {
    name: string,
    url: string | nil,
}

export type EmbedAuthor = {
    name: string,
    url: string | nil,
    icon_url: string | nil,
}

export type EmbedType = {
    title: string | nil,
    type: string | nil,
    description: string | nil,
    url: string | nil,
    timestamp: string | nil,
    color: number | nil,
    footer: EmbedFooter | nil,
    image: EmbedImage | nil,
    thumbnail: EmbedThumbnail | nil,
    provider: EmbedProvider | nil,
    author: EmbedAuthor | nil,
    fields: {EmbedField} | nil,
}

export type MessageType = {
    content: string | nil,
    username: string | nil,
    avatar_url: string | nil,
    tts: boolean | nil,
    embeds: { EmbedClass | EmbedType } | nil,
}

export type EmbedClass = {
    new: () -> EmbedClass,
    constructor: (self: EmbedClass) -> nil,
    setTitle: (self: EmbedClass, title: string) -> EmbedClass,
    setType: (self: EmbedClass, body: "rich" | "image" | "video" | "gifv" | "article" | "link") -> EmbedClass,
    setDescription: (self: EmbedClass, description: string) -> EmbedClass,
    setUrl: (self: EmbedClass, url: string) -> EmbedClass,
    setTimestamp: (self: EmbedClass, timestamp: string) -> EmbedClass,
    setColor: (self: EmbedClass, color: number | Color3) -> EmbedClass,
    setFooter: (self: EmbedClass, body: EmbedFooter) -> EmbedClass,
    setImage: (self: EmbedClass, body: EmbedImage) -> EmbedClass,
    setThumbnail: (self: EmbedClass, body: EmbedThumbnail) -> EmbedClass,
    setProvider: (self: EmbedClass, body: EmbedProvider) -> EmbedClass,
    setAuthor: (self: EmbedClass, body: EmbedAuthor) -> EmbedClass,
    addField: (self: EmbedClass, body: EmbedField) -> EmbedClass,
    data: EmbedClass
}

export type ProxyClass = {
    new: (conversionUrl: string) -> ProxyClass,
    constructor: (self: ProxyClass, conversionUrl: string) -> nil | ProxyClass,
    generateUrl: (self: ProxyClass, url: string) -> string,
    conversionUrl: string,
}

export type MessageClass = {
    new: () -> MessageClass,
    constructor: (self: MessageClass) -> nil,
    toJSON: (self: MessageClass) -> MessageType,
    setContent: (self: MessageClass, content: string) -> MessageClass,
    setUsername: (self: MessageClass, username: string) -> MessageClass,
    setAvatarUrl: (self: MessageClass, avatarUrl: string) -> MessageClass,
    setTTS: (self: MessageClass, tts: boolean) -> MessageClass,
    addEmbed: (self: MessageClass, embed: EmbedClass) -> MessageClass,
    data: MessageType,
}

export type WebhookClass = {
    new: (url: string) -> WebhookClass,
    constructor: (self: WebhookClass, url: string) -> nil,
	createMessage: (self: WebhookClass) -> MessageClass,
	createEmbed: (self: WebhookClass) -> EmbedClass,
	createCustomProxy: (self: WebhookClass, conversionUrl: string) -> ProxyClass,
    setProxy: (self: WebhookClass, proxy: string | ProxyClass) -> nil,
    send: (self: WebhookClass, body: string | Message) -> (boolean, string),
    url: string,
    proxy: WebhookClass,
}

local Proxy
do
	Proxy = setmetatable({}, {
		__tostring = function()
			return "Proxy"
		end,
	})
	Proxy.__index = Proxy
	function Proxy.new(...)
		local self = setmetatable({}, Proxy)
		return self:constructor(...) or self
	end
	function Proxy:constructor(conversionUrl)
		self.conversionUrl = conversionUrl
	end
	function Proxy:generateUrl(url)
		local parts = string.split(url, "/")
		local id = parts[#parts - 1]
		local token = parts[#parts]
		return string.format(self.conversionUrl, id, token)
	end
end

for k, v in PROXIES do -- allows for "config" variable to stay in top
	PROXIES[k] = Proxy.new(v)
end

local Embed
do
	Embed = setmetatable({}, {
		__tostring = function()
			return "Embed"
		end,
	})
	Embed.__index = Embed
	function Embed.new(...)
		local self = setmetatable({}, Embed)
		return self:constructor(...) or self
	end
	function Embed:constructor()
		self.data = {}
	end
	function Embed:setTitle(title)
		self.data.title = title
		return self
	end
	function Embed:setType(body)
		self.data.type = body
		return self
	end
	function Embed:setDescription(description)
		self.data.description = description
		return self
	end
	function Embed:setUrl(url)
		self.data.url = url
		return self
	end
	function Embed:setTimestamp(timestamp)
		self.data.timestamp = timestamp
		return self
	end
	function Embed:setColor(color)
		if typeof(color) == "Color3" then
			color = tonumber(color:ToHex(), 16)
		end
		self.data.color = color
		return self
	end
	function Embed:setFooter(body)
		self.data.footer = body
		return self
	end
	function Embed:setImage(body)
		self.data.image = body
		return self
	end
	function Embed:setThumbnail(body)
		self.data.thumbnail = body
		return self
	end
	function Embed:setProvider(body)
		self.data.provider = body
		return self
	end
	function Embed:setAuthor(body)
		self.data.author = body
		return self
	end
	function Embed:addField(body)
		if not self.data.fields then
			self.data.fields = { body }
		end
		table.insert(self.data.fields, body)
		return self
	end
end

local Message
do
	Message = setmetatable({}, {
		__tostring = function()
			return "Message"
		end,
	})
	Message.__index = Message
	function Message.new(...)
		local self = setmetatable({}, Message)
		return self:constructor(...) or self
	end
	function Message:constructor()
		self.data = {}
	end
	function Message:toJSON()
		local newData = table.clone(self.data)
		setmetatable(newData, nil)
		if newData.embeds then
			newData.embeds = {}
			for _, value in self.data.embeds do
				if getmetatable(value) == Embed then
					table.insert(newData.embeds, value.data)
				end
			end
		end
		return newData
	end
	function Message:setContent(content)
		self.data.content = content
		return self
	end
	function Message:setUsername(username)
		self.data.username = username
		return self
	end
	function Message:setAvatarUrl(avatarUrl)
		self.data.avatar_url = avatarUrl
		return self
	end
	function Message:setTTS(tts)
		self.data.tts = tts
		return self
	end
	function Message:addEmbed(embed)
		if not self.data.embeds then
			self.data.embeds = { embed }
		else
			table.insert(self.data.embeds, embed)
		end
		return self
	end
end

local Webhook
do
	Webhook = setmetatable({}, {
		__tostring = function()
			return "Webhook"
		end,
	})
	Webhook.__index = Webhook
	function Webhook.new(...)
		local self = setmetatable({}, Webhook)
		return self:constructor(...) or self
	end
	function Webhook:constructor(url)
		self.url = url
		self.proxy = PROXIES[DEFAULT_PROXY]
	end
	function Webhook:setProxy(proxy)
		if typeof(proxy) ~= "string" then
			self.proxy = proxy
		else
			self.proxy = PROXIES[proxy]
		end
	end
	function Webhook:createMessage(): MessageClass
		return Message.new()
	end
	function Webhook:createEmbed(): EmbedClass
		return Embed.new()
	end
	function Webhook:createCustomProxy(conversionUrl: string): ProxyClass
		return Proxy.new(conversionUrl)
	end
	function Webhook:send(body)
		if typeof(body) == "string" then
			local content = body
			body = Message.new():setContent(content)
		end
		local success, response = pcall(function()
			return HttpService:PostAsync(
				self.proxy:generateUrl(self.url),
				HttpService:JSONEncode(body:toJSON()),
				Enum.HttpContentType.ApplicationJson,
				false
			)
		end)
		return success, response
	end
end

return {
	createWebhook = function(url: string): WebhookClass
		return Webhook.new(url)
	end,

    Embed = Embed :: EmbedClass,
    Webhook = Webhook :: WebhookClass,
    Message = Message :: MessageClass,
	Proxy = Proxy :: ProxyClass,
}