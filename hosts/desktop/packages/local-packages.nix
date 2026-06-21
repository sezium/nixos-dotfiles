{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    pkgs.nvidia-docker
    pkgs.home-manager
  ];
}
