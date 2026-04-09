{
  config,
  lib,
  ...
}: {
  options.custom.niri = {
    enable = lib.mkEnableOption "Enable niri and dependencies";
  };

  config = lib.mkIf config.custom.niri.enable {
    networking.networkmanager.enable = true;
    hardware.bluetooth.enable = true;
    services.tuned.enable = true;
    services.upower.enable = true;
    programs.niri.enable = true;
  };
}
