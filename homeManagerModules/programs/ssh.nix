{
  pkgs,
  lib,
  config,
  options,
  ...
}:

{
  options = {
    custom.sshClientConfig.enable = lib.mkEnableOption "Enable ssh client configuration";
  };

  config = lib.mkIf config.custom.sshClientConfig.enable {
    programs.ssh = {
      enable = true; # This allows for ssh to be configured
      enableDefaultConfig = false;
      matchBlocks.github_key.addKeysToAgent = "yes";
    };
  };
}
