{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [ 
  pkgs.man-pages pkgs.man-pages-posix 
  ];
}
