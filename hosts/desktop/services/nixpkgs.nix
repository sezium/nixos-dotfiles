{
  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    nvidia.acceptLicense = true;
  };
  # ┃            nixpkgs.config.nvidia.acceptLicense = true;
}
