{pkgs}:
pkgs.writeShellScriptBin "port-forward-script" ''
  # This took me 1 1/2 days to write :c
  # but at least without ai (except the regex because I couldn't be bothered, sorry)
  # This script will tell my torrent client which port my vpn opened
  # location of the file with the forwarded port
  port_location_file=/run/user/$UID/Proton/VPN/forwarded_port

  # making sure the port number is in the valid range
  is_port_valid_regex="^(6553[0-4]|655[0-2][0-9]|65[0-4][0-9]|6[0-4][0-9]{2}|[1-5][0-9]{4}|[0-9]{1,4})$"
    while true; do
      # this will check for creation or changing of the file
      ${pkgs.inotify-tools}/bin/inotifywait -e create,modify $port_location_file
      # read port number from file
      port_number=$(<$port_location_file)
      # check if port_number is in range and not empty
      if [[ $port_number=~$is_port_valid_regex ]] &&  [ "$port_number" != "" ]; then
        deluge-console "config -s listen_ports ($port_number,$port_number)"
      fi
    done
''
