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
esac
