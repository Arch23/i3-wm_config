#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload arch-top &
  done
else
  polybar --reload top &
fi

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected primary" | cut -d" " -f1); do
    MONITOR=$m polybar --reload arch-bottom &
  done
else
  polybar --reload bottom &
fi