{
  pkgs,
  lib,
  options,
  config,
  ...
}: let
  cfg = config.custom.usenet;
in {
  options.custom.usenet = {
    enable = lib.mkEnableOption "Enable usenet downloader sabnzbd";
  };

  config = lib.mkIf cfg.enable {
    services.sabnzbd = {
      # enable = true;
      user = "nightcat";
      settings = {
        # Allows the configuration to be changed by the web interface
        # TODO: disable if any good options for this module come out
        allowConfigWrite = true;
        servers = {
          newsgroupdirect = {
            displayname = "Newsgroup Direct";
            name = "newsgroupdirect";
            host = "eu-tst.newsgroupdirect.com";
            port = 563;
            connections = 100;
            # 0 means highest priority
            # 100 means lowest priority
            priority = 90;
            ssl = true;
            ssl_verify = "strict";
          };

          easyusenet = {
            displayname = "Easyusenet";
            name = "easyusenet";
            host = "reader.easyusenet.nl";
            required = true;
            port = 563;
            expiry = "2026-08-01";
            connections = 10;
            # 0 means highest priority
            # 100 means lowest priority
            priority = 10;
            ssl = true;
            ssl_verify = "strict";
          };
        };
      };
    };
  };
}
