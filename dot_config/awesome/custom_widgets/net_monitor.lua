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

function createNetMonWidgetShort()
    up_speed = 0
    down_speed = 0
    arrow_up = ''
    arrow_down = ''
    net_widget = lain.widget.net{
        notify = "on",
        wifi_state = "on",
        eth_state = "off",
        settings = function()
            if net_now then
                if net_now.carrier == '1' then
                    threshold = 100
                    up_color = colours.fg_normal
                    down_color = colours.fg_normal
                    if gears.math.round(net_now.sent) > threshold then
                        up_color = colours.text_green
                    end
                    if gears.math.round(net_now.received) > threshold then
                        down_color = colours.text_green
                    end
                    up_speed = net_now.sent
                    down_speed = net_now.received
                    widget:set_markup(lain.util.markup(up_color, arrow_up) .. lain.util.markup(down_color, arrow_down))
                else
                    widget:set_markup(lain.util.markup(colours.text_red, arrow_up .. arrow_down))
                end
            end
        end
    }
    net_tooltip = awful.tooltip {
        objects = { net_widget.widget },
        timer_function = function()
            return arrow_up .. ' ' .. up_speed .. '\n' .. arrow_down .. ' ' .. down_speed
        end
    }
    return net_widget
end
