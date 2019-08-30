-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

function createBacklightWidget()
    return awful.widget.watch(
        "xbacklight -get",
        1,
        function(widget, stdout)
            prefix = '  '
            widget:set_text(prefix .. gears.math.round(stdout))
        end
    )
end
