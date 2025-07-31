#!/bin/sh
# Custom lock script for dynamic, styled i3lock-color screen
# Takes current screenshot, updates betterlockscreen cache, then locks.

IMG="/tmp/current_lock_screen_bg.png" # Temporary screenshot file

# 1. Take a screenshot of the current screen
# Adjust -q 75 for quality/speed tradeoff
scrot -z -q 25 "$IMG"

# 2. Update betterlockscreen's cache with the new screenshot
# This will apply blur, dim, and other effects defined in ~/.config/betterlockscreen/betterlockscreenrc
betterlockscreen -u "$IMG" --fx

# 3. Lock the screen with betterlockscreen (which uses the newly cached image)
betterlockscreen -l

# 4. Clean up the temporary screenshot
rm "$IMG"

exit 0