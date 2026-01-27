{ pkgs, lib, options, config, ... }:

{
  options = {
    custom.pcscd.enable = lib.mkEnableOption "Enable pcscd, a daemon for smart card authentication";
  };

  config = lib.mkIf config.custom.pcscd.enable {
    services.pcscd.enable = true;
  };
  # A service for handling smart card readers and smart cards (yubikey in my case)
}
