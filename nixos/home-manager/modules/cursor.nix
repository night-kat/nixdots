{ pkgs, ... }:

{
  home.pointerCursor = {
    enable = true;
    x11.enable = true;
    gtk.enable = true;
    hyprcursor = {
      enable = true;
      size = 48;
    };
    package = pkgs.fuchsia-cursor;
    name = "Fuchsia";
    size = 24;
  };
}
