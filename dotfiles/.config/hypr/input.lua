-- -----------------------------------------------------
-- Input
-- -----------------------------------------------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        repeat_rate = 50,
        repeat_delay = 240,

        numlock_by_default = false,
        mouse_refocus=true,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
            disable_while_typing = true,
            clickfinger_behavior = true,
            middle_button_emulation = false,
            tap_to_click = true,
            -- drog_lock = 2,
        },
    },
})
