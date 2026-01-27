{ pkgs, config, lib, ... }:

{
  options =  {
    custom.myCursor.enable = lib.mkEnableOption "Enable cursor with preset theme";
  };

  config = lib.mkIf config.custom.myCursor.enable {
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
  };
}
