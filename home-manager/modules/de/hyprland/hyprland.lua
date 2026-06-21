--[[
~/.config/hypr/hyprland.lua
Convertito da github.com/sezium/nixos-dotfiles
(home-manager/modules/de/hyprland/main.nix + binds.nix)

NOTA IMPORTANTE:
Da Hyprland 0.55 in poi, la sintassi "hyprlang" (hyprland.conf) e' deprecata
in favore di Lua (hyprland.lua). Questo file e' la conversione 1:1 del
vecchio hyprland.conf alla nuova API Lua (namespace globale `hl`).
Riferimento: https://wiki.hypr.land/Configuring/Start/
--]]

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

-- Variabili specifiche NVIDIA (rimuovi se non hai una GPU NVIDIA)
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")

hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-------------
---- MONITOR ----
-------------
-- Modifica secondo i tuoi monitor reali (questi sono quelli dell'autore originale)
-- Vedi https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({ output = "eDP-1",    mode = "preferred", position = "auto", scale = 1.0 })
hl.monitor({ output = "HDMI-A-2", mode = "preferred", position = "auto", scale = 2.0 })

-- Necessario per far funzionare correttamente gli screenshot
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

-- Dispositivi specifici (mouse Razer dell'autore originale - rimuovi/adatta)
hl.device({ name = "razer-razer-deathadder-essential",   sensitivity = -0.65 })
hl.device({ name = "razer-razer-deathadder-essential-1", sensitivity = -0.65 })

------------------
---- GESTURES ----
------------------
-- workspace_swipe / workspace_swipe_fingers sono stati sostituiti dal nuovo
-- sistema gestures. Vedi https://wiki.hypr.land/Configuring/Variables/#gestures
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
    invert = true,
})

----------------
---- LAYOUT ----
----------------
-- NOTA: l'opzione dwindle.pseudotile e' stata RIMOSSA in Hyprland 0.55
-- ("removed due to a lack of functionality"). Il dispatcher hl.dsp.window.pseudo()
-- (bind mainMod+P) resta comunque valido e disponibile.
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
-- NOTA CRITICA: hl.dsp.exit() NON ESISTE nell'API Lua (era solo "exit" in hyprlang).
-- Chiamarlo genera l'errore "hl.dispatch: expected a dispatcher" in fase di caricamento,
-- il che puo' interrompere la registrazione di TUTTI i bind scritti dopo questo punto
-- nello stesso file -- probabile causa di "SUPER non va" per i tasti successivi a D.
-- La wiki raccomanda "uwsm stop" (se usi uwsm) o "loginctl terminate-user ''" altrimenti,
-- per non interferire con la sequenza di shutdown ordinata.
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("uwsm stop"))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- NOTA: hl.dsp.window.kill_active() non esiste. Il dispatcher corretto e' hl.dsp.window.kill(),
-- ma se chiamato SENZA argomenti chiude TUTTE le istanze della classe della finestra attiva
-- (comportamento diverso dal vecchio killactive - vedi issue #14415, chiusa come "not planned").
-- Per ottenere l'equivalente esatto del vecchio killactive (solo la finestra attiva)
-- bisogna passare esplicitamente la finestra attiva tramite una funzione lua:
hl.bind(mainMod .. " + Q", function()
    hl.dispatch(hl.dsp.window.kill(hl.get_active_window()))
end)
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + space", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd(powerMenu))
hl.bind(mainMod .. " + 0", hl.dsp.exec_cmd(lockScreen))

-- Movimento focus (layout particolare: L=sinistra, H=destra, K=su, J=giu')
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))

-- Workspace 1-7
local workspaceKeys = { "Z", "X", "C", "V", "B", "N", "M" }
for i, key in ipairs(workspaceKeys) do
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Spostamento finestre
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Resize finestra attiva
hl.bind(mainMod .. " + ALT + l", hl.dsp.window.resize({ x = 40,  y = 0,   relative = true }))
hl.bind(mainMod .. " + ALT + h", hl.dsp.window.resize({ x = -40, y = 0,   relative = true }))
hl.bind(mainMod .. " + ALT + j", hl.dsp.window.resize({ x = 0,   y = 40,  relative = true }))
hl.bind(mainMod .. " + ALT + k", hl.dsp.window.resize({ x = 0,   y = -40, relative = true }))

-- Screenshot (percorso personalizzato, adatta alla tua home)
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(
    [[grim -g "$(slurp -w 0)" ~/Media/Pictures/screenshots/$(date +'%s')_grim.png]]
))

-- Script personalizzati dell'autore originale (probabilmente da rimuovere/adattare)
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("~/scripts/animation.sh"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/scripts/waybar.sh"))

-- Cambio workspace con rotellina del mouse
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Sposta/ridimensiona finestre con mainMod + click sinistro/destro
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Tasti multimedia (volume, luminosita')
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),               { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),          { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),              { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),            { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"),                                   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set +5%"),                                   { locked = true, repeating = true })

-- Controllo player multimediale
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
