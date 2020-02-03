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
    status = ''
    updates_widget = awful.widget.watch(
        "/home/asp437/.config/awesome/custom_widgets/arch-update -s",
        30,
        function(widget, stdout)
            output = gears.string.split(stdout, '\n')
            updates_count = tonumber(output[1])
            fg_color = colours.fg_normal
            if updates_count > 0 then
                fg_color = colours.text_red
            end
            widget:set_markup(lain.util.markup(fg_color, '  '))
            status = output[2] .. '\n' .. output[3]
        end
    )
    updates_tooltip = awful.tooltip {
        objects = { updates_widget },
        timer_function = function()
            return status
        end
    }
    return updates_widget
end
