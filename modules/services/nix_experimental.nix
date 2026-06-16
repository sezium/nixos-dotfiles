# -----------------------------------------------------------------------------
# Nix Experimental Features
# -----------------------------------------------------------------------------
#
# Reference: https://nixos.org/manual/nix/stable/#sec-flakes
# Last updated: 2025-10-09
#
# -----------------------------------------------------------------------------
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];  
  # Enables experimental features in Nix:
  # 
  # "nix-command" → Activates the new Nix CLI commands such as:
  #                 `nix build`, `nix run`, `nix develop`, `nix profile`, etc.
  #                 These commands provide a modern, unified interface
  #                 replacing some legacy commands like `nix-env`.
  #
  # "flakes" → Enables support for Nix Flakes, a reproducible and versioned
  #            format for packages, configurations, and dotfiles. This allows:
  #            - Using `flake.nix` for modular and reproducible setups
  #            - Commands like `nix flake update`, `nix flake show`, `nix flake new`
  #            - Pinning dependencies to specific revisions
}
