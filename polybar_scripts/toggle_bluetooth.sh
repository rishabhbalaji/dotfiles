#!/bin/sh

# Toggles Bluetooth power using bluetoothctl

if bluetoothctl show | grep "Powered: yes" > /dev/null; then
  bluetoothctl power off
else
  bluetoothctl power on
fi