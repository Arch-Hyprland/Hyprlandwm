hl.window_rule({
  name = "float common",
  match = { float = true },
  rounding = 14,
  animation = "popin"
})

hl.window_rule({
  name = "portal",
  match = { class = "[x|X]dg-desktop-portal-.*" },
  float = true,
  center = true,
  animation = "popin"
})

hl.window_rule({
  name = "pick-in-app",
  match = { title = "^(Open(\\s*?File)?|Save(\\s*?As)|[Ee|Ii]xport|[Ss]ettings|[Pp]reference|Choose File|Rename|Welcome.*)$" },
  float = true,
  center = true,
  animation = "popin"
})

hl.window_rule({
  name = "Picture-in-Picture",
  match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
  float = true,
  pin = true,
  move = { "(monitor_w*0.8)", "(monitor_h*0.1)" },
  animation = "popin"
})

hl.window_rule({
  name = "float-app",
  match = { title = "^(pavucontrol|blueman-manager|Network Connections|nm-connection-editor|qalculate-gtk)$"},
  float = true,
  center = true,
  animation = "popin"
})

hl.window_rule({
  name = "office-app",
  match = { class = "(wechat|QQ|feh|wps|et|org.fcitx.fcitx5-config-qt)" },
  float = true,
  center = true,
  animation = "popin"
})

hl.layer_rule({
  name = "swaync",
  match= { namespace = "swaync-.*"},
  blur = true,
  blur_popups = true,
  ignore_alpha = 0.2,
  animation = "slidefade 20%"
})

hl.layer_rule({
  name = "widget",
  match = { namespace = "eww-widget" },
  blur = true,
  blur_popups = true,
  ignore_alpha = 0.2,
  animation = "slidefade 20%"
})

hl.layer_rule({
  name = "launcher",
  match = { namespace = "(sirula|vicinae|rofi|anyrun|fuzzel"},
  blur = true,
  blur_popups = true,
  ignore_alpha = 0.2,
  animation = "popin 50%"
})

hl.layer_rule({
  name = "nwg-dock",
  match = { namespace = "(nwg-dock|waybar)" },
  blur = true,
  blur_popups = true,
  ignore_alpha = 0.2,
  animation = "slide"
})

hl.layer_rule({
  name = "hyprshell",
  match=  { namespace = "hyprshell_.*" },
  blur = true,
  blur_popups = true,
  ignore_alpha = 0.2,
  animation = "popin 50%"
})

hl.layer_rule({
  name = "caelestia",
  match = { namespace = "caelestia-drawers" },
  blur = true,
  blur_popups = true,
  ignore_alpha = 0.2
})

hl.layer_rule({
  name = "quickshell",
  match = { namespace = "^(quickshell:.*)$" },
  blur = true,
  ignore_alpha = 0.2
})

hl.layer_rule({
  name = "dms-dock",
  match = { namespace = "^dms:dock$" },
  blur = true,
  ignore_alpha = 0.2,
  animation = "slidefade 40%"
})

hl.layer_rule({
  name = "dms",
  match = { namespace = "^(dms:.*)$" },
  blur = true,
  ignore_alpha = 0.2
})

hl.layer_rule({
  name = "cider",
  match = { namespace= "cider" },
  ignore_alpha= 0,
  blur= true
})
