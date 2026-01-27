{ pkgs, lib, options, config, ... }:

let
  cfg = config.custom.fonts;
in
{
  options.custom.fonts = {
    enable = lib.mkEnableOption "Enable font configuration";
    enableFira-code = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable firacode and firacode-symbols";
    };
  };

  config = lib.mkIf cfg.enable {
    fonts = {
      fontconfig.useEmbeddedBitmaps = true;
      packages = with pkgs; 
      lib.optionals cfg.enableFira-code [
        fira-code
        fira-code-symbols
      ];
    };
  };
}
