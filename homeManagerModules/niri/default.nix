{
  lib,
  config,
  niri,
  ...
}: {
  imports = [
    niri.homeModules.niri
    ./niri-settings.nix
  ];
  options = {
    custom.niri.enable = lib.mkEnableOption "Enable niri";
  };

  config = lib.mkIf config.custom.niri.enable {
    programs.niri.enable = true;
  };
}
