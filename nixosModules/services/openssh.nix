{
  pkgs,
  lib,
  config,
  options,
  ...
}:

{
  options = {
    custom.openssh.enable = lib.mkEnableOption "Enable OpenSSH on a system level";
  };

  config = lib.mkIf config.custom.openssh.enable {
    services.openssh.enable = true;
  };
}
