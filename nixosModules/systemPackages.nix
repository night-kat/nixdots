{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.systemPackages;
in {
  options.custom.systemPackages = {
    enable = lib.mkEnableOption "A list of useful packages installed in the system profile";
  };

  config = lib.mkIf cfg.enable {
    # List packages installed in system profile.
    # You can use https://search.nixos.org/ to find more packages (and options).
    environment.systemPackages = with pkgs; [
      (lib.hiPrio pkgs.uutils-coreutils-noprefix) # `lib.hiPrio` is used to avoid potential conflict with `coreutils-full` (also see https://discourse.nixos.org/t/how-to-use-uutils-coreutils-instead-of-the-builtin-coreutils/8904/15?u=malix)
      wget
      # alacritty
      kitty
      gphoto2
      ffmpeg
      mpv
      sops
      mpvScripts.mpris
      (import ./../scripts/my-awesome-script.nix {inherit pkgs;})
      (import ./../scripts/port-forward-script.nix {inherit pkgs;})
      fwupd
      yubioath-flutter
      luajitPackages.luarocks_bootstrap
      clang
      ripgrep
      python313
      libsecret
      bluez
      pcscliteWithPolkit
      vscodium
      # vlc
    ];
  };
}
