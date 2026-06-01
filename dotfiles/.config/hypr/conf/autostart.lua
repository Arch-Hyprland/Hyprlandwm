hl.on("hyprland.start", function () 
    -- load plugin 
    hl.exec_cmd("hyprpm reload -n")

    -- Load cursor
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")

    -- Start listeners
    hl.exec_cmd("~/.config/ml4w/listeners.sh --startall")

    -- Start polkit daemon
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

    -- Restore wallpaper
    hl.exec_cmd("~/.config/ml4w/scripts/ml4w-wallpaper-app --restore")

    -- start fcitx5
    hl.exec_cmd("fcitx5 --replace -d")

    -- hyprshell
    hl.exec_cmd("hyprshell run")

    -- vicinae
    hl.exec_cmd("vicinae server")

    -- Environment for xdg-desktop-portal-hyprland
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- Autostart scripts
    hl.exec_cmd("~/.config/ml4w/scripts/ml4w-autostart")

    -- Load GTK settings
    hl.exec_cmd("~/.config/hypr/scripts/gtk.sh")

    -- Start swaync
    hl.exec_cmd("swaync")

    -- Start hypridle
    hl.exec_cmd("hypridle")

    -- Load cliphist history
    hl.exec_cmd("wl-paste --watch cliphist store")


    -- hl.exec_cmd("~/.config/ml4w/scripts/ags.sh")
    -- hl.exec_cmd("~/.config/hypr/scripts/eww.sh")
    -- hl.exec_cmd("caelestia shell -d")

    -- Start autostart cleanup
    hl.exec_cmd("~/.config/hypr/scripts/cleanup.sh")
end)
