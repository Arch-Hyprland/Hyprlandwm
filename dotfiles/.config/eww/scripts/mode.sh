#!/bin/bash

CFG="$HOME/.config/eww/ml4w-sidebar"
EWW=$(which eww)

if [[ $(pidof eww) ]]; then
  if [ "$1" == "dock" ]; then
    "${EWW}" --config "$CFG" close dock
    "${EWW}" --config "$CFG" open dock --arg mode=hide --screen 1
  elif [ "$1" == "hide" ]; then
    "${EWW}" --config "$CFG" close dock
    "${EWW}" --config "$CFG" open dock --arg mode=dock --screen 1
  elif [ "$1" == "reload" ]; then
    "${EWW}" --config "$CFG" reload
  fi
else
  sh "./launch.sh"
fi
