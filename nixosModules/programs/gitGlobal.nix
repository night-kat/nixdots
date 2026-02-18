{
  pkgs,
  lib,
  config,
  options,
  ...
}:

{
  options = {
    custom.gitGlobal.enable = lib.mkEnableOption "Enable git some global git settings";
  };

  config = lib.mkIf config.custom.gitGlobal.enable {
    programs.git = {
      enable = true;
      config = {
        init.defaultBranch = "main";
      };
    };
  };
}
