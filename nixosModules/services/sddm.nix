{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.sddm;
  # sddm-astronaut-custom = pkgs.sddm-astronaut.override {
  #   embeddedTheme = "black_hole";
  # };
in {
  options.custom.sddm = {
    enable = lib.mkEnableOption "Enable sddm display manager";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      sddm-sugar-dark
      sddm-astronaut
    ];

    services.displayManager.sddm = {
      enable = true;
      theme = "sddm-astronaut-theme";
      wayland.enable = true;
      extraPackages = [
        pkgs.sddm-sugar-dark
        pkgs.sddm-astronaut
      ];
    };
  };
}
