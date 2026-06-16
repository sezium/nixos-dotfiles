# -----------------------------------------------------------------------------
# Home Manager Integration
# -----------------------------------------------------------------------------
#
# Reference: https://nixos.wiki/wiki/Home_Manager
# Last updated: 2025-10-09
#
# -----------------------------------------------------------------------------
{ inputs, ... }: 
{
  imports = [
    inputs.home-manager.nixosModules.default   # Import Home Manager module for NixOS
  ];

  home-manager.useGlobalPkgs = true;
}
