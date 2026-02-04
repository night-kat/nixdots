{ config, lib, pkgs, hostName, ...}:

{
  imports = [
    ./../../../homeManagerModules
  ];

  home.stateVersion = "25.05"; # Don't change this
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.git = {
    signing = {
      format = "ssh";
      signByDefault = true;
      key = "~/.ssh/id_ed25519_sk.pub";
    };
  };
  
   wayland.windowManager.hyprland.enable = true;
  custom = {
    fishWithAliases.enable = true;
    myHyprland= {
      enable = true;
      laptopMonitor.enable = true;
      hasLidSwitch = true;
    };
    hyprpaper.enable = true;
    myCursor.enable = true;
    firefox.enable = true;
    gitConfig.enable = true;
    mpv.enable = true;
    sharedPackages.enable = true;
    sshClientConfig.enable = true;
    waybar = {
      enable = true;
      enableBattery = true;
    };
    yazi.enable = true;
  };
}
