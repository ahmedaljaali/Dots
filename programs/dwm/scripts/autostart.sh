#! /usr/bin/bash

# Nitrogen
exec nitrogen --restore &

exec dunst -config ~/.config/dunst/dunstrc &

exec picom --experimental-backends &
