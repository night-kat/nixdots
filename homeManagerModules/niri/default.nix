{
  lib,
  pkgs,
  config,
  niri,
  ...
}: {
  imports = [
    niri.homeModules.niri
    ./niri-settings.nix
  ];
  options = {
    custom.niri.enable = lib.mkEnableOption "Enable niri configuration and some dependencies";
  };

  config = lib.mkIf config.custom.niri.enable {
    programs.swaylock = {
      enable = true;
      settings = {
        color = "808080";
        font-size = 24;
        indicator-idle-visible = false;
        indicator-radius = 100;
        line-color = "ffffff";
        show-failed-attempts = true;
      };
    };
    programs.niri.enable = true;

    home.packages = with pkgs; [
      xwayland-satellite # xwayland support
    ];
  };
}
