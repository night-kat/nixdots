{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    custom.element.enable = lib.mkEnableOption "Enable element, a matrix client";
  };

  config = lib.mkIf config.custom.element.enable {
    home.packages = with pkgs; [
      element-desktop
    ];
  };
}
