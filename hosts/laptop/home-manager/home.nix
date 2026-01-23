{
  # imports = [
  #   ./modules/default.nix
  # ];
  home.stateVersion = "25.05"; # Don't change this
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
