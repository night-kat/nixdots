{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    custom.fish.enable = lib.mkEnableOption "Enable fish shell with some aliases and macchina";
  };

  config = lib.mkIf config.custom.fish.enable {
    programs = {
      macchina = {
        enable = true;
        # Attribute set of macchina themes. Each entry is written to
        # {file}$XDG_CONFIG_HOME/macchina/themes/.toml.
        #
        # Theme names are case-sensitive. A theme defined here can be activated
        # by setting {option}programs.macchina.settings.theme to its name.
        #   settings.theme = "Hydrogen";
        #   themes = {
        #     Hydrogen = {
        #       spacing = 2;
        #       padding = 0;
        #       hide_ascii = true;
        #       separator = ">";
        #       key_color = "Cyan";
        #       separator_color = "White";
        #
        #       palette = {
        #         type = "Full";
        #         visible = false;
        #       };
        #
        #       bar = {
        #         glyph = "o";
        #         symbol_open = "[";
        #         symbol_close = "]";
        #         hide_delimiters = true;
        #         visible = true;
        #       };
        #
        #       box = {
        #         border = "plain";
        #         visible = true;
        #         inner_margin = {
        #           x = 1;
        #           y = 0;
        #         };
        #       };
        #
        #       randomize = {
        #         key_color = false;
        #         separator_color = false;
        #       };
        #
        #       keys = {
        #         host = "Host";
        #         kernel = "Kernel";
        #         battery = "Battery";
        #         os = "OS";
        #         de = "DE";
        #         wm = "WM";
        #         distro = "Distro";
        #         terminal = "Terminal";
        #         shell = "Shell";
        #         packages = "Packages";
        #         uptime = "Uptime";
        #         memory = "Memory";
        #         machine = "Machine";
        #         local_ip = "Local IP";
        #         backlight = "Brightness";
        #         resolution = "Resolution";
        #         cpu_load = "CPU Load";
        #         cpu = "CPU";
        #         gpu = "GPU";
        #         disk_space = "Disk Space";
        #       };
        #     };
        #   };
      };

      fish = {
        enable = true;
        shellInit = "macchina";
        shellAliases = {
          btw = "echo i use nixos btw";
          grep = "rg";
        };
      };
    };
  };
}
