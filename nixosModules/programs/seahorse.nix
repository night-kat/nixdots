{ pkgs, lib, options, config, ... }:

{
  options.custom.seahorse = {
    enable = lib.mkEnableOption "Enable seahorse, a GUI for managing passwords";
  };

  config = lib.mkIf config.custom.seahorse.enable {
    programs.seahorse.enable = true; # GUI for managing passwords and keys
  };
}

