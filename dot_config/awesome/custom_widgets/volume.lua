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

function createVolumeWidget()
    return awful.widget.watch(
        "pulsemixer --get-mute --get-volume",
        1,
        function(widget, stdout)
            out = gears.string.split(stdout, ' ')
            if gears.string.startswith(out[1], '0') then
                -- Volume
                fg_color = colours.fg_normal
                if tonumber(out[2]) > 100 then
                    fg_color = colours.text_red
                end
                widget:set_markup(lain.util.markup(fg_color, "  " .. out[2]))
            else
                -- Mute
                widget:set_text("  M")
            end
        end,
        wibox.widget {
            widget = wibox.widget.textbox,
            buttons = gears.table.join(
                awful.button({}, 1, function(t) awful.spawn('pulsemixer --toggle-mute') end),
                awful.button({}, 3, function(t) awful.spawn('pavucontrol') end)
            )
        }
    )
end
