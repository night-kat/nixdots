{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "178902183+night-kat@users.noreply.github.com";
        name = "night-kat";
        signingKey = "~/.ssh/id_ed25519_sk";  
    };
      extraConfig = {
      };
    };
    signing = {
      format = "ssh";
      key = "~/.ssh/id_ed25519_sk";
      signByDefault = true;
    };
  };
}

