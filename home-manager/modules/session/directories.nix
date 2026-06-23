{ config, lib, pkgs, ... }:

let
  home = config.home.homeDirectory;
in
{
  # Path centralizzati: ogni altro modulo (hyprland, script, ecc.) deve
  # leggere questi valori da `config.myPaths.*` invece di scrivere stringhe
  # mockate a mano (es. "~/Media/Pictures/screenshots" o "~/scripts").
  options.myPaths = {
    docs = lib.mkOption {
      type = lib.types.str;
      default = "${home}/docs";
    };
    downloads = lib.mkOption {
      type = lib.types.str;
      default = "${home}/Downloads";
    };

    media = lib.mkOption {
      type = lib.types.str;
      default = "${home}/media";
    };
    videos = lib.mkOption {
      type = lib.types.str;
      default = "${config.myPaths.media}/videos";
    };
    music = lib.mkOption {
      type = lib.types.str;
      default = "${config.myPaths.media}/music";
    };
    screenshots = lib.mkOption {
      type = lib.types.str;
      default = "${config.myPaths.media}/screenshots";
    };
    images = lib.mkOption {
      type = lib.types.str;
      default = "${config.myPaths.media}/images";
    };

    hacks = lib.mkOption {
      type = lib.types.str;
      default = "${home}/hacks";
    };
    github = lib.mkOption {
      type = lib.types.str;
      default = "${home}/github";
    };
    scripts = lib.mkOption {
      type = lib.types.str;
      default = "${home}/scripts";
    };
  };

  config =
    let
      paths = config.myPaths;
    in
    {
      home.sessionVariables = {
        PATH_DOCS = paths.docs;
        PATH_DOWNLOADS = paths.downloads;

        PATH_MEDIA = paths.media;
        PATH_VIDEOS = paths.videos;
        PATH_MUSIC = paths.music;
        PATH_SCREENSHOTS = paths.screenshots;
        PATH_IMAGES = paths.images;

        PATH_HACKS = paths.hacks;
        PATH_GITHUB = paths.github;
        PATH_SCRIPTS = paths.scripts;
      };

      home.file = {
        "${paths.docs}/.keep".text = "";
        "${paths.downloads}/.keep".text = "";

        "${paths.media}/.keep".text = "";
        "${paths.videos}/.keep".text = "";
        "${paths.music}/.keep".text = "";
        "${paths.screenshots}/.keep".text = "";
        "${paths.images}/.keep".text = "";

        "${paths.hacks}/.keep".text = "";
        "${paths.github}/.keep".text = "";

        "${paths.scripts}" = {
          source = ../scripts;
          recursive = true;
          executable = true;
        };

        "${paths.images}" = {
          source = ../wallpapers;
          recursive = true;
        };
      };

      xdg.userDirs = {
        enable = true;
        createDirectories = true;

        documents = paths.docs;
        download = paths.downloads;

        videos = paths.videos;
        music = paths.music;
        pictures = paths.images;

        # Non gestiamo Desktop / Public / Templates: li puntiamo alla home
        # stessa così Home Manager non li materializza come cartelle
        # separate (createDirectories=true le creerebbe comunque se
        # lasciate al default XDG).
        desktop = home;
        publicShare = home;
        templates = home;
      };
    };
}
