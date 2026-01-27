{ config, lib, pkgs, options, ... }:

{
  options.custom.hyprland = {
    enable = lib.mkEnableOption "Enable hyprland systemwide";
  };

  config = lib.mkIf config.custom.hyprland.enable {
    programs.hyprland.enable = true;
  };
}