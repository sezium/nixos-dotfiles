{ pkgs, ... }: {

  home.packages = with pkgs; [

    # System / terminal utilities
    fastfetch
    btop
    tree
    unzip
    zip
    unrar
    wget
    killall
    perf

    # Screenshot
    grim 
    slurp

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
    ninja
    cmake
    gnumake
    bear
    neovim

    cargo
    rustc
    rusty-man

    appimage-run

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
    xfconf
    thunar
    thunar-volman
    thunar-archive-plugin
    thunar-dropbox-plugin
    tumbler
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
    wofi
    wl-clipboard
    wf-recorder
    brightnessctl

    # File sharing / network
    localsend

    # Wine
    wine64
    winetricks

  ];

}
