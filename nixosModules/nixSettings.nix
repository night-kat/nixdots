{
  config,
  pkgs,
  lib,
  ...
}:

{
  options = {
    custom.nixSettings.enable = lib.mkEnableOption "Enable flakes"; # This file may do more in the future
  };

  config = lib.mkIf config.custom.nixSettings.enable {
    nix = {
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      # garbage collection
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
    };
  };
}
