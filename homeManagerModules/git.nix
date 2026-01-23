{ ... }:

{
  options = {
    custom.gitConfig.enable =
      lib.mkEnableOption "Enable git with preconfigured email and name"
  };

  config = lib.mkIf config.custom.gitConfig.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          email = "178902183+night-kat@users.noreply.github.com";
          name = "night-kat";
        };
      };
      # TODO: per host only, not shared
      #     signing = {
      #      format = "ssh";
      #      signByDefault = true;
      #      key = "256 SHA256:0q+vDpRlycQT9R5l0vRenFBJ2SDJnaXnLjq36vTfmqY 178902183+night-kat@users.noreply.github.com (ED25519-SK)";
      #    };
    };
  };
}
