{
  pkgs,
  lib,
  options,
  config,
  ...
}:

{
  options.custom.boot = {
    enable = lib.mkEnableOption "Enable boot settings";
    grub.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Use grub bootloader";
    };
  };

  config = lib.mkIf config.custom.boot.enable {
    # Add extra Kernel modules
    boot = {
      kernelModules = [ "uvcvideo" ];
      # Use latest kernel.
      # Use the latest kernel if specified
      kernelPackages = pkgs.linuxPackages_latest;
      # Use the systemd-boot EFI boot loader.
      loader = lib.mkIf config.custom.boot.grub.enable {
        grub.device = "nodev";
        grub.efiSupport = true;
        systemd-boot.enable = false; # Note: systemd-boot should be disabled for grub to work
        efi.canTouchEfiVariables = true;
      };
    };
  };
}
