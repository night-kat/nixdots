{
  pkgs,
  lib,
  options,
  config,
  ...
}:

{
  options = {
    custom.systemLevelFish.enable = lib.mkEnableOption "Enable fish systemwide";
  };

  config = lib.mkIf config.custom.systemLevelFish.enable {
    programs.fish = {
      enable = true;
    };
  };
}
