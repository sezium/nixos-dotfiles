{ pkgs, ... }: {

  home.packages = with pkgs; [

    # System / terminal utilities
    fastfetch
    btop
    tree
    unzip
    zip
    wget
    killall
    perf

    # Search / navigation / CLI tools
    fd
    fzf
    ripgrep
    zoxide

    # Development tools
    git
    gh
    lazygit
    gcc
    cmake
    gnumake
    bear
    neovim

    # Terminal / shell customization
    kitty
    oh-my-posh

    # Audio / sound
    wiremix
    pavucontrol
    playerctl

    # Communication / social
    discord
    telegram-desktop

    # Image / drawing / notes
    aseprite
    xournalpp

    # File manager / XFCE tools
    xfce.xfconf
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-dropbox-plugin
    xfce.tumbler
    gvfs

    # Browser / web
    brave

    # Documents / office
    libreoffice
    gnome-calculator
    zathura

    # Gaming
    prismlauncher

    # Media (video / image / audio)
    mpv
    qimgv

    # Wayland / Hyprland utilities
    hyprpaper
    waybar
    wl-clipboard
    wf-recorder
    brightnessctl

    # File sharing / network
    localsend

    # Desktop / workflow apps
    github-desktop
    wofi-power-menu

  ];

}
