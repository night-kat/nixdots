{pkgs, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.

  programs.fish.enable = true;
  users.users.nightcat = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "input"
    ]; # Enable ‘sudo’ for the user.
    # openssh.authorizedKeys.keys = [
    # TODO: Add SSH public keys here
    # ];
    shell = pkgs.bash;
    packages = with pkgs; [
      tree
      git
    ];
  };
}
