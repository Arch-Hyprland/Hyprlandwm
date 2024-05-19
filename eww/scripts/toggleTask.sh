#!/bin/bash

CFG="$HOME/dotfiles/eww/ml4w-sidebar"
EWW=$(which eww)

if [[ $(pidof eww) ]]; then
  opened=$("${EWW}" --config "$CFG" active-windows | grep taskview)

  if [ -n "$opened" ]; then
    "${EWW}" --config "$CFG" close taskview
  else
    "${EWW}" --config "$CFG" open taskview --screen 1
  fi
fi
