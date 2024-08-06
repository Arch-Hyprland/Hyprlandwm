#!/bin/bash
# __        ______    _____  __  __           _       
# \ \      / /  _ \  | ____|/ _|/ _| ___  ___| |_ ___ 
#  \ \ /\ / /| |_) | |  _| | |_| |_ / _ \/ __| __/ __|
#   \ V  V / |  __/  | |___|  _|  _|  __/ (__| |_\__ \
#    \_/\_/  |_|     |_____|_| |_|  \___|\___|\__|___/
#                                                    

# Open rofi to select the Hyprshade filter for toggle
options="$(ls ~/.config/hypr/effects/wallpaper/)\noff"

# Open rofi
choice=$(echo -e "$options" | rofi -dmenu -replace -config ~/.config/rofi/config-themes.rasi -i -no-show-icons -l 5 -width 30 -p "Hyprshade") 
if [ ! -z $choice ] ;then
    echo "$choice" > ~/.config/ml4w/settings/wallpaper-effect.sh
    dunstify "Changing Wallpaper Effect to " "$choice"
    ~/.config/hypr/scripts/wallpaper.sh
fi