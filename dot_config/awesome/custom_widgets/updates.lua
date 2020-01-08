-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local lain = require("lain")
local hotkeys_popup = require("awful.hotkeys_popup")
local colours = require("colours")

function createUpdatesWidget()
    return awful.widget.watch(
        "/home/asp437/.config/awesome/custom_widgets/arch-update",
        300,
        function(widget, stdout)
            widget:set_markup(' ' ..  stdout .. ' ')
        end
    )
end
