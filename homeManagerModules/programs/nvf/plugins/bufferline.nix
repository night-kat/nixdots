{ ... }:

{
  programs.nvf.settings.vim.tabline.nvimBufferline = {
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
}
