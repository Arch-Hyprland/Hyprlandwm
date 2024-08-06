#!/bin/bash

CFG="$HOME/.config/eww/ml4w-sidebar"
EWW=$(which eww)

if [[ $(pidof eww) ]]; then
  opened=$("${EWW}" --config "$CFG" active-windows | grep widgets)

  if [ -n "$opened" ]; then
    "${EWW}" --config "$CFG" close widgets
  else
    "${EWW}" --config "$CFG" open widgets --screen 1
  fi
fi
