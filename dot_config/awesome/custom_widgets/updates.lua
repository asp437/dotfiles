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

function getLinesCount(updateOutput, block_name, metric_name, command)
    awful.spawn.easy_async(
        command,
        function(stdout, stderr, exitreason, exitcode)
            updateOutput[block_name][metric_name] = gears.string.linecount(stdout) - 1
        end
    )
end

function createUpdatesWidget()
    local widget_text = {}
    widget_text['updates'] = {}
    widget_text['count'] = {}
    widget_text['count']['AUR'] = 0
    widget_text['count']['pacman'] = 0
    widget_text['updates']['AUR'] = 0
    widget_text['updates']['pacman'] = 0

    local updates_new_widget = wibox.widget {
        markup = 'test',
        align  = 'center',
        valign = 'center',
        widget = wibox.widget.textbox,
        buttons = gears.table.join(
            awful.button({}, 1, function(t)
                getLinesCount(widget_text, 'updates', 'pacman', 'checkupdates')
                getLinesCount(widget_text, 'updates', 'AUR', 'pikaur -Quaq')
                getLinesCount(widget_text, 'count', 'pacman', 'pacman -Qen')
                getLinesCount(widget_text, 'count', 'AUR', 'pacman -Qm')
            end)
        )
    }

    local update_func = function()
        updates_count = tonumber(widget_text['updates']['AUR']) + tonumber(widget_text['updates']['pacman'])
        fg_color = colours.fg_normal
        if updates_count > 0 then
            fg_color = colours.text_red
        end
        updates_new_widget:set_markup(lain.util.markup(fg_color, '  '))
        return
    end

    gears.timer {
        timeout   = 900,
        call_now  = true,
        autostart = true,
        callback  = function()
            getLinesCount(widget_text, 'updates', 'pacman', 'checkupdates')
            getLinesCount(widget_text, 'updates', 'AUR', 'pikaur -Quaq')
            getLinesCount(widget_text, 'count', 'pacman', 'pacman -Qen')
            getLinesCount(widget_text, 'count', 'AUR', 'pacman -Qm')
        end
    }

    gears.timer {
        timeout   = 5,
        call_now  = true,
        autostart = true,
        callback  = update_func
    }

    updates_tooltip = awful.tooltip {
        objects = { updates_new_widget },
        timer_function = function()
            ret = 'Packages: ' .. widget_text['count']['pacman'] .. ' (AUR: ' .. widget_text['count']['AUR'] .. ')\n'
            ret = ret .. 'Updates: ' .. widget_text['updates']['pacman'] .. ' (AUR: ' .. widget_text['updates']['AUR'] .. ')'
            return ret
        end
    }

    return updates_new_widget
end
