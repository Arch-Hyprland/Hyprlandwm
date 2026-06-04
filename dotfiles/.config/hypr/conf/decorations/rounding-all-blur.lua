-- -----------------------------------------------------
-- General window decoration
-- name: "Rounding All Blur"
-- -----------------------------------------------------
local c = require("colors")

hl.config({
    decoration = {
        rounding = 10,
        active_opacity = 0.9,
        inactive_opacity = 0.6,
        fullscreen_opacity = 0.9,

        blur = {
            enabled = true,
            size = 3,
            passes = 4,
            new_optimizations = true,
            ignore_opacity = true,
            xray = true,
        },

        shadow = {
            enabled = true,
            range = 30,
            render_power = 3,
            color = c.shadow,
        },
    }
})

hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
