# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./users.nix
  ];

  # Automatic updates
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "-L" # print build logs
    ];
    dates = "02:00";
    randomizedDelaySec = "45min";
  };
  environment.pathsToLink = ["/share/applications" "/share/xdg-desktop-portal"];
  # enable nvidia stuff
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  # Whether to use open source or proprietary drivers
  hardware.nvidia.open = true; # see the note above

  # Set your time zone.
  time.timeZone = "Europe/Rome";
  # programs.hyprland.enable = true;
  custom = {
    boot = {
      enable = true;
      grub.enable = false;
      systemd-boot.enable = true;
    };
    niri.enable = true;
    gnome-keyring.enable = true;
    sudo-rs.enable = true;
    steam.enable = true;
    lutris.enable = true;
    sops.enable = true;
    yubikey.enable = true;
    gitGlobal.enable = true;
    fish.enable = true;
    console.enable = true;
    # seahorse.enable = true;
    ssh.enable = true;
    # usenet.enable = true;
    # auto-cpufreq.enable = true;
    avahiService.enable = true;
    bluemanService.enable = true;
    fwupdService.enable = true;
    germanKeyboardLayout.enable = true;
    # libinputService.touchPadSupport = true;
    openssh.enable = true;
    pcscd.enable = true;
    pipewire.enable = true;
    # printing = {
    #   enable = true;
    #   epsonDrivers.enable = true;
    # };
    # sddm.enable = true;
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
  networking.hostName = "nightcat-pc"; # Define your hostname

  system = {
    copySystemConfiguration = false;
    # This option defines the first version of NixOS you have installed on this particular machine,
    # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
    #
    # Most users should NEVER change this value after the initial install, for any reason,
    # even if you've upgraded your system to a new NixOS release.
    stateVersion = "25.11"; # Did you read the comment?
  };
}
