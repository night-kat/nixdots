{ ... }:

{
  imports = [
    ./nvim-cheatsheet.nix
    ./bufferline.nix
    ./nvimtree.nix
    ./lualine.nix
    ./telescope.nix
    ./toggleterm.nix
    ./whichkey.nix
    ./nvim-cmp.nix
    ./indent-blankline.nix
    ./conform-nvim.nix
    # Add signs to the sign column to indicate added, changed and deleted lines
    ./gitsigns.nix 
    ./autopairs.nix
  ];
}
