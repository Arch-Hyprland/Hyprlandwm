#!/usr/bin/bash

enable=$(wlr-randr --json | jq --arg name "eDP-1" '.[] | select(.name == $name) | .enabled')
if [ $enable == "true" ]; then
    wlr-randr --output eDP-1 --off
else
    wlr-randr --output eDP-1 --on
fi
