{ pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks.github_key.addKeysToAgent = "yes";
  };
}
