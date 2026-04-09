{
  config,
  lib,
  ...
}: {
  options = {
    custom.gnome-keyring.enable = lib.mkEnableOption "Enable gnome-keyring";
  };

  config = lib.mkIf config.custom.gnome-keyring.enable {
    services.gnome.gnome-keyring.enable = true;
    # this still allows use for ssh-agent
    services.gnome.gcr-ssh-agent.enable = false;
  };
}
