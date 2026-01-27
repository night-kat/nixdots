{ pkgs, lib, config, options, ... }:

{
  options.custom.printing = {
    enable = lib.mkEnableOption "Enable CUPS to print documents";
    epsonDrivers.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable printing drivers for Epson printers";
    };
  };

  config = {
    services = {
      # Enable CUPS to print documents.
      printing = {
        enable = true;
        drivers = lib.optionals config.custom.printing.epsonDrivers.enable [ pkgs.epson-escpr ];
      };
    };
  };
}