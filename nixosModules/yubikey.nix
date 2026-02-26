{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.custom.yubikey;
in {
  options = {
    custom.yubikey.enable = lib.mkEnableOption "Allows for yubikey authentication with pam";
  };
  config = lib.mkIf cfg.enable {
    services.udev.packages = [pkgs.yubikey-personalization];
    programs.gnupg.agent = {
      enable = true;
    };
    security.pam.services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
    };
  };
}
