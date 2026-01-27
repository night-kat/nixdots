{ pkgs, lib, options, config, ... }:

{
  options = {
    custom.pipewire.enable = lib.mkEnableOption "Enable pipewire";
  };

  config = lib.mkIf config.custom.pipewire.enable {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };
  };
}
