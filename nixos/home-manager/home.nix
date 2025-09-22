{ config, pkgs, ... }:

{
  imports = [
     ./modules/default.nix
  ];

  home.username = "nightcat";
  home.homeDirectory = "/home/nightcat";
  home.stateVersion = "25.05"; # Don't change this

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 

  programs = { 
    fish = {
      enable = true;
      shellAliases = {
        btw = "echo i use nixos  btw";
      };
    };
    neovim.enable = true;
    neovide.enable = true;
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "night-kat";
      userEmail = "178902183+night-kat@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };

}
