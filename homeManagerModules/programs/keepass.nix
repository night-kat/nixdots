{
  lib,
  config,
  ...
}: {
  options = {
    custom.keepass.enable = lib.mkEnableOption "Enable keepass";
  };

  config = lib.mkIf config.custom.keepass.enable {
    programs.keepassxc = {
      autostart = true;
      enable = true;
      settings = {
        # For available settings, see https://github.com/keepassxreboot/keepassxc/blob/develop/src/core/Config.cpp
        FdoSecrets.Enabled = true; # Enable Secret Service Integration
      };
    };

    xdg.autostart.enable = true; # Enable creation of XDG autostart entries.
  };
}
