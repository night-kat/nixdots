{
  pkgs,
  inputs,
  lib,
  config,
  options,
  ...
}:

{
  options = {
    custom.sharedPackages.enable = lib.mkEnableOption "Enable a list of shared programs";
  };

  config = lib.mkIf config.custom.sharedPackages.enable {
    home.packages = with pkgs; [
      fuchsia-cursor
      mpc
      mpd
      blueman
      libreoffice
      bluetui
      swaynotificationcenter
      wireplumber
      cava # Audio visualizer
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
      hyprcursor # TODO: Is this even needed?
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
      nixfmt # Nix code formatter
    ];
  };
}
