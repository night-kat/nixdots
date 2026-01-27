{ config, options, lib, pkgs, ... }:

{
  options = {
    custom.console.enable = lib.mkEnableOption "Enable console with preconfigured font";
  };

  config = lib.mkIf config.custom.console.enable {
    console = {
      font = "Lat2-Terminus16";
      # keyMap = "de";
      useXkbConfig = true; # use xkb.options in tty
    };
  };
}
