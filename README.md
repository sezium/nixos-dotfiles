# NixOS Config 



## Features

- **Multiple Hosts Support**:
- **Gruvbox Theme**:
- **Hyprland + Waybar**: 
- **Home Manager Integration**:
- **Tmux**:
- **Zsh**;
- **Kitty**;
- **Stylix Support**;

## Installation

To get started with this setup, follow these steps:

1. **Install NixOS**: If you haven't already installed NixOS, follow the [NixOS Installation Guide](https://nixos.org/manual/nixos/stable/#sec-installation) for detailed instructions.
2. **Clone the Repository**:

	```bash
    git clone https://github.com/sezium/nixos-dotfiles
    cd nixos-dotfiles
    ```

3. **Copy one of the hosts configuration to set up your own**:

    ```bash
    cd hosts
    cp -r laptop <your_hostname>
    cd <your_hostname>
    ```

4. **Put your `hardware-configuration.nix` file there**:

    ```bash
    cp /etc/nixos/hardware-configuration.nix ./
    ```

5. **Edit `hosts/<your_hostname>/local-packages.nix` and `nixos/packages.nix` files if needed**:

    ```bash
    vim local-packages.nix
    vim ../../nixos/packages.nix
    ```

6. **Finally, edit the `flake.nix` file**:

    ```diff
    ...
      outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs: let
        system = "x86_64-linux";
    --  homeStateVersion = "25.05";
    ++  homeStateVersion = "<your_home_manager_state_version>";
    --  user = "sezium";
    ++  user = "<your_username>";
        hosts = [
    --    { hostname = "desktop"; stateVersion = "25.05"; }
    --    { hostname = "laptop";  stateVersion = "25.05"; }
    ++    { hostname = "<your_hostname>"; stateVersion = "<your_state_version>"; }
        ];
    ...
    ```

7. **Rebuilding**:

    ```bash
    cd nixos-dotfiles
    git add .
    sudo nixos-rebuild switch --flake ./#<hostname>
    # or nixos-install --flake ./#<hostname> if you are installing on a fresh system
    home-manager switch --flake ./#sezium
    ```
