<div align="center">

<img alt="NixOS" src="https://raw.githubusercontent.com/NixOS/nixos-artwork/9d2cdedd73d64a068214482902adea3d02783ba8/logo/nix-snowflake-rainbow.svg" width="140px"/>

# :cat: NixOS Config :cat:

![ci-badge](https://img.shields.io/static/v1?label=Built%20with&message=nix&color=blue&style=flat&logo=nixos&link=https://nixos.org&labelColor=111212)

My current [NixOS](https://nixos.org/) and [Home Manager](https://github.com/nix-community/home-manager/) configurations.
</div>

## Repository layout
```
.
├── flake.lock
├── flake.nix
├── homeManagerModules
│   ├── cursor.nix
│   ├── default.nix
│   ├── homePackages.nix
│   ├── hyprland
│   │   ├── default.nix
│   │   ├── hyprland.nix
│   │   └── hyprpaper.nix
│   └── programs # These programs are installed on a user-level
│       ├── default.nix
│       ├── firefox.nix
│       ├── fish.nix
│       ├── git.nix
│       ├── gitui.nix
│       ├── mpv.nix
│       ├── neovide.nix
│       ├── nvf # The configuration for neovim
│       │   ├── default.nix
│       │   ├── mappings.nix
│       │   ├── nvf-configuration.nix
│       │   └── theme.nix
│       ├── ssh.nix
│       ├── waybar.nix
│       └── yazi.nix
├── hosts # The files for differents hosts
│   └── laptop
│       ├── configuration.nix
│       ├── hardware-configuration.nix
│       ├── home-manager
│       │   └── home.nix
│       └── users.nix
├── nixosModules # Some shared modules on system-level
│   ├── bluetoothSettings.nix
│   ├── boot.nix
│   ├── default.nix
│   ├── fonts.nix
│   ├── home-manager.nix
│   ├── lix.nix
│   ├── locale.nix
│   ├── networkSettings.nix
│   ├── nixSettings.nix
│   ├── nixUnfreePackages.nix
│   ├── programs
│   │   ├── console.nix
│   │   ├── default.nix
│   │   ├── fish.nix
│   │   ├── gitGlobal.nix
│   │   ├── hyprland.nix
│   │   ├── seahorse.nix
│   │   └── ssh.nix
│   ├── services
│   │   ├── autoCpuFreq.nix
│   │   ├── avahi.nix
│   │   ├── blueman.nix
│   │   ├── default.nix
│   │   ├── fwupd.nix
│   │   ├── kbLayout.nix
│   │   ├── libinput.nix
│   │   ├── openssh.nix
│   │   ├── pcscd.nix
│   │   ├── pipewire.nix
│   │   ├── printing.nix
│   │   ├── sabnzbd.nix
│   │   └── sddm.nix
│   ├── sops.nix
│   ├── systemPackages.nix
│   ├── systemSettings.nix
│   └── yubikey.nix
├── README.md
├── scripts 
│   ├── my-awesome-script.nix
│   ├── port-forward-script.nix
│   ├── random_wallpaper.sh
│   ├── signature.sh
│   └── ssh.sh
├── secrets
│   └── secrets.yaml
└── wallpapers
    ├── anime-secrets-of-the-silent-witch-date-sortie-trailer-3962595682.jpg
    ├── frieren-anime-girl-5120x2880-15156.jpg
    └── frieren-magical-5120x2880-15165.jpeg
