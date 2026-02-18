{
  lib,
  pkgs,
  options,
  config,
  ...
}:

let
  cfg = config.custom.neovide;
in
{
  options.custom.neovide = {
    enable = lib.mkEnableOption "Enable neovide";
  };

  config = lib.mkIf cfg.enable {
    programs.neovide = {
      enable = true;
    };
  };
}
