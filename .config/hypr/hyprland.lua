hl.monitor({
    output = "eDP-1",
    mode = "2880x1800@60",
    position = "0x0",
    scale = 1.5
})
hl.workspace_rule({ workspace = "1", monitor = "eDP-1", default = true })

hl.monitor({
  output = "desc:AOC Q3279WG5B 0x0000652C",
  mode = "preferred",
  position = "auto-right",
  scale = 1,
})

hl.monitor({
  output = "desc:AOC Q3279WG5B 0x000067FB",
  mode = "preferred",
  position = "auto-right",
  scale = 1,
})

hl.monitor({
  output = "desc:AOC U32E2WG6 QELM5JA000186",
  mode = "3840x2160@60",
  position = "auto-right",
  scale = 1.5,
  cm = "hdr",
  sdrbrightness = 1.2,
  sdrsaturation = 0.98,
})

hl.monitor({
  output = "desc:LG Electronics LG TV",
  mode = "preferred",
  position = "auto-up",
  scale = 1
})

hl.monitor({
    output = "desc:Iiyama North America PL2390 11298JH100680",
    mode = "preferred",
    position = "auto-left",
    scale = 1
})

hl.monitor({
    output = "desc:Iiyama North America PL2390 11298JH100788",
    mode = "preferred",
    position = "auto-left",
    scale = 1
})

hl.monitor({
  output = "desc:Xiaomi Corporation P27FBA-RAGL 5105400272188",
  mode = "1920x1080@60.00Hz",
  position = "auto-left",
  scale = 1,
})

hl.monitor({
    output = "",
    mode = "prefered",
    position = "auto",
    scale = 1
})
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1", default = true })

hl.workspace_rule({ workspace = "4", layout = "scrolling" })
hl.workspace_rule({ workspace = "5", layout = "scrolling" })

hl.on("hyprland.start", function ()

hl.exec_cmd("qs -c noctalia-shell")

hl.exec_cmd("~/.config/hypr/scripts/desktop-portals.sh")

hl.exec_cmd("hyprsunset")

require("exec")

hl.exec_cmd("vicinae server")

hl.exec_cmd("emacs --init-directory ~/.config/light_emacs --daemon")

hl.exec_cmd("hyprshade auto")

hl.exec_cmd("hypridle")

hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
-- hl.exec_cmd("/usr/lib/polkit-1/polkitd")

hl.exec_cmd("wal -R")

hl.exec_cmd("wl-paste --type text --watch cliphist store")
hl.exec_cmd("wl-paste --type image --watch cliphist store")

hl.exec_cmd("hyprctl setcursor Qogir-Dark 24")

end)

require("colors")

hl.config({
  input = {
    kb_layout = "fr",
    -- kb_variant =
    -- kb_model =
    -- kb_options =
    -- kb_rules =
    follow_mouse = 1,
    numlock_by_default = true,

    touchpad = {
        natural_scroll = false,
        scroll_factor = 1.5,
        -- Use two-finger clicks for right-click instead of lower-right corner
        clickfinger_behavior = 1,
    },

    -- Sensitity for mouse/trackpack
    sensitivity = 0.25, -- -1.0 - 1.0, 0 means no modification.
  }
})

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 12,
        border_size = 1,
        layout = "dwindle",
        allow_tearing = false,
        snap = {
            enabled = true,
            window_gap = 5,
            border_overlap = false,
            respect_gaps = true,
        },
        resize_on_border = true,
    }
})

hl.config({
    gestures = {
        workspace_swipe_create_new = true
    }
})

hl.config({
    cursor = {
        inactive_timeout = 3,
        enable_hyprcursor = true
    }
})

hl.config({
    group = {
        groupbar = {
            render_titles = false,
            gradients = false,
            height = 10,
            indicator_height = 7
        }
    }
})

