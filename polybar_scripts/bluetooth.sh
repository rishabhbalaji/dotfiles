#!/bin/sh

# Requires `bluetoothctl` and a Nerd Font for icons ()

# Check if Bluetooth is powered on
if bluetoothctl show | grep "Powered: yes" > /dev/null; then
    # Check if any device is connected (optional, if you want different icons for connected/disconnected)
    # if bluetoothctl info | grep "Device" > /dev/null; then
    #     echo "%{F#2193ff}" # Blue icon if powered and connected
    # else
    #     echo "" # Default icon if powered but no device connected
    # fi
    # Simple: just show blue icon if powered on, regardless of connection
    echo "%{F#2193ff}" # Blue icon if powered on
else
    echo "%{F#66ffffff}" # Grey icon if powered off
fi