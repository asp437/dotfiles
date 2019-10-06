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

function createNetMonWidget()
    return lain.widget.net{
        notify = "on",
        wifi_state = "on",
        eth_state = "off",
        settings = function()
            if net_now then
                if net_now.state == "up" then
                    widget:set_markup(lain.util.markup(colours.fg_normal, ' 直 ﰵ' .. net_now.sent .. ' ﰬ' .. net_now.received))
                else
                    widget:set_markup(lain.util.markup(colours.text_red, ' 睊No Connection'))
                end
            end
        end
    }
end
