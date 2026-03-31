{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    custom.blender.enable = lib.mkEnableOption "Enable blender";
  };

  config = lib.mkIf config.custom.blender.enable {
    home.packages = with pkgs; [
      blender
    ];
  };
}
