#!/bin/sh

killall -q .polybar-wrapper
killall -q polybar

# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

outputs=$(xrandr --query | grep " connected" | cut -d" " -f1)

for m in $outputs; do
    export MONITOR=$m

    polybar --reload mybar </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- &
    disown
done


# polybar mybar &

echo "Polybar launched..."
