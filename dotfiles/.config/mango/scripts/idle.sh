#!/usr/bin/bash

#swayidle -w \
#	timeout 1800 'swaylock -f -c 000000' \
#	timeout 1800 'hyprctl dispatch dpms off' \
#		resume 'hyprctl dispatch dpms on && ~/.config/hypr/scripts/restart_wlsunset.sh' \
#	timeout 300 'bash $HOME/.config/hypr/scripts/lightresume.sh dark' \
#		resume 'bash $HOME/.config/hypr/scripts/lightresume.sh resume' \
#	timeout 3600 'systemctl suspend'

swayidle \
	timeout 1800 'wlr-dpms off' \
	resume 'wlr-dpms on && ~/.config/mango/scripts/restart_wlsunset.sh' \
	timeout 300 'dimland -a 0.3' \
	resume 'bash ~/.config/mango/scripts/exitdim.sh'
