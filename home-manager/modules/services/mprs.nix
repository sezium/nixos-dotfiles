# Many Bluetooth headsets include media buttons (play/pause/skip).
# The mpris-proxy service, part of the BlueZ package, bridges these
# headset controls to media players that support the D-Bus MPRIS standard
# (e.g., Spotify, VLC, Firefox).
{
  services.mpris-proxy.enable = true;     # Enables MPRIS proxy to make Bluetooth headset buttons control media playback
}
