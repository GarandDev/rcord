# rCord

**rCord** is a small compact Discord webhook wrapper for [Roblox](https://devforum.roblox.com/t/rcord-v101-a-discord-webhook-api-wrapper-for-roblox/3253045), offering easy setup, complete type support, practical examples.

[![Latest Release](https://img.shields.io/github/v/release/GarandDev/rcord)](https://github.com/GarandDev/rcord/releases/latest)
[![Contributors](https://img.shields.io/github/contributors/GarandDev/rcord)](https://github.com/GarandDev/rcord/graphs/contributors)
[![Issues](https://img.shields.io/github/issues/GarandDev/rcord)](https://github.com/GarandDev/rcord/issues)
[![Pull Requests](https://img.shields.io/github/issues-pr/GarandDev/rcord)](https://github.com/GarandDev/rcord/pulls)

## Features
* **Validator**: rCord includes a built-in validator that helps you catch errors in your messages before they reach discord servers.
* **Compact**: rCord is designed to be small and efficient, aiding in better organization of your workflow.
* **Types**: Enjoy comprehensive type checking in rCord, with every class and function available for autocompletion in your IDE.

## Installation
### Using Roblox or Rojo
1. **Download the latest release**: Click the "Latest Release" badge above to navigate to the release page and download the latest version.
2. **Insert into your Roblox workspace**: Place the downloaded file into your Rojo project directory, or copy its contents and import them as a ModuleScript in Roblox Studio.

### Using Wally
1. **Download Wally**: Follow this tutorial: https://devforum.roblox.com/t/how-to-install-wally/1757494
2. **Add rCord to dependency**: Copy the code from [this](https://wally.run/package/garanddev/rcord) site under "Metadata". And put that in your dependencies.

## Documentation
View the docs markdown at [this link](https://github.com/GarandDev/rcord/blob/main/DOCS.md) (may have few mistakes as most of it was automated)

## Usage

### 1. Import rCord
```lua
local rCord = require(script.Parent.rCord) -- Adjust this path as needed
```

### 2. Initialize Your Webhook
```lua
local webhook = rCord.createWebhook("https://discord.com/api/webhooks/.../...") -- Replace with your webhook URL
```

### 3. Send a Generic Message
```lua
webhook:send("Hello")
webhook:send(webhook:createMessage():setContent("Hello"))
```

### 4. Send an Embed
```lua
local message = webhook:createMessage()
message:addEmbed(
   webhook:createEmbed():setTitle("Wow! Embed"):setDescription("Wow, this is real")
)
webhook:send(message)
```

## Examples
For additional usage examples, refer to the `examples` folder.
