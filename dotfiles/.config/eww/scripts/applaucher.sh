#!/bin/bash

CFG="$HOME/.config/eww/ml4w-sidebar"
EWW=$(which eww)

if [[ $(pidof eww) ]]; then
  opened=$("${EWW}" --config "$CFG" active-windows | grep AppLauncher)

  sc=$("$HOME"/.config/eww/scripts/curscreen.sh)
  if [ -n "$opened" ]; then
    "${EWW}" --config "$CFG" close AppLauncher
  else
    "${EWW}" --config "$CFG" open AppLauncher --screen $sc
  fi
fi
