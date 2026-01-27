{ pkgs, config, lib, options, ... }:

{
  options = {
    custom.fwupdService.enable = lib.mkEnableOption "Enable fwupd service, a service for firmware updates";
  };

  config = lib.mkIf config.custom.fwupdService.enable {
    services = {
      fwupd.enable = true;
    };
  };
}
