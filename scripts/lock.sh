#!/bin/sh
# Custom i3lock blur/gradient script using i3lock-color

# Variables for paths and colors
IMG="/tmp/i3lock.png"
ICON="$HOME/.config/i3/lock.png" # You can put a small lock icon here later
LOCK_COLOR="#282A2E" # Your background color (from Polybar/Alacritty)
TEXT_COLOR="#EAEAEA" # Your foreground color
ACCENT_COLOR="#8BE9FD" # Your accent color

# Take a screenshot (optimized for speed/quality)
scrot -z -q 75 "$IMG" # Adjusted quality to 75 for speed

# Apply a transparent gradient overlay (instead of blur)
# This creates a dark gradient from top to bottom, semi-transparent
convert "$IMG" -size 2x"$(xdpyinfo | grep dimensions | awk '{print $2}' | cut -d'x' -f2)" gradient:"$LOCK_COLOR"-"$LOCK_COLOR" -alpha set -channel A -evaluate set 50% +channel -background none -compose over -gravity north -composite "$IMG"

# Add optional custom text (Time and Date) - i3lock-color supports this directly
# You can add more features as desired here, like custom icons
# Add a lock icon (optional) - place a lock.png in ~/.config/i3/
# if [ -f "$ICON" ]; then
#   convert "$IMG" "$ICON" -gravity center -composite "$IMG"
# fi

# Lock the screen with the stylized i3lock-color
i3lock -i "$IMG" \
    --ring-width 4 \
    --line-uses-inside \
    #--keycolor="$ACCENT_COLOR" \
    --bshlcolor="$ACCENT_COLOR" \
    --separatorcolor="$LOCK_COLOR" \
    --insidevercolor="$LOCK_COLOR" \
    --insidewrongcolor="$LOCK_COLOR" \
    --ringvercolor="$TEXT_COLOR" \
    --ringwrongcolor="$TEXT_COLOR" \
    --veriftext="Verifying..." \
    --wrongtext="Wrong!" \
    --noinputtext="No input" \
    --locktext="" \
    --radius 100 \
    --indicator \
    --color="$LOCK_COLOR" \
    --time-str="%H:%M:%S" \
    --date-str="%A, %B %e" \
    --time-font="JetBrainsMono Nerd Font" \
    --date-font="JetBrainsMono Nerd Font" \
    --layout-font="JetBrainsMono Nerd Font" \
    --verif-font="JetBrainsMono Nerd Font" \
    --wrong-font="JetBrainsMono Nerd Font" \
    --noinput-font="JetBrainsMono Nerd Font" \
    --lock-font="JetBrainsMono Nerd Font" \
    --timecolor="$TEXT_COLOR" \
    --datecolor="$TEXT_COLOR" \
    --layoutcolor="$TEXT_COLOR" \
    --greetertext="" \
    --ignore-empty-password \
    --force-clock \
    --pass-screen-dim

# Clean up the temporary screenshot
rm "$IMG"