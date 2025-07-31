#!/bin/sh
# Polybar script to display the last wallpaper update time

TIMESTAMP_FILE="/tmp/last_wallpaper_update.txt"

if [ -f "$TIMESTAMP_FILE" ]; then
    TIMESTAMP=$(cat "$TIMESTAMP_FILE")
    # Convert Unix timestamp to human-readable format (e.g., "08:30 PM")
    # Using date command: +%I:%M %p (12-hour with AM/PM) or +%H:%M (24-hour)
    HUMAN_TIME=$(date -d "@$TIMESTAMP" +"%H:%M") # Adjust format as desired (e.g. +%b %d %H:%M)

    # Output for Polybar
    echo "  $HUMAN_TIME" # Using a download/arrow icon from Nerd Fonts
else
    echo " N/A" # Not available if file doesn't exist yet
fi