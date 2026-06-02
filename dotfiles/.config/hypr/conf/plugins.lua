hl.config({ 
  plugin =  {
    hyprbars = {
        enabled = false,
        bar_color = "rgba(1e1e2ece)",
        bar_height = 36,
        bar_blur = true,
        bar_title_enabled = false,
        bar_text_font = "Inter",
        bar_text_size = 14,
        bar_text_align = "left",
        bar_padding = 6,
        bar_button_padding = 4,
        bar_buttons_alignment = "right",
        bar_precedence_over_border = true,
        bar_part_of_window = true,
        icon_on_hover = true,
    },
  }
})

hl.plugin.hyprbars.add_button({
  icon = "󰖭 ",
  size = 32,
  bg_color = "rgba(00000000)",
  fg_color = "rgba(00000000)",
  action = "hyprctl dispatch killactive",
})
hl.plugin.hyprbars.add_button({
  icon = " ",
  size = 40,
  bg_color = "rgba(00000000)",
  fg_color = "rgba(00000000)",
  action = "hyprctl dispatch fullscreen 1",
})
hl.plugin.hyprbars.add_button({
  icon = "󱂬 ",
  size = 40,
  bg_color = "rgba(00000000)",
  fg_color = "rgba(00000000)",
  action = "hyprctl dispatch togglefloating",
})

