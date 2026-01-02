# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

    home-manager.useGlobalPkgs = true;
    home-manager.backupFileExtension = "backup";
    home-manager.users.nightcat = import ./home-manager/home.nix;


  # Add extra Kernel modules
  boot.kernelModules = ["uvcvideo"];

  # Use the systemd-boot EFI boot loader.
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  system.autoUpgrade.enable = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_GB.UTF-8";
 
  i18n.extraLocaleSettings = {
    LANG="de_DE.UTF-8";
    LC_CTYPE="de_DE.UTF-8";
    LC_NUMERIC="de_DE.UTF-8";
    LC_TIME="de_DE.UTF-8";
    LC_COLLATE="de_DE.UTF-8";
    LC_MONETARY="de_DE.UTF-8";
    LC_MESSAGES="en_GB.UTF-8";
    LC_PAPER="de_DE.UTF-8";
    LC_NAME="de_DE.UTF-8";
    LC_ADDRESS="de_DE.UTF-8";
    LC_TELEPHONE="de_DE.UTF-8";
    LC_MEASUREMENT="de_DE.UTF-8";
    LC_IDENTIFICATION="de_DE.UTF-8";
  };
  
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];  

  console = {
    font = "Lat2-Terminus16";
    # keyMap = "de";
    useXkbConfig = true; # use xkb.options in tty
  };  

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = false;
      };
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
      };
    };
  };

  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nightcat = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "input" ]; # Enable ‘sudo’ for the user.
    # openssh.authorizedKeys.keys = [
        # TODO: Add SSH public keys here
    # ];
    shell = pkgs.fish;
    packages = with pkgs; [
      tree
    ];
  };
  
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "obsidian"
      "steam"
      "teams"
    ];
  
  programs = {
    firefox.enable = true;
    # ssh.startAgent = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    fish.enable = true;
    git = {
      enable = true;
    };
  };


  fonts.packages = with pkgs; [ 
    nerd-fonts.jetbrains-mono 
    nerd-fonts.fira-code
  ];

  # Keyring
  programs.seahorse.enable = true; # GUI for managing passwords and keys

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    (lib.hiPrio pkgs.uutils-coreutils-noprefix) # `lib.hiPrio` is used to avoid potential conflict with `coreutils-full` (also see https://discourse.nixos.org/t/how-to-use-uutils-coreutils-instead-of-the-builtin-coreutils/8904/15?u=malix)
    wget
    neovim
    alacritty
    gphoto2
    ffmpeg
    mpv
    mpvScripts.mpris
    fwupd
    yubioath-flutter
    luajitPackages.luarocks_bootstrap
    clang
    ripgrep
    rustup
    v4l-utils
    python313
    libsecret
    bluez
    vscodium
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  services = {
      openssh.enable = true;
      gnome.gnome-keyring.enable = true;
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
      printing.drivers = [pkgs.epson-escpr];
      # Enable touchpad support (enabled default in most desktopManager).
      libinput.enable = true;
      pipewire = {
        enable = true;
        pulse.enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
      };
      blueman.enable = true;
      # Enable CUPS to print documents.
      printing.enable = true;
      xserver = {
        xkb = {
          layout = "de";
          variant = "";
        }; 
      };
      displayManager.sddm = {
        wayland.enable = true;
        enable = true;
      };
      fwupd.enable = true;
      # yubikey-agent.enable = true;

  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = false;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
}

