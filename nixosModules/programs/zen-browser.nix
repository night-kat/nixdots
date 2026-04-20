{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    custom.zen-browser.enable = lib.mkEnableOption "Enable zen-browser";
  };
  config = lib.mkIf config.custom.zen-browser.enable {
    environment.systemPackages = [
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
