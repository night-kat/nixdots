{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.boot;
in {
  options.custom.boot = {
    enable = lib.mkEnableOption "Enable boot settings";
    grub.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Use grub bootloader";
    };
    systemd-boot.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Use grub bootloader";
    };
  };

  config = lib.mkIf config.custom.boot.enable {
    # Add extra Kernel modules
    boot = {
      kernelModules = ["uvcvideo"];
      # Use latest kernel.
      # Use the latest kernel if specified
      kernelPackages = pkgs.linuxPackages_latest;

      loader = lib.mkMerge [
        (lib.mkIf cfg.grub.enable {
          grub.device = "nodev";
          grub.efiSupport = true;
          systemd-boot.enable = false;
          efi.canTouchEfiVariables = true;
        })

        (lib.mkIf cfg.systemd-boot.enable {
          systemd-boot.enable = true;
          grub.enable = false;
        })
      ];
    };
  };
}
