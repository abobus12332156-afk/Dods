-- Input configuration

hl.config({
    input = {
        -- sensitivity = -0.25,
        accel_profile = "flat",
	kb_layout  = "us,ru", 
        kb_variant = ",phonetic_winkeys",
        kb_model   = "",
        -- Переключение по комбинации Alt + Shift 
        kb_options = "grp:alt_shift_toggle", 
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity = 0,
        touchpad = { natural_scroll = false },
    },
    -- Uncomment the section below to enable software cursors; this can help with cursor display or behavior issues
    -- cursor = {
    --     no_hardware_cursors = 1,
    -- },
})

hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down",       action = "close" })
hl.gesture({ fingers = 3, direction = "up",         action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "left",       action = "float" })
