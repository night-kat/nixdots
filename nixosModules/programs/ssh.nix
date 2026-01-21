{ ... }:

{
  programs.ssh = {
    startAgent = true;
    enable = true;
    enableDefaultConfig = false;
    matchBlocks.github_key.addKeysToAgent = "yes";
  };
}
