{ pkgs, stateVersion, hostname, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./boot
    ./kernel
    ./drivers
    ./services
    ./packages
    ../../modules
  ];

  networking.hostName = hostname;
  system.stateVersion = stateVersion;

}
