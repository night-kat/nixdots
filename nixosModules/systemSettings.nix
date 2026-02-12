{
  pkgs,
  config,
  lib,
  options,
  ...
}:

{
  options = {
    custom.systemSettings.enable = lib.mkEnableOption "Enables shared/common system settings";
  };

  config = lib.mkIf config.custom.systemSettings.enable {
    system.autoUpgrade.enable = true;
  };
}
