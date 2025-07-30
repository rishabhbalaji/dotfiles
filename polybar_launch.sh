#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get monitor names
# This command uses xrandr to list connected monitors, then cuts out their names
# and filters out disconnected/off entries.
MONITORS=$(xrandr --query | grep " connected" | cut -d" " -f1)

# Launch Polybar for each detected monitor
for m in $MONITORS; do
  if [ "$m" = "HDMI-1" ]; then # Ensure "HDMI-1" is correct
    MONITOR=$m polybar -c ~/.config/polybar/config.ini primary -r &
  else
    MONITOR=$m polybar -c ~/.config/polybar/config.ini secondary -r & # <--- This is the crucial line for eDP-1
  fi
done

echo "Polybar launched on all monitors..."