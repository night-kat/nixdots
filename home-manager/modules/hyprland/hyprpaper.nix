{ config, lib, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "/etc/nixos/home-manager/wallpapers/frieren-magical-5120x2880-15165.jpeg"
      ];
      wallpaper = [
        "eDP-1, /etc/nixos/home-manager/wallpapers/frieren-magical-5120x2880-15165.jpeg"
      ];
    };
  };
}
