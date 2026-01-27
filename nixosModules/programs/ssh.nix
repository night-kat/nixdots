{ pkgs, lib, config, options, ... }:

{
  options = {
    custom.ssh.enable = lib.mkEnableOption "Enable ssh-agent system wide";
  };

  config = lib.mkIf config.custom.ssh.enable {  
    programs.ssh = {
      startAgent = true;
    };
  };
}
