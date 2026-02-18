{
  config,
  lib,
  ...
}: {
  options = {
    custom.yazi.enable = lib.mkEnableOption "Enable preconfigured yazi";
  };

  config = lib.mkIf config.custom.yazi.enable {
    programs.yazi = {
      enable = true;
      shellWrapperName = "y";
      enableFishIntegration = true;
      settings = {
        log = {
          enabled = true;
        };
        mgr = {
          ratio = [
            1
            4
            3
          ];
          sort_by = "natural";
          sort_sensitive = true;
          sort_reverse = false;
          sort_dir_first = true;
          sort_translit = false;
          linemode = "size";
          show_hidden = false;
          show_symlink = true;
          scrolloff = 5;
          mouse_events = [
            "click"
            "scroll"
          ];
          title_format = "Yazi: {cwd}";
        };
        preview = {
          wrap = "no";
          tab_size = 2;
          max_width = 600;
          max_height = 900;
          image_delay = 50;
          image_filter = "triangle";
          image_quality = 75;
          sixel_fraction = 15;
          ueberzug_scale = 1;
          ueberzug_offset = [
            0
            0
            0
            0
          ];
        };
        opener = {
          # for the future: try to configure xdg-open.
          # use something like this:
          #
          # open = [
          # {
          #   run = ''xdg-open "$@"'';
          #   orphan = true;
          #   desc = "Open with default application";
          # }
          edit = [
            {
              run = "$EDITOR %s"; # change the environment variable in hyprland.conf under env
              desc = "$EDITOR";
              block = true;
              for = "unix";
            }
          ];
          play = [
            {
              run = "mpv %s";
              desc = "MPV";
              block = true;
              for = "linux";
            }
          ];
        };
      };
    };
  };
}
