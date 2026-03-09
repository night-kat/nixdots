{
  pkgs,
  lib,
  options,
  config,
  ...
}: {
  options = {
    custom.firefox.enable = lib.mkEnableOption "Enable firefox on user level";
  };

  config = lib.mkIf config.custom.firefox.enable {
    programs.firefox.enable = true;
  };
}
