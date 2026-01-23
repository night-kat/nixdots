{ ... }:

{
  imports = [
    ./boot.nix
    ./fonts.nix
    ./bluetoothSettings.nix
    ./locale.nix
    ./networksettings.nix
    ./nixSettings.nix
    ./lix.nix
    ./systemSettings.nix
    ./programs/default.nix
    ./services/default.nix
    ./systemPackages.nix
  ]
}