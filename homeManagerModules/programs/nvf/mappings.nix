{
  pkgs,
  lib,
  options,
  config,
  inputs,
  ...
}:

{
  # This file only contains mappings for neovim
  # Mappings for plugins are in their respective files

  programs.nvf.settings.vim.keymaps = [
    # why does this exist?
    # I will leave it just in case idk
    # {
    #   mode = "n";
    # key = "h";
    # action = "<NOP>";
    # desc = "Do nothing (disable h in normal mode)";
    # }

    # Same thing as above

    # Keybinds in visual mode
    {
      mode = "v";
      key = "h";
      action = "<Left>";
      desc = "move left(visual mode)";
    }

    {
      mode = "v";
      key = "j";
      action = "<Down>";
      desc = "move down (visual mode)";
    }

    {
      mode = "v";
      key = "k";
      action = "<Up>";
      desc = "move up (visual mode)";
    }

    {
      mode = "v";
      key = "l";
      action = "<Right>";
      desc = "move right (visual mode)";
    }

    {
      # <ESC> exist insert mode,
      # ^ moves cursor to the beginning
      # i reenters insert mode
      mode = "i";
      key = "<C-b>";
      action = "<ESC>^i";
      desc = "move to beginning of line";
    }

    {
      mode = "i";
      key = "<C-e>";
      action = "<End>";
      desc = "move to end of line";
    }

    {
      mode = "i";
      key = "<C-h>";
      action = "<Left>";
      desc = "move left";
    }

    {
      mode = "i";
      key = "<C-l>";
      action = "<Right>";
      desc = "move right";
    }

    {
      mode = "i";
      key = "<C-j>";
      action = "<Down>";
      desc = "move down";
    }

    {
      mode = "i";
      key = "<C-k>";
      action = "<Up>";
      desc = "move up";
    }

    # Regular movement in normal mode
    {
      mode = "n";
      key = "h";
      action = "<Left>";
      desc = "move left(visual mode)";
    }

    {
      mode = "n";
      key = "j";
      action = "<Down>";
      desc = "move down (visual mode)";
    }

    {
      mode = "n";
      key = "k";
      action = "<Up>";
      desc = "move up (visual mode)";
    }

    {
      mode = "n";
      key = "l";
      action = "<Right>";
      desc = "move right (visual mode)";
    }

    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      desc = "switch window left";
    }

    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      desc = "switch window right";
    }

    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      desc = "switch window down";
    }

    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      desc = "switch window up";
    }

    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>noh<Enter>";
      desc = "General clear highlights";
    }

    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<Enter>";
      desc = "General Save file";
    }

    {
      mode = "n";
      key = "<C-c>";
      action = "<cmd>%y+<CR>";
      desc = "General Copy whole file";
    }

    {
      mode = "n";
      key = "<leader>fm";
      action = "<cmd>set nu!<Enter>";
      desc = "Toggle line number";
    }

    {
      mode = "n";
      key = "<leader>rn";
      action = "<cmd>set rnu!<Enter>";
      desc = "Toggle relative number";
    }

    {
      mode = "n";
      key = "<leader>fm";
      action = "require('conform').format {lsp_fallback = true } end";
      desc = "General format file";
    }

    {
      mode = "n";
      key = "<leader>ds";
      action = "vimd.diagnostic.setloclist";
      desc = "LSP Diagnostic loclist";
    }

    # Comments
    {
      mode = "n";
      key = "<leader>/";
      action = "gcc";
      noremap = false;
      desc = "Toggle Comment";
    }

    {
      mode = "v";
      key = "<leader>/";
      action = "gc";
      noremap = false;
      desc = "Toggle comment in visual mode";
    }

    # nvimtree
    {
      mode = "n";
      key = "<C-n>";
      action = "<cmd>NvimTreeToggle<Enter>";
      desc = "nvimtree toggle window";
    }

    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>NvimTreeFocus<Enter>";
      desc = "nvimtree focus window";
    }

    # #telescope
    # {
    #   mode = "n";
    #   leader = "<leader>ff";
    #   action = "builtin.find_files";
    #   desc = "Telescope find files";
    # }
  ];
}
