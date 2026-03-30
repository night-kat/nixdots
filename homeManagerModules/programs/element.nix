{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    custom.element.enable = lib.mkEnableOption "Enable element and a secret service";
  };

  config = lib.mkIf config.custom.element.enable {
    home.packages = with pkgs; [
      element-desktop
      gcr
    ];
  };
}
