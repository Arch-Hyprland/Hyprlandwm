# get current screen
screen=0

if [ $XDG_CURRENT_DESKTOP == "Hyrpland" ]; then
  screen=$(hyprctl activewindow -j | jq '.monitor')
elif [ $XDG_CURRENT_DESKTOP == "niri" ]; then
  niri msg focused-output | grep HDMI >/dev/null && screen=1 || screen=0
fi

echo $screen