hl.config({
    decoration = {
        active_opacity = 0.9,
        inactive_opacity = 0.9,
        rounding = 2,
        rounding_power = 2.0,
        blur = {
            enabled = true,
            size = 5,
            passes = 2
        },
        shadow = {
            enabled = false,
            range = 12,
            offset = {0, 0},
            render_power = 1,
        },
        dim_inactive = true,
        dim_strength = 0.1,
    }
})

hl.config({
    render = {
        cm_enabled = true,
        cm_auto_hdr = 2,
        new_render_scheduling = true,
        use_fp16 = 1
    }
})

hl.config({
    dwindle = {
        force_split = 2,
        preserve_split = true,
        smart_split = false,
        precise_mouse_move = true
    }
})

hl.config({
    master = {
        new_on_top = false,
        orientation = left,
        center_master_fallback = left,
        always_keep_position = false,
    }
})

hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        mouse_move_enables_dpms = true
    },
    debug = {
        vfr = true
    }
})

hl.config({
    gestures = {
        workspace_swipe_create_new = true
    }
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "up", action = "cursor_zoom", zoom_level = "2", mode = "mult" })
hl.gesture({ fingers = 3, direction = "down", action = "cursor_zoom", zoom_level = "0.625", mode = "mult" })

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 3.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "popin" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "popin" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.79, bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "easeOutQuint", style = "slidevert" })

hl.window_rule({ match = { title = "^float-.*$" }, tag = "+floating-window" })
hl.window_rule({ match = { tag = "floating-window" }, float = true, center = true, size = {1276, 750} })

hl.window_rule({ match = { class = "blueberry.py|blueman-manager|org.kde.dolphin|org.gnome.Nautilus|org.gnome.NautilusPreviewer|com.gabm.satty|About|TUI.float|nm-connection-editor|org.pulseaudio.pavucontrol|org.kde.gwenview|Wiremix|waypaper"}, tag = "+floating-window" })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk|org.freedesktop.impl.portal.desktop.kde|sublime_text|DesktopEditors|org.gnome.Nautilus|waypaper|brave-browser|zen", title="^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*|File.*Upload.*)" }, tag = "+floating-window" })
hl.window_rule({ match = { class = "[Ss]lack", title = "Slack - Huddle Preview" }, tag = "+floating-window" })
hl.window_rule({ match = { class = "^(Bitwarden)$"}, no_screen_share = true, tag = "+floating-window" })
hl.window_rule({ match = { class = "emacs", title = "emacs-float" }, float = true, size = {1400, 400}, move = { "(window_w*0.5)", "(monitor_h-window_h-50)" }})

hl.window_rule({ match = { title = "(Picture.?in.?[Pp]icture)" }, tag = "+pip" })
hl.window_rule({ match = { tag = "pip" }, float = true, pin = true, size = { 600, 338 }, keep_aspect_ratio = true, border_size = 0, opacity = "1 1", move = { "(monitor_w-window_w-10)", "(monitor_h-window_h-10)" } })


hl.window_rule({ workspace = 1, match = { class = "^(.*Microsoft Teams.*|teams-for-linux|discord|WebCord|[Ss]lack)$" } })
hl.window_rule({ workspace = 2, match = { class = "(brave-browser|zen$)" } })
hl.window_rule({ workspace = 3, match = { class = "emacs", title = ".*GNU Emacs.*" } })
hl.window_rule({ workspace = "special:scratchpad", match = { class = "deezer-desktop" }, tag = "+floating-window" })

hl.window_rule({ match = { title = "WebcamOverlay" }, float = true, pin = true, no_initial_focus = true, no_dim = true, move = { "(monitor_w-window_w-10)", "(monitor_h-window-h-10)"  } })

hl.window_rule({ match = { class = ".*" }, opaque = 1, idle_inhibit = "fullscreen" })
hl.window_rule({ match = { class = "^(kitty|Alacritty|com.mitchellh.ghostty)$" }, opaque = 0 })

