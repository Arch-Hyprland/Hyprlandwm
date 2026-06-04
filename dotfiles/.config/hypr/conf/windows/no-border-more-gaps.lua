local c = require("colors")
hl.config({
    general = {
        gaps_in  = 20,
        gaps_out = 40,
        border_size = 0,
        col = {
            active_border   = c.on_surface,
            inactive_border = c.primary,
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    }
})
