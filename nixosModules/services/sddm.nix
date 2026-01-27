{ pkgs, lib, options, config, ... }:

let 
  cfg = config.custom.sddm;
in {
  options.custom.sddm = {
    enable = lib.mkEnableOption "Enable sddm display manager";
  };

  config = lib.mkIf cfg.enable {
    services = {
      displayManager.sddm = {
        wayland.enable = true;
        enable = true;
      };
    };
  };
}
