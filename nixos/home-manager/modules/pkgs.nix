{ pkgs, inputs, ... }:

{
  programs = { 
    firefox.enable = true;
    neovide.enable = true;
    yazi.enable = true;
  };

  home.packages = with pkgs; [
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
  ];
}
