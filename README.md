# rCord

rCord is a Discord webhook wrapper for Roblox. It provides a easy setup, full type support, examples, and inbuilt proxy support.

[![Latest Release](https://img.shields.io/github/v/release/GarandDev/rcord)](https://github.com/GarandDev/rcord/releases/latest)
[![Contributors](https://img.shields.io/github/contributors/GarandDev/rcord)](https://github.com/GarandDev/rcord/graphs/contributors)
[![Issues](https://img.shields.io/github/issues/GarandDev/rcord)](https://github.com/GarandDev/rcord/issues)
[![Pull Requests](https://img.shields.io/github/issues-pr/GarandDev/rcord)](https://github.com/GarandDev/rcord/pulls)

## Installation

1. **Download the latest release**: Press on the "latest release" button above me, and download the file.
2. **Insertion into your Roblox workspace**: Either plop this file into your Rojo directory, or copy the contents of it and import it into Roblox as a module script.

### Usage
1. **Import rCord**
   ```lua
  local rCord = require(script.Parent.rCord) -- replace this with your path to rCord
   ```

2. **Initiliaze your webhook**
   ```lua
  local webhook = rCord.Webhook.new("https://discord.com/api/webhooks/.../...") -- replace this with your webhook url
   ```

3. **Send a generic message**
   ```lua
   webhook:send("Hello")
   webhook:send(rCord.Message.new():setContent("Hello"))
   ```

4. **Send an embed**
   ```lua
   local message = rCord.Message.new()
   message:addEmbed(
      message:createEmbed():setTitle("Wow! Embed"):setDescription("Wow, this is real")
   )
   webhook:send(message)
   ```

### Examples
Look into the examples folder :)
