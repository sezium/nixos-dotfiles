# -----------------------------------------------------------------------------
# Audio configuration (PipeWire)
# -----------------------------------------------------------------------------
#
# Reference: https://wiki.nixos.org/wiki/PipeWire
# Last updated: 2025-10-09
#
# -----------------------------------------------------------------------------
{
  security.rtkit.enable = true;              # Enables RTKit for low-latency, stable audio scheduling
    services.pipewire = {
      enable = true;                         # Starts the PipeWire multimedia server (modern replacement for PulseAudio)
        alsa.enable = true;                  # Enables ALSA compatibility so legacy apps can output audio
        alsa.support32Bit = true;            # Adds 32-bit ALSA support (needed for Steam, Wine, etc.)
        pulse.enable = true;                 # Provides a PulseAudio-compatible daemon for most desktop apps
    };
}
