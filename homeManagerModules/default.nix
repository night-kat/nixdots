{ ... }:

{
  imports = [
    ./pkgs.nix
    ./waybar.nix
    ./hyprland
    ./ssh.nix
    ./mpv.nix
    ./cursor.nix
    ./firefox.nix
    ./fish.nix
    ./git.nix
    ./programs.nix # TODO: Seperate out programs, put into ./programs directory
    ./yazi.nix
    ./programs
    # ./nvim.nix
  ];
}
