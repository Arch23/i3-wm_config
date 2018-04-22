#!/usr/bin/env sh

if type "xrandr"; then
    count=$(xrandr --query | grep " connected" | wc -l)
    if [ $count == 2 ]; then
        ret=$(xrandr --query | grep "HDMI" | wc -l)
        if [ $ret == 1 ]; then
            /bin/bash ~/.i3/script/monitor-hdmi.sh &
        fi
    else
       /bin/bash ~/.i3/script/monitor-laptop.sh &
    fi
    /bin/bash ~/.config/polybar/launch.sh &
fi