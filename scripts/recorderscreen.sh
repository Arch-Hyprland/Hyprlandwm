#!/usr/bin/bash



_check() {
  # check wether already had a wf-recorder process running 
  pid=$(ps -ef | grep wf-record | grep ".mkv")
  if [ -n "${pid}" ]; then
    dunstify "Already having a Recording is runnig, please stop it first"
    exit 1
  fi
}


_start() {

  MONITORS=$(hyprctl monitors | grep -A1 Monitor | tr '\r\n' " " |  tr -d '[ \t]' | sed 's/Monitor/􀧒  : /g' |sed 's/--/\n/g')

  CHOICE=$(echo -e "$MONITORS" | rofi -dmenu -replace -config ~/dotfiles/rofi/config-screenshot.rasi -i -no-show-icons -l 2 -width 40 -p "Take Screen Record")
  CHOICE=$(echo "${CHOICE}" | sed 's/(.*//g' | cut -d ":" -f 2 | tr -d '[ \t]')

  if [ -n "$CHOICE" ]; then
      RECORDTIMTE=$(date +"%y%m%d-%H%M%S")
      dunstify "Screen Recorder start..." 
      wf-recorder -o "${CHOICE}" -r 60 -f "${HOME}/Videos/wfrecorder/recording-${RECORDTIMTE}.mkv" > "/tmp/wf-record-${RECORDTIMTE}.log" &
  else
    dunstify "unable start wf-recorder, please check log file in /tmp/wf-recorder-${RECORDTIMTE}.log"
  fi
}

_stop() {
  pid=$(ps -ef | grep wf-record | grep ".mkv")
  if [ -z "$pid" ]; then
    dunstify "canot find record screen process, please check!!"
    exit
  fi
  ps -ef | grep wf-record | grep ".mkv" | xargs kill -15 
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
        dunstify "not support operation!! $1"
    ;;
esac
