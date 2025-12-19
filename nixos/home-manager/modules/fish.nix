{ ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
      grep = "rg";
  };
}
