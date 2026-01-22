{ pkgs, config, ... }:

{
  options = {
    systemSettings.enable = lib.mkEnableOption "Enables shared/common system settings"
  }
  config = {
    system.autoUpgrade.enable = true;
  };
}
