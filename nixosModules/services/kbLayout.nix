{
  pkgs,
  lib,
  options,
  config,
  ...
}:

let
  cfg = config.custom.germanKeyboardLayout;
in
{
  options.custom.germanKeyboardLayout = {
    enable = lib.mkEnableOption "Enable german keyboard layout";
  };

  config = lib.mkIf cfg.enable {
    services = {
      xserver = {
        xkb = {
          layout = "de";
          variant = "nodeadkeys";
        };
      };
    };
  };
}
