{ ... }:

{
  services = {
    # Enable CUPS to print documents.
    printing = {
      enable = true;
      printing.drivers = [pkgs.epson-escpr];
    };
  }
}