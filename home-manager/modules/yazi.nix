{ ... }:

{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      log = {
        enabled = false;
      };
      # opener = {
      #   play = [
      #     { run = "vlc %s"; orphan = true; for = "unix"; }
      #   ];
      # };
    };
  };
}

