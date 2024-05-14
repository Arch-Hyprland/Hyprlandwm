#!/usr/bin/bash

_check() {
  # check wether already had a wf-recorder process running 
  pid=$(ps -ef | grep wf-record | grep ".mkv")
  if [ -n "${pid}" ]; then
    dunstify \
      -i "org.gnome.SoundRecorder" \
      -a "wfrecorder" \
      "Already having a Recording is runnig, please stop it first"
    exit 1
  fi
}


_start() {

  # MONITORS=$(hyprctl monitors | grep -A1 Monitor | tr '\r\n' " " |  tr -d '[ \t]' | sed 's/Monitor/􀥂  : /g' |sed 's/--/\n/g')
  NUM=$(hyprctl monitors -j | jq ".|length")
  MONITORS=$(hyprctl monitors -j \
      | jq "[.[]|{make,width,height,id,refreshRate,name}]" \
      | jq ".[]|.make,.width,.height,.refreshRate,.name" \
      | xargs printf "􀥂  (%s)-[%sx%s@%s]->(%s)\n")
  SLURP="􀍳  (Area)-[Select A Screen Area]->(Slurp)"
  MONITORS="${MONITORS}\n${SLURP}"
  CHOICE=$(echo -e "$MONITORS" | rofi   \
      -dmenu \
      -replace \
      -config ~/dotfiles/rofi/config-screenshot.rasi \
      -i -no-show-icons \
      -l $(echo "${NUM}+1" | bc) \
      -width $(echo "20*${NUM}" | bc) \
      -p "Take Screen Record")

  CHOICE=$(echo "${CHOICE}" | sed 's/.*->//g' | sed 's/[()]//g' | tr -d '[ \t]')

  if [ -n "$CHOICE" ]; then

    RECORDTIMTE=$(date +"%y%m%d-%H%M%S")
    if [ "${CHOICE}" == "Slurp" ]; then
      wf-recorder -g "$(slurp)" \
          -r 60 \
          -c h264_vaapi \
          -d /dev/dri/renderD129 \
          -f "${HOME}/Videos/wfrecorder/recording-${RECORDTIMTE}.mkv" > "/tmp/wf-record-${RECORDTIMTE}.log" &

    else
      wf-recorder -o "${CHOICE}" \
          -r 60 \
          -c h264_vaapi \
          -d /dev/dri/renderD129 \
          -f "${HOME}/Videos/wfrecorder/recording-${RECORDTIMTE}.mkv" > "/tmp/wf-record-${RECORDTIMTE}.log" &
    fi
    dunstify \
      -i "org.gnome.SoundRecorder" \
      -a "wfrecorder" \
      "Screen Recorder start..." 
  else
    dunstify  \
      -i "org.gnome.SoundRecorder" \
      -a "wfrecorder" \
      "unable start wf-recorder, click open log file" 
  fi
}

_stop() {
  pid=$(ps -ef | grep wf-record | grep ".mkv")
  if [ -z "$pid" ]; then
    dunstify \
      -i "org.gnome.SoundRecorder" \
      -a "wfrecorder" \
      "canot find record screen process, please check!!"
    exit
  fi
  ps -ef | grep wf-record | grep ".mkv" | xargs kill -15 
  dunstify \
    -i "org.gnome.SoundRecorder" \
    -a "wfrecorder" \
    "Record finished!!"
  exit
}

case $1 in
    "start")
        _check
        _start
    ;;
    "stop")
        _stop
        sleep 1
    ;;
    *) 
        dunstify \
          -i "org.gnome.SoundRecorder" \
          -a "wfrecorder" \
          "not support operation!! $1"
    ;;
esac