hl.layer_rule({ match = { namespace = "(selection|wayfreeze|hyprpicker)" }, no_anim = true })
hl.layer_rule({ match = { namespace = "(rofi|walker|vicinae)" }, dim_around = true })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, animation = "slide", blur = true, no_screen_share = true })

local term = "uwsm-app -- ghostty"
local term2 = "uwsm-app -- kitty"
local termapp = "uwsm-app -- ghostty +new-window -e"
local termapp2 = "uwsm-app -- kitty -e"

local thememenu = "~/.config/rofi/theme.sh"
local appmenu = "vicinae toggle"
local appmenu2 = "~/.config/rofi/appmenu.sh"
local clipboardlist = "~/.config/rofi/clipboardlist.sh"
local powermenu = "~/.config/hypr/scripts/powermenu.sh"
local volume = "~/.config/hypr/scripts/volume.sh"


local noctalia_ipc = "qs -c noctalia-shell ipc call"

-- local wallpapermenu = "~/.config/rofi/wallpaper.sh"
local wallpapermenu = noctalia_ipc .. " wallpaper toggle"

local notification_menu = noctalia_ipc .. " notifications toggleHistory"
local notification_toggle = noctalia_ipc .. " notifications toggleDND"
local notification_clear = noctalia_ipc .. " notifications clear"

local brightness = "~/.config/hypr/scripts/brightness.sh"
local lockscreen = "hyprlock"
local sleep = "~/.config/hypr/scripts/sleep.sh"
local suspend = "~/.config/hypr/scripts/suspend.sh"
local wlogout = "~/.config/hypr/scripts/wlogout.sh"
local colorpicker = "~/.config/hypr/scripts/colorpicker.sh"
local files = "uwsm-app -- dolphin"
local editor = "uwsm-app -- emacsclient -c -n -a 'emacs'"
local editorTerm = term .. " -e emacsclient -t -a 'emacs -nw'"
local editorEverywhere =  "emacsclient --eval '(thanos/type)'"

local browser = "uwsm-app -- zen-browser"
-- local help_keybind = "~/.config/hypr/scripts/show_keybind.sh"
local help_keybind = noctalia_ipc .. " plugin:keybind-cheatsheet toggle"
local screenshot = "~/.config/hypr/scripts/screenshot.sh"
local screenrecord = "~/.config/hypr/scripts/screenrecord.sh"
local screenrecordMenu = "~/.config/hypr/scripts/screenrecord-menu.sh"

hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(term), { description = "Terminal" })
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd(term2), { description = "Second Terminal" })
hl.bind("SUPER + CTRL + RETURN", hl.dsp.exec_cmd(term2, {float = true, center = true, size = {950, 600}}), { description = "Second Terminal" })

hl.bind("SUPER + E", hl.dsp.exec_cmd(files), { description = "File Manager" })
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd(editor), { description = "Editor" })
hl.bind("SUPER + CTRL + E", hl.dsp.exec_cmd(editorTerm), { description = "Editor in Term" })
hl.bind("SUPER + code:18", hl.dsp.exec_cmd(termapp .. " k9s --logoless"), { description = "K9S" })
hl.bind("SUPER + M", hl.dsp.exec_cmd(termapp .. " btop"), { description = "Btop" })
hl.bind("SUPER + V", hl.dsp.exec_cmd(clipboardlist), { description = "Open clipboard" })
hl.bind("SUPER + SHIFT + I", hl.dsp.exec_cmd(editorEverywhere), { description = "Editor for every text" })

hl.bind("SUPER + D", hl.dsp.exec_cmd(appmenu), { description = "AppMenu" })
hl.bind("SUPER + X", hl.dsp.exec_cmd(powermenu), { description = "PowerMenu" })
hl.bind("SUPER + W", hl.dsp.exec_cmd(wallpapermenu), { description = "WallpaperMenu" })
hl.bind("SUPER + SHIFT + COMMA", hl.dsp.exec_cmd(help_keybind), { description = "HelpMenu" })
hl.bind("SUPER + N", hl.dsp.exec_cmd(notification_menu), { description = "NotificationMenu" })
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd(notification_toggle), { description = "NotificationDNDToggle" })
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd(notification_clear), { description = "NotificationClear" })

