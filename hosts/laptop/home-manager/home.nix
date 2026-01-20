{ config, pkgs, ... }:

{
  imports = [
     ./modules/default.nix
  ];
  home.username = "nightcat";
  home.homeDirectory = "/home/nightcat";
  home.stateVersion = "25.05"; # Don't change this
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 
}
