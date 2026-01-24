{ ... }:

{
  imports = [
    ./home-manager.nix
    ./boot.nix
    ./fonts.nix
    ./bluetoothSettings.nix
    ./locale.nix
    ./networksettings.nix
    ./nixSettings.nix
    ./lix.nix
    ./systemSettings.nix
    ./programs
    ./services
    ./systemPackages.nix
  ];
}
