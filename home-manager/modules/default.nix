{ ... }:

{
  imports = [
    ./pkgs.nix
    ./waybar.nix
    ./hyprland/default.nix
    ./ssh.nix
    ./mpv.nix # HDR error in fullscreen, disabled hdr. Not sure if it will be fixed
    ./cursor.nix
    ./fish.nix
    ./git.nix
#    ./nvim.nix
    # ./nvim.nix
    ./yazi.nix
  ];
}
