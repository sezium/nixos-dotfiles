{ pkgs, stateVersion, hostname, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./boot
    ./kernel
    ./drivers
    ./services
    ./packages
  ];

  networking.hostName = hostname;
  system.stateVersion = stateVersion;

}

