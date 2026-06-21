{
  boot = {
    loader.grub.enable = true;
    loader.grub.device = "/dev/sda";
    loader.grub.configurationLimit = 5; 
  # loader.grub.efiSupport = true;
    kernelParams = ["nvidia_drm.modeset=1"];
  };


}
