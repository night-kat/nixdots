{
  lib,
  config,
  pkgs,
  options,
  ...
}:

{
  options = {
    custom.networkSettings.enable = lib.mkEnableOption "Enable common network settings";
  };

  config = lib.mkIf config.custom.networkSettings.enable {
    # TODO: make on per host basis
    # networking.hostName = "nightcat"; # Define your hostname.
    # Pick only one of the below networking options.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.
  };
}
