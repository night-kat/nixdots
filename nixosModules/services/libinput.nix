{ pgks, lib, options, config, ... }:

let 
  cfg = config.custom.libinputService;
in {
  options.custom.libinputService = {
    touchPadSupport = lib.mkOption{
      type = lib.types.bool;
      default = false;
      description = "Enable touchpad support (enabled default in most desktopManager)";
    };
  };

  config = {
    # Enable touchpad support (enabled default in most desktopManager)
    services.libinput = lib.mkIf cfg.touchPadSupport { enable = true; };
  };
}