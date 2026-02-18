# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./users.nix
  ];

  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];

  # Set your time zone.
  time.timeZone = "Europe/Rome";
  programs.hyprland.enable = true;
  custom = {
        boot = {
    enable = true;
    # latestKernel = true;
    grub.enable = true;
  };
    systemLevelFish.enable = true;
    console.enable = true;
    seahorse.enable = true;
    ssh.enable = true;
    usenet.enable = true;
    auto-cpufreq.enable = true;
    avahiService.enable = true;
    bluemanService.enable = true;
    fwupdService.enable = true;
    germanKeyboardLayout.enable = true;
    libinputService.touchPadSupport = true;
    openssh.enable = true;
    pcscd.enable = true;
    pipewire.enable = true;
    printing = {
      enable = true;
      epsonDrivers.enable = true;
    };
    sddm.enable = true;
    bluetoothSettings.enable = true;
    fonts = {
      enable = true;
    };
    lix.enable = true;
    locale.enableGerman = true;
    networkSettings.enable = true;
    nixSettings.enable = true;
    unfreePackages.enable = true;
    systemPackages.enable = true;
    systemSettings.enable = true;
  };
  networking.hostName = "nightcat"; # Define your hostname

  system.copySystemConfiguration = false;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  system.stateVersion = "25.05"; # Did you read the comment?
}

