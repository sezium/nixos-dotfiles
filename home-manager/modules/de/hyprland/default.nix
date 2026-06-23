{ config, lib, pkgs, ... }:

let
  cfg = config.myPaths;

  # Driver / env NVIDIA: centralizzati qui, applicati SOLO se questa
  # macchina ha effettivamente una GPU NVIDIA e un desktop Hyprland
  # attivo. Esposto come option così il modulo NixOS di sistema può
  # impostarlo a true sulle macchine desktop con NVIDIA, lasciandolo
  # false (default) ovunque altrove (es. laptop senza NVIDIA).
  nvidiaEnvBlock =
    if config.myHyprland.nvidiaDesktop then
      ''
        hl.env("GBM_BACKEND", "nvidia-drm")
        hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
        hl.env("LIBVA_DRIVER_NAME", "nvidia")
        hl.env("GDK_BACKEND", "wayland,x11,*")
        hl.env("SDL_VIDEODRIVER", "wayland")
        hl.env("CLUTTER_BACKEND", "wayland")
      ''
    else
      "-- nessuna GPU NVIDIA su questa macchina: nessuna env iniettata";

  hyprLuaFinal = pkgs.replaceVars ./hyprland.lua {
    scriptsDir = cfg.scripts;
    screenshotsDir = cfg.screenshots;
    nvidiaEnvBlock = nvidiaEnvBlock;

    # Questi NON sono placeholder Nix: sono variabili letterali di wpctl
    # (@DEFAULT_AUDIO_SINK@ / @DEFAULT_AUDIO_SOURCE@) che devono restare
    # cosi' nel file finale. Passando null disabilitiamo la sostituzione
    # E il controllo "unsubstituted identifier" di replaceVars per loro.
    DEFAULT_AUDIO_SINK = null;
    DEFAULT_AUDIO_SOURCE = null;
  };
in
{
  options.myHyprland.nvidiaDesktop = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = ''
      Abilita le variabili d'ambiente NVIDIA (GBM_BACKEND,
      __GLX_VENDOR_LIBRARY_NAME, LIBVA_DRIVER_NAME, ...) dentro la
      configurazione Hyprland. Da impostare a true SOLO sulle macchine
      desktop con GPU NVIDIA (tipicamente settato dal modulo NixOS di
      sistema in base all'host); deve restare false su laptop o
      macchine senza NVIDIA per non rompere l'avvio di Wayland.
    '';
  };

  config = {
    wayland.windowManager.hyprland = {
      enable = true;
    };

    xdg.configFile."hypr/hyprland.lua".source = hyprLuaFinal;
  };
}
