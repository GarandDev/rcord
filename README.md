<div align="center">

   <img src="./docs/public/banner.png" height="70px" width="auto" height="auto" />

   <a href="https://rcord.rbxgarand.xyz" rel="noopener noreferrer" target="_blank"><img src="./docs/public/installs/docs.png" width="auto" height="18px" /></a>
   <img src="./docs/public/installs/dot.png" width="auto" height="18px" />
   <a href="https://wally.run/package/garanddev/rcord" rel="noopener noreferrer" target="_blank"><img src="./docs/public/installs/wally.png" width="auto" height="18px" /></a>
   <img src="./docs/public/installs/dot.png" width="auto" height="18px" />
   <a href="https://github.com/garanddev/rcord" rel="noopener noreferrer" target="_blank"><img src="./docs/public/installs/repo.png" width="auto" height="18px" /></a>

   Allows for Webhooks in Roblox via **rCord**
   - - -
</div>

<div align="center">

   [![Latest Release](https://img.shields.io/github/v/release/GarandDev/rcord)](https://github.com/GarandDev/rcord/releases/latest)
   [![Contributors](https://img.shields.io/github/contributors/GarandDev/rcord)](https://github.com/GarandDev/rcord/graphs/contributors)
   [![Issues](https://img.shields.io/github/issues/GarandDev/rcord)](https://github.com/GarandDev/rcord/issues)
   [![Pull Requests](https://img.shields.io/github/issues-pr/GarandDev/rcord)](https://github.com/GarandDev/rcord/pulls)
</div>

rCord allows you to easily deploy webhooks in your game, allowing you to have a better view of your game.
- Full type support via both LuaU Language Server and native Roblox. 📱
- Read our new [documentation page](https://rcord.rbxgarand.xyz) where you can learn about all the workings of rCord 📝
- Compact and lightweight, allowing for fast deployment. 🤏
- Fast and without proxy, no worrying about proxy downtime. ️💨
- Easy syntax inspired by [discord.js](https://discord.js.org). 👍
- - -

<h3>Example usage</h3>

```lua
local Players = game:GetService("Players")

local rCord = require(script.Parent.rCord) -- Adjust this path as needed
local webhook = rCord.createWebhook("https://discord.com/api/webhooks/.../...")

Players.PlayerAdded:Connect(function(player)
   webhook:send("Player " .. player.Name.. " joined!")
end)
```