local c = require("colors")
hl.config({
    general = {
        gaps_in  = 10,
        gaps_out = 20,
        border_size = 1,
        col = {
            active_border   = { colors = { c.primary, c.on_primary}, angle = 90 },
            inactive_border = c.on_primary,
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    }
})
