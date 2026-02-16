{ ... }:

{
  programs.nvf.settings.vim.filetree.nvimTree = {
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
}

