#!/bin/bash

CFG="$HOME/.config/eww/ml4w-sidebar"
EWW=$(which eww)

if [[ $(pidof eww) ]]; then
  opened=$("${EWW}" --config "$CFG" active-windows | grep Search)

  sc=$("$HOME"/.config/eww/scripts/curscreen.sh)
  if [ -n "$opened" ]; then
    "${EWW}" --config "$CFG" close Search
  else
    "${EWW}" --config "$CFG" open Search --screen $sc
  fi
fi
