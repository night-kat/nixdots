{ pkgs, lib, config, options, ... }:

let
  cfg = config.custom.bacon;
in
{
  options.custom.bacon = {
    enable = lib.mkEnableOption "Enable bacon";
  };

  config = lib.mkIf cfg.enable {
    programs.bacon = {
      enable = true;
    };
  };
}
