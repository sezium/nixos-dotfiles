{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    pkgs.nvidia-docker
    pkgs.home-manager

    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
  ];
}
