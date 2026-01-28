{ pkgs, lib, options, config, ... }:

let
  cfg = config.custom.fonts;
in
{
  options.custom.fonts = {
    enable = lib.mkEnableOption "Enable font configuration";
    enableNerdFonts = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable firacode";
    };
  };

  config = lib.mkIf cfg.enable {
    fonts = {
      fontconfig.useEmbeddedBitmaps = true;
      packages = with pkgs; lib.mkIf cfg.enableNerdFonts [
        nerd-fonts.fira-code
        nerd-fonts.symbols-only
        nerd-fonts.departure-mono
        nerd-fonts.droid-sans-mono
      ];
    };
  };
}
