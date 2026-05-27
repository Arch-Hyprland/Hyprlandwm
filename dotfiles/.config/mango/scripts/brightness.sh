#!/usr/bin/bash

# Change brightness level with `light`.
# You can call this script like this:
# brightness.sh [up|down]

function get_brightness {
	var=$(brightnessctl get)
	echo "${var##* }" | sed 's/[^0-9][^.]*//g'
}

function send_notification {
	DIR=$(dirname "$0")
	brightness=$(get_brightness)
	icon_name="${HOME}/.config/rice_assets/Icons/b.png"

	# Send the notification
	dunstify "Brightness: $brightness%" -h int:value:$brightness -i /usr/share/icons/Adwaita/96x96/status/display-brightness-symbolic.symbolic.png -t 1000 --replace=555 -u low
}

case $1 in
up)
	swayosd-client --brightness +2
	# brightnessctl set +1%
	# send_notification
	;;
down)
	swayosd-client --brightness -2
	# brightnessctl set 1%-
	# send_notification
	;;
esac
