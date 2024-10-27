#!/bin/bash

# File to store the current state
STATE_FILE="$HOME/.config/hypr/gaps_state"

# Function to apply gaps
apply_gaps() {
    # Change the bellow gaps_out and gaps_in to your liking
    hyprctl --batch "keyword general:gaps_out 15;keyword general:gaps_in 10;keyword decoration:rounding 8"
    echo "1" > "$STATE_FILE"
}

# Function to remove gaps
remove_gaps() {
    hyprctl --batch "keyword general:gaps_out 0;keyword general:gaps_in 0;keyword decoration:rounding 0"
    echo "0" > "$STATE_FILE"
}

# Check if the state file exists, if not create it
if [ ! -f "$STATE_FILE" ]; then
    echo "0" > "$STATE_FILE"
fi

# Read the current state
current_state=$(cat "$STATE_FILE")

# Toggle the state
if [ "$current_state" = "0" ]; then
    apply_gaps
else
    remove_gaps
fi
