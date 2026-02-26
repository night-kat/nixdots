{ pkgs, lib, options, config, ... }:

let 
  cfg = config.custom.usenet;
in
{
  options.custom.usenet = {
    enable =  lib.mkEnableOption "Enable usenet downloader sabnzbd";
  };

  config = lib.mkIf cfg.enable {
    services.sabnzbd = {
      enable = true;
      user = "nightcat";
      settings= {
        config_conversion_version = 4;
        queue_complete = "";
        queue_complete_pers = 0;
        bandwidth_perc = 100;
        refresh_rate = 0;
        interface_settings = "";
        queue_limit = 20;
        config_lock = 0;
        fixed_ports = 1;
        notified_new_skin = 0;
        direct_unpack_tested = 0;
        sorters_converted = 1;
        check_new_rel = 1;
        auto_browser = 1;
        language = "en";
        enable_https_verification = 1;
        host = "127.0.0.1";
        port = 8080;
        https_port = "";
        username = "";
        password = "";
        bandwidth_max = "";
        cache_limit = "1G";
        web_dir = "Glitter";
        web_color = "Auto";
        https_cert = "server.cert";
        https_key = "server.key";
        https_chain = "";
        enable_https = 0;
        inet_exposure = 0;
        # store in sops-nix
        # api_key = "";
        # nzb_key = "";
        socks5_proxy_url = "";
        permissions = "";
        # directory for incomplete downloads
        download_dir = "~/usenet/unvollständig";
        # directory for completed downloads
        complete_dir = "~/usenet/vollständig";
        complete_free = "";
        fulldisk_autoresume = 0;
        script_dir = "";
        nzb_backup_dir = "";
        admin_dir = "admin";
        backup_dir = "";
        # directory that will be scanned for nzb files
        dirscan_dir = "~/usenet/nzb files";
        dirscan_speed = 5;
        password_file = "";
        log_dir = "logs";
        max_art_tries = 3;
        top_only = 0;
        sfv_check = 1;
        script_can_fail = 0;
        enable_recursive = 1;
        flat_unpack = 0;
        par_option = "";
        pre_check = 0;
        nice = "";
        win_process_prio = 3;
        ionice = "";
        fail_hopeless_jobs = 1;
        fast_fail = 1;
        auto_disconnect = 1;
        pre_script = "None";
        end_queue_script = "None";
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