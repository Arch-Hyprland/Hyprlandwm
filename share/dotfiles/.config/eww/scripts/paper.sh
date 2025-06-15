#!/bin/bash

CFG="$HOME/.config/eww/ml4w-sidebar"
EWW=$(which eww)

if [[ $(pidof eww) ]]; then
  opened=$("${EWW}" --config "$CFG" active-windows | grep WallPaper)

  sc=$("$HOME"/.config/eww/scripts/curscreen.sh)
  if [ -n "$opened" ]; then
    "${EWW}" --config "$CFG" close WallPaper
  else
    "${EWW}" --config "$CFG" open WallPaper --screen $sc
  fi
fi
