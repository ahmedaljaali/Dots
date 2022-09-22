#! /usr/bin/bash

nitrogen --restore &

dunst -config ~/.config/dunst/dunstrc &

picom --experimental-backends &

# Setup lock screen image
betterlockscreen -u ~/wallpapers/castle.jpg --dim 40 --blur 1 &

#lock screen
xidlehook  --not-when-audio --timer 60 'light -S 30' 'light -S 50' --timer 10  "notify-send -u critical -t 10000 'LOCKING THE SCREEN IN 30 SECONDS'"  "light -S 50&&notify-send -u critical -t 10000 'Cancelled'" --timer 30 "betterlockscreen -l dimblur" "light -S 50"  --timer 300 'systemctl suspend' 'light -S 50' &

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
nm-applet &

redshift-gtk &

/usr/lib/geoclue-2.0/demos/agent &

# Switch between Arabic and English
setxkbmap -option grp:alt_shift_toggle us,ar &