hl.bind("SUPER + C", hl.dsp.exec_cmd(colorpicker), { description = "ColorPicker" })
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd(suspend), { description = "Suspend" })

hl.bind("SUPER + CTRL + ALT + T", hl.dsp.exec_cmd([[notify-send -u low "    $(date +"%A %H:%M  ·  %d %B %Y  ·  Week %V")"]]), { description = "Show time" })
hl.bind("SUPER + CTRL + ALT + B", hl.dsp.exec_cmd([[notify-send -u low "󰁹    Battery is at $(~/.config/hypr/scripts/battery-remaining.sh)%"]]), { description = "Show battery remaining" })

hl.bind("SUPER + CTRL + A", hl.dsp.exec_cmd(termapp2 .. " wiremix", { float = true, center = true }), { description = "Audio controls" })
hl.bind("SUPER + CTRL + B", hl.dsp.exec_cmd(termapp2 .. " bluetui", { float = true, center = true, size = {800, 500} }), { description = "Bluetooth controls" })
hl.bind("SUPER + CTRL + W", hl.dsp.exec_cmd(termapp2 .. " impala", { float = true, center = true }), { description = "Wifi controls" })

hl.config({
    binds = {
        drag_threshold = 10 -- Fire a drag event only after dragging for more than 10px
    }
})

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "MoveWindow" })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "ResizeWindow" })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(brightness .. " --inc"), { locked = true, repeating = true, description = "Raise Brightness" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(brightness .. " --dec"), { locked = true, repeating = true, description = "Lower Brightness" })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(volume .. " --inc"), { locked = true, repeating = true, description = "Raise Volume" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(volume .. " --dec"), { locked = true, repeating = true, description = "Lower Volume" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(volume .. " --toggle"), { locked = true, description = "Toggle Volume" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(volume .. " --toggle-mic"), { locked = true, description = "Toggle Mic" })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, description = "Next Track" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Pause Media" })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Pause Media" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, description = "Previous Track" })
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"), { locked = true, description = "Stop Track" })

hl.bind("PRINT", hl.dsp.exec_cmd(screenshot .. " smart"), { description = "Screenshot Smart"})
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("wayscriber -a"), { description = "Screenshot Edit"})

hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd(screenrecordMenu), { description = "Start Capture" })

hl.bind("SUPER + SHIFT + T", hl.dsp.exec_cmd("~/.config/hypr/scripts/image-to-text.sh"), { description = "Image To Text" })

hl.bind("SUPER + SHIFT + CTRL + W", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"), { description = "Toggle Waybar" })

hl.bind("SUPER + Q", hl.dsp.window.close(), { description = "Kill Active"})
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("~/.config/hypr/scripts/window-pop.sh"), { description = "Pop window" })
hl.bind("SUPER + SHIFT + SPACE", hl.dsp.layout("togglesplit"), { description = "Toggle window split" })
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }), { description = "Full screen" })
hl.bind("SUPER + ALT + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 2 }), { description = "Tiled full screen" })
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({ mode = "maximized" }), { description = "Full width" })
hl.bind("SUPER + G", hl.dsp.group.toggle(), { description = "Toggle Group" })
hl.bind("SUPER + P", hl.dsp.window.pseudo(), { description = "Pseudo Window" })
hl.bind("SUPER + C", hl.dsp.exec_cmd("~/.config/hypr/scripts/compactmode.sh"), { description = "Toggle CompactMode" })
hl.bind("SUPER + O", function()
    hl.dispatch(hl.dsp.window.set_prop({prop = "opaque", value = "toggle" }))
  end, { description = "Toggle Opaque" })

hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("scratchpad"), { description = "Toggle scratchpad" })
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:scratchpad" }), { description = "Move window to scratchpad" })

