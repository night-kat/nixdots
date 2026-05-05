{...}: {
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
      signByDefault = false;
    };
    settings = {
      user.signingkey = ["~/.ssh/id_ed25519_sk_rk_github_sign.pub"];
      # user.signingkey = ["~/.ssh/id_ed25519_sk_codeberg.pub"];
    };
  };

  # wayland.windowManager.hyprland.enable = true;
  custom = {
    niri.enable = true;
    element.enable = true;
    nvf.enable = true;
    neovide.enable = true;
    gitui.enable = true;
    fish.enable = true;
    # myHyprland = {
    #   enable = true;
    #   laptopMonitor.enable = true;
    #   hasLidSwitch = true;
    # };
    # hyprpaper.enable = true;
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
