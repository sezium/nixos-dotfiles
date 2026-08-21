{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_6_12; # latest kernel for the nvidia legacy gpu.
}
