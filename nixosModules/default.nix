{ ... }:

{
  imports = [
    ./boot.nix
    ./fonts.nix
    ./hardware.nix
    ./locale.nix
    ./networksettings.nix
    ./nixsettings.nix
    ./overlays.nix
    ./systemSettings.nix
    ./programs/default.nix
    ./services/default.nix
    ./systempPackages.nix
  ]
}