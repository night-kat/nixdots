{ config, lib, pkgs, options, ... }:

{
  options = {
    custom.myPrograms.enable = lib.mkEnableOption "Enable programs needed on both systems" ;
  };

  config = lib.mkIf config.custom.myPrograms.enable {
    programs = {
      firefox.enable = true;
      yazi.enable = true;
      # TODO: Create devshell for all rust things
      bacon.enable = true;
      # TODO: Reenable once you have a config for them
      neovim.enable = true;
      neovide.enable = true;
      home-manager.enable = true;
    };
  };
}