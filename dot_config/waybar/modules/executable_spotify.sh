#!/bin/bash

# Define constants
PLAYER="spotify"
MAX_LENGTH=40
PLAY_ICON=""
PAUSE_ICON=""

# Function to truncate text
truncate_text() {
    local text="$1"
    if [[ ${#text} -gt $MAX_LENGTH ]]; then
        echo "${text:0:$MAX_LENGTH}..."
    else
        echo "$text"
    fi
}

# Get player status
status=$(playerctl metadata --player=$PLAYER --format '{{lc(status)}}')

# Initialize variables
text=""
icon=""

case $status in
    "playing")
        icon=$PLAY_ICON
        info=$(playerctl metadata --player=$PLAYER --format '{{artist}} - {{title}}')
        text="$(truncate_text "$info") $icon"
        ;;
    "paused")
        icon=$PAUSE_ICON
        text=$icon
        ;;
    "stopped"|*)
        # No text or icon for stopped state or any other state
        ;;
esac

# Output JSON
echo -e "{\"text\":\"$text\", \"class\":\"$status\"}"
