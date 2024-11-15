-- Made by GarandDev via https://github.com/GarandDev/rcord
-- Contributors: kaan650

local HttpService = game:GetService("HttpService")

local DEBUG = false

export type ResponseData = {
	success: boolean,
	statusCode: number,
	statusMessage: string,
	body: string?,
	error: string?
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
	new: (url: string | Secret) -> WebhookClass,
	constructor: (self: WebhookClass, url: string) -> nil,
	createMessage: (self: WebhookClass) -> MessageClass,
	createEmbed: (self: WebhookClass) -> EmbedClass,
	send: (self: WebhookClass, body: string | Message, wait: boolean?, thread_id: string?) -> (boolean, ResponseData),
	url: string | Secret,
}

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
	end
	function Webhook:createMessage(): MessageClass
		return Message.new()
	end
	function Webhook:createEmbed(): EmbedClass
		return Embed.new()
	end
	function Webhook:convertToUrl(thread_id, wait)
		local addon = `?wait={tostring(wait)}{thread_id and `&thread_id={thread_id}` or ""}`
		if typeof(self.url) ~= "Secret" then
			return self.url .. addon
		end

		return self.url:AddSuffix(addon)
	end
	function Webhook:send(body, wait, thread_id)
		wait = wait or false
		if typeof(body) == "string" then
			local content = body
			body = Message.new():setContent(content)
		end

		local valid, err = body:validateMessage() -- validate message before hitting discord
		if not valid then
			return false, {
				error = err
			}
		end
	
		local url = self:convertToUrl(thread_id, wait)
		local jsonBody = body:toJSON()

		if DEBUG then
			print(`[rCord]: Sending webhook with data `, jsonBody)
			print(`[rCord]: Sending using URL {url}`)
		end

		local success, data = pcall(HttpService.RequestAsync, HttpService, {
			Url = url,
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
			},
			Body = HttpService:JSONEncode(jsonBody),
			Compress = Enum.HttpCompression.None
		})
		
		return success, {
			success = data.Success,
			statusCode = data.StatusCode,
			statusMessage = data.StatusMessage,
			body = data.Body,
			error = if not success then "an error occurred while sending to discord, find the error in the response data" else nil
		} :: ResponseData
	end
end

return {
	createWebhook = function(url: string | Secret): WebhookClass
		return Webhook.new(url)
	end,

	Embed = Embed :: EmbedClass,
	Webhook = Webhook :: WebhookClass,
	Message = Message :: MessageClass,
}