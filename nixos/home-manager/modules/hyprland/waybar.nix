{ ... }:
{ 
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
    };

    settings = [
      {
        layer = "top";
        position = "top";
        spacing = "0";
        height = 34;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" "custom/notification" ];
        modules-right = [ "cpu" "memory" "network" "bluetooth" "battery" "pulseaudio" ];
      }
    ];
  };
}
