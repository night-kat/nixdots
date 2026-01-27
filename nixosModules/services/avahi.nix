{ pkgs, config, options, lib, ... }:

{
  options = {
    custom.avahiService.enable = lib.mkEnableOption "enable avahi as a system wide service and set some options";
  };
  
  config = lib.mkIf config.custom.avahiService.enable {
    services = {
      # Avahi is a system that enables programs to publish
      # and discover services and hosts running on a local
      # network
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };
  };
}
