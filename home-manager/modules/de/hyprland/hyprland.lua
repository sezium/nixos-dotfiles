-----------------------------
---- VARIABILI D'AMBIENTE ----
-----------------------------
hl.env("NIXOS_OZONE_WL", "1")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

-- Variabili NVIDIA: presenti solo se questa macchina e' un desktop
-- con GPU NVIDIA (centralizzato in home-manager via myHyprland.nvidiaDesktop,
-- a sua volta pilotato dal modulo di sistema). Su laptop/non-NVIDIA
-- questo blocco resta vuoto.
@nvidiaEnvBlock@

-------------
---- MONITOR ----
-------------
hl.monitor({ output = "eDP-1",    mode = "preferred", position = "auto", scale = 1.0 })
hl.monitor({ output = "HDMI-A-2", mode = "preferred", position = "auto", scale = 2.0 })

hl.layer_rule({ match = { namespace = "selection" }, no_anim = true })

---------------
---- VARIABILI ----
---------------
local mainMod     = "SUPER"
local terminal    = "kitty"
local fileManager = terminal .. " zsh -c yazi"
local menu        = "wofi --show drun"
local powerMenu   = "wofi-power-menu"
local lockScreen  = "hyprlock"
local browser     = "brave"

-- Path centralizzati, iniettati da home-manager (config.myPaths.*)
-- Non vanno mockati qui dentro: se cambiano, cambiano in
-- home-manager/modules/session/directories.nix.
local scriptsDir      = "@scriptsDir@"
local screenshotsDir  = "@screenshotsDir@"

---------------
---- AUTOSTART ----
---------------
hl.on("hyprland.start", function()
    hl.exec_cmd(lockScreen)
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("waybar")
    hl.exec_cmd(browser, { workspace = "1 silent" })
    hl.exec_cmd(terminal, { workspace = "2 silent" })
end)

-----------------
---- GENERAL ----
-----------------
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 0,
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },
})

-------------------
---- DECORATION ----
-------------------
hl.config({
    decoration = {
        rounding = 5,
        shadow = {
            enabled = false,
        },
        blur = {
            enabled = false,
        },
    },
})

-------------------
---- ANIMATIONS ----
-------------------
hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("myBezier",   { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.00} } })
hl.curve("myBezier2",  { type = "bezier", points = { {0, 0.55},   {0.45, 1}   } })
hl.curve("dragEffect", { type = "bezier", points = { {0, 1},      {0.4, 1}    } })

hl.animation({ leaf = "windowsMove", enabled = true, speed = 20, bezier = "dragEffect" })
hl.animation({ leaf = "windows",     enabled = true, speed = 10, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 4,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 4,  bezier = "dragEffect", style = "popin 20%" })
hl.animation({ leaf = "fade",        enabled = true, speed = 3,  bezier = "myBezier2" })
hl.animation({ leaf = "layersIn",    enabled = true, speed = 5,  bezier = "myBezier2", style = "fade" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 5,  bezier = "myBezier2" })

---------------
---- INPUT ----
---------------
hl.config({
    input = {
        kb_layout = "us",
        repeat_delay = 200,
        repeat_rate = 30,
        accel_profile = "flat",
        scroll_factor = 1.0,

        touchpad = {
            natural_scroll = false,
            disable_while_typing = false,
            scroll_factor = 0.2,
        },
    },
})

hl.device({ name = "razer-razer-deathadder-essential",   sensitivity = -0.65 })
hl.device({ name = "razer-razer-deathadder-essential-1", sensitivity = -0.65 })

------------------
---- GESTURES ----
------------------
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
    invert = true,
})

----------------
---- LAYOUT ----
----------------
hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "slave",
        new_on_top = true,
        mfact = 0.5,
    },
})

--------------
---- MISC ----
--------------
hl.config({
    misc = {
        animate_mouse_windowdragging = true,
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})

----------------------------
---- REGOLE FINESTRE ----
----------------------------
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

--------------------
---- KEYBINDS ----
--------------------
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("uwsm stop"))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + Q", function()
    hl.dispatch(hl.dsp.window.kill(hl.get_active_window()))
end)
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + space", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd(powerMenu))
hl.bind(mainMod .. " + 0", hl.dsp.exec_cmd(lockScreen))

hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))

local workspaceKeys = { "Z", "X", "C", "V", "B", "N", "M" }
for i, key in ipairs(workspaceKeys) do
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

hl.bind(mainMod .. " + ALT + l", hl.dsp.window.resize({ x = 40,  y = 0,   relative = true }))
hl.bind(mainMod .. " + ALT + h", hl.dsp.window.resize({ x = -40, y = 0,   relative = true }))
hl.bind(mainMod .. " + ALT + j", hl.dsp.window.resize({ x = 0,   y = 40,  relative = true }))
hl.bind(mainMod .. " + ALT + k", hl.dsp.window.resize({ x = 0,   y = -40, relative = true }))

-- Screenshot: path reale gestito da home-manager (myPaths.screenshots),
-- niente piu' "~/Media/Pictures/screenshots" mockato e fuori posto.
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(
    'grim -g "$(slurp -w 0)" ' .. screenshotsDir .. '/$(date +\'%s\')_grim.png'
))

-- Animazioni: tasto SUPER + A, chiama lo script reale gestito da
-- home-manager (myPaths.scripts), niente piu' "~/scripts" mockato.
hl.bind(mainMod .. " + A", function()
    local enabled = hl.get_config("animations.enabled")
    hl.config({ animations = { enabled = not enabled } })
end)
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(scriptsDir .. "/waybar.sh"))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),               { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),          { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),              { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),            { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"),                                   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set +5%"),                                   { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
