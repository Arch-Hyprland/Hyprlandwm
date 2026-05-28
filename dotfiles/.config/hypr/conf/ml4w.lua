--    __  _____  _____      __  _____          ___
--   /  |/  / / / / / | /| / / / ___/__  ___  / _/
--  / /|_/ / /_/_  _/ |/ |/ / / /__/ _ \/ _ \/ _/
-- /_/  /_/____//_/ |__/|__/  \___/\___/_//_/_/
--

-- HOME directory
local HOME = os.getenv("HOME")

hl.window_rule({
    name = "ml4w-app",
    match = {title = "ML4W.*"},
    float = true,
    center = true,
    pin = true,
    size = {900, 600}
})

hl.window_rule({
    name = "waypaper",
    match = {class = "*waypaper*"},
    float = true,
    center = true,
    pin = true,
    size = {900, 700}
})

-- Newelle
hl.window_rule({
    name = "newelle",
    match = {class = "io.github.qwersyk.Newelle"},
    float = true,
    center = true,
    pin = true,
    size = { 1000, 700 }
})


hl.window_rule({
    name = "nwg-group",
    match = {class = "nwg-.*" },
    float = true,
    center = true,
    size = { 900, 600 }
})

hl.window_rule({
    name = "missioncenter",
    match = {class = "io.missioncenter.MissionCenter"},
    float = true,
    center = true,
    pin = true,
    size = { 900, 600 }
})

hl.window_rule({
    name = "gnome-calculator",
    match = { class = "org.gnome.Calculator"},
    float = true,
    center = true,
    size = { 700, 600 }
})

hl.window_rule({
    name = "hyprland-share-picker",
    match = {class = "hyprland-share-picker"},
    float = true,
    pin = true,
    center = true,
    size = { 600, 400 }
})

hl.window_rule({
    name = "io.github.bluemancz.hyprmod",
    match = {class = "io.github.bluemancz.hyprmod"},
    float = true,
    center = true,
    size = { 1000, 700 }
})
hl.window_rule({
    name = "custom-terminal",
    match = {class = "dotfiles-.*"},
    float = true,
    pin = true,
    center = true,
    size = { 1000,  700 }
})

-- XDG Desktop Portal
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")

hl.env("DESKTOP_SESSION", "Hyprland")

hl.env("AQ_DRM_DEVICES","/dev/dri/card2:/dev/dri/card1")
hl.env("AQ_FORCE_LINEAR_BLIT","0")

-- Wayland variables
hl.env("OZONE_PLATFORM", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland") -- auto
hl.env("WEBKIT_DISABLE_DMABUF_RENDERER","1")

-- Qt related environment variables
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR","2")
hl.env("QT_IM_MODULE","fcitx")
hl.env("QT_IM_MODULES","wayland;fcitx")

-- GDK
hl.env("GDK_SCALE", "2")

-- Toolkit Backend
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("CLUTTER_BACKEND", "wayland")

-- Mozilla
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- Set the cursor size for xcursor
-- hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- SDL version
hl.env("SDL_VIDEODRIVER", "wayland")

-- Quickshell debug
hl.env("QS_NO_RELOAD_POPUP", "1")
