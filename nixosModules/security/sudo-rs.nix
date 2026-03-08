{
  config,
  lib,
  ...
}: {
  options = {
    custom.sudo-rs.enable = lib.mkEnableOption "Enable sudo-rs, a sudo alternative";
  };

  config = lib.mkIf config.custom.sudo-rs.enable {
    security = {
      sudo.enable = lib.mkForce false;
      sudo-rs = {
        enable = true;
        configFile = "Defaults pwfeedback";
      };
    };
  };
}
