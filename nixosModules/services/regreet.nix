{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.custom.regreet;
in {
  options.custom.regreet = {
    enable = lib.mkEnableOption "Enable regreet display manager and greetd";

    hyprland.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Set regreet to launch hyprland";
    };

    niri.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Set regreet to launch niri";
    };
  };

  config = lib.mkIf cfg.enable {
    # services.gnome = {
    #   gcr-ssh-agent.enable = false;
    # };
    environment.variables = {
      XKB_DEFAULT_LAYOUT = "de";
      XKB_DEFAULT_VARIANT = "nodeadkeys";
    };
    programs.regreet = {
      enable = true;
    };
    services = {
      greetd = {
        enable = true;
        settings = {
          terminal = {
            vt = 1;
          };

          # How the background image covers the screen if the aspect ratio doesn't match
          # Available values: "Fill", "Contain", "Cover", "ScaleDown" Refer to:
          # https://docs.gtk.org/gtk4/enum.ContentFit.html NOTE: This is ignored if ReGreet
          # isn't compiled with GTK v4.8 support.
          fit = "Contain";

          default_session =
            lib.mkIf cfg.hyprland.enable {
            }
            // lib.optionalAttrs cfg.hyprland.enable {
              command = "${pkgs.cage}/bin/cage --cmd hyprland";
            }
            // lib.optionalAttrs cfg.niri.enable {
              command = "${pkgs.cage}/bin/cage --cmd niri";
            };
        };
      };
    };
  };
}
