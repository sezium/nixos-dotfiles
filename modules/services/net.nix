# -----------------------------------------------------------------------------
# NetworkManager Integration
# -----------------------------------------------------------------------------
#
# Reference: https://nixos.org/manual/nixos/stable/#sec-network-configuration
# Last updated: 2025-10-09
#
# -----------------------------------------------------------------------------
{
  networking.networkmanager.enable = true;  # Enables NetworkManager for managing network connections (Wi-Fi, Ethernet, VPN)
}
