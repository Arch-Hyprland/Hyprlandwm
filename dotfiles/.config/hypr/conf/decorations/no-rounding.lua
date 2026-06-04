-- -----------------------------------------------------
-- General window decoration
-- name: "No Rounding"
-- -----------------------------------------------------
local c = require("colors")
hl.config({
    decoration = {
        rounding = 0,
        active_opacity = 1.0,
        inactive_opacity = 0.9,
        fullscreen_opacity = 1.0,
        rounding_power = 2,

        shadow = {
            enabled = true,
            range = 32,
            render_power = 2,
            color = c.shadow
        },

        blur = {
            enabled   = true,
            size      = 4,
            passes    = 4,
            new_optimizations = true,
            ignore_opacity = true,
            xray = true,
            vibrancy  = 0.1696,
        },
    },
})
