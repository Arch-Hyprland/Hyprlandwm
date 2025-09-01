#!/usr/bin/env bash
#    ___           __
#   / _ \___  ____/ /__
#  / // / _ \/ __/  '_/
# /____/\___/\__/_/\_\
#

if [ ! -f $HOME/.config/ml4w/settings/dock-disabled ]; then
    killall nwg-dock-hyprland
    sleep 0.5
    nwg-dock-hyprland -i 90 -p bottom -ico awn-applet -mb 5 -d -s style.css -c "/home/unicorn/.config/eww/scripts/applaucher.sh"
else
    echo ":: Dock disabled"
fi
