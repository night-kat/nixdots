{
  lib,
  config,
  ...
}: {
  options = {
    custom.direnv.enable = lib.mkEnableOption "Enable direnv";
  };

  config = lib.mkIf config.custom.direnv.enable {
    programs.direnv = {
      enable = true;
    };
  };
}
