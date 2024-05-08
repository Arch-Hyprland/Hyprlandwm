#!/bin/bash

FILE="$HOME/.cache/ml4w_sidebar"
CFG="$HOME/dotfiles/eww/ml4w-sidebar"
EWW=$(which eww)

if [[ ! $(pidof eww) ]]; then
	${EWW} --config "${CFG}" daemon
  STATE="1"
  for (( i=1; i <= 10; i++ ))
  do
    sleep 1
    pong=$("${EWW}" --config "${CFG}" ping)
    if [ -n "${pong}" ] && [ "${pong}" == "pong" ]; then
      dunstify \
         -h string:x-dunst-stack-tag:eww \
         -a "eww weight" \
         -i "asc-de" \
        "eww 启动成功, 正在建立通信"

      # 启动成功标志
      STATE="0"
      break
    else 
      dunstify \
        -h int:value:$(echo "20 * ${i}" | bc) \
        -a "eww widgets" \
        -h string:x-dunst-stack-tag:eww \
        -i "asc-de" \
        "正在启动 EWW 服务, 请稍侯...."
    fi

    if [ -z ${STATE} ] && [ ${STATE} != "0" ]; then
      dunstify \
         -h string:x-dunst-stack-tag:eww \
         -a "eww weight" \
         -i "asc-de" \
        "eww 启动失败, 通信超时"
    fi
  done
fi

if [ -f "$HOME"/dotfiles/.settings/eww-monitor.sh ] && [ $(cat "$HOME/dotfiles/.settings/eww-monitor.sh") != "auto" ]; then
	echo ":: Using monitor id from $HOME/dotfiles/.settings/eww-monitor.sh"
	sc=$(cat "$HOME"/dotfiles/.settings/eww-monitor.sh)
else
	echo ":: Autodetect current focused monitor."
	sc=$(python "$HOME"/dotfiles/hypr/scripts/active-monitor.py)
fi
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	echo ":: Opening on Monitor $sc"
	"${EWW}" --config "$CFG" open ml4wlauncher --screen "$sc"
	"${EWW}" --config "$CFG" open resources --screen "$sc"
	"${EWW}" --config "$CFG" open powermenu --screen "$sc"
	"${EWW}" --config "$CFG" open controlpanel --screen "$sc"
else
	${EWW} --config "$CFG" close resources ml4wlauncher powermenu controlpanel
	echo ":: Closing widgets"
	rm "$FILE"
fi
