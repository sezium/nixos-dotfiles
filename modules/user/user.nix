{ pkgs, user, config, ... }: {


  users = {
    defaultUserShell = pkgs.zsh;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "audio"];
    };
  };

  # services.getty.autologinUser = user;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "Hyprland";
        user = user;
      };
    };
  };
}
