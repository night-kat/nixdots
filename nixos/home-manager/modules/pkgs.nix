{ pkgs, inputs, ... }:

{
  programs = { 
    firefox.enable = true;
    yazi.enable = true;
    bacon.enable = true;
    neovim.enable = true;
    neovide.enable = true;
    home-manager.enable = true;
  };

  home.packages = with pkgs; [
    fuchsia-cursor
    mpc
    mpd
    blueman
    libreoffice
    bluetui
    swaynotificationcenter
    wireplumber
    cava
    alacritty
    niri
    hyprland
    hyprpaper
    xwayland
    hyprshot
    swaylock
    hypridle
    lazygit
    rofi
    waybar
    yazi
    proton-pass 
    protonmail-desktop
    protonvpn-gui
    brightnessctl
    pwvucontrol
    obsidian
    playerctl
    wl-clipboard-rs
    ani-cli
    clipse
    tealdeer
    qbittorrent
    signal-desktop
    rustlings
    hyprcursor
  ];
}