hl.bind("SUPER + TAB", function()
    hl.dispatch(hl.dsp.window.cycle_next())   -- Change focus to another window
    hl.dispatch(hl.dsp.window.bring_to_top()) -- Bring it to the top
end, { description = "Cycle windows forward" })
hl.bind("SUPER + SHIFT + TAB", function()
    hl.dispatch(hl.dsp.window.cycle_next({next = false})) -- Change focus to another window
    hl.dispatch(hl.dsp.window.bring_to_top())             -- Bring it to the top
end, { description = "Cycle windows backward" })

hl.bind("SUPER + H", hl.dsp.focus( { direction = "l" }), { description = "Focus Left" })
hl.bind("SUPER + L", hl.dsp.focus( { direction = "r" }), { description = "Focus Right" })
hl.bind("SUPER + K", hl.dsp.focus( { direction = "u" }), { description = "Focus Up" })
hl.bind("SUPER + J", hl.dsp.focus( { direction = "d" }), { description = "Focus Down" })

hl.bind("SUPER + SEMICOLON", hl.dsp.focus({ monitor = "+1" }), { description = "Focus next monitor" })
hl.bind("SUPER + COMMA", hl.dsp.focus({ monitor = "-1" }), { description = "Focus prev monitor" })

hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l", group_aware = true }), { description = "Move Left"})
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r", group_aware = true }), { description = "Move Right"})
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u", group_aware = true }), { description = "Move Up"})
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d", group_aware = true }), { description = "Move Down"})

hl.bind("SUPER + B", hl.dsp.group.prev(), { description = "Previous In Group" })
hl.bind("SUPER + SHIFT + B", hl.dsp.group.next(), { description = "Next In Group" })

hl.bind("SUPER + CTRL + H", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true, description = "Shrink Window Horizontally" })
hl.bind("SUPER + CTRL + L", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true, description = "Grow Window Horizontally" })
hl.bind("SUPER + CTRL + K", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true, description = "Shrink Window Vertically"})
hl.bind("SUPER + CTRL + J", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true, description = "Grow Window Vertically"})

for workspace = 1, 8 do
  local key = "code:" .. tostring(workspace + 9)
  hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = tostring(workspace) }), { description = "Switch to workspace " .. workspace })
  hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = tostring(workspace) }), { description = "Move window to workspace " .. workspace })
  hl.bind("SUPER + SHIFT + ALT + " .. key, hl.dsp.window.move({ workspace = tostring(workspace), follow = false }), { description = "Move window silently to workspace " .. workspace })
end

hl.bind("SUPER + ALT + H", hl.dsp.workspace.move({ monitor = "l" }), { description = "Move workspace to left monitor" })
hl.bind("SUPER + ALT + L", hl.dsp.workspace.move({ monitor = "r" }), { description = "Move workspace to right monitor" })
hl.bind("SUPER + ALT + K", hl.dsp.workspace.move({ monitor = "u" }), { description = "Move workspace to up monitor" })
hl.bind("SUPER + ALT + J", hl.dsp.workspace.move({ monitor = "d" }), { description = "Move workspace to down monitor" })

hl.env("GDK_BACKEND","wayland,x11,*")
hl.env("QT_QPA_PLATFORM","wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME","qt6ct")
hl.env("QT_STYLE_OVERRIDE","kvantum")
hl.env("SDL_VIDEODRIVER","wayland")
hl.env("CLUTTER_BACKEND","wayland")
hl.env("MOZ_ENABLE_WAYLAND","1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT","wayland")
hl.env("OZONE_PLATFORM","wayland")
hl.env("XDG_SESSION_TYPE","wayland")
hl.env("XDG_CURRENT_DESKTOP","Hyprland")
hl.env("XDG_SESSION_DESKTOP","Hyprland")

hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

hl.env("XDG_MENU_PREFIX", "arch-")

hl.env("DEBUGINFOD_URLS", "https://debuginfod.archlinux.org")
