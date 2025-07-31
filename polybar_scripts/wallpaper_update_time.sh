#!/bin/sh
# Polybar script to display time elapsed since last wallpaper update

TIMESTAMP_FILE="/tmp/last_wallpaper_update.txt"

if [ -f "$TIMESTAMP_FILE" ]; then
    LAST_UPDATE_TIMESTAMP=$(cat "$TIMESTAMP_FILE")
    CURRENT_TIMESTAMP=$(date +%s) # Get current Unix timestamp

    # Calculate time difference in seconds
    TIME_DIFF=$((CURRENT_TIMESTAMP - LAST_UPDATE_TIMESTAMP))

    if [ "$TIME_DIFF" -lt 0 ]; then
        # Should not happen, but handle if clock goes backward or file is from future
        ELAPSED_TIME="N/A (future?)"
    elif [ "$TIME_DIFF" -lt 60 ]; then
        # Less than 1 minute
        ELAPSED_TIME="${TIME_DIFF}s"
    elif [ "$TIME_DIFF" -lt 3600 ]; then
        # Less than 1 hour (display as M:SS)
        MINUTES=$((TIME_DIFF / 60))
        SECONDS=$((TIME_DIFF % 60))
        # Pad seconds with leading zero if less than 10
        ELAPSED_TIME=$(printf "%d:%02d" "$MINUTES" "$SECONDS")
    else
        # 1 hour or more (display as H:MM:SS)
        HOURS=$((TIME_DIFF / 3600))
        MINUTES=$(( (TIME_DIFF % 3600) / 60 ))
        SECONDS=$((TIME_DIFF % 60))
        # Pad minutes and seconds with leading zeros
        ELAPSED_TIME=$(printf "%d:%02d:%02d" "$HOURS" "$MINUTES" "$SECONDS")
    fi

    # Output for Polybar
    echo "󰋩  $ELAPSED_TIME" # Using a download/arrow icon from Nerd Fonts
else
    echo "  N/A" # Not available if file doesn't exist yet
fi