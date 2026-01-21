{ ... }:

{
  fonts = {
    fontconfig.useEmbeddedBitmaps = true;
    packages = with pkgs; [
      fira-code
      fira-code-symbols
    ];
  };
}
