hl.config({ 
  plugin =  {
    overview = {
      panelColor = "rgba(1e1e2e80)",
      panelHeight = 150,
      workspaceActiveBorder = primary,
      workspaceInactiveBorder = "rgba(ffffff22)",
      workspaceBorderSize = 5,
      workspaceMargin = 20,
      reservedArea = 0,
      dragAlpha = 0.2,
      gapsIn = 50,
      gapsOut = 50,
      hideTopLayers = true,
      hideBackgroundLayers = true,
      hideOverlayLayers = true,
    },
    hyprbars = {
        bar_color = "rgba(1e1e2ece)",
        bar_height = 36,
        bar_padding = 6,
        bar_blur = true,
        bar_button_padding = 4,
        bar_title_enabled = false,
        bar_text_font = "Inter",
        bar_text_size = 14,
        bar_text_align = "left",
        bar_buttons_alignment = "center",
        bar_precedence_over_border = true,
        bar_part_of_window = true,
        -- icon_on_hover = true,
    },
  }
})

hl.plugin.hyprbars.add_buttom({
  icon = "󰖭 ",
  size = 32,
  bg_color = "rgba(00000000)",
  fg_color = "rgba(00000000)",
  action = "hyprctl dispatch killactive",
})
hl.plugin.hyprbars.add_buttom({
  icon = " ",
  size = 40,
  bg_color = "rgba(00000000)",
  fg_color = "rgba(00000000)",
  action = "hyprctl dispatch fullscreen 1",
})
hl.plugin.hyprbars.add_buttom({
  icon = "󱂬 ",
  size = 40,
  bg_color = "rgba(00000000)",
  fg_color = "rgba(00000000)",
  action = "hyprctl dispatch togglefloating",
})

