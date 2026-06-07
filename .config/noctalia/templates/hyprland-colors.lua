local active_color = "{{colors.primary.default.rgba}}"
local inactive_color = "{{colors.primary_container.default.rgba}}"

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
