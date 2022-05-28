#!/bin/sh

# [... default stuff that your distro may throw in here ...] #

# Set up an icon tray
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --tint 0x5f5f5f --height 18 &

# Set the default X cursor to the usual pointer
xsetroot -cursor_name left_ptr

# Set a nice background
nitrogen &

# Fire up screensaver
xscreensaver -no-splash &

# Nitrogen
nitrogen --restore &


exec xmonad