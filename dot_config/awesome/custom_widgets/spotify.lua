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
-- local dbus = require("dbus")
local hotkeys_popup = require("awful.hotkeys_popup")
local colours = require("colours")

function createSpotifyWidget()
    local widget = wibox.widget {
        markup = ' Spotify',
        align  = 'center',
        valign = 'center',
        widget = wibox.widget.textbox,
        buttons = gears.table.join(
            awful.button({}, 1, function()
            end)
        )
    }

    tooltip = awful.tooltip {
        objects = { widget },
        markup = 'test'
    }

    name = 'ru.user.asp437'
    dbus.release_name('session', name)
    local request_succ = dbus.request_name('session', name)
    local tooltip_text
    gears.debug.dump("request_succ: " .. tostring(request_succ))
    dbus.add_match(
        'session',
        "type='signal', interface='org.freedesktop.DBus.Properties', path='/org/mpris/MediaPlayer2', member='PropertiesChanged'"
    )
    signal_handler = function (...)
        gears.debug.dump('signal caught')
        local data = {...}
        local content = data[3]
        if content['Metadata'] ~= nil then
            tooltip_text = 'Artist: ' .. tostring(content['Metadata']['xesam:artist'][1]) .. '\n'
            tooltip_text = tooltip_text .. 'Track: ' .. tostring(content['Metadata']['xesam:title']) .. '\n'
            tooltip_text = tooltip_text .. 'Album: ' .. tostring(content['Metadata']['xesam:album']) .. '\n'
            tooltip.markup = lain.util.markup(fg_color, tooltip_text)
        end
        gears.debug.dump(data)
    end
    local signal_interface = 'org.freedesktop.DBus.Properties'
    dbus.disconnect_signal(signal_interface, signal_handler)
    dbus.connect_signal(signal_interface, signal_handler )

    return widget
end
