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
local tp_smapi = lain.widget.contrib.tp_smapi()

function createBatteryWidget()
    bat = lain.widget.bat({
        timeout = 5,
        settings = function()
            if bat_now.status ~= nil then
                prefix = ''
                if bat_now.perc ~= 'N/A' then
                    local perc = bat_now.perc
                    local fg_color = colours.fg_normal

                    if perc < 20 then
                        fg_color = colours.text_red
                    end

                    local time = bat_now.time ~= 'N/A' and '(' .. bat_now.time .. ')' or ''
                    if bat_now.ac_status == 1 then
                        fg_color = colours.text_orange
                        if bat_now.status == "Full" then
                            fg_color = colours.text_green
                            widget:set_markup(lain.util.markup(fg_color, prefix))
                            return
                        end
                    end

                    widget:set_markup(lain.util.markup(fg_color, prefix .. ' ' .. perc .. '% ' .. time))
                else
                    widget:set_markup(lain.util.markup(colours.text_red, prefix .. ' ' .. bat_now.perc))
                end
            end
        end
    })
    return bat.widget
end
