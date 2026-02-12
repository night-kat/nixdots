{
  lib,
  pkgs,
  config,
  options,
  ...
}:

{
  options = {
    custom.unfreePackages.enable = lib.mkEnableOption "Allow some unfree packages";
  };

  config = lib.mkIf config.custom.unfreePackages.enable {
    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "obsidian"
        # TODO: Steam is per host basis, remove teams eventually
        # "steam"
        "teams"
      ];
  };
}
