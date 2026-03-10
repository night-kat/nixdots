{
  lib,
  config,
  ...
}: let
  cfg = config.custom.sddm;
in {
  options.custom.sddm = {
    enable = lib.mkEnableOption "Enable sddm display manager with gnome-keyring";
  };

  config = lib.mkIf cfg.enable {
    # services.gnome = {
    #   gnome-keyring.enable = true;
    #   gcr-ssh-agent.enable = false;
    # };
    # security.pam.services.login.enableGnomeKeyring = true;
    services = {
      displayManager.sddm = {
        wayland.enable = true;
        enable = true;
      };
    };
  };
}
