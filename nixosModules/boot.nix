{ ... }:

{
  # Add extra Kernel modules
  boot = {
    kernelModules = ["uvcvideo"];
    # Use lates kernel.
    kernelPackages = pkgs.linuxPackages_latest;
    # Use the systemd-boot EFI boot loader.
    loader = {
      grub.device = "nodev";
      grub.efiSupport = true;
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
    };
  };
}