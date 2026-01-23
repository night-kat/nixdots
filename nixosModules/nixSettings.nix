{ config, pkgs, lib, ... }:

{
  option = {
    custom.nixSettings.enable =
      lib.mkEnableOption "Enable flakes" # This file may do more in the future
  };

  config = lib.mkIf config.custom.nixSettings.enable {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
