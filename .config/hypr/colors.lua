local active_color = "rgba(135, 154, 57, 1.0)"
local inactive_color = "rgba(52, 62, 15, 1.0)"

hl.config({
    general = {
        col = {
            active_border = active_color,
            inactive_border = inactive_color
        }
    },
    group = {
        col = {
            border_active = active_color,
            border_inactive = inactive_color
        },
        groupbar = {
            col = {
                active = active_color,
                inactive = inactive_color
            }
        }
    }
})
