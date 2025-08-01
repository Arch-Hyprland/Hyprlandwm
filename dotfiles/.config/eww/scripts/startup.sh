#!/bin/bash

CFG="$HOME/.config/eww/ml4w-sidebar"
EWW=$(which eww)

if [[ ! $(pidof eww) ]]; then
  ${EWW} --config "${CFG}" daemon
  STATE="1"
  for ((i = 1; i <= 10; i++)); do
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
  done
  if [ -z ${STATE} ] && [ ${STATE} != "0" ]; then
    dunstify \
      -h string:x-dunst-stack-tag:eww \
      -a "eww weight" \
      -i "asc-de" \
      "eww 启动失败, 通信超时"
  fi
fi

opened=$("${EWW}" --config "$CFG" active-windows | grep controls)

if [ $? -eq 0 ] && [ -n "$opened" ]; then
  ${EWW} --config "$CFG" close controls
  echo ":: Closing widgets"
else
  # current screen 
  sc=$("$HOME"/.config/eww/scripts/curscreen.sh)
  echo ":: Opening on Monitor $sc"
  "${EWW}" --config "$CFG" open controls --screen "$sc"
fi
