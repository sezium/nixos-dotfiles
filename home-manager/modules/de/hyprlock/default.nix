# see
# also hyprlock documentation is head of hyprlock nix packages version, so i can't manage animation...
# https://mynixos.com/home-manager/options/programs.hyprlock
# TODO use stylix with this color...
{ config, ... }:

let
  paths = config.myPaths;
  colors = config.lib.stylix.colors;
in
{
  programs.hyprlock = {
    enable = true;

    importantPrefixes = [
      # "$"
      # "bezier"
      # "monitor"
      # "size"
      # "input-field"
    ];

    extraConfig = ''
      # BACKGROUND
      background {
        monitor =
        path = ${paths.images}/flower.png
        blur_passes = 3
        contrast = 0.8916
        brightness = 0.8172
        vibrancy = 0.1696
        vibrancy_darkness = 0.0
      }

      # GENERAL
      general {
        grace = 0
      }

      # ANIMATION
      animations {
        enabled = true
        bezier = linear, 1, 1, 0, 0
        animation = fadeIn, 1, 5, linear
        animation = fadeOut, 1, 5, linear
        animation = inputFieldDots, 1, 2, linear
      }

      # PROFILE PHOTO
      image {
        monitor =
        path = ${paths.images}/icon_256x256.png
        border_size = 0
        size = 200
        rounding = -1
        rotate = 0
        reload_time = -1
        reload_cmd =
        position = 0, 40
        halign = center
        valign = center
      }

      # DAY-MONTH-DATE
      label {
        monitor =
        text = cmd[update:1000] echo -e "$(date +"%A, %B %d")"
        color = rgba(${colors.base05-rgb-r}, ${colors.base05-rgb-g}, ${colors.base05-rgb-b}, 0.70)
        font_size = 25
        position = 0, 350
        halign = center
        valign = center
      }

    # TIME
    label {
      monitor =
      text = cmd[update:1000] echo "<span>$(date +"%I:%M")</span>"
      color = rgba(${colors.base07-rgb-r}, ${colors.base07-rgb-g}, ${colors.base07-rgb-b}, 0.70)
      font_size = 100
      position = 0, 250
      halign = center
      valign = center
    }

    # INPUT FIELD
    input-field {
      monitor =
      size = 300, 60
      outline_thickness = 2
      dots_size = 0.2
      dots_spacing = 0.2
      dots_center = true

      outer_color = rgba(${colors.base04-rgb-r}, ${colors.base04-rgb-g}, ${colors.base04-rgb-b}, 0.0)
      inner_color = rgba(${colors.base01-rgb-r}, ${colors.base01-rgb-g}, ${colors.base01-rgb-b}, 0.85)
      font_color = rgb(${colors.base05-rgb-r}, ${colors.base05-rgb-g}, ${colors.base05-rgb-b})

      fade_on_empty = false
      hide_input = false

      position = 0, -210
      halign = center
      valign = center
    }
      # CURRENT SONG
      label {
        monitor =
        text = cmd[update:1000] echo "$(${paths.scripts}/songdetail.sh)"
        color = rgba(${colors.base05-rgb-r}, ${colors.base05-rgb-g}, ${colors.base05-rgb-b}, 0.60)
        font_size = 18
        position = 0, 50
        halign = center
        valign = bottom
      }
    '';
  };
}
