{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.sddm;
in {
  options.custom.sddm = {
    enable = lib.mkEnableOption "Enable sddm display manager";
  };

  config = lib.mkIf cfg.enable {
    # environment.systemPackages = with pkgs; [
    #   sddm-sugar-dark
    #   (pkgs.callPackage ./../../ressources/sddm-astronaut-theme {
    #     theme = "hyprland_kath";
    #     # theme = "black_hole";
    #     # theme = "japanese_aesthetic";
    #     # theme = "astronaut";
    #     # theme = "purple_leaves";
    #     # theme = "pixel_sakura(-static)";
    #   })
    # ];

    services.displayManager.sddm = {
      enable = true;
      theme = "sddm-astronaut-theme";
      wayland.enable = true;
      extraPackages = [
        # pkgs.sddm-sugar-dark
        pkgs.sddm-astronaut
      ];
    };
  };
}
