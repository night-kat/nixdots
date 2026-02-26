{
  lib,
  config,
  inputs,
  ...
}: let
  cfg = config.custom.nvf;
in {
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
          spellcheck = {
            enable = true;
          };

          lsp = {
            # This must be enabled for the language modules to hook into
            # the LSP API.
            enable = true;

            formatOnSave = true;
            lspkind.enable = false;
            lightbulb.enable = true;
            lspsaga.enable = false;
            trouble.enable = true;
            otter-nvim.enable = true;
            nvim-docs-view.enable = true;
            harper-ls.enable = true;
          };

          statusline.lualine = {
            enable = true;
            theme = "catppuccin";
          };

          #causes error
          # minimap = {
          #   codewindow.enable = true;
          #};

          projects = {
            project-nvim.enable = true;
          };

          snippets.luasnip = {
            enable = true;
          };

          binds.cheatsheet = {
            enable = true;
          };

          utility = {
            diffview-nvim.enable = true;
            # nvim-biscuits.enable = true;
            surround.enable = true;
            motion = {
              hop.enable = true;
              leap.enable = true;
            };
          };

          filetree.nvimTree = {
            enable = true;
            setupOpts = {
              git.enable = true;
              renderer.highlight_git = true;
              update_focused_file = {
                enable = true;
                update_root = true;
              };
              # This will sync nvimtree root with current working directory
              sync_root_with_cwd = true;
            };
          };

          terminal.toggleterm = {
            enable = true;
          };

          binds.whichKey = {
            enable = true;
          };

          telescope = {
            enable = true;
          };

          autocomplete.nvim-cmp = {
            enable = true;
          };

          git.gitsigns = {
            enable = true;
          };

          formatter.conform-nvim = {
            enable = true;
          };

          tabline.nvimBufferline = {
            enable = true;
            # Reminder for mappings if i need it
            mappings = {
              # Using cycleNext and cyclePrevious will cause
              # the buffer to have looping behaviour
              # when reaching the last or first buffer
              # and is my preference
              cycleNext = "<tab>";
              cyclePrevious = "<S-tab>";
              closeCurrent = "<leader>x";
            };
          };

          autopairs.nvim-autopairs.enable = true;
          debugger = {
            nvim-dap = {
              enable = true;
              ui.enable = true;
            };
          };

          options = {
            # shiftwidth = 4;
            # tabstop = 4;
            # Requirement for bufferline to work
            termguicolors = true;
          };

          viAlias = false;
          vimAlias = true;
          lineNumberMode = "number";
          # Causes error
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
              event = ["BufEnter"];
              pattern = ["*"];
              command = "setlocal indentexpr=nvim_treesitter#indent()";
            }
          ];

          visuals = {
            nvim-scrollbar.enable = true;
            nvim-web-devicons.enable = true;
            nvim-cursorline.enable = true;
            cinnamon-nvim.enable = true;
            fidget-nvim.enable = true;

            highlight-undo.enable = true;
            indent-blankline.enable = true;

            # Fun
            cellular-automaton.enable = false;
          };

          ui = {
            borders.enable = true;
            noice.enable = true;
            colorizer.enable = true;
            modes-nvim.enable = false; # the theme looks terrible with catppuccin
            illuminate.enable = true;
            smartcolumn = {
              enable = true;
              setupOpts.custom_colorcolumn = {
                # this is a freeform module, it's `buftype = int;` for configuring column position
                nix = "110";
                ruby = "120";
                java = "130";
                go = ["90" "130"];
              };
            };
            fastaction.enable = true;
          };

          languages = {
            haskell.enable = true;
            rust = {
              enable = true;
              # lsp = {
              #   enable = true;
              #   opts = ''
              #     ['rust-analyzer'] = {
              #       cargo = {allFeature = true},
              #       checkOnSave = true,
              #       procMacro = {
              #         enable = true,
              #       },
              #     },'';
              # };
              extensions.crates-nvim.enable = true;
              # treesitter.enable = true;
              # format.enable = true;
            };
            yaml.enable = true;
            nix = {
              enable = true;
              lsp = {
                enable = true;
              };
              treesitter.enable = true;
              extraDiagnostics.enable = true;
              format = {
                enable = true;
              };
            };
          };
        };
      };
    };
  };
}
