{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = {
        "monitor" = "eDP-1";
        "path" = "${../../wallpapers/frieren-magical-5120x2880-15165.jpeg}";
        "fit_mode" = "cover";
      };
    };
  };
}
