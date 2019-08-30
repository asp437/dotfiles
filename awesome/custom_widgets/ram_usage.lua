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

function createRAMUsageWidget()
    return awful.widget.watch(
        "free",
        5,
        function(widget, stdout)
            usage = 0
            for line in stdout:gmatch("[^\r\n]+") do
                if (gears.string.startswith(line, "Mem")) then
                    raw_vals = gears.string.split(line, ' ')
                    vals = {}
                    for val in gears.table.iterate(raw_vals, function(t) return t ~= nil end) do
                        if (val ~= "") then
                            table.insert(vals, val)
                        end
                    end
                end
            end
            usage = gears.math.round((vals[3] / vals[2] * 100))
            fg_color = colours.fg_normal
            if usage > 75 then
                fg_color = colours.text_red
            end
            prefix = '  '
            widget:set_markup(lain.util.markup(fg_color, prefix .. usage .. '%'))
        end
    )
end
