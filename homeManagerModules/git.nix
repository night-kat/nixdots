{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "178902183+night-kat@users.noreply.github.com";
        name = "night-kat";
      };
      extraConfig = {

      };
    };
    signing = {
      format = "ssh";
      signByDefault = true;
      key = "256 SHA256:0q+vDpRlycQT9R5l0vRenFBJ2SDJnaXnLjq36vTfmqY 178902183+night-kat@users.noreply.github.com (ED25519-SK)";
    };
  };
}
