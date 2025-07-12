#    ___           __
#   / _ \___  ____/ /__
#  / // / _ \/ __/  '_/
# /____/\___/\__/_/\_\
#


config="$HOME/.config/gtk-3.0/settings.ini"
if [ ! -f $HOME/.config/ml4w/settings/dock-disabled ]; then
    killall nwg-dock-hyprland
    sleep 0.5
    prefer_dark_theme="$(grep 'gtk-application-prefer-dark-theme' "$config" | sed 's/.*\s*=\s*//')"
    if [ $prefer_dark_theme == 0 ]; then
        style="style-light.css"
    else
        style="style-dark.css"
    fi
    nwg-dock-hyprland -i 80 -p bottom -mb 5 -d -ico awn-applet -s $style -c  "/home/unicorn/.config/eww/scripts/applaucher.sh"
else
    echo ":: Dock disabled"
fi
