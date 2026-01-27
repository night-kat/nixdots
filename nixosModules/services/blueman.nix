{ pkgs, options, lib, config, ... }:

{
  options = {
    custom.bluemanService.enable = lib.mkEnableOption "Enable blueman as a system service";
  };

  config = { 
    services = {
      blueman.enable = true;
    };
  };
}