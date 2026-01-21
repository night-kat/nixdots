{ ... }:

{
  imports = [
    ./boot.nix
    ./fonts.nix
    ./hardware.nix
    ./locale.nix
    ./locale.nix
    ./programs/default.nix
    ./services/default.nix
    ./systempPackages.nix
  ]
}