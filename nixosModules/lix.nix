{ pkgs, ... }:

{
  options = {
    custom.enablelix.enable = 
      lib.mkEnableOption "Enable the lix language, a community driven implementation of nix"
  };

  config = lib.mkIf config.custom.lix.enable {
      nixpkgs.overlays = [
    (final: prev: {
      inherit (prev.lixPackageSets.stable)
        nixpkgs-review
        nix-eval-jobs
        nix-fast-build
        colmena
        ;
    })
  ];

  nix.package = pkgs.lixPackageSets.stable.lix;
  };
}
