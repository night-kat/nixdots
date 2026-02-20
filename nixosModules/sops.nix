{
  inputs,
  lib,
  config,
  ...
}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  options = {
    custom.sops.enable = lib.mkEnableOption "Enable sops-nix";
  };

  config = lib.mkIf config.custom.sops.enable {
    sops.defaultSopsFile = ./../secrets/secrets.yaml;
    sops.defaultSopsFormat = "yaml";

    sops.age.keyFile = "/home/user/.config/sops/age/keys.txt";

    # sops.secrets.example-key = {};
    # sops.secrets."myservice/my_subdir/my_secret" = {
    #   owner = "sometestservice";
    # };
  };
}
