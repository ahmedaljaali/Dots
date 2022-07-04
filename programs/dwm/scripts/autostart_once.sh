#! /usr/bin/bash


#lock screen
exec betterlockscreen -u ~/wallpapers/Sunset.png --dim 40 -b 3 & # Setup the lock screen image
exec xidlehook --not-when-fullscreen --timer 60 'light -S 30' 'light -S 50' --timer 10  "notify-send -u critical -t 10000 'LOCKING THE SCREEN IN 30 SECONDS'"  "light -S 50&&notify-send -u critical -t 10000 'Cancelled'" --timer 30 "betterlockscreen -l dimblur" "light -S 50"  --timer 300 'systemctl suspend' 'light -S 50' &

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec nm-applet &

# Redshift
exec redshift-gtk &

# Switch between Arabic and English
exec setxkbmap -option grp:alt_shift_toggle us,ar &
