{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    custom.lutris.enable = lib.mkEnableOption "Enable ssh-agent system wide";
  };

  config = lib.mkIf config.custom.lutris.enable {
    environment.systemPackages = [
      pkgs.lutris
    ];
  };
}
