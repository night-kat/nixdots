{
  config,
  options,
  lib,
  pkgs,
  ...
}: {
  # TODO: Per host only, not shared, factor out later maybe
  options = {
    custom.hyprpaper.enable = lib.mkEnableOption "Enable hyprpaper with background";
  };

  config = lib.mkIf config.custom.hyprpaper.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        wallpaper = {
          "monitor" = "eDP-1";
          "path" = "${./../../wallpapers/frieren_1.jpeg}";
          "fit_mode" = "cover";
        };
      };
    };
  };
}
