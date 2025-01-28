#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.5; done

# Function to launch polybar
launch_polybar() {
  MONITOR=$1 polybar &
}

# Get all connected monitors
MONITORS=$(xrandr --query | grep " connected" | cut -d" " -f1)

# Launch polybar on each monitor
echo "Launching Polybar on monitors: $MONITORS"
echo "$MONITORS" | while read -r monitor; do
  echo "Launching on $monitor"
  launch_polybar "$monitor"
done

echo "Polybar launched..."
