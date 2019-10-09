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
    local has_backlight = true
    -- awful.spawn.with_line_callback('xbacklight -get', {
    --     stdout = function(line)
    --         if line == '' or line == nil then
    --             has_backlight = false
    --         else
    --             has_backlight = true
    --         end
    --     end
    -- })
    if has_backlight then
        return awful.widget.watch(
            "xbacklight -get",
            1,
            function(widget, stdout)
                if stdout == '' or stdout == nil then
                    return
                end
                prefix = '  '
                widget:set_text(prefix .. gears.math.round(stdout))
            end
        )
    else
        return nil
    end
end
