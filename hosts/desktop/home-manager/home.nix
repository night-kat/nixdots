{
  config,
  lib,
  pkgs,
  hostName,
  ...
}: {
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
    };
    settings = {
      user.signingkey = "~/.ssh/id_ed25519_sk_rk_codeberg_auth.pub";
    };
  };

  wayland.windowManager.hyprland.enable = true;
  custom = {
    blender.enable = true;
    # keepass.enable = true;
    waybar.enable = true;
    nvf.enable = true;
    neovide.enable = true;
    gitui.enable = true;
    fish.enable = true;
    niri.enable = true;
    myHyprland = {
      enable = true;
      laptopMonitor.enable = true;
      hasLidSwitch = true;
    };
    # hyprpaper.enable = true;
    myCursor.enable = true;
    firefox.enable = true;
    gitConfig.enable = true;
    mpv.enable = true;
    element.enable = true;
    sharedPackages.enable = true;
    sshClientConfig.enable = true;
    yazi.enable = true;
  };
}
