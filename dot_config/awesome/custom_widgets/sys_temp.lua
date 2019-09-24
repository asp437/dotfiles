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

function createSysTempWidget()
    return awful.widget.watch(
        "/home/asp437/.config/awesome/custom_widgets/temperature",
        5,
        function(widget, stdout)
            local text_color = colours.fg_normal
            local temp = gears.math.round(stdout)
            if temp > 55 then
                text_color = colours.text_red
            end
            prefix = '  '
            widget:set_markup(lain.util.markup(text_color, prefix .. temp .. '°C'))
        end
    )
end
