#!/bin/bash

# ----------------------------------------------------- 
# Requires pacman-contrib trizen

# ----------------------------------------------------- 
# Define threshholds for color indicators
# ----------------------------------------------------- 

RECORDER=1
STARTTIME=""
# ----------------------------------------------------- 
# Calculate available updates pacman and aur (with trizen)
# ----------------------------------------------------- 

WF=$(ps -ef | grep wf-recorder | grep .mkv | awk '{print $2}')
if [ -n "${WF}" ]; then 
  RECORDER=0
  STARTTIME=$(ps -h -p "${WF}" -o etime)
  STARTTIME="${STARTTIME// /}"
  # printf "%s" ${STARTTIME}
fi

# ----------------------------------------------------- 
# Testing
# ----------------------------------------------------- 

# Overwrite updates with numbers for testing
#
# test JSON output
# printf '{"text": "􀧒  09:00", "alt": "09:00", "tooltip": "Recoding: 09:00", "class": "red"}'
# exit

# ----------------------------------------------------- 
# Output in JSON format for Waybar Module custom-recorder
# ----------------------------------------------------- 

css_class=""

if [ ${RECORDER} -eq 0 ] && [ -n "${STARTTIME}" ]; then
    css_class="red"
else
    css_class="white"
fi

if [ ${RECORDER} -eq 0 ] && [ -n "${STARTTIME}" ]; then
    printf '{"text": "􀧒 %s", "alt": "%s", "tooltip": "Recoding: %s", "class": "%s"}' "${STARTTIME}" "${STARTTIME}" "${STARTTIME}" "$css_class"
else
    printf '{"text": "􀜯 ", "alt": "", "tooltip": "click start recorder", "class": "white"}'
fi
