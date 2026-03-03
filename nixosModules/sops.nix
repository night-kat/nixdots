{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  options = {
    custom.sops.enable = lib.mkEnableOption "Enable sops-nix";
  };

  config = lib.mkIf config.custom.sops.enable {
    environment.systemPackages = [pkgs.sops];
    sops = {
      defaultSopsFile = ./../secrets/secrets.yaml;
      defaultSopsFormat = "yaml";
      age.keyFile = "/home/user/.config/sops/age/keys.txt";
      secrets = {
        "easyusenet".username = {};
        "easyusenet".password = {};
      };
    };
  };
}
