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
│   ├── programs
│   │   ├── bacon.nix
│   │   ├── default.nix
│   │   ├── firefox.nix
│   │   ├── fish.nix
│   │   ├── git.nix
│   │   ├── mpv.nix
│   │   ├── ssh.nix
│   │   ├── waybar.nix
│   │   └── yazi.nix
│   └── services
├── hosts
│   ├── desktop
│   └── laptop
│       ├── configuration.nix
│       ├── hardware-configuration.nix
│       ├── home-manager
│       │   ├── home.nix
│       │   └── scripts
│       │       ├── random_wallpaper.sh
│       │       ├── signature.sh
│       │       └── ssh.sh
│       └── users.nix
├── nixosModules
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
│   │   └── sddm.nix
│   ├── systemPackages.nix
│   └── systemSettings.nix
├── README.md
└── wallpapers
    ├── anime-secrets-of-the-silent-witch-date-sortie-trailer-3962595682.jpg
    ├── frieren-anime-girl-5120x2880-15156.jpg
    └── frieren-magical-5120x2880-15165.jpeg
``` 
