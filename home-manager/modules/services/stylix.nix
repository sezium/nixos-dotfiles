{ pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "either";
    # for theme, please see https://github.com/tinted-theming/schemes/tree/spec-0.11/base16
base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
# base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

    # @TODO fix tmux

    image = ../wallpapers/flower.png;

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    opacity = {
      applications = 1.0;
      terminal = 1.0; # 0.95
      desktop = 1.0;
      popups = 1.0;
    };

    icons = {
      enable = true;
      package = pkgs.gruvbox-plus-icons;
      light = "Gruvbox-Plus-Light";
      dark = "Gruvbox-Plus-Dark";
    };


# if you're changing a nerd font and some nerd font icons are not showing,
# run this: fc-cache -r.
    fonts = {
      monospace = {
        # package = pkgs.cascadia-code;
        package = pkgs.nerd-fonts.caskaydia-cove;
        name = "CaskaydiaCove Nerd Font";
        # package = pkgs.nerd-fonts.jetbrains-mono;
        # name = "JetBrainsMono Nerd Font";
      };

      sansSerif = {
        package = pkgs.nerd-fonts.caskaydia-cove;
        name = "CaskaydiaCove Nerd Font";
        # package = pkgs.nerd-fonts.jetbrains-mono;
        # name = "JetBrainsMono Nerd Font";
      };

      serif = {
        package = pkgs.nerd-fonts.caskaydia-cove;
        name = "CaskaydiaCove Nerd Font";
        # package = pkgs.dejavu_fonts;
        # name = "DejaVu Serif";
      };
    };

    fonts.sizes = {
      terminal = 11;
      applications = 12;
      popups = 10;
      desktop = 10;
    };

    targets = {
      nixos-icons.enable = true;
      fzf.enable = true;
      gtk.enable = true;
      hyprland.enable = true;
      hyprlock.enable = false;
      yazi.enable = true;
      kitty.enable = true;
      mpv.enable = true;
      neovim.enable = true;
      qt.enable = true;
      tmux.enable = true;
      nixcord.enable = true; # discord
      spotify-player.enable = true;
      vim.enable = true;
      # waybar.enable = true;
      # wofi.enable = true;
      zathura.enable = true;
    };
  };

}
