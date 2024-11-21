#!/bin/bash
if [[ "$1" == "--welcome" ]]; then
   com.ml4w.welcome &
elif [[ "$1" == "--dotfiles" ]]; then
   com.ml4w.dotfilessettings &
elif [[ "$1" == "--hyprland" ]]; then
   com.ml4w.hyprland.settings &
else
    echo "ERROR: $1 not found"
fi

