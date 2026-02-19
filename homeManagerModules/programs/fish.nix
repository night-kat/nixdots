{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    custom.fishWithAliases.enable = lib.mkEnableOption "Enable fish shell with some aliases";
  };

  config = lib.mkIf config.custom.fishWithAliases.enable {
    programs.fish = {
      enable = true;
      shellAliases = {
        btw = "echo i use nixos btw";
        grep = "rg";
      };
    };
  };
}
