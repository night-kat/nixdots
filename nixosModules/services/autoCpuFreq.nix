{
  pkgs,
  lib,
  config,
  options,
  ...
}:

{
  options.custom.auto-cpufreq = {
    enable = lib.mkEnableOption "Enable automatic CPU frequency scaling";
  };

  config = lib.mkIf config.custom.auto-cpufreq.enable {
    services = {
      auto-cpufreq = {
        enable = true;
        settings = {
          battery = {
            governor = "powersave";
            turbo = "never";
          };
          charger = {
            governor = "balanced";
            turbo = "auto";
          };
        };
      };
    };
  };
}
