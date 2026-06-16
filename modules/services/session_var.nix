# -----------------------------------------------------------------------------
# Session Variables
# -----------------------------------------------------------------------------
#
# Reference: https://nixos.wiki/wiki/Environment_variables
# Last updated: 2025-10-09
#
# -----------------------------------------------------------------------------
{
  environment.sessionVariables = {
    TERMINAL = "kitty";
    EDITOR = "nvim";
    BROWSER = "brave"; # TODO check if this is correct or else add browser to the session var in home-manager
    SHELL = "zsh";
  };
}
