{ pkgs, inputs, ... }:

{
  programs = { 
    firefox.enable = true;
    yazi.enable = true;
    bacon.enable = true;
    neovim.enable = false;
    neovide.enable = false;
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
    yubikey-manager
    #dependencies for yazi
    imagemagick # for Font, HEIC, and JPEG XL preview
    ffmpeg # for video thumbnails
    jq # for JSON preview
    poppler # for PDF preview
    fd # for file searching
    # ripgrep already installed in configuration.nix
    fzf # for quick file subtree navigation
    zoxide # for historical directories navigation, requires fzf
    resvg # for SVG preview
    tor-browser
    calibre
  ];
}
