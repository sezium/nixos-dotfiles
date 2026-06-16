{ pkgs, ... }: {
  environment.systemPackages = [ 
      pkgs.home-manager 
      pkgs.wineWow64Packages.waylandFull
  ];
}
