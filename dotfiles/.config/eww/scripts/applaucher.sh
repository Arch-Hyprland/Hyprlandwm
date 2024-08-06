#!/bin/bash

CFG="$HOME/dotfiles/eww/ml4w-sidebar"
EWW=$(which eww)

if [[ $(pidof eww) ]]; then
  opened=$("${EWW}" --config "$CFG" active-windows | grep AppLauncher)

  if [ -n "$opened" ]; then
    "${EWW}" --config "$CFG" close AppLauncher
  else
    "${EWW}" --config "$CFG" open AppLauncher --screen 0
  fi
fi
