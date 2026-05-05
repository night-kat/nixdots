{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    custom.fish.enable = lib.mkEnableOption "Enable fish shell with some aliases and macchina";
  };

  config = lib.mkIf config.custom.fish.enable {
    programs.macchina.enable = true;
    programs.fish = {
      enable = true;
      shellInit = "macchina";
      shellAliases = {
        btw = "echo i use nixos btw";
        grep = "rg";
      };
    };
  };
}
