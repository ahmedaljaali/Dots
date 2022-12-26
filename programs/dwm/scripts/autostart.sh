#! /usr/bin/bash

nitrogen --restore &

dunst -config ~/.config/dunst/dunstrc &

picom --experimental-backends &

# Setup lock screen image
betterlockscreen -u ~/wallpapers/castle.jpg --dim 40 --blur 1 &

#lock screen
xidlehook --detect-sleep --not-when-audio --timer 60 'light -S 20' 'light -S 75' --timer 60  "notify-send -u critical -t 30000 'LOCKING THE SCREEN IN 30 SECONDS'"  "light -S 75&&notify-send -u critical -t 10000 'Cancelled'" --timer 30 "betterlockscreen -l dimblur" "light -S 75"  --timer 300 'systemctl suspend' 'light -S 75' &

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
nm-applet &

redshift-gtk &

/usr/lib/geoclue-2.0/demos/agent &

# Switch between Arabic and English
setxkbmap -option grp:alt_shift_toggle us,ar &

# see https://unix.stackexchange.com/a/295652/332452
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
