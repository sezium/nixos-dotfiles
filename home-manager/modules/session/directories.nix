{ config, lib, pkgs, ... }:

let
  home = config.home.homeDirectory;

  paths = rec {
    docs = "${home}/docs";
    downloads = "${home}/Downloads";

    media = "${home}/media";
    videos = "${media}/videos";
    music = "${media}/music";
    screenshots = "${media}/screenshots";

    # runtime target (non source)
    images = "${media}/images";

    hacks = "${home}/hacks";
    github = "${home}/github";
  };

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

    "${home}/scripts" = {
      source = ../scripts; # TODO fix this path
      recursive = true;
      executable = true;
    };

    "${paths.images}" = {
      source = ../wallpapers; # TODO fix this path
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
  };
}
