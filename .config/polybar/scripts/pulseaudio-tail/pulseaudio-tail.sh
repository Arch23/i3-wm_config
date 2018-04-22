#!/bin/sh

sink=0

volume_up() {
    vol=$(pamixer --sink $sink --get-volume)
    if [ $vol -gt 95 ]; then
        pactl set-sink-volume $sink 100%
    else
        pactl set-sink-volume $sink +5%
    fi
}

volume_down() {
    vol=$(pamixer --sink $sink --get-volume)
    if [ $vol -lt 5 ]; then
        pactl set-sink-volume $sink 0%
    else
        pactl set-sink-volume $sink -5%
    fi
}

volume_mute() {
    pactl set-sink-mute $sink toggle
}

volume_print() {

    #if pacmd list-sinks | grep active | head -n 1 | grep -q speaker; then
    #    icon=""
    #elif pacmd list-sinks | grep active | head -n 1 | grep headphones; then
    #    icon=""
    #else
    #    icon=""
    #fi

    muted=$(pamixer --sink $sink --get-mute)

    if [ "$muted" = true ]; then
        #echo "$icon "
        echo ""
    else
        #echo "$icon $(pamixer --sink $sink --get-volume)%"
        echo "$(pamixer --sink $sink --get-volume)%"
    fi
}

listen() {
    volume_print

    pactl subscribe | while read -r event; do
        if echo "$event" | grep -q "#$sink"; then
            volume_print
        fi
    done
}

case "$1" in
    --up)
        volume_up
        ;;
    --down)
        volume_down
        ;;
    --mute)
        volume_mute
        ;;
    *)
        listen
        ;;
esac
