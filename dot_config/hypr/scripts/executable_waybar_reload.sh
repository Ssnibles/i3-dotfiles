#!/bin/bash

CONFIG="$HOME/.config/waybar/new-conf"
CSS="$HOME/.config/waybar/style.css"
CONFIG_FILES="$CONFIG $CSS"

trap "killall waybar" EXIT

while true; do
    waybar -c $CONFIG
    inotifywait -e create,modify $CONFIG_FILES
    killall waybar
done
