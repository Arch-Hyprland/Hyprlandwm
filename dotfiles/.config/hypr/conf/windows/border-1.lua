local c = require("colors")
hl.config({
    general = {
        gaps_in  = 10,
        gaps_out = 20,
        border_size = 1,
        col = {
            active_border = c.on_primary,
            inactive_border = c.primary,
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    }
})
