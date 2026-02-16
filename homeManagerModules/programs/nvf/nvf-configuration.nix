{
  pkgs,
  lib,
  options,
  config,
  inputs,
  ...
}:
let
  cfg = config.custom.nvf;
in
{
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  options = {
    custom.nvf.enable = lib.mkEnableOption "Enable nvf";
  };

  config = lib.mkIf cfg.enable {
    programs.nvf = {
      enable = true;

      # Your settings need to go into the settings attribute set
      # most settings are documented in the appendix
      settings = {
        vim = {
          options = {
            shiftwidth = 4;
            tabstop = 4;
            # Requirement for bufferline to work
            termguicolors = true;
          };

          viAlias = false;
          vimAlias = true;
          lineNumberMode = "number";
          # clipboard = {
          #   enable = true;
          #   registers = "unnammedplus";
          #   providers.wl-copy.enable = true;
          # };

          # Temporary fix for indent not working
          # See issue https://github.com/NotAShelf/nvf/issues/1397
          autocmds = [
            {
              enable = true;
              event = [ "BufEnter" ];
              pattern = [ "*" ];
              command = "setlocal indentexpr=nvim_treesitter#indent()";
            }
          ];

          languages = {
            rust = {
              enable = true;
              lsp.enable = true;
              treesitter.enable = true;
            };
            nix = {
              enable = true;
              lsp.enable = true;
              treesitter.enable = true;
            };
          };
        };
      };
    };
  };
}
