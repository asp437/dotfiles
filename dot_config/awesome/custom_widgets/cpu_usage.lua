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

function createCPUUsageWidget()
    return lain.widget.cpu {
        settings = function()
            fg_color = colours.fg_normal
            if cpu_now.usage > 75 then
                fg_color = colours.text_red
            end
            prefix = '  '
            widget:set_markup(lain.util.markup(fg_color, prefix .. cpu_now.usage .. '%'))
        end
    }
end
