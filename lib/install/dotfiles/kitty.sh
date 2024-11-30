# ------------------------------------------------------
# Neovim
# ------------------------------------------------------
_writeLogHeader "Kitty"

if [ -z $automation_kitty ] ;then
    if [ -d $ml4w_directory/$version/.config/kitty ] ;then
        if [ -d ~/.config/kitty ]; then
            _writeHeader "Kitty"
            _writeLogTerminal 0 "The script has detected a kitty folder in your ~/.config folder."
            _writeLogTerminal 0 "You can replace it with the latest version of ML4W Dotfiles $version."
            echo
            if gum confirm "Do you want to replace your configuration?"; then
                _writeLogTerminal 0 "ML4W Kitty configuration will be installed"
            elif [ $? -eq 130 ]; then
                _writeCancel
                exit 130
            else
                rm -rf $ml4w_directory/$version/.config/kitty
                _writeSkipped
            fi
        fi
    fi
else
    if [[ "$automation_kitty" = true ]] ;then
        _writeLogTerminal 0 "AUTOMATION: Kitty configuration will be installed."
    else
        rm -rf $ml4w_directory/$version/.config/kitty
        _writeLogTerminal 0 "AUTOMATION: Kitty configuration will be restored."
    fi
fi