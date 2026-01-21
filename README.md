<div align="center">

<img alt="NixOS" src="https://raw.githubusercontent.com/NixOS/nixos-artwork/9d2cdedd73d64a068214482902adea3d02783ba8/logo/nix-snowflake-rainbow.svg" width="140px"/>

# :cat: NixOS Config :cat:

![ci-badge](https://img.shields.io/static/v1?label=Built%20with&message=nix&color=blue&style=flat&logo=nixos&link=https://nixos.org&labelColor=111212)

My current [NixOS](https://nixos.org/) and [Home Manager](https://github.com/nix-community/home-manager/) configurations.
</div>

## Repository layout
```
.
├── configuration.nix    # Main configuration
├── flake.lock
├── flake.nix
├── hardware-configuration.nix
└── home-manager
    ├── home.nix
    ├── modules
    │   ├── cursor.nix
    │   ├── default.nix
    │   ├── fish.nix
    │   ├── git.nix
    │   ├── hyprland
    │   │   ├── default.nix
    │   │   ├── hyprland.nix
    │   │   └── hyprpaper.nix
    │   ├── mpv.nix
    │   ├── pkgs.nix
    │   ├── ssh.nix
    │   ├── waybar.nix
    │   └── yazi.nix
    ├── scripts    # Some scripts I find useful
    │   ├── random_wallpaper.sh    # incomplete
    │   ├── signature.sh    # Generate signing key on yubikey
    │   └── ssh.sh    # Generate ssh key on yubikey
    └── wallpapers
        ├── anime-secrets-of-the-silent-witch-date-sortie-trailer-3962595682.jpg
        ├── frieren-anime-girl-5120x2880-15156.jpg
        └── frieren-magical-5120x2880-15165.jpeg
```
