# rCord

**rCord** is a Discord webhook wrapper for Roblox, offering easy setup, complete type support, practical examples, and built-in proxy support.

[![Latest Release](https://img.shields.io/github/v/release/GarandDev/rcord)](https://github.com/GarandDev/rcord/releases/latest)
[![Contributors](https://img.shields.io/github/contributors/GarandDev/rcord)](https://github.com/GarandDev/rcord/graphs/contributors)
[![Issues](https://img.shields.io/github/issues/GarandDev/rcord)](https://github.com/GarandDev/rcord/issues)
[![Pull Requests](https://img.shields.io/github/issues-pr/GarandDev/rcord)](https://github.com/GarandDev/rcord/pulls)

## Features
* **Validator**: rCord includes a built-in validator that helps you catch errors in your messages before they reach the proxy.
* **Compact**: rCord is designed to be small and efficient, aiding in better organization of your workflow.
* **Types**: Enjoy comprehensive type checking in rCord, with every class and function available for autocompletion in your IDE.

## Installation

1. **Download the latest release**: Click the "Latest Release" badge above to navigate to the release page and download the latest version.
2. **Insert into your Roblox workspace**: Place the downloaded file into your Rojo project directory, or copy its contents and import them as a ModuleScript in Roblox Studio.

## Documentation
View the docs markdown at [this link](https://github.com/GarandDev/rcord/blob/main/DOCS.md)

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
