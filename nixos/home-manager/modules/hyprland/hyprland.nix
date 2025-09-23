{
  hostName,
  pkgs,
  ...
}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    sourceFirst = true;
    settings = {
    # source = [
    #   "/etc/nixos/home-manager/modules/hyprland/enter_your_theme_here"
    # ];
    monitor = ",preferred,auto,auto";

    # Programs
    "$terminal" = "alacritty";
    "$webBrowser" = "firefox";
    "$menu" = "rofi -show drun";
    "$codeEditor" = "neovide";
    "$fileManager" = "alacritty -e yazi";
    "$notes" = "obsidian";

    exec-once = [
      "clipse -listen"
      # "waybar"
    ];
      
    input = {
      kb_layout = "de";
      kb_variant = "";
      kb_model = "";
      kb_rules = "";
      touchpad = {
        natural_scroll = true;
        disable_while_typing = false;
      };
      sensitivity = 0; # -1.0 - 1.0, 0 = means no modification
    };

    general = {
      gaps_in = 5;
      gaps_out = 7;
      border_size = 3;

      # trans flag colors
      "col.active_border" = "rgb(5BCEFA) rgb(F5A9B8) rgb(FFFFFF) rgb(F5A9B8) rgb(5BCEFA) 90deg"; 
      "col.inactive_border" = "rgba(595959aa)";

      resize_on_border = true;
      layout = "dwindle";
    };

    decoration = {
      rounding = 10;
      "rounding_power" = 2;

      # Change transparency of focused and unfocused windows
      active_opacity = "0.95";
      inactive_opacity = "0.85";

      shadow = {
        enabled = true;
        range = 5;
        render_power = 3;
        offset = "0, 0";
        color = "rgba(1a1a1aee)";
      };      
    };

    animations = {
      bezier = [
        "slow, 0, 0.85, 0.3,1"
        "overshot, 0.7, 0.6, 0.1, 1.1"
        "slingshot, 1, -1, 0.15, 1.25"
        "myBezier, 0.05, 0.9, 0.1, 1.05"
      ];
    };

    env = [
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"
    ];

    "$mainMod" = "SUPER";
    bind = [
      # Move focus and change windows around
      "$mainMod, Q, exec, $terminal"
      "$mainMod, C, killactive"
      "$mainMod, R, exec, $menu"
      "$mainMod SHIFT, M, exit"
      "$mainMod, F, fullscreen"

      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      "$mainMod, h, movefocus, l"
      "$mainMod, l, movefocus, r"
      "$mainMod, k, movefocus, u"
      "$mainMod, j, movefocus, d"

      "$mainMod CTRL, h, movewindow, l"
      "$mainMod CTRL, l, movewindow, r"
      "$mainMod CTRL, k, movewindow, u"
      "$mainMod CTRL, j, movewindow, d"

      # Switch workspaces
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Move window to workspaces
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      # Move window to workspace without moving yourself
      "$mainMod CTRL, 1, movetoworkspacesilent, 1"
      "$mainMod CTRL, 2, movetoworkspacesilent, 2"
      "$mainMod CTRL, 3, movetoworkspacesilent, 3"
      "$mainMod CTRL, 4, movetoworkspacesilent, 4"
      "$mainMod CTRL, 5, movetoworkspacesilent, 5"
      "$mainMod CTRL, 6, movetoworkspacesilent, 6"
      "$mainMod CTRL, 7, movetoworkspacesilent, 7"
      "$mainMod CTRL, 8, movetoworkspacesilent, 8"
      "$mainMod CTRL, 9, movetoworkspacesilent, 9"
      "$mainMod CTRL, 0, movetoworkspacesilent, 10"

      # resize with mainMod CTRL + arrow keys
      "$mainMod CTRL, left, resizeactive, -20 0"
      "$mainMod CTRL, right, resizeactive, 20 0"
      "$mainMod CTRL, up, resizeactive, 0 -20"
      "$mainMod CTRL, down, resizeactive, 0 20"

      # Toggle floating windows
      "$mainMod, T, togglefloating"
      
      # clipboard functionality
      "SUPER, V, exec, alacritty --class clipse -e clipse"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
      "$mainMod, v, resizewindow"
    ];

    # Requires playerctl
    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];

    # Laptop multimedia keys for volume and LCD brightness
    bindel = [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ", XF86MonBrightnessUp, exec, brightnessctl s 5%+"
      ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
    ]; 
    
      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "float, class:(clipse)"
        "size 622 652, class:(clipse)"
      ];
    };
  };
}
