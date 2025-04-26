# ------------------------------------------------------
# Apps Installation
# ------------------------------------------------------
_writeHeader "Apps"
echo "Installing the ML4W Apps now..."
_removeLegacyApp() {
    app_name=$1
    if [ -f /usr/share/applications/$app_name.desktop ]; then
        sudo rm /usr/share/applications/$app_name.desktop
    fi
    if [ -f /usr/share/icons/hicolor/128x128/apps/$app_name.png ]; then
        sudo rm /usr/share/icons/hicolor/128x128/apps/$app_name.png
    fi
    if [ -f /usr/bin/$app_name ]; then
        sudo rm /usr/bin/$app_name
        _writeLog 1 "Legacy $app_name App removed successfully"
    fi
}

# Create local applications folder if not exits
if [ ! -d $HOME/.local/share/applications/ ]; then
    mkdir $HOME/.local/share/applications
    _writeLog 1 "$HOME/.local/share/applications created"
fi

# Remove legacy ML4W Apps
_removeLegacyApp "com.ml4w.welcome"
_removeLegacyApp "com.ml4w.dotfilessettings"
_removeLegacyApp "com.ml4w.hyprland.settings"

# Installation of ML4W Flatpaks from GitHub

ml4w_app="com.ml4w.welcome"
ml4w_app_repo="dotfiles-welcome"
echo ":: Installing $ml4w_app"
curl -s https://raw.githubusercontent.com/mylinuxforwork/packages-installer/main/setup.sh | bash -s -- -y -p flatpak -s https://raw.githubusercontent.com/mylinuxforwork/$ml4w_app_repo/master/$ml4w_app.pkginst $ml4w_app &>>$(_getLogFile)

ml4w_app="com.ml4w.settings"
ml4w_app_repo="dotfiles-settings"
echo ":: Installing $ml4w_app"
curl -s https://raw.githubusercontent.com/mylinuxforwork/packages-installer/main/setup.sh | bash -s -- -y -p flatpak -s https://raw.githubusercontent.com/mylinuxforwork/$ml4w_app_repo/master/$ml4w_app.pkginst $ml4w_app &>>$(_getLogFile)

ml4w_app="com.ml4w.sidebar"
ml4w_app_repo="dotfiles-sidebar"
echo ":: Installing $ml4w_app"
curl -s https://raw.githubusercontent.com/mylinuxforwork/packages-installer/main/setup.sh | bash -s -- -y -p flatpak -s https://raw.githubusercontent.com/mylinuxforwork/$ml4w_app_repo/master/$ml4w_app.pkginst $ml4w_app &>>$(_getLogFile)

ml4w_app="com.ml4w.calendar"
ml4w_app_repo="dotfiles-calendar"
echo ":: Installing $ml4w_app"
curl -s https://raw.githubusercontent.com/mylinuxforwork/packages-installer/main/setup.sh | bash -s -- -y -p flatpak -s https://raw.githubusercontent.com/mylinuxforwork/$ml4w_app_repo/master/$ml4w_app.pkginst $ml4w_app &>>$(_getLogFile)

ml4w_app="com.ml4w.hyprlandsettings"
ml4w_app_repo="hyprland-settings"
echo ":: Installing $ml4w_app"
curl -s https://raw.githubusercontent.com/mylinuxforwork/packages-installer/main/setup.sh | bash -s -- -y -p flatpak -s https://raw.githubusercontent.com/mylinuxforwork/$ml4w_app_repo/master/$ml4w_app.pkginst $ml4w_app &>>$(_getLogFile)

_writeLogHeader "Run Hyprland Settings App"

# Execute hyprctl from the Settings app
if [ -f ~/.config/com.ml4w.hyprlandsettings/hyprctl.sh ]; then
    _writeLog 0 "Starting restore from ML4W Hyprland Settings App"
    ~/.config/com.ml4w.hyprlandsettings/hyprctl.sh
fi
