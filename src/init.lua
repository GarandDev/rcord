local HttpService = game:GetService("HttpService")

local DEBUG = false

local DEFAULT_PROXY = "garand" -- the proxy it will use
local USE_GARAND_PROXY = "https://api.rbxgarand.xyz/useThisProxy" -- if you have chosen garand proxy it will check here if it is alive
local PROXIES = {
	newstargeted = "https://webhook.newstargeted.com/api/webhooks/%s/%s",
	lewisakura = "https://webhook.lewisakura.moe/api/webhooks/%s/%s",
	garand = "https://api.rbxgarand.xyz/api/webhooks/%s/%s",
}

export type EmbedFooter = {
    text: string,
    icon_url: string?,
    proxy_icon_url: string?,
}

export type EmbedField = {
    name: string,
    value: string,
    inline: boolean?,
}

export type EmbedImage = {
    url: string,
    height: number?,
    width: number?,
}

export type EmbedThumbnail = {
    url: string,
    height: number?,
    width: number?,
}

export type EmbedProvider = {
    name: string,
    url: string?,
}

export type EmbedAuthor = {
    name: string,
    url: string?,
    icon_url: string?,
}

export type EmbedType = {
    title: string?,
    type: string?,
    description: string?,
    url: string?,
    timestamp: string?,
    color: number?,
    footer: EmbedFooter?,
    image: EmbedImage?,
    thumbnail: EmbedThumbnail?,
    provider: EmbedProvider?,
    author: EmbedAuthor?,
    fields: {EmbedField}?,
}

export type MessageType = {
    content: string?,
    username: string?,
    avatar_url: string?,
    tts: boolean?,
    embeds: { EmbedClass | EmbedType }?,
	thread_name: string?
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
	getCharacters: (self: EmbedClass) -> number,
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
	setThreadName: (self: MessageClass, name: string) -> MessageClass,
    addEmbed: (self: MessageClass, embed: EmbedClass) -> MessageClass,
	validateMessage: (self: MessageClass) -> (boolean, string?),
    data: MessageType,
}

export type WebhookClass = {
    new: (url: string) -> WebhookClass,
    constructor: (self: WebhookClass, url: string) -> nil,
	createMessage: (self: WebhookClass) -> MessageClass,
	createEmbed: (self: WebhookClass) -> EmbedClass,
	createCustomProxy: (self: WebhookClass, conversionUrl: string) -> ProxyClass,
    setProxy: (self: WebhookClass, proxy: string | ProxyClass) -> nil,
    send: (self: WebhookClass, body: string | Message, wait: boolean?, thread_id: string?) -> (boolean, string),
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
	function Proxy:isGarandProxyAlive()
		if DEFAULT_PROXY ~= "garand" then
			return
		end

		local success, response = pcall(function()
			return HttpService:JSONDecode(HttpService:GetAsync(USE_GARAND_PROXY))
		end)

		return success and (response or {})["useThisProxy"] or false
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
	function Embed:getCharacters()
		local characters = 0

		for _,v in pairs({self.data.title, self.data.description, (self.data.footer or {}).text, (self.data.author or {}).name}) do
			characters += string.len(v or "")
		end

		for _,v in pairs(self.data.fields or {}) do
			characters += (string.len(v.name) + string.len(v.value))
		end

		return characters
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
	function Message:setThreadName(name)
		self.data.thread_name = name
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
	function Message:validateMessage()
		local content = self.data.content
		local embeds = self.data.embeds
		if (not content or content == "") and (not embeds or #embeds == 0) then
			return false, "no content and no embeds"
		end

		if content and string.len(content) > 2000 then
			return false, "over 2000 characters"
		end

		if #(embeds or {}) > 10 then
			return false, "over 10 embeds"
		end

		local total = 0
		for _, v in pairs(self.data.embeds or {}) do
			total += v:getCharacters()
		end

		if total > 6000 then
			return false, "embeds characters are over 6000"
		end

		return true
	end
end

local HAS_CHECKED_LIFE_OF_GARAND_PROXY = false
local IS_GARAND_PROXY_ALIVE = true

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
		self:setProxy(DEFAULT_PROXY)
	end
	function Webhook:setProxy(proxy)
		if typeof(proxy) ~= "string" then
			self.proxy = proxy
		else
			self.proxy = PROXIES[proxy]
		end

		if proxy == "garand" and not HAS_CHECKED_LIFE_OF_GARAND_PROXY then
			IS_GARAND_PROXY_ALIVE = self.proxy:isGarandProxyAlive()
			HAS_CHECKED_LIFE_OF_GARAND_PROXY = true
		end

		if not IS_GARAND_PROXY_ALIVE then
			print("[IMPORTANT] You chose 'garand' proxy, but it is offline or out of service. Automatically choosing 'newstargeted' proxy")
			self.proxy = PROXIES["newstargeted"]
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
	function Webhook:send(body, wait, thread_id)
		wait = wait or false
		if typeof(body) == "string" then
			local content = body
			body = Message.new():setContent(content)
		end

		local valid, err = body:validateMessage() -- validate message before hitting proxy
		if not valid then
			return false, err
		end

		if DEBUG then
			print("Sending webhook with data ", body:toJSON())
			print("Sending using URL ",string.format("%s?wait=%s%s", self.proxy:generateUrl(self.url), tostring(wait), thread_id and "&thread_id=" ..thread_id or ""))
		end

		local success, response = pcall(function()
			return HttpService:PostAsync(
				string.format("%s?wait=%s%s", self.proxy:generateUrl(self.url), tostring(wait), thread_id and "&thread_id=" ..thread_id or ""),
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