#!/bin/bash

CFG="$HOME/dotfiles/eww/ml4w-sidebar"
EWW=$(which eww)

if [[ $(pidof eww) ]]; then
  "${EWW}" --config "$CFG" close dock
  if [ "$1" == "dock" ]; then
    "${EWW}" --config "$CFG" open dock --arg mode=hide --screen 1
  elif [ "$1" == "hide" ]; then
    "${EWW}" --config "$CFG" open dock --arg mode=dock --screen 1
  fi
else
  sh "./launch.sh"
fi
