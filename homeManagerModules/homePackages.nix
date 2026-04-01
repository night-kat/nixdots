{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    custom.sharedPackages.enable = lib.mkEnableOption "Enable a list of shared programs";
  };

  config = lib.mkIf config.custom.sharedPackages.enable {
    home.packages = with pkgs; [
      direnv
      nix-direnv
      inotify-tools
      libfido2
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
      deluge
      signal-desktop
      rustlings
      hyprcursor # TODO: Is this even needed?
      yubikey-manager
      tor-browser
      # calibre
      sabnzbd # Usenet downloader
      unzip
    ];
  };
}
