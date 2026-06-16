# -----------------------------------------------------------------------------
# Nix-ld Integration
# -----------------------------------------------------------------------------
#
# Reference: None
# Last updated: 2025-10-09
#
# -----------------------------------------------------------------------------
{
  programs.nix-ld.enable = true;  # Enables nix-ld to run non-Nix binaries that depend on standard system libraries
}
