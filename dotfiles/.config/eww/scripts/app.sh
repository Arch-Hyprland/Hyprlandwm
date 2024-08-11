#!/bin/bash
if [[ "$1" == "--welcome" ]]; then
   APPIMAGELAUNCHER_DISABLE=1 $HOME/.config/ml4w/apps/ML4W_Welcome-x86_64.AppImage &
elif [[ "$1" == "--dotfiles" ]]; then
   APPIMAGELAUNCHER_DISABLE=1 $HOME/.config/ml4w/apps/ML4W_Dotfiles_Settings-x86_64.AppImage &
elif [[ "$1" == "--hyprland" ]]; then
   APPIMAGELAUNCHER_DISABLE=1 $HOME/.config/ml4w/apps/ML4W_Hyprland_Settings-x86_64.AppImage &
else
    echo "ERROR: $1 not found"
fi

