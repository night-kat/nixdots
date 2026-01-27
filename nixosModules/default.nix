{ ... }:

{
  imports = [
    ./boot.nix
    ./fonts.nix
    ./bluetoothSettings.nix
    ./locale.nix
    ./networkSettings.nix
    ./nixSettings.nix
    ./lix.nix
    ./systemSettings.nix
    ./programs
    ./services
    ./systemPackages.nix
    ./nixUnfreePackages.nix
  ];
}
