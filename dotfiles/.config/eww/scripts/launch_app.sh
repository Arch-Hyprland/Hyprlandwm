#!/bin/bash
if [[ "$1" == "--welcome" ]]; then
    $HOME/.config/ml4w/apps/ML4W_Welcome-x86_64.AppImage &
elif [[ "$1" == "--dotfiles" ]]; then
    $HOME/.config/ml4w/apps/ML4W_Dotfiles_Settings-x86_64.AppImage &
elif [[ "$1" == "--hyprland" ]]; then
	$HOME/.config/ml4w/apps/ML4W_Hyprland_Settings-x86_64.AppImage &
else
    echo "ERROR: $1 not found"
fi

