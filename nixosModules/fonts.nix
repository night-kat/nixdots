{
  pkgs,
  lib,
  options,
  config,
  ...
}:

let
  cfg = config.custom.fonts;
in
{
  options.custom.fonts = {
    enable = lib.mkEnableOption "Enable font configuration";
  };

  config = lib.mkIf cfg.enable {
    fonts = {
      fontconfig = {
        useEmbeddedBitmaps = true;
        defaultFonts = {
          monospace = [
            "Fira Code"
          ];
          emoji = [
            "Symbols Nerd Font"
          ];
        };
      };

      packages = with pkgs; [
        hasklig
        nerd-fonts.symbols-only # symbols icon only
        nerd-fonts.fira-code
        monaspace
        noto-fonts
        noto-fonts-color-emoji
        google-fonts
      ];
    };
  };
}
