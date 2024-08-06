#!/bin/bash
clear
cat <<"EOF"
 ____           _                 
|  _ \ ___  ___| |_ ___  _ __ ___ 
| |_) / _ \/ __| __/ _ \| '__/ _ \
|  _ <  __/\__ \ || (_) | | |  __/
|_| \_\___||___/\__\___/|_|  \___|
                                  
__     __         _       _   _                 
\ \   / /_ _ _ __(_) __ _| |_(_) ___  _ __  ___ 
 \ \ / / _` | '__| |/ _` | __| |/ _ \| '_ \/ __|
  \ V / (_| | |  | | (_| | |_| | (_) | | | \__ \
   \_/ \__,_|_|  |_|\__,_|\__|_|\___/|_| |_|___/
                                                

EOF
echo "You can restore to the default Hyprland Variations."
echo "PLEASE NOTE: You can reactivate to a customized variation or selection in the settings script."
echo "Your customized variation will not be overwritten or deleted."

if gum confirm "Do you want to restore all variations to the default values?" ;then
    echo 

    echo "source = ~/.config/hypr/conf/keybindings/default.conf" > ~/.config/hypr/conf/keybinding.conf
    echo "Hyprland keybinding.conf restored!"

    echo "source = ~/.config/hypr/conf/environments/default.conf" > ~/.config/hypr/conf/environment.conf
    echo "Hyprland environment.conf restored!"

    echo "source = ~.config/hypr/conf/windowrules/default.conf" > ~/.config/hypr/conf/windowrule.conf
    echo "Hyprland windowrule.conf restored!"

    echo "source = ~/.config/hypr/conf/animations/default.conf" > ~/.config/hypr/conf/animation.conf
    echo "Hyprland animation.conf restored!"

    echo "source = ~/.config/hypr/conf/decorations/default.conf" > ~/.config/hypr/conf/decoration.conf
    echo "Hyprland decoration.conf restored!"

    echo "source = ~/.config/hypr/conf/windows/default.conf" > ~/.config/hypr/conf/window.conf
    echo "Hyprland window.conf restored!"

    echo "source = ~/.config/hypr/conf/monitors/default.conf" > ~/.config/hypr/conf/monitor.conf
    echo "Hyprland monitor.conf restored!"

    echo 
    echo ":: Restore done!"
else
    echo ":: Restore canceled!"
    exit
fi