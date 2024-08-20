

_activewindow() {
  echo $(hyprctl activewindow -j)
}

_activeworkspace() {
  echo $(hyprctl activeworkspace -j)
}

_workspaces() {
  echo $(hyprctl workspaces -j)
}

_windows() {
  echo $(hyprctl clients -j)
}


case $1 in 
  "activewindow")
    _activewindow
  ;;
  "activeworkspace")
    _activeworkspace
  ;;
  "workspaces")
    _workspaces
  ;;
  "windows")
    _windows
  ;;
  *)
    dunstify \
      -i "system-error" \
      -a "wfrecorder" \
      "not support operation!! $1"
esac

