-- -----------------------------------------------------
-- Laptop Layouts & Swipe Gestures
-- -----------------------------------------------------

hl.config({
    dwindle = {
        preserve_split = true,
    },
    master = {
        -- new_status = "master" -- Commented out due to compatibility reasons
    },

    scrolling = {
      fullscreen_on_one_column = true,
      column_width= 0.8,
      focus_fit_method = 0
    },
    binds = {
        workspace_back_and_forth = false,
        allow_workspace_cycles = true,
        pass_mouse_when_bound = false,
    },
})

-- Handle multi-finger touchpad actions explicitly outside the main block
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
